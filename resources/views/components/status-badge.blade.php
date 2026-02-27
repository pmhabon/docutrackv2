@props(['status' => '', 'commentersCount' => 0, 'pending' => 0])

@php
    $s = $status;
    $c = intval($commentersCount);
    $p = intval($pending);
    $badge = '';
    $label = '';

    if ($c > 0) {
        if ($p > 0) {
            $badge = 'bg-warning';
            $label = 'Pending';
        } else {
            $badge = 'bg-success';
            $label = 'Reviews Done';
        }
    } else {
        switch ($s) {
            case 'pending':
                $badge = 'bg-warning'; $label = 'Pending'; break;
            case 'pending_formatting':
                $badge = 'bg-info'; $label = 'No reviewers assigned'; break;
            case 'approved':
                $badge = 'bg-success'; $label = 'Approved'; break;
            case 'rejected':
                $badge = 'bg-danger'; $label = 'Rejected'; break;
            case 'no_reviewers_assigned':
                $badge = 'bg-info'; $label = 'No reviewers assigned'; break;
            case 'reviews_done':
                $badge = 'bg-success'; $label = 'Reviews Done'; break;
            default:
                $badge = 'bg-secondary'; $label = ucfirst(str_replace('_',' ',$s ?: 'Unknown')); break;
        }
    }
@endphp

<span class="badge {{ $badge }}">{{ $label }}</span>
