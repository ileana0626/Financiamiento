<?php

Broadcast::channel('mensaje.{id}', function ($user, $id) {
    return (int) $user->id === (int) $id;
});
Broadcast::channel('escribiendo', function ($user) {
    return Auth::check();
});
Broadcast::channel('logout.user.{id}', function ($user, $id) {
    return (int) $user->id === (int) $id;
});