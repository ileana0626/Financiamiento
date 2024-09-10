<template>
    <div class="col">
        <div class="float-sm-right mr-5">
            <ul class="breadcrumb">
                <li>
                    <router-link to="/"><span class="material-symbols-rounded v-align-icon-bc">home</span></router-link>
                </li>
                <li class="breadActive">
                    <span>
                        Catalogos
                    </span>
                </li>
            </ul>
        </div>
        <br><br>
        <div class="row col-md-11 col-10 mx-auto card-info">
            <div class="card-header d-flex justify-content-between align-items-center container-fluid">
                <h3 class="card-title font-weight-bold">Catalogo de Cargos</h3>
                <div class="col card-tools d-flex justify-content-end">
                    <vs-button @click.prevent="Abrirmodal(1, 1, 0, '')"
                        style="background-color: var(--iee-white) !important; color: var(--text-color) !important">
                        <b>
                            <span class="material-symbols-rounded v-align-icon-bc"> add </span>
                            Agregar
                        </b>
                    </vs-button>
                </div>
            </div>
            <div class="card-body container-fluid" style="background-color: var(--iee-white);">
                <div class="center">
                    <vs-table>
                        <template #thead>
                            <vs-tr>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    #
                                </vs-th>
                                <vs-th sort @click="catCargos = $vs.sortData($event, catCargos, 'nombre')"
                                    style="width: 30px; background-color: var(--iee-white);">
                                    Puesto
                                </vs-th>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    Accion
                                </vs-th>
                            </vs-tr>
                        </template>
                        <template #tbody>
                            <vs-tr :key="i"
                                v-for="(tr, i) in $vs.getPage($vs.getSearch(catCargos, search), pageCargos, max)"
                                :data="tr" style="max-height: 100px !important">
                                <vs-td class="tableRowHeight">
                                    {{ i + 1 }}
                                </vs-td>
                                <vs-td class="tableRowHeight">
                                    {{ tr.nombre }}
                                </vs-td>
                                <vs-td class="d-flex align-items-center justify-content-center">
                                    <el-tooltip class="item h-100" effect="dark" content="Editar" placement="top">
                                        <vs-button class="btn btn-flat btn-sm "
                                            style="background-color: var(--iee-white);border-color: var(--iee-white);"
                                            @click.prevent="Abrirmodal(1, 2, tr.idCargo, tr.nombre)">
                                            <span class="material-symbols-rounded" style="color: var(--text-color);">
                                                edit
                                            </span>
                                        </vs-button>
                                    </el-tooltip>
                                </vs-td>
                            </vs-tr>
                        </template>
                        <template #notFound style="background-color: var(--iee-white) !important;">
                            Sin resultados...
                        </template>
                        <template #footer style="background-color: var(--iee-white) !important;">
                            <vs-pagination v-model="pageCargos" color="dark"
                                :length="$vs.getLength($vs.getSearch(catCargos, search), max)"
                                style="background-color: var(--iee-white) !important;" />
                        </template>
                    </vs-table>
                </div>
            </div>
        </div>
        <br>
        <div class="row col-md-11 col-10 mx-auto card-info">
            <div class="card-header d-flex justify-content-between align-items-center container-fluid">
                <h3 class="card-title font-weight-bold">Catalogo de Personal</h3>
                <div class="col card-tools d-flex justify-content-end">
                    <vs-button @click.prevent="Abrirmodal(2, 1, 0, '')"
                        style="background-color: var(--iee-white) !important; color: var(--text-color) !important">
                        <b>
                            <span class="material-symbols-rounded v-align-icon-bc"> add </span>
                            Agregar
                        </b>
                    </vs-button>
                </div>
            </div>
            <div class="card-body container-fluid" style="background-color: var(--iee-white);">
                <div class="center">
                    <vs-table>
                        <template #thead>
                            <vs-tr>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    #
                                </vs-th>
                                <vs-th sort @click="catRemitente = $vs.sortData($event, catRemitente, 'nombre')"
                                    style="width: 30px; background-color: var(--iee-white);">
                                    Personal
                                </vs-th>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    Accion
                                </vs-th>
                            </vs-tr>
                        </template>
                        <template #tbody>
                            <vs-tr :key="i"
                                v-for="(tr, i) in $vs.getPage($vs.getSearch(catRemitente, search), pageRemitente, max)"
                                :data="tr" style="max-height: 100px !important">
                                <vs-td class="tableRowHeight">
                                    {{ i + 1 }}
                                </vs-td>
                                <vs-td class="tableRowHeight">
                                    {{ tr.nombre }}
                                </vs-td>
                                <vs-td class="d-flex align-items-center justify-content-center">
                                    <el-tooltip class="item h-100" effect="dark" content="Editar" placement="top">
                                        <vs-button class="btn btn-flat btn-sm "
                                            style="background-color: var(--iee-white);border-color: var(--iee-white);"
                                            @click.prevent="Abrirmodal(2, 2, tr.idRemitente, tr.nombre)">
                                            <span class="material-symbols-rounded" style="color: var(--text-color);">
                                                edit
                                            </span>
                                        </vs-button>
                                    </el-tooltip>
                                </vs-td>
                            </vs-tr>
                        </template>
                        <template #notFound style="background-color: var(--iee-white) !important;">
                            Sin resultados...
                        </template>
                        <template #footer style="background-color: var(--iee-white) !important;">
                            <vs-pagination v-model="pageRemitente" color="dark"
                                :length="$vs.getLength($vs.getSearch(catRemitente, search), max)"
                                style="background-color: var(--iee-white) !important;" />
                        </template>
                    </vs-table>
                </div>
            </div>
        </div>
        <br>
        <div class="row col-md-11 col-10 mx-auto card-info">
            <div class="card-header d-flex justify-content-between align-items-center container-fluid">
                <h3 class="card-title font-weight-bold">Catalogo de Terminos</h3>
                <div class="col card-tools d-flex justify-content-end">
                    <vs-button @click.prevent="Abrirmodal(3, 1, 0, '')"
                        style="background-color: var(--iee-white) !important; color: var(--text-color) !important">
                        <b>
                            <span class="material-symbols-rounded v-align-icon-bc"> add </span>
                            Agregar
                        </b>
                    </vs-button>
                </div>
            </div>
            <div class="card-body container-fluid" style="background-color: var(--iee-white);">
                <div class="center">
                    <vs-table>
                        <template #thead>
                            <vs-tr>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    #
                                </vs-th>
                                <vs-th sort @click="catTermino = $vs.sortData($event, catTermino, 'nombre')"
                                    style="width: 30px; background-color: var(--iee-white);">
                                    Tipos
                                </vs-th>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    Accion
                                </vs-th>
                            </vs-tr>
                        </template>
                        <template #tbody>
                            <vs-tr :key="i"
                                v-for="(tr, i) in $vs.getPage($vs.getSearch(catTermino, search), pageTermino, max)"
                                :data="tr" style="max-height: 100px !important">
                                <vs-td class="tableRowHeight">
                                    {{ i + 1 }}
                                </vs-td>
                                <vs-td class="tableRowHeight">
                                    {{ tr.nombre }}
                                </vs-td>
                                <vs-td class="d-flex align-items-center justify-content-center">
                                    <el-tooltip class="item h-100" effect="dark" content="Editar" placement="top">
                                        <vs-button class="btn btn-flat btn-sm "
                                            style="background-color: var(--iee-white);border-color: var(--iee-white);"
                                            @click.prevent="Abrirmodal(3, 2, tr.idTermino, tr.nombre)">
                                            <span class="material-symbols-rounded" style="color: var(--text-color);">
                                                edit
                                            </span>
                                        </vs-button>
                                    </el-tooltip>
                                </vs-td>
                            </vs-tr>
                        </template>
                        <template #notFound style="background-color: var(--iee-white) !important;">
                            Sin resultados...
                        </template>
                        <template #footer style="background-color: var(--iee-white) !important;">
                            <vs-pagination v-model="pageTermino" color="dark"
                                :length="$vs.getLength($vs.getSearch(catTermino, search), max)"
                                style="background-color: var(--iee-white) !important;" />
                        </template>
                    </vs-table>
                </div>
            </div>
        </div>
        <br>
        <div class="row col-md-11 col-10 mx-auto card-info">
            <div class="card-header d-flex justify-content-between align-items-center container-fluid">
                <h3 class="card-title font-weight-bold">Catalogo de Seguimiento</h3>
                <div class="col card-tools d-flex justify-content-end">
                    <vs-button @click.prevent="Abrirmodal(5, 1, 0, '')"
                        style="background-color: var(--iee-white) !important; color: var(--text-color) !important">
                        <b>
                            <span class="material-symbols-rounded v-align-icon-bc"> add </span>
                            Agregar
                        </b>
                    </vs-button>
                </div>
            </div>
            <div class="card-body container-fluid" style="background-color: var(--iee-white);">
                <div class="center">
                    <vs-table>
                        <template #thead>
                            <vs-tr>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    #
                                </vs-th>
                                <vs-th sort @click="cat_seguimiento = $vs.sortData($event, cat_seguimiento, 'nombre')"
                                    style="width: 30px; background-color: var(--iee-white);">
                                    Tipo
                                </vs-th>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    Accion
                                </vs-th>
                            </vs-tr>
                        </template>
                        <template #tbody>
                            <vs-tr :key="i"
                                v-for="(tr, i) in $vs.getPage($vs.getSearch(cat_seguimiento, search), pageSeguimiento, max)"
                                :data="tr" style="max-height: 100px !important">
                                <vs-td class="tableRowHeight">
                                    {{ i + 1 }}
                                </vs-td>
                                <vs-td class="tableRowHeight">
                                    {{ tr.nombre }}
                                </vs-td>
                                <vs-td class="d-flex align-items-center justify-content-center">
                                    <el-tooltip class="item h-100" effect="dark" content="Editar" placement="top">
                                        <vs-button class="btn btn-flat btn-sm "
                                            style="background-color: var(--iee-white);border-color: var(--iee-white);"
                                            @click.prevent="Abrirmodal(5, 2, tr.idSeguimiento, tr.nombre)">
                                            <span class="material-symbols-rounded" style="color: var(--text-color);">
                                                edit
                                            </span>
                                        </vs-button>
                                    </el-tooltip>
                                </vs-td>
                            </vs-tr>
                        </template>
                        <template #notFound style="background-color: var(--iee-white) !important;">
                            Sin resultados...
                        </template>
                        <template #footer style="background-color: var(--iee-white) !important;">
                            <vs-pagination v-model="pageSeguimiento" color="dark"
                                :length="$vs.getLength($vs.getSearch(cat_seguimiento, search), max)"
                                style="background-color: var(--iee-white) !important;" />
                        </template>
                    </vs-table>
                </div>
            </div>
        </div>
        <br>
        <div class="row col-md-11 col-10 mx-auto card-info">
            <div class="card-header d-flex justify-content-between align-items-center container-fluid">
                <h3 class="card-title font-weight-bold">Catalogo de Departamentos</h3>
                <div class="col card-tools d-flex justify-content-end">
                    <vs-button @click.prevent="Abrirmodal(6, 1, 0, '')"
                        style="background-color: var(--iee-white) !important; color: var(--text-color) !important">
                        <b>
                            <span class="material-symbols-rounded v-align-icon-bc"> add </span>
                            Agregar
                        </b>
                    </vs-button>
                </div>
            </div>
            <div class="card-body container-fluid" style="background-color: var(--iee-white);">
                <div class="center">
                    <vs-table>
                        <template #thead>
                            <vs-tr>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    #
                                </vs-th>
                                <vs-th sort
                                    @click="cat_departamentos = $vs.sortData($event, cat_departamentos, 'nombre')"
                                    style="width: 30px; background-color: var(--iee-white);">
                                    Departamento
                                </vs-th>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    Accion
                                </vs-th>
                            </vs-tr>
                        </template>
                        <template #tbody>
                            <vs-tr :key="i"
                                v-for="(tr, i) in $vs.getPage($vs.getSearch(cat_departamentos, search), pageDepartamento, max)"
                                :data="tr" style="max-height: 100px !important">
                                <vs-td class="tableRowHeight">
                                    {{ i + 1 }}
                                </vs-td>
                                <vs-td class="tableRowHeight">
                                    {{ tr.nombre }}
                                </vs-td>
                                <vs-td class="d-flex align-items-center justify-content-center">
                                    <el-tooltip class="item h-100" effect="dark" content="Editar" placement="top">
                                        <vs-button class="btn btn-flat btn-sm "
                                            style="background-color: var(--iee-white);border-color: var(--iee-white);"
                                            @click.prevent="Abrirmodal(6, 2, tr.id, tr.nombre)">
                                            <span class="material-symbols-rounded" style="color: var(--text-color);">
                                                edit
                                            </span>
                                        </vs-button>
                                    </el-tooltip>
                                </vs-td>
                            </vs-tr>
                        </template>
                        <template #notFound style="background-color: var(--iee-white) !important;">
                            Sin resultados...
                        </template>
                        <template #footer style="background-color: var(--iee-white) !important;">
                            <vs-pagination v-model="pageDepartamento" color="dark"
                                :length="$vs.getLength($vs.getSearch(cat_departamentos, search), max)"
                                style="background-color: var(--iee-white) !important;" />
                        </template>
                    </vs-table>
                </div>
            </div>
        </div>
        <br>
        <div class="row col-md-11 col-10 mx-auto card-info">
            <div class="card-header d-flex justify-content-between align-items-center container-fluid">
                <h3 class="card-title font-weight-bold">Catalogo de Tipo</h3>
                <div class="col card-tools d-flex justify-content-end">
                    <vs-button @click.prevent="Abrirmodal(7, 1, 0, '')"
                        style="background-color: var(--iee-white) !important; color: var(--text-color) !important">
                        <b>
                            <span class="material-symbols-rounded v-align-icon-bc"> add </span>
                            Agregar
                        </b>
                    </vs-button>
                </div>
            </div>
            <div class="card-body container-fluid" style="background-color: var(--iee-white);">
                <div class="center">
                    <vs-table>
                        <template #thead>
                            <vs-tr>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    #
                                </vs-th>
                                <vs-th sort @click="cat_tipo = $vs.sortData($event, cat_tipo, 'nombre')"
                                    style="width: 30px; background-color: var(--iee-white);">
                                    Tipo
                                </vs-th>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    Accion
                                </vs-th>
                            </vs-tr>
                        </template>
                        <template #tbody>
                            <vs-tr :key="i"
                                v-for="(tr, i) in $vs.getPage($vs.getSearch(cat_tipo, search), pageTipo, max)"
                                :data="tr" style="max-height: 100px !important">
                                <vs-td class="tableRowHeight">
                                    {{ i + 1 }}
                                </vs-td>
                                <vs-td class="tableRowHeight">
                                    {{ tr.nombre }}
                                </vs-td>
                                <vs-td class="d-flex align-items-center justify-content-center">
                                    <el-tooltip class="item h-100" effect="dark" content="Editar" placement="top">
                                        <vs-button class="btn btn-flat btn-sm "
                                            style="background-color: var(--iee-white);border-color: var(--iee-white);"
                                            @click.prevent="Abrirmodal(7, 2, tr.id, tr.nombre)">
                                            <span class="material-symbols-rounded" style="color: var(--text-color);">
                                                edit
                                            </span>
                                        </vs-button>
                                    </el-tooltip>
                                </vs-td>
                            </vs-tr>
                        </template>
                        <template #notFound style="background-color: var(--iee-white) !important;">
                            Sin resultados...
                        </template>
                        <template #footer style="background-color: var(--iee-white) !important;">
                            <vs-pagination v-model="pageTipo" color="dark"
                                :length="$vs.getLength($vs.getSearch(cat_tipo, search), max)"
                                style="background-color: var(--iee-white) !important;" />
                        </template>
                    </vs-table>
                </div>
            </div>
        </div>
        <br>
        <div class="row col-md-11 col-10 mx-auto card-info">
            <div class="card-header d-flex justify-content-between align-items-center container-fluid">
                <h3 class="card-title font-weight-bold">Catalogo de Estatus</h3>
                <div class="col card-tools d-flex justify-content-end">
                    <vs-button @click.prevent="Abrirmodal(8, 1, 0, '')"
                        style="background-color: var(--iee-white) !important; color: var(--text-color) !important">
                        <b>
                            <span class="material-symbols-rounded v-align-icon-bc"> add </span>
                            Agregar
                        </b>
                    </vs-button>
                </div>
            </div>
            <div class="card-body container-fluid" style="background-color: var(--iee-white);">
                <div class="center">
                    <vs-table>
                        <template #thead>
                            <vs-tr>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    #
                                </vs-th>
                                <vs-th sort @click="cat_estutus = $vs.sortData($event, cat_estutus, 'nombre')"
                                    style="width: 30px; background-color: var(--iee-white);">
                                    Estatus
                                </vs-th>
                                <vs-th style="width: 30px; background-color: var(--iee-white);">
                                    Accion
                                </vs-th>
                            </vs-tr>
                        </template>
                        <template #tbody>
                            <vs-tr :key="i"
                                v-for="(tr, i) in $vs.getPage($vs.getSearch(cat_estutus, search), pageEstatus, max)"
                                :data="tr" style="max-height: 100px !important">
                                <vs-td class="tableRowHeight">
                                    {{ i + 1 }}
                                </vs-td>
                                <vs-td class="tableRowHeight">
                                    {{ tr.nombre }}
                                </vs-td>
                                <vs-td class="d-flex align-items-center justify-content-center">
                                    <el-tooltip class="item h-100" effect="dark" content="Editar" placement="top">
                                        <vs-button class="btn btn-flat btn-sm "
                                            style="background-color: var(--iee-white);border-color: var(--iee-white);"
                                            @click.prevent="Abrirmodal(8, 2, tr.id, tr.nombre)">
                                            <span class="material-symbols-rounded" style="color: var(--text-color);">
                                                edit
                                            </span>
                                        </vs-button>
                                    </el-tooltip>
                                </vs-td>
                            </vs-tr>
                        </template>
                        <template #notFound style="background-color: var(--iee-white) !important;">
                            Sin resultados...
                        </template>
                        <template #footer style="background-color: var(--iee-white) !important;">
                            <vs-pagination v-model="pageEstatus" color="dark"
                                :length="$vs.getLength($vs.getSearch(cat_estutus, search), max)"
                                style="background-color: var(--iee-white) !important;" />
                        </template>
                    </vs-table>
                </div>
            </div>
        </div>
        <vs-dialog blur v-model="active" id="pwd">
            <template #header>
                <div class="col text-center">
                    <div>
                        <br>
                        <h4 class="not-margin">
                            Agregar Nuevo Registro de <b>{{ nombreTabla }}</b>
                        </h4>
                    </div>
                </div>
            </template>
            <div class="con-form">
                <label class="col-form-label">Nombre</label>
                <vs-input type="text" placeholder="Nombre" v-model="registro" autocomplete="off" id="asunto5">
                    <template #icon>
                        <span class="material-symbols-rounded">
                            edit_note
                        </span>
                    </template>
                    <template #message-danger v-if="errorGuardar.length > 0">
                        {{ errorGuardar }}
                    </template>
                </vs-input>
                <br>
                <vs-button style="background-color: var(--iee-black) !important;" id="pwdb" block
                    @click.prevent="registrar">
                    Registrar
                </vs-button>
            </div>
            <template #footer>
                <center>
                    <div class="footer-dialog">
                    </div>
                </center>
            </template>
        </vs-dialog>

        <vs-dialog blur v-model="active2" id="pwd">
            <template #header>
                <div class="col text-center">
                    <div>
                        <br>
                        <h4 class="not-margin">
                            Actualizar Registro de <b>{{ nombreTabla }}</b>
                        </h4>
                        <br>
                        <h4 class="not-margin">
                            Dato Actualizar : <b>{{ datoActualizar }}</b>
                        </h4>
                    </div>
                </div>
            </template>
            <div class="con-form">
                <label class="col-form-label">Nombre</label>
                <vs-input type="text" placeholder="Nombre" v-model="nombreEditado" autocomplete="off" id="asunto6">
                    <template #icon>
                        <span class="material-symbols-rounded">
                            edit_note
                        </span>
                    </template>
                    <template #message-danger v-if="errorEditar.length > 0">
                        {{ errorEditar }}
                    </template>
                </vs-input>
                <br>
                <vs-button style="background-color: var(--iee-black) !important;" id="pwdb" block
                    @click.prevent="editar">
                    Editar
                </vs-button>
            </div>
            <template #footer>
                <center>
                    <div class="footer-dialog">
                    </div>
                </center>
            </template>
        </vs-dialog>
    </div>
