<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>@yield('title', 'DocuTrack')</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.9.1/chart.min.js"></script>
    <style>
        :root{--maroon:#800000;--maroon-dark:#600000;--maroon-light:#a00000}
        body{font-family:'Segoe UI', sans-serif;background:#f5f7fa}
        .sidebar{width:260px;background:linear-gradient(180deg,var(--maroon-dark),var(--maroon));min-height:100vh;color:#fff;box-shadow:2px 0 10px rgba(0,0,0,0.1);position:fixed;left:0;top:0;overflow-y:auto}
        .sidebar-brand{padding:20px;border-bottom:2px solid rgba(255,255,255,0.1);margin-bottom:20px}
        .sidebar-brand h4{margin:0;font-weight:700;font-size:20px}
        .sidebar-brand small{opacity:0.8}
        .sidebar .nav-link{color:rgba(255,255,255,0.85);text-decoration:none;padding:12px 20px;margin-bottom:8px;border-radius:8px;transition:all 0.3s}
        .sidebar .nav-link:hover{background:rgba(255,255,255,0.15);color:#fff}
        .sidebar .nav-link i{margin-right:10px;width:18px}
        .main-content{margin-left:260px;flex:1}
        .topbar{height:70px;background:#fff;display:flex;align-items:center;justify-content:space-between;padding:0 30px;border-bottom:2px solid #eef2f6;box-shadow:0 2px 8px rgba(0,0,0,0.05)}
        .topbar-title{display:flex;align-items:center;gap:15px}
        .topbar-title i{font-size:24px;color:var(--maroon)}
        .topbar-title h5{margin:0;color:#333;font-weight:600}
        .content{padding:30px}
        .card-stat{background:#fff;border-radius:12px;border:0;box-shadow:0 4px 12px rgba(0,0,0,0.06);padding:20px;transition:transform 0.3s,box-shadow 0.3s}
        .card-stat:hover{transform:translateY(-4px);box-shadow:0 8px 20px rgba(0,0,0,0.1)}
        .card-stat i{font-size:28px;color:var(--maroon);margin-bottom:10px}
        .btn-primary{background:linear-gradient(135deg,var(--maroon),var(--maroon-light));border:0}
        .btn-primary:hover{background:linear-gradient(135deg,var(--maroon-dark),var(--maroon))}
        .badge-status-active{background:#198754}
        .badge-status-inactive{background:#6c757d}
        .search-bar{background:#fff;border:2px solid#e0e0e0;border-radius:8px;padding:10px 15px;font-size:14px}
        .search-bar:focus{border-color:var(--maroon);background:#fff}
        table {font-size:14px}
        table thead th{background:#f5f7fa;font-weight:600;border-top:0;color:#555}
        .modal-header{background:linear-gradient(135deg,var(--maroon),var(--maroon-light));color:#fff}
        @media(max-width:992px){.sidebar{width:0;left:-260px}.main-content{margin-left:0}}
    </style>
    @stack('styles')
</head>
<body>
<div class="d-flex">
    <!-- Sidebar -->
    <nav class="sidebar">
        <div class="sidebar-brand">
            <h4><i class="fas fa-file-alt"></i> DocuTrack</h4>
            <small>ISPSC DMS</small>
        </div>
        @if(auth()->check())
            @php $u = auth()->user(); @endphp
            <div style="padding:12px 18px;border-bottom:1px solid rgba(255,255,255,0.06);">
                <div style="font-size:13px;font-weight:600;color:rgba(255,255,255,0.95)">Account</div>
                <div style="font-size:13px;margin-top:6px;opacity:0.95">
                    <div><i class="fas fa-user-tag" style="width:14px"></i> {{ ucfirst(str_replace('_',' ', $u->role ?? '')) }}</div>
                    <div style="margin-top:6px"><i class="fas fa-map-marker" style="width:14px"></i> ISPSC Tagudin</div>
                    <div>
                        <i class="fas fa-building" style="width:14px"></i>
                        @if($u->college)
                            {{ $u->college }}
                        @else
                            <a href="{{ route('profile.edit') }}" class="text-decoration-none" style="color:rgba(255,255,255,0.95)"><em>Set college</em></a>
                        @endif
                    </div>
                    <div>
                        <i class="fas fa-graduation-cap" style="width:14px"></i>
                        @if($u->program)
                            {{ $u->program }}
                        @else
                            <a href="{{ route('profile.edit') }}" class="text-decoration-none" style="color:rgba(255,255,255,0.95)"><em>Set program</em></a>
                        @endif
                    </div>
                    <div style="margin-top:6px;font-size:12px;opacity:0.85"><i class="fas fa-envelope" style="width:14px"></i> {{ $u->email }}</div>
                </div>
            </div>
        @endif
        <ul class="nav flex-column" style="list-style:none;padding:0;margin:0">
            <li><a href="{{ route('dashboard') }}" class="nav-link {{ Route::is('dashboard') ? 'active' : '' }}"><i class="fas fa-chart-line"></i> Dashboard</a></li>
            <li><a href="{{ route('documents.index') }}" class="nav-link {{ Route::is('documents.*') ? 'active' : '' }}"><i class="fas fa-file-pdf"></i> Documents</a></li>
            <li><a href="{{ route('templates.index') }}" class="nav-link {{ Route::is('templates.*') ? 'active' : '' }}"><i class="fas fa-file-alt"></i> Templates</a></li>
            @php
                $showAssigned = false;
                if (auth()->check()) {
                    $u = auth()->user();
                    if (in_array($u->role, ['faculty','dean','campus_director','program_head','superadmin'])) {
                        $showAssigned = \App\Models\Document::whereHas('editors', function($q) use ($u) { $q->where('users.id', $u->id); })
                            ->orWhereHas('commenters', function($q) use ($u) { $q->where('users.id', $u->id); })
                            ->exists();
                    }
                }
            @endphp
            @if($showAssigned)
                <li><a href="{{ route('documents.assigned') }}" class="nav-link {{ Route::is('documents.assigned') ? 'active' : '' }}"><i class="fas fa-clipboard-list"></i> Assigned To Me</a></li>
            @endif
            <li><a href="{{ route('dashboard.users.visibility') }}" class="nav-link {{ Route::is('dashboard.users.visibility') ? 'active' : '' }}"><i class="fas fa-user-friends"></i> Faculty</a></li>
            @if(auth()->user() && auth()->user()->role === 'superadmin')
                <li style="margin-top:15px;padding:8px 20px;opacity:0.6"><small><i class="fas fa-cog"></i> ADMIN</small></li>
                <li><a href="{{ route('users.index') }}" class="nav-link {{ Route::is('users.*') ? 'active' : '' }}"><i class="fas fa-users"></i> Manage Users</a></li>
                <!-- Campuses removed for single-campus deployment -->
                <li><a href="{{ route('colleges.index') }}" class="nav-link {{ Route::is('colleges.*') ? 'active' : '' }}"><i class="fas fa-building"></i> Colleges</a></li>
                <li><a href="{{ route('programs.index') }}" class="nav-link {{ Route::is('programs.*') ? 'active' : '' }}"><i class="fas fa-graduation-cap"></i> Programs</a></li>
                <li><a href="{{ route('settings.index') }}" class="nav-link {{ Route::is('settings.*') ? 'active' : '' }}"><i class="fas fa-sliders-h"></i> Settings</a></li>
            @endif
            @php $allowedManage = ['program_head','dean','campus_director','superadmin']; @endphp
            @if(auth()->check() && in_array(auth()->user()->role, $allowedManage))
                <li><a href="{{ route('templates.manage') }}" class="nav-link {{ Route::is('templates.manage') ? 'active' : '' }}"><i class="fas fa-file-signature"></i> Manage Templates</a></li>
            @endif
            <li><a href="{{ route('activity.index') }}" class="nav-link {{ Route::is('activity.*') ? 'active' : '' }}"><i class="fas fa-history"></i> Activity Logs</a></li>
        </ul>
    </nav>

    <!-- Main Content -->
    <div class="main-content" style="width:100%">
        <!-- Topbar -->
        <header class="topbar">
            <div class="topbar-title">
                <i class="fas fa-bars" id="toggleSidebar" style="cursor:pointer;display:none"></i>
                <h5>@yield('page-title')</h5>
            </div>

            <div class="dropdown">
                <div class="d-flex align-items-center" style="gap:12px">
                    {{-- Notifications bell --}}
                    <div class="dropdown">
                        <a href="#" class="text-decoration-none" id="notifMenu" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fas fa-bell" style="font-size:18px;color:var(--maroon)"></i>
                            @if(auth()->user()->unreadNotifications->count() > 0)
                                <span class="badge bg-danger" style="font-size:11px;margin-left:6px">{{ auth()->user()->unreadNotifications->count() }}</span>
                            @endif
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="notifMenu" style="width:320px">
                            @foreach(auth()->user()->unreadNotifications->take(10) as $n)
                                <li><a class="dropdown-item" href="{{ route('notifications.click', $n->id) }}">{{ $n->data['message'] ?? 'Notification' }} <br><small class="text-muted">{{ $n->created_at->diffForHumans() }}</small></a></li>
                            @endforeach
                            @if(auth()->user()->unreadNotifications->count() == 0)
                                <li class="dropdown-item text-muted">No new notifications</li>
                            @endif
                        </ul>
                    </div>

                    <a class="dropdown-toggle text-decoration-none" href="#" role="button" id="profileMenu" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="fas fa-user-circle" style="font-size:24px;color:var(--maroon)"></i>
                        <span style="margin-left:8px;color:#333">{{ auth()->user()->firstName }}</span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="profileMenu">
                        <li><a class="dropdown-item" href="{{ route('profile.edit') }}"><i class="fas fa-edit"></i> Edit Profile</a></li>
                        <li>
                            <form method="POST" action="{{ route('auth.logout') }}" class="m-0">
                                @csrf
                                <button class="dropdown-item" type="submit"><i class="fas fa-sign-out-alt"></i> Logout</button>
                            </form>
                        </li>
                    </ul>
                </div>
            </div>
        </header>

        <!-- Page Content -->
        <main class="content">
            @yield('content')
        </main>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
    document.getElementById('toggleSidebar')?.addEventListener('click', function(){
        const sidebar = document.querySelector('.sidebar');
        sidebar.classList.toggle('d-none');
    });
</script>
@stack('scripts')
</body>
</html>
