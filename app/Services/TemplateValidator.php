<?php

namespace App\Services;

class TemplateValidator
{
    // Validate template vs student docx. Returns ['valid' => bool, 'errors' => [], 'details' => []]
    // $templateRules (optional) is an array with keys 'margins','normal','heading1' using internal units
    public static function validate(string $templatePath, string $studentPath, array $templateRules = null): array
    {
        $errors = [];
        $details = [];

        // Helper: extract xml from docx
        $extract = function($docxPath, $entry) {
            $zip = new \ZipArchive();
            if ($zip->open($docxPath) === true) {
                $idx = $zip->locateName($entry);
                if ($idx !== false) {
                    $data = $zip->getFromIndex($idx);
                    $zip->close();
                    return $data;
                }
                $zip->close();
            }
            return null;
        };

        $tplDoc = null;
        $tplStyles = null;
        // If template rules were provided, we will use those as authoritative rather than parsing the template file
        if ($templateRules === null) {
            $tplDoc = $extract($templatePath, 'word/document.xml');
            $tplStyles = $extract($templatePath, 'word/styles.xml');
        }
        $stuDoc = $extract($studentPath, 'word/document.xml');
        $stuStyles = $extract($studentPath, 'word/styles.xml');

        // Require uploaded document XML; template XML is optional when templateRules are provided
        if (! $stuDoc) {
            return ['valid' => false, 'errors' => ['Unable to read uploaded document XML.'], 'details' => []];
        }
        if ($templateRules === null && ! $tplDoc) {
            return ['valid' => false, 'errors' => ['Unable to read template document XML.'], 'details' => []];
        }

        // Load XML
        libxml_use_internal_errors(true);
        $tplDocXml = simplexml_load_string($tplDoc);
        $stuDocXml = simplexml_load_string($stuDoc);
        $tplStylesXml = $tplStyles ? simplexml_load_string($tplStyles) : null;
        $stuStylesXml = $stuStyles ? simplexml_load_string($stuStyles) : null;

        $ns = [];
        if ($tplDocXml !== false) {
            foreach ($tplDocXml->getNamespaces(true) as $k => $v) $ns[$k] = $v;
        }

        // PAGE MARGINS: word/document.xml -> sectPr->pgMar attributes (w:top, left, right, bottom) in twentieths of a point
        try {
            $tplPgMar = null;
            if ($templateRules !== null && isset($templateRules['margins'])) {
                $tplPgMar = $templateRules['margins'];
            } else {
                $tplPgMar = self::getPageMargins($tplDocXml);
            }
            $stuPgMar = self::getPageMargins($stuDocXml);
            if ($tplPgMar && $stuPgMar) {
                // require exact match for margins (no tolerance)
                foreach (['top','bottom','left','right'] as $side) {
                    $tplVal = (int)($tplPgMar[$side] ?? 0);
                    $stuVal = (int)($stuPgMar[$side] ?? 0);
                    $match = ($tplVal === $stuVal);
                    $details['page_margins'][$side] = ['template' => $tplVal, 'uploaded' => $stuVal, 'diff' => abs($tplVal - $stuVal), 'match' => $match];
                    if (! $match) {
                        $errors[] = "Page margin mismatch for {$side}. Template={$tplVal} ; Uploaded={$stuVal} (units=1/1440 inch)";
                    }
                }
            } else {
                if (! $tplPgMar) $errors[] = 'Template missing page margin information (sectPr/pgMar).';
                if (! $stuPgMar) $errors[] = 'Uploaded document missing page margin information (sectPr/pgMar).';
            }
        } catch (\Exception $e) {
            $errors[] = 'Failed to compare page margins: ' . $e->getMessage();
        }

        // FONT SIZE, LINE SPACING, INDENTATION: compare 'Normal' style run properties if available
        try {
            // Determine template Normal style: either from stored rules or by parsing template styles.xml
            if ($templateRules !== null && isset($templateRules['normal'])) {
                $tplNormal = $templateRules['normal'];
            } else {
                $tplNormal = self::getStyleProperties($tplStylesXml, 'Normal');
            }
            $stuNormal = self::getStyleProperties($stuStylesXml, 'Normal');

            if ($templateRules === null && $tplStylesXml === null) {
                $errors[] = 'Template missing styles.xml; cannot validate Normal style.';
            }
            if ($stuStylesXml === null) {
                $errors[] = 'Uploaded document missing styles.xml; cannot validate Normal style.';
            }
            if ($templateRules === null && ! $tplNormal) {
                $errors[] = 'Template does not define a Normal style.';
            }
            if (! $stuNormal) {
                $errors[] = 'Uploaded document does not define a Normal style.';
            }

            if ($tplNormal && $stuNormal) {
                $tplIndent = $tplNormal['indent'] ?? 0;
                $stuIndent = $stuNormal['indent'] ?? 0;
                $fontMatch = (isset($tplNormal['fontSize']) && isset($stuNormal['fontSize'])) ? ($tplNormal['fontSize'] === $stuNormal['fontSize']) : false;
                $lineMatch = (isset($tplNormal['line']) && isset($stuNormal['line'])) ? ($tplNormal['line'] === $stuNormal['line']) : false;
                $indentMatch = ($tplIndent === $stuIndent);
                $details['normal_style'] = [
                    'template' => $tplNormal,
                    'uploaded' => $stuNormal,
                    'font_match' => $fontMatch,
                    'line_match' => $lineMatch,
                    'indent_match' => $indentMatch,
                    'indent_diff' => abs($tplIndent - $stuIndent),
                ];

                if (! $fontMatch) {
                    $errors[] = "Font size mismatch (Normal). Template={$tplNormal['fontSize']} ; Uploaded={$stuNormal['fontSize']} (half-points)";
                }
                if (! $lineMatch) {
                    $errors[] = "Line spacing mismatch (Normal). Template={$tplNormal['line']} ; Uploaded={$stuNormal['line']}";
                }
                if (! $indentMatch) {
                    $errors[] = "Indentation mismatch (Normal). Template={$tplIndent} ; Uploaded={$stuIndent} (twips)";
                }
            }
        } catch (\Exception $e) {
            $errors[] = 'Failed to compare normal style: ' . $e->getMessage();
        }

        // Heading1: compare if available
        try {
            if ($templateRules !== null && isset($templateRules['heading1'])) {
                $tplH1 = $templateRules['heading1'];
            } else {
                $tplH1 = self::getStyleProperties($tplStylesXml, 'Heading1');
            }
            $stuH1 = self::getStyleProperties($stuStylesXml, 'Heading1');

            if ($templateRules === null && $tplStylesXml === null) {
                $errors[] = 'Template missing styles.xml; cannot validate Heading1.';
            }
            if ($stuStylesXml === null) {
                $errors[] = 'Uploaded document missing styles.xml; cannot validate Heading1.';
            }
            if ($templateRules === null && ! $tplH1) {
                $errors[] = 'Template does not define a Heading1 style.';
            }
            if (! $stuH1) {
                $errors[] = 'Uploaded document does not define a Heading1 style.';
            }

            if ($tplH1 && $stuH1) {
                $h1FontMatch = (isset($tplH1['fontSize']) && isset($stuH1['fontSize'])) ? ($tplH1['fontSize'] === $stuH1['fontSize']) : false;
                $details['heading1'] = ['template' => $tplH1, 'uploaded' => $stuH1, 'font_match' => $h1FontMatch];
                if (! $h1FontMatch) {
                    $errors[] = "Heading1 font size mismatch. Template={$tplH1['fontSize']} ; Uploaded={$stuH1['fontSize']} (half-points)";
                }
            }
        } catch (\Exception $e) {
            $errors[] = 'Failed to compare heading styles: ' . $e->getMessage();
        }

        // (No header/footer validation here) -- validator focuses on margins, font size, line spacing, heading styles, and indentation.

        $valid = empty($errors);

        return ['valid' => $valid, 'errors' => $errors, 'details' => $details];
    }

