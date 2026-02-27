<?php

namespace App\Services;

class BibliographyFormatter
{
    /**
     * Very small heuristic formatter for bibliography entries into simple styles.
     * This is intentionally simple and aims to provide a basic conversion/labeling.
     * For full compliance use a citation library or external tool.
     *
     * @param array $entries
     * @param string $style one of: apa, mla, chicago, ieee
     * @return array formatted lines
     */
    public static function format(array $entries, string $style = 'apa') : array
    {
        $out = [];
        foreach ($entries as $e) {
            $line = trim($e);
            if ($line === '') continue;

            // Heuristics: if entry already looks formatted, leave mostly unchanged
            // If contains a year in parentheses or period after author, assume formatted
            if (preg_match('/\(\d{4}\)/', $line) || preg_match('/,\s*\d{4}/', $line) || preg_match('/\d{4}\./', $line)) {
                $formatted = $line;
            } else {
                // naive split: try 'Author. Title. Year.' or 'Author - Title - Year'
                $parts = preg_split('/[\.|\-|–|—]/', $line);
                $parts = array_filter(array_map('trim', $parts));
                if (count($parts) >= 3) {
                    $author = $parts[0]; $title = $parts[1]; $year = $parts[2];
                } elseif (count($parts) == 2) {
                    $author = $parts[0]; $title = $parts[1]; $year = '';
                } else {
                    // fallback: attempt to extract year at end
                    if (preg_match('/(.*)\b(\d{4})\b$/', $line, $m)) {
                        $author = $m[1]; $title = ''; $year = $m[2];
                    } else {
                        $author = $line; $title = ''; $year = '';
                    }
                }

                switch (strtolower($style)) {
                    case 'mla':
                        $formatted = trim($author . '. ' . ($title ? $title . '. ' : '') . ($year ? $year . '.' : ''));
                        break;
                    case 'chicago':
                        $formatted = trim($author . '. ' . ($title ? '"' . $title . '." ' : '') . ($year ? $year . '.' : ''));
                        break;
                    case 'ieee':
                        $formatted = trim(($author ? $author . ', ' : '') . ($title ? '"' . $title . '"' : '') . ($year ? ', ' . $year : ''));
                        break;
                    case 'apa':
                    default:
                        // APA: Author (Year). Title.
                        $formatted = trim(($author ? $author : '') . ($year ? ' (' . $year . ')' : '') . ($title ? '. ' . $title . '.' : ''));
                        break;
                }
            }

            $out[] = $formatted;
        }

        return $out;
    }
}
