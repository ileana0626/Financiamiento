<template>
    <footer class="" style="background: var(--footer-bg) !important;">
        <div class="main-footer d-flex text-sm-center justify-content-between"
            style="background: var(--footer-bg) !important; color: var(--text-color); border-top: 1px solid var(--iee-light-gray-2);">
            <div class="d-sm-block mr-2 cr px-2">
                <small class="mr-1">Copyright &copy; 2024</small>
                <small>Instituto Electoral del Estado </small>
            </div>
            <div class="d-none d-sm-block">
                <small>Creado con &nbsp; <i class="fas fa-heart pulse-heart">
                    </i> &nbsp; por la Coordinación de
                    Informática</small>
            </div>
            <div class="d-sm-block ml-2 text-right text-sm-center">
                <small>Versión 1.12.21.08102024</small>
            </div>
        </div>
    </footer>
</template>
<style>
.pulse-heart {
    color: #ef1b55 !important;
    -webkit-animation-name: pulse-heart;
    animation-name: pulse-heart;
    -webkit-animation-duration: 1s;
    animation-duration: 1s;
    -webkit-animation-iteration-count: infinite;
    animation-iteration-count: infinite;
    -webkit-animation-timing-function: linear;
    animation-timing-function: linear
}

@-webkit-keyframes pulse-heart {
    0% {
        -webkit-transform: scale(1.1);
        transform: scale(1.1)
    }

    50% {
        -webkit-transform: scale(0.8);
        transform: scale(0.8)
    }

    100% {
        -webkit-transform: scale(1);
        transform: scale(1)
    }
}

@keyframes pulse-heart {
    0% {
        -webkit-transform: scale(1.1);
        transform: scale(1.1)
    }

    50% {
        -webkit-transform: scale(0.8);
        transform: scale(0.8)
    }

    100% {
        -webkit-transform: scale(1);
        webkit-transform: scale(1)
    }
}
</style>