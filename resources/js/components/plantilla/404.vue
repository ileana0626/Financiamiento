<template>
    <div class="">
        <div class="m-5 d-flex flex-column align-items-center justify-content-center">
            <img class="w50" src="/img/404.webp" alt="Error 404">
            <h3 class="mt-4 text-center">
                <i class="fas fa-exclamation-triangle" style="font-size: 25px !important;"></i>
                <span>¡Ups! Página no encontrada.</span>
            </h3>
            <p class="text-justify" style="color: black;">
                <span>
                    No pudimos encontrar la página que esta buscando, mientras
                    tanto puede navegar entre las
                </span> <a href="/" class="text-center"
                    style="font-size: 1rem; color: var(--dorado) !important; display: initial;">páginas que tiene disponibles. <i
                        class="fas fa-external-link-alt pl-1" style="font-size: 16px !important;"></i></a>
            </p>
        </div>
    </div>
</template>

<script>
export default {

}
</script>

<style>
.fas.fa-exclamation-triangle {
    color: #00a19a !important;
}
</style>