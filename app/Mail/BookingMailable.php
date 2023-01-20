<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Support\Facades\Auth;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class BookingMailable extends Mailable
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
        $subject = "Hotel Reservation";
        return $this->from('test@thezabeerdhaka.com', 'The Zabeer Dhaka')
                    ->to(Auth::user()->email, Auth::user()->first_name.' '.Auth::user()->last_name)
                    ->view('mail-template.booking')
                    ->with($this->data)
                    ->subject($subject);
    }
}
