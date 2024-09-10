<!DOCTYPE html>
<html>
<head>
    <title>NUEVA CUENTA CREADA</title>
</head>
<body>
    <div style="display:flex; justify-content: center; margin-left: auto; margin-right: auto; margin-top: 20px; margin-bottom: 20px;">
        <img style="width: 175px; height: 75px" src="https://conoceles.ieepuebla.org.mx/img/iee.png" alt="IEE Puebla" class="logoIEE">
        <img style="margin-left:50px; width: 250px; height: 75px" src="https://conoceles.ieepuebla.org.mx/img/LOGOELECCION2024_1.png" alt="logo IEE Puebla" class="banner">
    </div>
    <h1>SE HA CREADO TU CUENTA CORRECTAMENTE</h1>
    <span style="font-size: 1.25rem; margin-top: 50px">
        <strong style="text-transform: uppercase">Hola, {{$details['fullname']}}</strong>
        <br>se ha creado una cuenta para el <strong>Sistema de Registro de Candidaturas (SRC)</strong>
        para el usuario <strong>{{ $details['username'] }}</strong>
    </span>
    <br>
    <hr style="width: 90%; margin: 2rem; border: 3px solid #baa378; border-radius: 5px">
    
    <div style="min-width: 500px; margin:auto; margin-top: 50px; margin-bottom: 50px; background-color: #f5ede1; border-radius: 15px; width: 50%; padding: 2rem;">
        <div style="box-shadow: 0 0 5px 5px rgba(0, 0, 0, 0.5)">
            <img style="width:50%; display:flex; justify-content: center; margin: auto; margin-top: 20px; margin-bottom: 20px; border-radius: 15px;"
            src="https://src.ieepuebla.org.mx/img/src.webp" alt="SRC Logo">
        </div>
    
        <div style="width: 50%; text-align: center; margin: auto; border-radius: 10px; border: 2px solid #e4d6be; padding: 1rem;">
            <div style="font-size: 1.25rem; margin: 20px;"><strong>Su contraseña para acceder al sistema es:</strong></div>
            <div style="margin: 20px;"><strong style="font-size: 1.5rem; color: #0d1616;">{{$details['newPass']}}</strong></div>
        </div>
    </div>
    
    <hr style="width: 90%; margin: 2rem; border: 3px solid #baa378; border-radius: 5px">
    <br>
    <span style="font-size: 1.25rem;">Si el usuario aún no puede acceder al sistema, comuníquese al departamento de Coordinación de Informática</span> <br>
    
    <img style="display:flex; justify-content: center; margin: auto; margin-top: 20px; margin-bottom: 20px; border-radius: 15px;" src="https://gifdb.com/images/high/ugandan-knuckles-dancing-dead-inside-meme-c5nrcun7hz1ds839.gif" alt="logo IEE Puebla" class="dead-inside" width="500px">
    <br><br>
    <small style="font-size: 1rem; font-style: italic">Copyright © 2024 Instituto Electoral del Estado &nbsp; | &nbsp; Desarrollado por la Dirección Administrativa &nbsp; | &nbsp; Coordinación de Informática</small>
</body>
</html>