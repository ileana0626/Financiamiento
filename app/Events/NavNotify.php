<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class NavNotify implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $info;
    public $idRol;
    public $idDPTO;

    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct($info, $idRol, $idDPTO)
    {
        $this->info = $info;
        $this->idRol = $idRol;
        $this->idDPTO = $idDPTO;
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        return new PrivateChannel('navNotifyy'. $this->idRol . $this->idDPTO);
    }

    public function broadcastWith()
    {
        // Datos que quieres enviar al cliente
        return [
            'info' => $this->info,
        ];
    }
}
