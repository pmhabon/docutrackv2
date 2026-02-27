@extends('layouts.app')

@section('title','Upload Document')
@section('page-title','Upload Document')

@section('content')
<div class="container" style="max-width:600px">
    {{-- top-level error list removed to avoid duplicate messages; detailed validation block remains below --}}

    <div class="card-stats p-4 rounded">
        <form method="POST" action="{{ route('documents.store') }}" enctype="multipart/form-data">
            @csrf

            @if(session('validation_details') || $errors->has('file'))
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                            <div style="font-weight:600">Upload couldn't be processed</div>
                            <div style="margin-top:6px">The uploaded document doesn't match the selected template. Please address the issues below.</div>
                            @if(session('validation_details'))
                                @php
                                    $vd = session('validation_details');
                                    // remove duplicate error messages and filter out template-side messages
                                    $errs = array_values(array_unique($vd['errors'] ?? []));
                                    $errs_no_template = array_values(array_filter($errs, function($e){ return stripos($e, 'Template') === false; }));

                                    // detect uploaded-side problems only (template is authoritative; do not report template-side missing)
                                    $hasStuPg = false;
                                    $hasStuNormal = false;
                                    $hasStuH1 = false;
                                    foreach ($errs_no_template as $ee) {
                                        if (strpos($ee, 'Uploaded document missing page margin') !== false) $hasStuPg = true;
                                        if (strpos($ee, 'Uploaded document does not define a Normal') !== false) $hasStuNormal = true;
                                        if (strpos($ee, 'Uploaded document does not define a Heading1') !== false) $hasStuH1 = true;
                                    }

                                    // check detailed mismatches where available
                                    $marginsMismatch = false;
                                    if (!empty($vd['details']['page_margins'])) {
                                        foreach ($vd['details']['page_margins'] as $side => $vals) {
                                            if (isset($vals['match']) && $vals['match'] === false) { $marginsMismatch = true; break; }
                                            // older detail shape may not include 'match' so also check diff
                                            if (isset($vals['diff']) && (int)$vals['diff'] !== 0) { $marginsMismatch = true; break; }
                                        }
                                    }

                                    $normalFontMismatch = false; $normalLineMismatch = false; $normalIndentMismatch = false;
                                    if (!empty($vd['details']['normal_style'])) {
                                        $ns = $vd['details']['normal_style'];
                                        if (isset($ns['font_match']) && $ns['font_match'] === false) $normalFontMismatch = true;
                                        if (isset($ns['line_match']) && $ns['line_match'] === false) $normalLineMismatch = true;
                                        if (isset($ns['indent_match']) && $ns['indent_match'] === false) $normalIndentMismatch = true;
                                    }

                                    $h1FontMismatch = false;
                                    if (!empty($vd['details']['heading1'])) {
                                        $h1 = $vd['details']['heading1'];
                                        if (isset($h1['font_match']) && $h1['font_match'] === false) $h1FontMismatch = true;
                                    }

                                    // header/footer mismatches
                                    $headerMismatch = false; $footerMismatch = false;
                                    $tplHasHeader = false; $tplHasFooter = false;
                                    if (!empty($vd['details']['header'])) {
                                        $tplHasHeader = isset($vd['details']['header']['template']) && $vd['details']['header']['template'] !== null;
                                        if (isset($vd['details']['header']['match']) && $vd['details']['header']['match'] === false) $headerMismatch = true;
                                    }
                                    if (!empty($vd['details']['footer'])) {
                                        $tplHasFooter = isset($vd['details']['footer']['template']) && $vd['details']['footer']['template'] !== null;
                                        if (isset($vd['details']['footer']['match']) && $vd['details']['footer']['match'] === false) $footerMismatch = true;
                                    }

                                    $condensed = [];

                                    // Margins: template is authoritative. If template doesn't define margins, tell user.
                                    // Margins: only report uploaded problems (template-side messages are omitted)
                                    if ($marginsMismatch) {
                                        $condensed[] = 'Page margins incorrect.';
                                    } else if ($hasStuPg) {
                                        $condensed[] = 'Page margins incorrect.';
                                    }

                                    // Normal style: template authoritative
                                    // Normal style: only report uploaded-side problems or mismatches
                                    $styleProblems = [];
                                    if ($normalFontMismatch) $styleProblems[] = 'font size';
                                    if ($normalLineMismatch) $styleProblems[] = 'line spacing';
                                    if ($normalIndentMismatch) $styleProblems[] = 'indentation';
                                    if (!empty($styleProblems)) {
                                        $condensed[] = 'Normal style incorrect (' . implode(', ', $styleProblems) . ').';
                                    } else if ($hasStuNormal) {
                                        $condensed[] = 'Normal style incorrect.';
                                    }

                                    // Heading1: template authoritative
                                    // Heading1: only report uploaded-side problems or mismatches
                                    if ($h1FontMismatch) {
                                        $condensed[] = 'Heading1 incorrect.';
                                    } else if ($hasStuH1) {
                                        $condensed[] = 'Heading1 incorrect.';
                                    }

                                    // Header/footer: template authoritative
                                    // Header/footer: only report uploaded-side problems or mismatches
                                    if ($headerMismatch) $condensed[] = 'Header incorrect.';
                                    if (!empty($vd['details']['header']) && empty($vd['details']['header']['uploaded'])) $condensed[] = 'Header incorrect.';
                                    if ($footerMismatch) $condensed[] = 'Footer incorrect.';
                                    if (!empty($vd['details']['footer']) && empty($vd['details']['footer']['uploaded'])) $condensed[] = 'Footer incorrect.';
                                @endphp

                                <hr>
                                <div style="font-size:13px">
                                    @if(!empty($condensed))
                                        <ul style="margin-bottom:6px">
                                            @foreach($condensed as $c)
                                                <li>{{ $c }}</li>
                                            @endforeach
                                        </ul>
                                    @endif

                                    <div style="margin-top:6px;font-style:italic;font-size:13px">Validation checks: margin size, font size, line spacing, heading styles, indentation.</div>

                                    <a href="#" id="vd_toggle" onclick="event.preventDefault(); var el=document.getElementById('vd_details'); el.style.display = (el.style.display==='none') ? 'block' : 'none'; this.textContent = (el.style.display==='none') ? 'Show details' : 'Hide details';">Show details</a>

                                    <div id="vd_details" style="display:none;margin-top:8px">
                                        @if(!empty($errs))
                                            <div><strong>Errors:</strong></div>
                                            <ul>
                                                @foreach($errs as $e)
                                                    <li>{{ $e }}</li>
                                                @endforeach
                                            </ul>
                                        @endif
                                        @if(!empty($vd['details']))
                                            <div><strong>Details:</strong></div>
                                            @if(!empty($vd['details']['page_margins']))
                                                <div><em>Page margins (twips):</em></div>
                                                <ul>
                                                @foreach($vd['details']['page_margins'] as $side => $vals)
                                                    <li>{{ ucfirst($side) }} — template: {{ $vals['template'] }}, uploaded: {{ $vals['uploaded'] }}, diff: {{ $vals['diff'] }}</li>
                                                @endforeach
                                                </ul>
                                            @endif
                                            @if(!empty($vd['details']['normal_style']))
                                                <div><em>Normal style:</em></div>
                                                <pre style="white-space:pre-wrap;background:#f8f9fa;padding:8px;border-radius:6px">{{ json_encode($vd['details']['normal_style'], JSON_PRETTY_PRINT) }}</pre>
                                            @endif
                                            @if(!empty($vd['details']['heading1']))
                                                <div><em>Heading1:</em></div>
                                                <pre style="white-space:pre-wrap;background:#f8f9fa;padding:8px;border-radius:6px">{{ json_encode($vd['details']['heading1'], JSON_PRETTY_PRINT) }}</pre>
                                            @endif
                                        @endif
                                    </div>
                                </div>
                    @endif
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            @endif

            <div class="mb-3">
                <label class="form-label">Document Title</label>
                <input type="text" name="title" class="form-control" value="{{ old('title') }}" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Description</label>
                <textarea name="description" class="form-control" rows="4">{{ old('description') }}</textarea>
            </div>

            <div class="mb-3">
                <label class="form-label">Select File</label>
                <input type="file" name="file" class="form-control" accept=".pdf,.doc,.docx" required>
                <small class="text-muted">Supported: PDF, DOC, DOCX</small>
            </div>

            <div class="mb-3">
                <label class="form-label">Document Type</label>
                <select name="document_type_id" class="form-select">
                    <option value="">-- Select Type --</option>
                    @foreach($types as $t)
                        <option value="{{ $t->id }}" {{ old('document_type_id') == $t->id ? 'selected' : '' }}>{{ $t->name }}</option>
                    @endforeach
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label">Template Used</label>
                <select name="template_id" id="templateSelect" class="form-select">
                    <option value="">-- No template / Detect automatically --</option>
                    @if(!empty($templates) && $templates->count())
                        @foreach($templates as $tpl)
                            <option value="{{ $tpl->id }}" {{ old('template_id') == $tpl->id ? 'selected' : '' }}>{{ $tpl->title ?? $tpl->original_name ?? 'Template #' . $tpl->id }} @if($tpl->college) ({{ $tpl->college }}) @endif @if($tpl->program) - {{ $tpl->program }} @endif</option>
                        @endforeach
                    @endif
                </select>
                <small class="text-muted">Select the template that the uploaded document is based on to enable precise validation. (Required for DOCX uploads)</small>
            </div>

            {{-- Formatting options moved to Template uploader. --}}

            {{-- Citation style moved to Template metadata; document uploader no longer requests citation style. --}}

            <div class="mb-3">
                <label class="form-label">Number of Authors</label>
                <div class="btn-group w-100" role="group">
                    <input type="radio" class="btn-check" name="author_mode" id="single_author" value="single" {{ old('author_mode', 'single') === 'single' ? 'checked' : '' }}>
                    <label class="btn btn-outline-secondary" for="single_author">Single Author</label>

                    <input type="radio" class="btn-check" name="author_mode" id="multiple_authors" value="multiple" {{ old('author_mode') === 'multiple' ? 'checked' : '' }}>
                    <label class="btn btn-outline-secondary" for="multiple_authors">Multiple Authors</label>
                </div>
            </div>

            <!-- Single Author Mode -->
            <div id="single_author_section" class="mb-3" style="display: {{ old('author_mode', 'single') === 'single' ? 'block' : 'none' }}">
                <div class="row">
                    <div class="col-md-9 mb-3">
                        <label class="form-label">Author Name</label>
                        <input type="text" name="single_author_name" class="form-control author-autocomplete" placeholder="Type author name..." value="{{ old('single_author_name') }}" data-author-list='@json($users)'>
                        <small class="text-muted">Or select a user:</small>
                        <select name="single_author_user_id" class="form-select mt-1">
                            <option value="">-- Choose user (optional) --</option>
                            @foreach($users as $u)
                                <option value="{{ $u->id }}">{{ trim(($u->firstName ?? '') . ' ' . ($u->middleName ?? '') . ' ' . ($u->lastName ?? '')) }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label class="form-label">Type</label>
                        <select name="single_author_type" class="form-select">
                            <option value="Primary" {{ old('single_author_type', 'Primary') === 'Primary' ? 'selected' : '' }}>Primary</option>
                            <option value="Secondary" {{ old('single_author_type') === 'Secondary' ? 'selected' : '' }}>Secondary</option>
                            <option value="Contributor" {{ old('single_author_type') === 'Contributor' ? 'selected' : '' }}>Contributor</option>
                        </select>
                    </div>
                </div>
            </div>

            <!-- Multiple Authors Mode -->
            <div id="multiple_authors_section" style="display: {{ old('author_mode') === 'multiple' ? 'block' : 'none' }}">
                <div id="authors_container">
                    <!-- Authors will be dynamically added here -->
                </div>
                <div class="mb-3 mt-3">
                    <label class="form-label">Or choose existing users as authors</label>
                    <select name="author_user_ids[]" class="form-select" multiple size="6">
                        @foreach($users as $u)
                            <option value="{{ $u->id }}">{{ trim(($u->firstName ?? '') . ' ' . ($u->middleName ?? '') . ' ' . ($u->lastName ?? '')) }}</option>
                        @endforeach
                    </select>
                    <small class="text-muted">Hold Ctrl/Cmd to select multiple.</small>
                </div>
                <button type="button" class="btn btn-sm btn-outline-primary" id="add_author_btn">+ Add Author</button>
            </div>

            <div class="card p-2 mb-3" style="background:#f8f9fa">
                <div style="font-weight:600;margin-bottom:8px">Uploaded By</div>
                <div style="font-size:13px">
                    <div><strong>{{ auth()->user()->firstName }} {{ auth()->user()->lastName }}</strong></div>
                    <div><span class="badge bg-info">{{ ucfirst(str_replace('_',' ', auth()->user()->role ?? '')) }}</span></div>
                    <div style="margin-top:6px">
                        <i class="fas fa-map-marker" style="width:14px"></i> ISPSC Tagudin
                    </div>
                    <div><i class="fas fa-building" style="width:14px"></i> {{ auth()->user()->college ?? '—' }}</div>
                </div>
            </div>

            <div class="d-flex gap-2">
                <button type="submit" class="btn btn-primary">Upload Document</button>
                <a href="{{ route('documents.index') }}" class="btn btn-outline-secondary">Cancel</a>
            </div>
        </form>
    </div>
</div>

<style>
.autocomplete-list {
    position: absolute;
    background: white;
    border: 1px solid #ddd;
    max-height: 200px;
    overflow-y: auto;
    width: 100%;
    z-index: 1000;
    border-radius: 4px;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}
.autocomplete-item {
    padding: 8px 12px;
    cursor: pointer;
    border-bottom: 1px solid #f0f0f0;
}
.autocomplete-item:hover {
    background-color: #f0f0f0;
}
.author-input-wrapper {
    position: relative;
}
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const authorsList = @json($users);
    let authorCount = 0;

    // Toggle between single/multiple author modes
    document.querySelectorAll('input[name="author_mode"]').forEach(radio => {
        radio.addEventListener('change', function() {
            if (this.value === 'single') {
                document.getElementById('single_author_section').style.display = 'block';
                document.getElementById('multiple_authors_section').style.display = 'none';
            } else {
                document.getElementById('single_author_section').style.display = 'none';
                document.getElementById('multiple_authors_section').style.display = 'block';
                // Initialize multiple authors if empty
                if (authorCount === 0) {
                    addAuthorField();
                }
            }
        });
    });

    // Initialize multiple authors section if needed
    if (document.querySelector('#multiple_authors_section').style.display !== 'none') {
        if (authorCount === 0) {
            addAuthorField();
        }
    }

    // Add author field button
    document.getElementById('add_author_btn').addEventListener('click', addAuthorField);

    function addAuthorField() {
        authorCount++;
        const container = document.getElementById('authors_container');
        
        const authorDiv = document.createElement('div');
        authorDiv.className = 'author-field mb-3 p-3 border rounded';
        authorDiv.id = `author_${authorCount}`;
        authorDiv.innerHTML = `
            <div class="d-flex justify-content-between align-items-center mb-2">
                <h6 class="mb-0">Author ${authorCount}</h6>
                ${authorCount > 1 ? `<button type="button" class="btn btn-sm btn-outline-danger remove-author-btn" data-author-id="${authorCount}">Remove</button>` : ''}
            </div>
            <div class="row">
                <div class="col-md-9 mb-2">
                    <label class="form-label">Name</label>
                    <input type="text" name="multiple_authors[${authorCount}][name]" class="form-control author-autocomplete" placeholder="Type author name..." data-author-list='${JSON.stringify(authorsList)}' required>
                </div>
                <div class="col-md-3 mb-2">
                    <label class="form-label">Type</label>
                    <select name="multiple_authors[${authorCount}][type]" class="form-select">
                        <option value="Primary">Primary</option>
                        <option value="Secondary">Secondary</option>
                        <option value="Contributor">Contributor</option>
                    </select>
                </div>
            </div>
        `;
        
        container.appendChild(authorDiv);
        setupAutocomplete(authorDiv.querySelector('.author-autocomplete'), authorsList);
        
        // Setup remove button if exists
        const removeBtn = authorDiv.querySelector('.remove-author-btn');
        if (removeBtn) {
            removeBtn.addEventListener('click', function() {
                authorDiv.remove();
            });
        }
    }

    function setupAutocomplete(inputEl, authors) {
        let listContainer = null;

        inputEl.addEventListener('focus', function() {
            if (!listContainer) {
                createAutocompleteList(this, authors);
            }
        });

        inputEl.addEventListener('input', function() {
            if (!listContainer) {
                createAutocompleteList(this, authors);
            }
            filterAutocompleteList(this, authors);
        });

        inputEl.addEventListener('blur', function() {
            setTimeout(() => {
                if (listContainer) {
                    listContainer.remove();
                    listContainer = null;
                }
            }, 200);
        });

        function createAutocompleteList(inputEl, authors) {
            const wrapper = inputEl.parentElement;
            listContainer = document.createElement('div');
            listContainer.className = 'autocomplete-list';
            wrapper.style.position = 'relative';
            wrapper.appendChild(listContainer);

            populateAutocompleteList(listContainer, authors, inputEl);
        }

        function populateAutocompleteList(container, authors, inputEl) {
            const query = inputEl.value.toLowerCase();
            const filtered = authors.filter(a => {
                const fullName = `${a.firstName || ''} ${a.middleName || ''} ${a.lastName || ''}`.replace(/\s+/g,' ').trim().toLowerCase();
                return fullName.includes(query) || query === '';
            }).slice(0, 8);

            container.innerHTML = '';
            filtered.forEach(author => {
                const fullName = `${author.firstName || ''} ${author.middleName || ''} ${author.lastName || ''}`.replace(/\s+/g,' ').trim();
                const item = document.createElement('div');
                item.className = 'autocomplete-item';
                item.textContent = fullName;
                item.addEventListener('click', function() {
                    inputEl.value = fullName;
                    if (listContainer) {
                        listContainer.remove();
                        listContainer = null;
                    }
                });
                container.appendChild(item);
            });
        }

        function filterAutocompleteList(inputEl, authors) {
            if (listContainer) {
                populateAutocompleteList(listContainer, authors, inputEl);
            }
        }
    }

    // Setup autocomplete for single author field
    const singleAuthorInput = document.querySelector('input[name="single_author_name"]');
    if (singleAuthorInput) {
        setupAutocomplete(singleAuthorInput, authorsList);
    }
});
</script>
<script>
// Toggle template select requirement based on chosen file type
document.addEventListener('DOMContentLoaded', function(){
    const fileInput = document.querySelector('input[name="file"]');
    const templateSelect = document.getElementById('templateSelect');

    function updateTemplateRequirement() {
        if (!fileInput || !templateSelect) return;
        const val = fileInput.value || '';
        const ext = val.split('.').pop().toLowerCase();
        if (ext === 'docx') {
            templateSelect.required = true;
        } else {
            templateSelect.required = false;
        }
    }

    if (fileInput) {
        fileInput.addEventListener('change', updateTemplateRequirement);
        updateTemplateRequirement();
    }
    // Margin preset toggle (show custom inputs when chosen)
    const marginPreset = document.getElementById('marginPreset');
    const customMargins = document.getElementById('customMargins');
    if (marginPreset) {
        marginPreset.addEventListener('change', function() {
            if (!customMargins) return;
            customMargins.style.display = this.value === 'custom' ? 'block' : 'none';
        });
    }
});
</script>
@endsection
