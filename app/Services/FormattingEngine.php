<?php

namespace App\Services;

use ZipArchive;
use Illuminate\Support\Facades\Storage;
use App\Services\ActivityTracker;

class FormattingEngine
{
    protected static function inchesToTwips($inches)
    {
        return (int)round($inches * 1440);
    }

    public static function process(string $fullPath, array $options = [])
    {
        // Only handle DOCX for now
        if (!file_exists($fullPath)) {
            throw new \Exception('File not found: ' . $fullPath);
        }

        $ext = strtolower(pathinfo($fullPath, PATHINFO_EXTENSION));
        if ($ext !== 'docx') return ['formatted' => false];

        $tmp = sys_get_temp_dir() . '/docx_' . uniqid();
        mkdir($tmp);

        $zip = new ZipArchive();
        if ($zip->open($fullPath) !== true) {
            throw new \Exception('Unable to open docx file as zip');
        }

        // extract to temp
        $zip->extractTo($tmp);
        $zip->close();

        $wordDir = $tmp . '/word';

        // Update margins in document.xml if provided. Accept either legacy keys or rule structure.
        $docXmlPath = $wordDir . '/document.xml';
        $hasMargins = false;
        $mTop = $mBottom = $mLeft = $mRight = null;
        if (!empty($options['margins']) && is_array($options['margins'])) {
            $hasMargins = true;
            $mTop = $options['margins']['top'] ?? null;
            $mBottom = $options['margins']['bottom'] ?? null;
            $mLeft = $options['margins']['left'] ?? null;
            $mRight = $options['margins']['right'] ?? null;
        } elseif (isset($options['margin_preset']) && file_exists($docXmlPath)) {
            $hasMargins = true;
            $mTop = isset($options['margin_top']) ? self::inchesToTwips((float)$options['margin_top']) : null;
            $mBottom = isset($options['margin_bottom']) ? self::inchesToTwips((float)$options['margin_bottom']) : null;
            $mLeft = isset($options['margin_left']) ? self::inchesToTwips((float)$options['margin_left']) : null;
            $mRight = isset($options['margin_right']) ? self::inchesToTwips((float)$options['margin_right']) : null;
        }

        if ($hasMargins && file_exists($docXmlPath)) {
            $docXml = file_get_contents($docXmlPath);
            if (preg_match('/<w:sectPr[\s\S]*?<w:pgMar[^>]*\/?>/i', $docXml, $m)) {
                $pgMar = $m[0];
                // build replacement attributes
                $attrs = '';
                if ($mTop !== null) $attrs .= " w:top=\"{$mTop}\"";
                if ($mRight !== null) $attrs .= " w:right=\"{$mRight}\"";
                if ($mBottom !== null) $attrs .= " w:bottom=\"{$mBottom}\"";
                if ($mLeft !== null) $attrs .= " w:left=\"{$mLeft}\"";

                // replace existing pgMar tag
                $newPgMar = preg_replace('/<w:pgMar[^>]*\/?>/i', '<w:pgMar' . $attrs . '/>', $pgMar);
                $docXml = str_replace($pgMar, $newPgMar, $docXml);
                file_put_contents($docXmlPath, $docXml);
            }
        }

        // Update styles.xml for Normal and Heading1 font/size using DOM (namespace-aware)
        $stylesXmlPath = $wordDir . '/styles.xml';
        if (file_exists($stylesXmlPath)) {
            $stylesXml = file_get_contents($stylesXmlPath);
            // accept either new rule structure or legacy option names
            $font = $options['normal']['font'] ?? $options['format_font'] ?? null;
            $fontSize = $options['normal']['fontSize'] ?? null; // expected in half-points (w:sz)

            if ($font || $fontSize) {
                libxml_use_internal_errors(true);
                $dom = new \DOMDocument();
                // Normalize escaped newlines that may exist in styles.xml content
                $stylesXml = str_replace('\\n', "\n", $stylesXml);
                $dom->preserveWhiteSpace = true;
                $dom->formatOutput = false;
                $loaded = $dom->loadXML($stylesXml);
                if ($loaded === false) {
                    // if load fails, fall back to using the raw string write (avoid breaking formatting)
                    file_put_contents($stylesXmlPath, $stylesXml);
                    // clear libxml errors and continue
                    libxml_clear_errors();
                    // skip DOM modifications
                    $loaded = false;
                }
                $xp = new \DOMXPath($dom);
                $w = 'http://schemas.openxmlformats.org/wordprocessingml/2006/main';
                $xp->registerNamespace('w', $w);

                // target styles to update
                $styleIds = ['Normal', 'Heading1'];
                foreach ($styleIds as $sid) {
                    $styles = $xp->query("//w:style[@w:styleId='{$sid}']");
                    foreach ($styles as $styleNode) {
                        // find or create rPr
                        $rPrList = $xp->query('w:rPr', $styleNode);
                        if ($rPrList->length) {
                            $rPr = $rPrList->item(0);
                        } else {
                            $rPr = $dom->createElementNS($w, 'w:rPr');
                            $styleNode->appendChild($rPr);
                        }

                        if ($font) {
                            $rFontsList = $xp->query('w:rFonts', $rPr);
                            if ($rFontsList->length) {
                                $rFonts = $rFontsList->item(0);
                            } else {
                                $rFonts = $dom->createElementNS($w, 'w:rFonts');
                                $rPr->appendChild($rFonts);
                            }
                            $rFonts->setAttributeNS($w, 'w:ascii', $font);
                            $rFonts->setAttributeNS($w, 'w:hAnsi', $font);
                        }

                        if ($fontSize) {
                            $szList = $xp->query('w:sz', $rPr);
                            if ($szList->length) {
                                $sz = $szList->item(0);
                            } else {
                                $sz = $dom->createElementNS($w, 'w:sz');
                                $rPr->appendChild($sz);
                            }
                            $sz->setAttributeNS($w, 'w:val', (string)(int)$fontSize);
                        }

                        // paragraph properties only for Normal
                        if ($sid === 'Normal' && (!empty($options['normal']['indent']) || !empty($options['normal']['line']))) {
                            $pPrList = $xp->query('w:pPr', $styleNode);
                            if ($pPrList->length) {
                                $pPr = $pPrList->item(0);
                            } else {
                                $pPr = $dom->createElementNS($w, 'w:pPr');
                                $styleNode->appendChild($pPr);
                            }

                            if (!empty($options['normal']['line'])) {
                                $spacingList = $xp->query('w:spacing', $pPr);
                                if ($spacingList->length) {
                                    $spacing = $spacingList->item(0);
                                } else {
                                    $spacing = $dom->createElementNS($w, 'w:spacing');
                                    $pPr->appendChild($spacing);
                                }
                                $spacing->setAttributeNS($w, 'w:line', (string)(int)$options['normal']['line']);
                            }

                            if (!empty($options['normal']['indent'])) {
                                $indList = $xp->query('w:ind', $pPr);
                                if ($indList->length) {
                                    $ind = $indList->item(0);
                                } else {
                                    $ind = $dom->createElementNS($w, 'w:ind');
                                    $pPr->appendChild($ind);
                                }
                                $ind->setAttributeNS($w, 'w:left', (string)(int)$options['normal']['indent']);
                            }
                        }
                    }
                }

                $newXml = $dom->saveXML();
                file_put_contents($stylesXmlPath, $newXml);
            }
        }

        // Extract simple bibliography from document.xml: find a paragraph with text 'References' and gather subsequent paragraphs until next heading
        $bib = [];
        if (file_exists($docXmlPath)) {
            $docXml = file_get_contents($docXmlPath);
            // remove namespace prefixes for easier parsing
            $xml = preg_replace('/(<\/?)(w:)/', '$1', $docXml);
            libxml_use_internal_errors(true);
            $dom = new \DOMDocument();
            $dom->loadXML($xml);
            $xp = new \DOMXPath($dom);
            $paragraphs = $xp->query('//p');
            $collect = false;
            foreach ($paragraphs as $p) {
                $texts = [];
                $tNodes = $p->getElementsByTagName('t');
                foreach ($tNodes as $t) { $texts[] = $t->textContent; }
                $text = trim(implode('', $texts));
                if ($collect) {
                    // stop if next heading detected (simple heuristic: style contains 'Heading')
                    $pPr = $p->getElementsByTagName('pPr')->item(0);
                    $isHeading = false;
                    if ($pPr) {
                        $pStyle = $pPr->getElementsByTagName('pStyle')->item(0);
                        if ($pStyle && stripos($pStyle->getAttribute('val'), 'Heading') !== false) $isHeading = true;
                    }
                    if ($isHeading) break;
                    if ($text !== '') $bib[] = $text;
                }
                if (!$collect && strcasecmp($text, 'References') === 0) {
                    $collect = true;
                }
            }
        }

        // Repack zip
        $newZipPath = $tmp . '/out.docx';
        $zip = new ZipArchive();
        if ($zip->open($newZipPath, ZipArchive::CREATE) !== true) {
            throw new \Exception('Unable to create output zip for docx');
        }
        $files = new \RecursiveIteratorIterator(new \RecursiveDirectoryIterator($tmp));
        foreach ($files as $name => $file) {
            if (! $file->isDir()) {
                $filePath = $file->getRealPath();
                $relativePath = substr($filePath, strlen($tmp) + 1);
                // skip our output file if present
                if ($relativePath === 'out.docx') continue;
                $zip->addFile($filePath, $relativePath);
            }
        }
        $zip->close();

        // overwrite original
        copy($newZipPath, $fullPath);

        // save bibliography if any
        $bibPath = null;
        if (!empty($bib)) {
            $base = basename($fullPath);
            $name = pathinfo($base, PATHINFO_FILENAME);
            $bibFile = 'documents/bibliography-' . $name . '.txt';
            Storage::disk('local')->put($bibFile, implode("\n", $bib));
            $bibPath = storage_path('app/' . $bibFile);
        }

        // cleanup
        // remove tmp recursively
        $it = new \RecursiveDirectoryIterator($tmp, \RecursiveDirectoryIterator::SKIP_DOTS);
        $files = new \RecursiveIteratorIterator($it, \RecursiveIteratorIterator::CHILD_FIRST);
        foreach($files as $file) {
            if ($file->isDir()) rmdir($file->getRealPath()); else unlink($file->getRealPath());
        }
        @rmdir($tmp);

        return ['formatted' => true, 'bibliography' => $bibPath, 'bibliography_entries' => $bib];
    }
}
