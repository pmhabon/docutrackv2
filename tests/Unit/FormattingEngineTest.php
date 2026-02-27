<?php

namespace Tests\Unit;

use Tests\TestCase;
use App\Services\FormattingEngine;
use Illuminate\Support\Facades\Storage;

class FormattingEngineTest extends TestCase
{
    public function test_formatting_engine_changes_font_in_styles_xml()
    {
        // create a minimal DOCX (zip) directly with proper root entries
        $styles = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>\n<w:styles xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">\n<w:style w:type="paragraph" w:styleId="Normal">\n<w:name w:val="Normal"/>\n<w:rPr data-test="1"></w:rPr>\n</w:style>\n</w:styles>';
        $doc = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>\n<w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main"><w:body><w:p><w:r><w:t>Test</w:t></w:r></w:p></w:body></w:document>';
        $contentTypes = '<?xml version="1.0" encoding="UTF-8"?><Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types"></Types>';
        $rels = '<?xml version="1.0" encoding="UTF-8"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"></Relationships>';

        $zipPath = sys_get_temp_dir() . '/test_doc_' . uniqid() . '.docx';
        $zip = new \ZipArchive();
        if ($zip->open($zipPath, \ZipArchive::CREATE) !== true) {
            $this->fail('Unable to create test docx');
        }
        $zip->addFromString('[Content_Types].xml', $contentTypes);
        $zip->addFromString('_rels/.rels', $rels);
        $zip->addFromString('word/document.xml', $doc);
        $zip->addFromString('word/styles.xml', $styles);
        $zip->close();

        // call formatting engine with rules requesting Times New Roman, size 24 (12pt)
        $opts = [
            'normal' => [
                'font' => 'Times New Roman',
                'fontSize' => 24
            ]
        ];

        $res = FormattingEngine::process($zipPath, $opts);
        $this->assertTrue(!empty($res['formatted']), 'FormattingEngine did not report formatted');

        // extract styles.xml and assert it contains Times New Roman
        $zip2 = new \ZipArchive();
        $this->assertTrue($zip2->open($zipPath) === true, 'Unable to open formatted docx');
        // locate any entry that ends with or contains word/styles.xml
        $foundName = null;
        for ($i = 0; $i < $zip2->numFiles; $i++) {
            $name = $zip2->getNameIndex($i);
            if (stripos(str_replace('\\','/',$name), 'word/styles.xml') !== false) { $foundName = $name; break; }
        }
        if ($foundName === null) {
            $entries = [];
            for ($i = 0; $i < $zip2->numFiles; $i++) { $entries[] = $zip2->getNameIndex($i); }
            $this->fail('styles.xml not found in formatted docx; entries: ' . implode(', ', $entries));
        }
        $stylesXml = $zip2->getFromName($foundName);
        $this->assertStringContainsString('Times New Roman', $stylesXml);

        // cleanup
            @unlink($zipPath);
    }
}
