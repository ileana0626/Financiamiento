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
Broadcast::channel('navNotify.{idRol}.{idDPTO}', function($user, $idRol, $idDPTO){
    $user->load('roles');
    $idDPTO = ($idDPTO == NULL) ? 0 : $idDPTO;
    $hasRole = $user->roles->contains('idRol', $idRol);
    return $hasRole && $user->departamento == $idDPTO;
});
Broadcast::channel('test', function(){
    return true;
});