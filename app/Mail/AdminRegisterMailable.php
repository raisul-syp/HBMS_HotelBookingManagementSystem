<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class AdminRegisterMailable extends Mailable
{
    use Queueable, SerializesModels;
    public $data;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($data)
    {
        $this->data = $data;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        $subject = "User Registration";
        return $this->from('info@thezabeerdhaka.com', 'The Zabeer Dhaka User Registration')
                    ->to($this->data['user_email'])
                    ->view('mail-template.admin-register')
                    ->with($this->data)
                    ->subject($subject);
    }
}
