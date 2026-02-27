<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Notifications\Messages\DatabaseMessage;

class DocumentAssigned extends Notification
{
    use Queueable;

    protected $document;
    protected $assignedBy;

    public function __construct($document, $assignedBy)
    {
        $this->document = $document;
        $this->assignedBy = $assignedBy;
    }

    public function via($notifiable)
    {
        return ['database'];
    }

    public function toDatabase($notifiable)
    {
        $byName = $this->assignedBy->firstName . ' ' . $this->assignedBy->lastName;
        return [
            'message' => "$byName has added you as a commentor/reviewer on this file",
            'document_id' => $this->document->id,
            'title' => $this->document->title,
            'url' => route('documents.show', $this->document->id),
            'assigned_by' => $this->assignedBy->id,
        ];
    }
}