    private static function getPageMargins($docXml)
    {
        if (! $docXml) return null;
        $namespaces = $docXml->getNamespaces(true);
        $w = isset($namespaces['w']) ? $namespaces['w'] : null;
        $xpath = $docXml->xpath('//w:sectPr/w:pgMar');
        if (!$xpath || !isset($xpath[0])) return null;
        $attrs = $xpath[0]->attributes($w ?: null);
        $res = [];
        foreach (['top','bottom','left','right'] as $a) {
            $res[$a] = isset($attrs[$a]) ? (int)$attrs[$a] : 0;
        }
        return $res;
    }

    private static function getStyleProperties($stylesXml, $styleName)
    {
        if (!$stylesXml) return null;
        $ns = $stylesXml->getNamespaces(true);
        $w = $ns['w'] ?? null;
        // find style by name
        foreach ($stylesXml->style as $s) {
            $name = $s->name;
            if ($name) {
                $attrs = $name->attributes($w ?: null);
                $val = (string)($attrs['val'] ?? '');
                if ($val === $styleName) {
                    $res = [];
                    // run properties
                    if ($s->rPr) {
                        $r = $s->rPr;
                        if ($r->sz) {
                            $rattrs = $r->sz->attributes($w ?: null);
                            $res['fontSize'] = isset($rattrs['val']) ? (int)$rattrs['val'] : null;
                        }
                    }
                    if ($s->pPr) {
                        $p = $s->pPr;
                        if ($p->spacing) {
                            $sp = $p->spacing->attributes($w ?: null);
                            $res['line'] = isset($sp['line']) ? (int)$sp['line'] : null;
                        }
                        if ($p->ind) {
                            $ind = $p->ind->attributes($w ?: null);
                            $res['indent'] = isset($ind['left']) ? (int)$ind['left'] : 0;
                        }
                    }
                    return $res;
                }
            }
        }
        return null;
    }
}
