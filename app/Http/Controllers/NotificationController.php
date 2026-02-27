<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class NotificationController extends Controller
{
    public function click($id)
    {
        $user = Auth::user();
        $notification = $user->notifications()->where('id', $id)->firstOrFail();
        $notification->markAsRead();
        $url = $notification->data['url'] ?? route('dashboard');
        return redirect($url);
    }

    public function index(Request $request)
    {
        $user = Auth::user();
        $unread = $user->unreadNotifications()->orderBy('created_at', 'desc')->get();
        $read = $user->readNotifications()->orderBy('created_at', 'desc')->get();
        return view('notifications.index', ['unread' => $unread, 'read' => $read]);
    }

    public function markAllRead(Request $request)
    {
        $user = Auth::user();
        $user->unreadNotifications->markAsRead();
        return back()->with('success', 'All notifications marked as read.');
    }
}
