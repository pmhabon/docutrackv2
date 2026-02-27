<?php

namespace App\Services;

use Illuminate\Support\Facades\Storage;
use App\Services\ActivityTracker;

class DocumentConverter
{
    // Check whether soffice is callable on the system
    public static function available(): bool
    {
        // Try common checks; allow failure if shell_exec disabled
        try {
            if (stripos(PHP_OS, 'WIN') === 0) {
                $out = @shell_exec('where soffice 2>&1');
            } else {
                $out = @shell_exec('which soffice 2>&1');
            }
            if ($out && trim($out) !== '') return true;
            // last resort: try --version
            $ver = @shell_exec('soffice --version 2>&1');
            return !empty($ver);
        } catch (\Throwable $e) {
            return false;
        }
    }

    // Convert a full path file (doc or pdf) to a docx. Returns the full path of converted file.
    // Throws Exception on failure.
    public static function convertToDocx(string $fullPath): string
    {
        if (!file_exists($fullPath)) {
            throw new \Exception('File for conversion not found: ' . $fullPath);
        }

        $ext = strtolower(pathinfo($fullPath, PATHINFO_EXTENSION));
        if ($ext === 'docx') return $fullPath;

        if (!self::available()) {
            throw new \Exception('LibreOffice (soffice) not available on this server. Install it to enable conversion.');
        }

        $outDir = sys_get_temp_dir() . '/docconv_' . uniqid();
        if (!@mkdir($outDir) && !is_dir($outDir)) {
            throw new \Exception('Unable to create temp dir for conversion');
        }

        // Build command
        $cmd = escapeshellcmd('soffice') . ' --headless --convert-to docx --outdir ' . escapeshellarg($outDir) . ' ' . escapeshellarg($fullPath) . ' 2>&1';
        $output = null;
        $code = null;
        // shell_exec does not return exit code; use exec for portability
        @exec($cmd, $output, $code);

        // look for converted file in outDir
        $base = pathinfo($fullPath, PATHINFO_FILENAME);
        $candidates = glob($outDir . '/' . $base . '.docx');
        if (empty($candidates)) {
            // try any docx created
            $list = glob($outDir . '/*.docx');
            if (!empty($list)) $candidates = $list;
        }

        if (empty($candidates)) {
            ActivityTracker::logSystem('document', 'conversion_failed', 'DocumentConverter', null, null, ['file' => $fullPath, 'output' => $output, 'code' => $code], 'high', 'Document conversion failed');
            throw new \Exception('Conversion to DOCX failed. Output: ' . implode('\n', (array)$output));
        }

        $converted = $candidates[0];

        // move converted file into storage/documents and return full path
        $disk = Storage::disk('local');
        $destName = 'documents/' . uniqid('converted_') . '-' . basename($converted);
        if (!@copy($converted, storage_path('app/' . $destName))) {
            throw new \Exception('Unable to copy converted file to storage');
        }

        // cleanup temp
        @unlink($converted);
        @rmdir($outDir);

        ActivityTracker::logSystem('document', 'conversion_success', 'DocumentConverter', null, null, ['source' => $fullPath, 'converted' => storage_path('app/' . $destName)], 'low', 'Document converted to DOCX');

        return storage_path('app/' . $destName);
    }
}
