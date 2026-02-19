<?php

namespace App\Http\Middleware;

use App\Services\ActivityTracker;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ActivityTrackerMiddleware
{
    public function handle(Request $request, Closure $next)
    {
        return $next($request);
    }

    public function terminate(Request $request, $response): void
    {
        // Log login attempts
        if ($request->routeIs('auth.store')) {
            if (Auth::check() && session('login_tracked') !== true) {
                ActivityTracker::logLogin();
                session(['login_tracked' => true]);
            }
        }

        // Log logout
        if ($request->routeIs('auth.logout')) {
            ActivityTracker::logLogout();
        }
    }
}
