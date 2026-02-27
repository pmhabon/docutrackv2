<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use App\Models\Document;
use App\Services\FormattingEngine;
use App\Services\DocumentConverter;
use App\Services\ActivityTracker;
use App\Services\BibliographyFormatter;
use Illuminate\Support\Facades\Storage;

class FormatDocument implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $documentId;

    public function __construct(int $documentId)
    {
        $this->documentId = $documentId;
    }

    public function handle()
    {
        $document = Document::find($this->documentId);
        if (! $document) return;

        // mark as processing so dashboards reflect active work
        try {
            $document->update(['status' => 'formatting_processing']);
        } catch (\Throwable $e) {
            // non-fatal: continue processing even if status update fails
        }

        $userId = $document->user_id;
        $disk = Storage::disk('local');
        $rel = 'documents/' . $document->file_path;
        $full = storage_path('app/' . $rel);

        // ensure file exists
        if (! file_exists($full)) {
            ActivityTracker::logSystem('document', 'formatting_missing_file', 'FormatDocument', null, null, ['document_id' => $document->id, 'path' => $rel], 'low', 'Formatting skipped: file missing');
            return;
        }

        // backup
        try {
            $backupRel = 'documents/backups/' . time() . '-' . basename($full);
            $disk->copy($rel, $backupRel);
            ActivityTracker::logSystem('document', 'format_backup', 'FormatDocument', null, null, ['document_id' => $document->id, 'backup' => storage_path('app/' . $backupRel)], 'low', 'Backup created before formatting (queued)');
        } catch (\Throwable $e) {
            ActivityTracker::logSystem('document', 'format_backup_error', 'FormatDocument', null, null, ['document_id' => $document->id, 'exception' => $e->getMessage()], 'low', 'Backup error before queued formatting');
        }

        // convert if needed
        $ext = strtolower(pathinfo($full, PATHINFO_EXTENSION));
        if (in_array($ext, ['doc','pdf'])) {
            try {
                $converted = DocumentConverter::convertToDocx($full);
                // update document to point to converted file
                $document->update(['file_path' => basename($converted), 'file_type' => 'application/vnd.openxmlformats-officedocument.wordprocessingml.document']);
                $full = $converted;
            } catch (\Throwable $e) {
                ActivityTracker::logSystem('document', 'conversion_error', 'FormatDocument', null, null, ['document_id' => $document->id, 'exception' => $e->getMessage()], 'low', 'Conversion failed in queued job');
            }
        }

        // determine template format rules
        $fmtOpts = null;
        if ($document->template_id) {
            $tpl = \App\Models\Template::find($document->template_id);
            if ($tpl && !empty($tpl->format_rules)) $fmtOpts = $tpl->format_rules;
        }

        try {
            $res = FormattingEngine::process($full, $fmtOpts);

            // apply bibliography formatting if present
            $citationStyle = $fmtOpts['citation_style'] ?? null;
            if (!empty($res['bibliography_entries']) && !empty($citationStyle)) {
                $formatted = BibliographyFormatter::format($res['bibliography_entries'], $citationStyle);
                $base = basename($full);
                $name = pathinfo($base, PATHINFO_FILENAME);
                $outFile = 'documents/bibliography-' . $citationStyle . '-' . $name . '.txt';
                Storage::disk('local')->put($outFile, implode("\n", $formatted));
                ActivityTracker::logSystem('document', 'bibliography_extracted', 'FormatDocument', null, null, ['document_id' => $document->id, 'bib_path' => storage_path('app/' . $outFile), 'style' => $citationStyle], 'low', 'Bibliography extracted and formatted');
            } elseif (!empty($res['bibliography'])) {
                ActivityTracker::logSystem('document', 'bibliography_extracted', 'FormatDocument', null, null, ['document_id' => $document->id, 'bib_path' => $res['bibliography']], 'low', 'Bibliography extracted');
            }

            if (!empty($res['formatted'])) {
                // update status to pending so reviewers see it
                $document->update(['status' => 'pending']);
                // notify uploader
                $notify = [['user_id' => $userId, 'type' => 'document.formatted', 'data' => ['message' => 'Your document has been formatted', 'document_id' => $document->id, 'url' => route('documents.show', $document->id)]]];
                ActivityTracker::logDocumentUpdate($document->id, 'formatted', ['user_id' => $userId, 'notify' => $notify]);
            }
        } catch (\Throwable $e) {
            ActivityTracker::logSystem('document', 'formatting_error', 'FormatDocument', null, null, ['document_id' => $document->id, 'exception' => $e->getMessage()], 'high', 'Formatting job error');
            // mark status to indicate formatting failed
            $document->update(['status' => 'pending_formatting']);
            $notify = [['user_id' => $userId, 'type' => 'document.formatting_failed', 'data' => ['message' => 'Formatting failed for your document', 'document_id' => $document->id, 'url' => route('documents.backups', $document->id)]]];
            ActivityTracker::logDocumentUpdate($document->id, 'formatting_failed', ['user_id' => $userId, 'notify' => $notify]);
        }
    }
}
