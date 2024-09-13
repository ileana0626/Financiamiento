<template>
    <div class="">
        <div class="content-header">
            <div class="container-fluid mb-md-3 pl-4 pl-md-3 pt-0">
                <div class="float-sm-right mr-5">
                    <!-- Breadcrumb (navegacion) -->
                    <ul class="breadcrumb">
                        <li>
                            <router-link to="/"><span
                                class="material-symbols-rounded v-align-icon-bc">home</span></router-link>
                        </li>
                        <li>
                            <router-link to="/perfil"><span>
                                Mi Perfil
                            </span></router-link>
                        </li>
                        <li class="breadActive">
                            <span>Editar</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="px-3 px-md-5 container-fluid">
            <div class="mx-3 mt-5 mt-md-4">
                <!--Todo el contenido principal de la vista irá dentro de este div-->
                <div class="card-info">
                    <div class="card-header d-flex">
                        <h3 class="card-title font-weight-bold">Editar perfil</h3>
                    </div>
                    <div class="card-body container-fluid" style="background-color: var(--iee-white);">
                        <div class="row">
                            <div class="col-12 col-xl-6 px-3 pb-3">
                                <label class="col-form-label">Fotografía</label>
                                <div class="d-flex justify-content-center overflow-auto pb-4">
                                    <template v-if="fileComprobante.length === 0">
                                        <el-upload class="upload-demo my-4" :class="fileComprobante.length > 0 ? 'd-none' : 'd-block'" drag
                                        action="https://jsonplaceholder.typicode.com/posts/" :on-preview="handlePreview" :on-remove="handleRemove"
                                        :on-change="handleChange" :file-list="fileComprobante" :on-exceed="handleExceed" :auto-upload="false" accept=".jpg,.jpeg,.png"
                                        :limit="1" ref="upload">
                                        <i class="fa fa-cloud-upload-alt"
                                            style="font-size: 70px; margin-top: 30px; margin-bottom: 10px; color: var(--grey);"></i>
                                        <div class="el-upload__text">Suelta tu archivo aquí o <em>haz clic para seleccionar</em></div>
                                        <div slot="tip" class="el-upload__tip">Solo imágenes tipo JPG, JPEG o PNG con un tamaño menor a 5MB</div>
                                        </el-upload>
                                    </template>
                                    <template v-else>
                                        <div>
                                            <div class="d-flex justify-content-between p-2 cardFile" :class="!!darkMode ? 'shadow-dark' : 'shadow'">
                                                <!-- Tipo -->
                                                <div class="d-flex justify-content-between align-items-center">
                                                <div class="d-flex">
                                                    <i class="fa fa-file-image m-2 mr-3" style="font-size: 32px; color: var(--iee-white-dark);"></i>
                                                    <div class="d-flex flex-column filenameContainer">
                                                    <span class="errorDesc">Nombre</span>
                                                    <el-tooltip class="item" effect="dark" :content="fileComprobante[0].name" placement="right">
                                                        <div>
                                                        <span class="fileNameClass errorDescDesc bold" style=""> {{ fileComprobante[0].name }} </span>
                                                        </div>
                                                    </el-tooltip>
                                                    </div>
                                                </div>
                                                <el-tooltip class="item" effect="dark" content="Eliminar archivo" placement="right">
                                                    <div class="cardFileRemoveIcon" @click="eliminarArchivoSeleccionado">
                                                    <i class="far fa-trash-alt"></i>
                                                    </div>
                                                </el-tooltip>
                                                </div>
                                            </div>
                                        </div>
                                    </template>

                                </div>
                            </div>
                            <div class="col-12 px-3 d-flex justify-content-center">
                                <!-- <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#595959'" :key="'limpia1'+darkMode">
                                    <div style="color: var(--btn-txt-color); font-weight: 700;">
                                        <i class="fas fa-eraser pr-2" style="font-size: 0.8125rem !important;"></i>Limpiar
                                    </div>
                                </vs-button>       -->
                                <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#595959'" :key="'accion1'+darkMode">
                                    <div style="color: var(--btn-txt-color); font-weight: 700;">
                                        <i class="fas fa-pencil-alt pr-2" style="font-size: 0.8125rem !important;"></i>Actualizar Fotografía
                                    </div>
                                </vs-button>                                
                            </div>
                        </div>      
                        <el-divider></el-divider>                   
                        <div class="row">
                            <div class="col-12 col-lg-4 px-3 pb-3">
                                <label class="col-form-label">Nombre(s)</label>
                                <vs-input id="Nombres" type="text" color="#C2B280" icon-after
                                    placeholder="Nombre(s)" autocomplete="off">
                                </vs-input>
                            </div>
                            <div class="col-12 col-lg-4 px-3 pb-3">
                                <label class="col-form-label">Primer Apellido</label>
                                <vs-input id="Apaterno" type="text" color="#C2B280" icon-after
                                    placeholder="Primer Apellido" autocomplete="off">
                                </vs-input>
                            </div>
                            <div class="col-12 col-lg-4 px-3 pb-3">
                                <label class="col-form-label">Segundo Apellido</label>
                                <vs-input id="Amaterno" type="text" color="#C2B280" icon-after
                                    placeholder="Segundo Apellido" autocomplete="off">
                                </vs-input>
                            </div>
                            <div class="col-12 col-lg-4 px-3 pb-3">
                                <label class="col-form-label">Correo electrónico</label>
                                <vs-input id="email" type="email" color="#C2B280" icon-after
                                    placeholder="Correo electrónico" autocomplete="off">
                                </vs-input>
                            </div>
                            <div class="col-12 col-lg-4 px-3 pb-3">
                                <label class="col-form-label">Fecha de nacimiento</label>
                                <div class="d-block">
                                    <el-date-picker v-model="value1" type="date" placeholder="Seleccione su fecha de nacimiento"
                                        :picker-options="pickerOptions" :default-value="fechaValida" format="dd/MM/yyyy">
                                    </el-date-picker>
                                </div>
                            </div>
                            <div class="col-12 col-lg-4 px-3 pb-3">
                                <label class="col-form-label">Teléfono celular</label>
                                <vs-input id="celular" type="number" color="#C2B280" icon-after
                                    placeholder="Teléfono celular" autocomplete="off">
                                </vs-input>
                            </div>
                            <div class="col-12 px-3 d-flex justify-content-center flex-column flex-md-row pt-2">
                                <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#595959'" :key="'limpia2'+darkMode">
                                    <div style="color: var(--btn-txt-color); font-weight: 700;">
                                        <i class="fas fa-eraser pr-2" style="font-size: 0.8125rem !important;"></i>Limpiar
                                    </div>
                                </vs-button>      
                                <vs-button :color="!!(darkMode) ? '#f5f5f5' : '#595959'" :key="'accion2'+darkMode">
                                    <div style="color: var(--btn-txt-color); font-weight: 700;">
                                        <i class="fas fa-pencil-alt pr-2" style="font-size: 0.8125rem !important;"></i>Actualizar Datos
                                    </div>
                                </vs-button>                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data() {
        return {
            darkMode: localStorage.getItem('theme') == 'dark',
            
            fileComprobante: [],
            og: window.location.origin + '/',

            
            fechaValida: new Date().setFullYear( new Date().getFullYear() - 18),
            pickerOptions: {
                disabledDate(time) {
                    var date = new Date();
                    date.setFullYear(date.getFullYear() - 18);
                    return time.getTime() > date;
                    },
                },
            value1: '',
        }
    },
    created(){
        EventBus.$on('darkMode', (data)=>{this.darkMode = data})
    },
    methods: {
        handlePreview(file) {
        },
        handleRemove(file, fileList) {
            this.fileComprobante.splice(0, this.fileComprobante.length)
        },
        handleExceed(files, fileList) {
            Swal.fire({
                icon: 'error',
                title: 'Solo puede subir un documento como comprobante.',
                showConfirmButton: true,
                confirmButtonText: 'De acuerdo',
            });
        },
        handleChange(file, fileList) {
            let arregloNombre;
            var lastIndex = file.name.lastIndexOf('.');
            // Add the string before the last .
            // Return updated string, this will update the file.name attribute value
            arregloNombre = file.name.substr(lastIndex + 1);
            arregloNombre = String(arregloNombre).toUpperCase();

            if ((arregloNombre == 'JPG') || (arregloNombre == 'JPEG') || (arregloNombre == 'PNG')) {
                if (file.size > 5120000) {
                    this.$refs.upload.clearFiles();
                    Swal.fire({
                        icon: 'error',
                        html: '<div class="col"><div class="swal2-title p-0 mb-2">¡El archivo excede el límite de carga permitido!</div><div class="swal2-title font-weight-normal p-0" style="font-size: 20px">Seleccione uno con menor peso</div></div>',
                        showConfirmButton: true,
                        confirmButtonText: 'De acuerdo',
                    });

                    this.fileComprobante.splice(0, this.fileComprobante.length);

                } else {
                    this.fileComprobante.push(file.raw);
                }
            }
            else {
                this.fileComprobante.splice(0, this.fileComprobante.length);
                Swal.fire({
                    icon: 'error',
                    html: '<div class="col">'+
                            '<div class="swal2-title p-0 mb-2" style="font-size: 18px;">'+
                                '¡Formato de archivo no válido!'+
                            '</div>'+
                        '</div>',
                    showConfirmButton: true,
                    confirmButtonText: 'De acuerdo',
                    });
                }
        },
        eliminarArchivoSeleccionado() {
            Swal.fire({
                icon: 'warning',
                title: '¿Desea eliminar el archivo seleccionado?',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                // cancelButtonColor: 'transparent',
                cancelButtonText: "Cancelar",
                confirmButtonText: 'De acuerdo',
                reverseButtons: true,
            }).then((result) => {
                if (result.isConfirmed) {
                    this.handleRemove();
                }
            })
        },

    }
}
</script>

<style scoped>

</style>