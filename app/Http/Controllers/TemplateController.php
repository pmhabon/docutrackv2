<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Auth;
use App\Models\Template;

class TemplateController extends Controller
{
    // Show current template info (simple)
    public function show()
    {
        // kept for backward compatibility — redirect to index
        return redirect()->route('templates.index');
    }

    // Public listing for all users: templates accessible to the current user
    public function index()
    {
        $user = Auth::user();

        if (in_array($user->role, ['superadmin','campus_director'])) {
            $templates = Template::latest()->paginate(15);
        } else {
            $templates = Template::where(function($q) use ($user) {
                $q->where('college', $user->college)->orWhere('program', $user->program)->orWhereNull('college')->orWhereNull('program');
            })->latest()->paginate(15);
        }

        return view('templates.available', ['templates' => $templates]);
    }

    // Manage page — only for non-faculty/non-students (owners and admin roles)
    public function manage()
    {
        $user = Auth::user();
        if (in_array($user->role, ['faculty','student'])) abort(403);

        if (in_array($user->role, ['superadmin','campus_director'])) {
            $templates = Template::latest()->paginate(15);
        } elseif ($user->role === 'dean') {
            $templates = Template::where('college', $user->college)->latest()->paginate(15);
        } elseif ($user->role === 'program_head') {
            $templates = Template::where(function($q) use ($user) {
                $q->where('program', $user->program)->orWhere('college', $user->college);
            })->latest()->paginate(15);
        } else {
            $templates = Template::where('user_id', $user->id)->latest()->paginate(15);
        }

        // supply colleges/programs for superadmin to assign templates
        $colleges = \App\Models\College::orderBy('name')->get();
        $programs = \App\Models\Program::orderBy('name')->get();

        return view('templates.manage', ['templates' => $templates, 'colleges' => $colleges, 'programs' => $programs]);
    }

    // Store new template (only allowed roles)
    public function store(Request $request)
    {
        $user = Auth::user();
        $allowed = ['program_head','dean','campus_director','superadmin'];
        if (! in_array($user->role, $allowed)) abort(403);

        $rules = [
            'file' => 'required|file|mimes:docx|max:10240',
            'title' => 'nullable|string|max:255',
            // require format metadata now - templates must supply rules for automated reformatting
            'format_font' => 'required|string|max:255',
            'normal_font_size' => 'required|numeric', // points
            'line_spacing' => 'required|in:single,1.5,double',
            'margin_top' => 'required|numeric',
            'margin_bottom' => 'required|numeric',
            'margin_left' => 'required|numeric',
            'margin_right' => 'required|numeric',
            'heading1_size' => 'required|numeric',
            'paragraph_indent' => 'required|numeric',
            'citation_style' => 'required|string|in:apa,mla,chicago,ieee'
        ];

        // allow superadmin to optionally assign template to a college/program
        if ($user->role === 'superadmin') {
            $rules['college'] = 'nullable|string|max:255';
            $rules['program'] = 'nullable|string|max:255';
        }

        $data = $request->validate($rules);

        $file = $request->file('file');
        $uploaded = $file->store('templates');

        // Build format_rules as internal units expected by validator:
        // margins: inches -> twips (1 inch = 1440 twips)
        // font sizes: points -> half-points (1pt = 2 half-points)
        $formatRules = null;
        // Build required format_rules
        $formatRules = [
            'margins' => [
                'top' => (int)round($data['margin_top'] * 1440),
                'bottom' => (int)round($data['margin_bottom'] * 1440),
                'left' => (int)round($data['margin_left'] * 1440),
                'right' => (int)round($data['margin_right'] * 1440),
            ],
            'normal' => [
                'font' => $data['format_font'],
                'fontSize' => (int)round($data['normal_font_size'] * 2),
                'line' => ($data['line_spacing'] === 'single' ? 240 : ($data['line_spacing'] === '1.5' ? 360 : 480)),
                'indent' => (int)round($data['paragraph_indent'] * 1440),
            ],
            'heading1' => [
                'fontSize' => (int)round($data['heading1_size'] * 2),
            ],
            'citation_style' => $data['citation_style'] ?? null,
        ];

        $template = Template::create([
            'user_id' => $user->id,
            'title' => $data['title'] ?? pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME),
            'file_path' => $uploaded,
            'original_name' => $file->getClientOriginalName(),
            'mime_type' => $file->getClientMimeType(),
            'file_size' => $file->getSize(),
            'college' => ($user->role === 'superadmin' && isset($data['college'])) ? $data['college'] : $user->college,
            'program' => ($user->role === 'superadmin' && isset($data['program'])) ? $data['program'] : $user->program,
            'format_rules' => $formatRules,
        ]);

        return redirect()->back()->with('success', 'Research template uploaded.');
    }

    // Download current template (available to authenticated users)
    public function download(Template $template)
    {
        $user = Auth::user();

        // visibility check
        if (!in_array($user->role, ['superadmin','campus_director'])) {
            if ($user->role === 'dean' && $template->college !== $user->college) abort(403);
            if (in_array($user->role, ['program_head','faculty','student']) && $template->program !== $user->program && $template->college !== $user->college) abort(403);
        }

        $disk = Storage::disk('local');
        if (! $disk->exists($template->file_path)) abort(404);
        return response()->download($disk->path($template->file_path), $template->original_name ?: basename($template->file_path));
    }

    public function destroy(Template $template)
    {
        $user = Auth::user();

        // allow owner, superadmin, campus_director, or dean of same college
        if ($template->user_id === $user->id || in_array($user->role, ['superadmin','campus_director'])) {
            // allowed
        } elseif ($user->role === 'dean' && $template->college === $user->college) {
            // allowed
        } else {
            abort(403);
        }

        $disk = Storage::disk('local');
        if ($disk->exists($template->file_path)) {
            $disk->delete($template->file_path);
        }
        $template->delete();

        return redirect()->back()->with('success', 'Template deleted.');
    }
}
