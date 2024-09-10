<html>
<head>
    <title>RECUPERACIÓN DE CONTRASEÑA</title>
</head>
<body>
    <div style="background-color: #f5f5f5; margin: 0; padding-left:0; padding-right:0; padding-top: 20px; padding-bottom:20px;">
        <div style="background-color: #FFFFFF; display:flex; margin-left: auto; margin-right: auto; margin-top: 20px; margin-bottom: 0px; padding-bottom:20px; min-width: 500px; width: 50%; border-radius: 15px 15px 0 0;">
            <img style="width: 175px; height: 80px; margin-left: auto; margin-right: 20px; margin-top:20px;" src="https://src.ieepuebla.org.mx/img/iee.png" alt="IEE Puebla" class="logoIEE">
            <img style="width: 250px; height: 75px; margin-right: auto; margin-left: 20px; margin-top:20px;" src="https://conoceles.ieepuebla.org.mx/img/LOGOELECCION2024_1.png" alt="logo IEE Puebla" class="banner">
        </div>
        
        <div style="min-width: 500px; margin:auto; margin-top: 0px; margin-bottom: 0px; background-color: #0d1616; border-radius:  0; width: 50%; padding: 2rem 0;">
            {{-- <img style="display:flex; justify-content: center; margin: auto; width: 100px; height: 100px; margin:auto;  border-radius: 15px;" src="https://src.ieepuebla.org.mx/img/lock-icon.png" alt="Reset Pass" class="lockIcon"> --}}
            {{-- <img style="display:flex; justify-content: center; margin: auto; margin-top: 20px; margin-bottom: 20px; border-radius: 100%;" src="https://src.ieepuebla.org.mx/img/xd.gif" alt="logo IEE Puebla" class="dead-inside" width="150px"> --}}
            <br><h1 style="margin: auto; text-align: center; color: #FFFFFF">Restablezca su contraseña</h1><br>
        </div>
    
        <div style="min-width: 500px; margin:auto; margin-top: 0px; margin-bottom: 0px; background-color: #FFFFFF; width: 50%;">
            <div style="width:90%; margin:auto">
                <span style="font-size: 1.25rem; margin-top: 0px; margin: 20px">
                    <br><strong style="text-transform: uppercase;">Hola, {{$details['fullname']}}</strong><br>
                    <br>
                    <span style="text-align:justify !important;">
                        Le hemos enviado este correo electrónico en respuesta a su solicitud para restablecer su contraseña del Sistema de Registro de Candidaturas.
                    </span><br><br>
                </span>
                <div style="width: 50%; text-align: center; margin: auto; border-radius: 10px; border: 2px solid #0d1616; padding: 1rem; background-color: #0d1616;">
                    <div style="font-size: 1.25rem; margin: 20px;"><strong style="color: #FFFFFF">Su nueva contraseña para acceder al sistema es:</strong></div>
                    <div style="margin: 20px;"><strong style="font-size: 1.5rem; color: #FFFFFF;">{{$details['newPass']}}</strong></div>
                    <div style="background-color: #FFFFFF; margin:auto; margin-bottom: 10px; width: 150px; height: 50px; display: flex; justify-content-center align-items-center;">
                        <a style="background-color: #a5904a; margin: 0.5rem; padding: 1rem 1.5rem; text-decoration: none; color: #FFFFFF; font-weight: bold; font-size: 1.1rem; border-radius: 15px;" href="src.ieepuebla.org.mx">Acceder</a>
                    </div>
                    <br>
                </div>
                <br>
                <span style="text-align:justify; font-size: 1.25rem; padding-bottom:20px">Si el usuario aún no puede acceder al sistema, comuníquese a la Dirección de Prerrogativas y Partidos Políticos (DPPP).</span> <br>
            </div>
        </div>
    
        <div style="min-width: 500px; margin:auto; margin-top: 0px; margin-bottom: 10px; background-color: #0d1616; border-radius: 0 0 15px 15px; width: 50%; padding: 2rem 0; font-weight:bold; font-size:0.85rem; color: #FFFFFF">
            <table style="margin: auto">
                <tr style="padding-right: 10px;">
                    <td>
                        Contacto
                    </td>
                    <td>
                        <a style="text-decoration: none; color: #FFFFFF; font-weight: normal" href="https://www.facebook.com/PueblaIEE"><img width="30" src="https://src.ieepuebla.org.mx/img/facebook.png" alt="Facebook"></a>
                        <a style="text-decoration: none; color: #FFFFFF; font-weight: normal" href="https://twitter.com/Puebla_IEE"><img width="30" src="https://src.ieepuebla.org.mx/img/twitter.png" alt="Twitter (X)"></a>
                        {{-- <a href="instagram.com"><img width="30" src="https://src.ieepuebla.org.mx/img/instagram.png" alt=""></a> --}} 
                        <a style="text-decoration: none; color: #FFFFFF; font-weight: normal" href="https://www.youtube.com/user/pueblaiee"><img width="30" src="https://src.ieepuebla.org.mx/img/youtube.png" alt="Youtube"></a>
                        <a style="text-decoration: none; color: #FFFFFF; font-weight: normal" href="https://www.tiktok.com/@iee_puebla"><img width="30" src="https://src.ieepuebla.org.mx/img/tiktok.png" alt="Tiktok"></a>
                        <a style="text-decoration: none; color: #FFFFFF; font-weight: normal" href="https://open.spotify.com/show/00HCXn1pO4rzqTwQ9Nf1Po"><img width="30" src="https://src.ieepuebla.org.mx/img/spotify.png" alt="Spotify"></a>
                    </td>
                </tr>
                <tr style="padding-left: 10px;">
                    <td>
                        Calle Aquiles Serdán Sur, No. 416-A, <br> Col. San Felipe Hueyotlipan, C.P. 72030 Puebla. Pue.
                    </td>
                </tr>
                <tr>
                    <td>
                        2024 ©  <a style="text-decoration: none; color: #a5904a;" href="ieepuebla.org.mx">Instituto Electoral del Estado de Puebla</a>
                    </td> 
                </tr>
            </table>
        </div>
    </div>
</body>
</html>