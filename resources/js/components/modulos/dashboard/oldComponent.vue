<template>
    <div>
        <div class="card cardintro d-flex flex-row" style="height: 19rem">
            <div class="tituloCard flex-grow-1 p-3 align-self-center" style="color: var(--iee-white);">
                <h5 class="font-weight-bold tituloin">
                    ¡Buen día {{ cfullname }}!
                </h5>
                <h6 class="subtituloin font-weight-bold subtituloin">
                    Lorem, ipsum dolor sit amet consectetur adipisicing elit. Modi odit facilis neque
                    corporis laborum sit, ratione consectetur officiis quae, itaque deleniti ullam amet
                    soluta labore repellat, expedita numquam assumenda impedit.
                </h6>
            </div>
            <div class="align-self-center">
                <img src="/img/imglogro.webp" style="height: 10vh !important;">
            </div>
        </div>
        <div class="col ">
            <div class="row mt-4 rowvalidados">
            </div>
        </div>  

        <div class="container-fluid px-3 px-xl-5 py-3 mt-3">
            <div class="row overflow-hidden">
                <div class="col-12 col-md-6 col-xl-6 d-flex justify-content-start izq-row pl-4 pl-md-0" style="background-color: #CC3843; border-radius: 25px;" >
                    <img src="/img/LOGO_NUEVO.png" alt="" class="bg-left-img" style="height: auto;">
                </div>
                <div class="col-12 col-md-8 col-lg-6 offset-md-2 pt-5 pb-3 mq-pos mt-md-3" style="background-color: #0c1f2c; color: white;">
                    <div class="container-fluid pt-5 pt-md-0 der-row">
                        <div class="bg-right-img bg-white">
                            <img draggable="false" src="/img/LOGO_NUEVO.png" alt="Foto de perfil" class="bg-right-img-adjust">
                        </div>
                        <div class="offset-0 offset-md-3 p-3">
                            <h1 class="font-weight-bold pt-3 pt-md-0">{{ `¡Buen día ${cfullname}!` }}</h1>
                            <p class="text-justify mt-3 font-weight-bold">
                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Aspernatur veritatis aliquid incidunt sapiente doloribus 
                                distinctio voluptatibus illum natus minima laborum quos in fugiat, pariatur architecto animi saepe esse id repellendus?
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div> 
        

        <div class="container-fluid px-3 px-xl-5 py-3" style="height: auto;">
            <div class="dash-cloud-card shadow">
                <div class="clouds"></div>
                <div class="row p-5">
                    <div class="col-12 col-lg-7 font-weight-bold">
                        <h1 class="font-weight-bold" style="color: #541FAB;">Bienvenido, {{ cfullname }}</h1>
                        <br>
                        <p class="text-justify" style="color: #595959">
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Ipsam rem nisi atque, veniam quaerat 
                            voluptas laudantium delectus beatae similique provident quo ratione deleniti recusandae in quos aperiam sequi quibusdam cumque.
                        </p>
                    </div>
                    <div class="col">
                        <div class="ribbon">
                            <img src="/img/ribbon-bg.png" alt="liston banner bienvenida">
                        </div>                            
                    </div>
                </div>
            </div>
        </div>        
    </div>   
</template>

<script>
export default {

}
</script>

<style>

</style>