</template>

<script>
let methods = require('../../../methods')
export default {
    data() {
        return {
            error: 1,
            pageRemitente: 1,
            pageCargos: 1,
            pageTermino: 1,
            pageSeguimiento: 1,
            pageDepartamento: 1,
            pageTipo: 1,
            pageEstatus: 1,
            max: 10,
            search: '',
            catRemitente: [],
            catCargos: [],
            catTermino: [],
            cat_seguimiento: [],
            cat_departamentos: [],
            cat_tipo: [],
            cat_estutus: [],
            active: false,
            active2: false,
            table: 0,
            nombreTabla: '',
            registro: '',
            nombreEditado: '',
            idEditar: 0,
            datoActualizar: '',
            errorEditar: '',
            errorGuardar: '',
        }
    },
    mounted() {
        this.obtenerDatos(1)
        this.obtenerDatos(2)
        this.obtenerDatos(3)
        this.obtenerDatos(5)
        this.obtenerDatos(6)
        this.obtenerDatos(7)
        this.obtenerDatos(8)
    },
    methods: {
        obtenerDatos(tipo) {
            let url = '/administracion/usuario/obtenerDatos'
            axios.get(url, {
                params: {
                    'tipo': tipo
                }
            }).then(response => {
                switch (tipo) {
                    case 1:
                        this.catCargos = response.data
                        break;
                    case 2:
                        this.catRemitente = response.data
                        break;
                    case 3:
                        this.catTermino = response.data
                        break;
                    case 5:
                        this.cat_seguimiento = response.data
                        break;
                    case 6:
                        this.cat_departamentos = response.data
                        break;
                    case 7:
                        this.cat_tipo = response.data
                        break;
                    case 8:
                        this.cat_estutus = response.data
                        break;
                    default:
                        break;
                }
            }).catch(error => {
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3]);

            });
        },
        Abrirmodal(tipo, modal, id, nom) {
            this.registro = ''
            this.datoActualizar = ''
            this.idEditar = 0
            if (modal == 1) {
                this.active = !this.active
                this.idEditar = 0
                this.datoActualizar = ''
            } else if (modal == 2) {
                this.active2 = !this.active2
                this.idEditar = id
                this.datoActualizar = nom
            }
            switch (tipo) {
                case 1:
                    this.table = 1
                    this.nombreTabla = 'Cargos'
                    break;
                case 2:
                    this.table = 2
                    this.nombreTabla = 'Personal'
                    break;
                case 3:
                    this.table = 3
                    this.nombreTabla = 'Terminos'
                    break;
                case 5:
                    this.table = 5
                    this.nombreTabla = 'Seguimiento'
                    break;
                case 6:
                    this.table = 6
                    this.nombreTabla = 'Departamentos'
                    break;
                case 7:
                    this.table = 7
                    this.nombreTabla = 'Tipo'
                    break;
                case 8:
                    this.table = 8
                    this.nombreTabla = 'Estatus'
                    break;
                default:
                    break;
            }
        },
        registrar() {
            this.validar()
            if (this.error = 1) {
                return
            } else {
                let url = '/administracion/usuario/registrar'
                axios.post(url, {
                    'tipo': this.table,
                    'nombre': this.registro
                }).then(response => {
                    this.obtenerDatos(this.table)
                    Swal.fire({
                        icon: 'success',
                        title: 'Registrado correctamente',
                        showConfirmButton: true,
                        confirmButtonText: 'De acuerdo'
                    });
                }).catch((error) => {
                    let nombreMetodo = url.split('/');
                    methods.catchHandler(error, nombreMetodo[3]);
                })
            }
        },
        editar() {
            this.validar()
            if (this.error = 1) {
                return
            } else {
                let url = '/administracion/usuario/editar'
                axios.post(url, {
                    'tipo': this.table,
                    'id': this.idEditar,
                    'nombre': this.nombreEditado

                }).then(response => {
                    this.obtenerDatos(this.table)
                    Swal.fire({
                        icon: 'success',
                        title: 'Registro actualizado correctamente',
                        showConfirmButton: true,
                        confirmButtonText: 'De acuerdo'
                    });
                }).catch((error) => {
                    let nombreMetodo = url.split('/');
                    methods.catchHandler(error, nombreMetodo[3]);
                })
            }
        },
        validar() {
            this.error = 0;
            if (this.registro.length == 0) {
                this.registro.trim()
                if (/^[0-9]{0,10}$/.test(this.registro)) {
                    this.error = 1;
                    this.errorEditar = 'Caracteres no validos'
                }
            }
            if (this.nombreEditado.length == 0) {
                this.nombreEditado.trim()
                if (/^[0-9]{0,10}$/.test(this.nombreEditado)) {
                    this.error = 1;
                    this.errorGuardar = 'Caracteres no validos'
                }
            }
        }

    }
}
</script>

<style></style>