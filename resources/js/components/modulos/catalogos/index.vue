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
        <div class="col-md-11 mx-auto">
            <div class="row">
                <div class="row col-md-6 col-6 mx-auto card-info px-0 pr-sm-5 pb-4">
                    <div class="card-header d-flex justify-content-between align-items-center container-fluid"
                        style="height: 8vh;">
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
                    <div class="card-body container-fluid" style="background-color: var(--iee-white); height: 82%">
                        <div class="center">
                            <vs-table>
                                <template #header>
                                    <vs-input v-model="search" border placeholder="Escribe un cargo"
                                        class="inputSearchPreguntas" />
                                </template>
                                <template #thead>
                                    <vs-tr>
                                        <vs-th style="width:100px; background-color: var(--iee-white);">
                                            #
                                        </vs-th>
                                        <vs-th sort @click="catCargos = $vs.sortData($event, catCargos, 'nombre')"
                                            style=" background-color: var(--iee-white);">
                                            Puesto
                                        </vs-th>
                                        <vs-th style=" background-color: var(--iee-white);">
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
                                            <el-tooltip class="item h-100" effect="dark" content="Editar"
                                                placement="top">
                                                <vs-button class="btn btn-flat btn-sm "
                                                    style="background-color: var(--iee-white);border-color: var(--iee-white);"
                                                    @click.prevent="Abrirmodal(1, 2, tr.idCargo, tr.nombre)">
                                                    <span class="material-symbols-rounded"
                                                        style="color: var(--text-color);">
                                                        edit
                                                    </span>
                                                </vs-button>
                                            </el-tooltip>
                                            <el-tooltip class="item h-100" effect="dark" content="Desactivar"
                                                placement="top" v-if="tr.status == 'A'">
                                                <vs-button class="btn btn-flat btn-sm "
                                                    style="background-color: var(--iee-white);border-color: var(--iee-white);"
                                                    @click.prevent="desactivar(7, tr.idCargo, 1)">
                                                    <span class="material-symbols-rounded"
                                                        style="color: var(--text-color);">
                                                        visibility
                                                    </span>
                                                </vs-button>
                                            </el-tooltip>

                                            <el-tooltip class="item h-100" effect="dark" content="Activar"
                                                placement="top" v-else-if="tr.status == 'I'">
                                                <vs-button class="btn btn-flat btn-sm "
                                                    style="background-color: var(--iee-white);border-color: var(--iee-white);"
                                                    @click.prevent="desactivar(7, tr.idCargo, 2)">
                                                    <span class="material-symbols-rounded"
                                                        style="color: var(--text-color);">
                                                        visibility_off
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
                <div class="row col-md-6 col-6 mx-auto card-info px-0 pr-sm-5 pb-4">
                    <div class="card-header d-flex justify-content-between align-items-center container-fluid"
                        style="height: 8vh;">
                        <h3 class="card-title font-weight-bold">Catalogo de Personal IEE</h3>
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
                    <div class="card-body container-fluid" style="background-color: var(--iee-white); height: 82%">
                        <div class="center">
                            <vs-table>
                                <template #header>
                                    <vs-input v-model="search2" border placeholder="Escribe un personal"
                                        class="inputSearchPreguntas" />
                                </template>
                                <template #thead>
                                    <vs-tr>
                                        <vs-th style="width:100px; background-color: var(--iee-white);">
                                            #
                                        </vs-th>
                                        <vs-th sort @click="catRemitente = $vs.sortData($event, catRemitente, 'nombre')"
                                            style=" background-color: var(--iee-white);">
                                            Personal
                                        </vs-th>
                                        <vs-th style=" background-color: var(--iee-white);">
                                            Accion
                                        </vs-th>
                                    </vs-tr>
                                </template>
                                <template #tbody>
                                    <vs-tr :key="i"
                                        v-for="(tr, i) in $vs.getPage($vs.getSearch(catRemitente, search2), pageRemitente, max)"
                                        :data="tr" style="max-height: 100px !important">
                                        <vs-td class="tableRowHeight">
                                            {{ i + 1 }}
                                        </vs-td>
                                        <vs-td class="tableRowHeight">
                                            {{ tr.nombre }}
                                        </vs-td>
                                        <vs-td class="d-flex align-items-center justify-content-center">
                                            <el-tooltip class="item h-100" effect="dark" content="Editar"
                                                placement="top">
                                                <vs-button class="btn btn-flat btn-sm "
                                                    style="background-color: var(--iee-white);border-color: var(--iee-white);"
                                                    @click.prevent="Abrirmodal(2, 2, tr.idRemitente, tr.nombre)">
                                                    <span class="material-symbols-rounded"
                                                        style="color: var(--text-color);">
                                                        edit
                                                    </span>
                                                </vs-button>
                                            </el-tooltip>
                                            <el-tooltip class="item h-100" effect="dark" content="Desactivar"
                                                placement="top" v-if="tr.status == 'A'">
                                                <vs-button class="btn btn-flat btn-sm "
                                                    style="background-color: var(--iee-white);border-color: var(--iee-white);"
                                                    @click.prevent="desactivar(2, tr.idRemitente, 1)">
                                                    <span class="material-symbols-rounded"
                                                        style="color: var(--text-color);">
                                                        visibility
                                                    </span>
                                                </vs-button>
                                            </el-tooltip>

                                            <el-tooltip class="item h-100" effect="dark" content="Activar"
                                                placement="top" v-else-if="tr.status == 'I'">
                                                <vs-button class="btn btn-flat btn-sm "
                                                    style="background-color: var(--iee-white);border-color: var(--iee-white);"
                                                    @click.prevent="desactivar(2, tr.idRemitente, 2)">
                                                    <span class="material-symbols-rounded"
                                                        style="color: var(--text-color);">
                                                        visibility_off
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
                                        :length="$vs.getLength($vs.getSearch(catRemitente, search2), max)"
                                        style="background-color: var(--iee-white) !important;" />
                                </template>
                            </vs-table>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row col-md-6 col-6 mx-auto card-info px-0 pr-sm-5 pb-4">
                    <div class="card-header d-flex justify-content-between align-items-center container-fluid"
                        style="height: 8vh;">
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
                    <div class="card-body container-fluid" style="background-color: var(--iee-white); height: 79%">
                        <div class="center">
                            <vs-table>
                                <template #header>
                                    <vs-input v-model="search3" border placeholder="Escribe un termino"
                                        class="inputSearchPreguntas" />
                                </template>
                                <template #thead>
                                    <vs-tr>
                                        <vs-th style="width:100px; background-color: var(--iee-white);">
                                            #
                                        </vs-th>
                                        <vs-th sort @click="catTermino = $vs.sortData($event, catTermino, 'nombre')"
                                            style=" background-color: var(--iee-white);">
                                            Tipos
                                        </vs-th>
                                        <vs-th style=" background-color: var(--iee-white);">
                                            Accion
                                        </vs-th>
                                    </vs-tr>
                                </template>
                                <template #tbody>
                                    <vs-tr :key="i"
                                        v-for="(tr, i) in $vs.getPage($vs.getSearch(catTermino, search3), pageTermino, max)"
                                        :data="tr" style="max-height: 100px !important">
                                        <vs-td class="tableRowHeight">
                                            {{ i + 1 }}
                                        </vs-td>
                                        <vs-td class="tableRowHeight">
                                            {{ tr.nombre }}
                                        </vs-td>
                                        <vs-td class="d-flex align-items-center justify-content-center">
                                            <el-tooltip class="item h-100" effect="dark" content="Editar"
                                                placement="top">
                                                <vs-button class="btn btn-flat btn-sm "
                                                    style="background-color: var(--iee-white);border-color: var(--iee-white);"
                                                    @click.prevent="Abrirmodal(3, 2, tr.idTermino, tr.nombre)">
                                                    <span class="material-symbols-rounded"
                                                        style="color: var(--text-color);">
                                                        edit
                                                    </span>
                                                </vs-button>
                                            </el-tooltip>
                                            <el-tooltip class="item h-100" effect="dark" content="Desactivar"
                                                placement="top" v-if="tr.status == 'A'">
                                                <vs-button class="btn btn-flat btn-sm "
                                                    style="background-color: var(--iee-white);border-color: var(--iee-white);"
                                                    @click.prevent="desactivar(3, tr.idTermino, 1)">
                                                    <span class="material-symbols-rounded"
                                                        style="color: var(--text-color);">
                                                        visibility
                                                    </span>
                                                </vs-button>
                                            </el-tooltip>

                                            <el-tooltip class="item h-100" effect="dark" content="Activar"
                                                placement="top" v-else-if="tr.status == 'I'">
                                                <vs-button class="btn btn-flat btn-sm "
                                                    style="background-color: var(--iee-white);border-color: var(--iee-white);"
                                                    @click.prevent="desactivar(3, tr.idTermino, 2)">
                                                    <span class="material-symbols-rounded"
                                                        style="color: var(--text-color);">
                                                        visibility_off
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
                                        :length="$vs.getLength($vs.getSearch(catTermino, search3), max)"
                                        style="background-color: var(--iee-white) !important;" />
                                </template>
                            </vs-table>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row col-md-6 col-6 mx-auto card-info px-0 pr-sm-5 pb-4">
                    <div class="card-header d-flex justify-content-between align-items-center container-fluid"
                        style="height: 8vh;">
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
                    <div class="card-body container-fluid" style="background-color: var(--iee-white); height: 79%">
                        <div class="center">
                            <vs-table>
                                <template #header>
                                    <vs-input v-model="search4" border placeholder="Escribe un seguimiento"
                                        class="inputSearchPreguntas" />
                                </template>
                                <template #thead>
                                    <vs-tr>
                                        <vs-th style="width:100px; background-color: var(--iee-white);">
                                            #
                                        </vs-th>
                                        <vs-th sort
                                            @click="cat_seguimiento = $vs.sortData($event, cat_seguimiento, 'nombre')"
                                            style=" background-color: var(--iee-white);">
                                            Tipo
                                        </vs-th>
                                        <vs-th style=" background-color: var(--iee-white);">
                                            Accion
                                        </vs-th>
                                    </vs-tr>
                                </template>
                                <template #tbody>
                                    <vs-tr :key="i"
                                        v-for="(tr, i) in $vs.getPage($vs.getSearch(cat_seguimiento, search4), pageSeguimiento, max)"
                                        :data="tr" style="max-height: 100px !important">
                                        <vs-td class="tableRowHeight">
                                            {{ i + 1 }}
                                        </vs-td>
                                        <vs-td class="tableRowHeight">
                                            {{ tr.nombre }}
                                        </vs-td>
                                        <vs-td class="d-flex align-items-center justify-content-center">
                                            <el-tooltip class="item h-100" effect="dark" content="Editar"
                                                placement="top">
                                                <vs-button class="btn btn-flat btn-sm "
                                                    style="background-color: var(--iee-white);border-color: var(--iee-white);"
                                                    @click.prevent="Abrirmodal(5, 2, tr.idSeguimiento, tr.nombre)">
                                                    <span class="material-symbols-rounded"
                                                        style="color: var(--text-color);">
                                                        edit
                                                    </span>
                                                </vs-button>
                                            </el-tooltip>
                                            <el-tooltip class="item h-100" effect="dark" content="Desactivar"
                                                placement="top" v-if="tr.status == 'A'">
                                                <vs-button class="btn btn-flat btn-sm "
                                                    style="background-color: var(--iee-white);border-color: var(--iee-white);"
                                                    @click.prevent="desactivar(5, tr.idSeguimiento, 1)">
                                                    <span class="material-symbols-rounded"
                                                        style="color: var(--text-color);">
                                                        visibility
                                                    </span>
                                                </vs-button>
                                            </el-tooltip>

                                            <el-tooltip class="item h-100" effect="dark" content="Activar"
                                                placement="top" v-else-if="tr.status == 'I'">
                                                <vs-button class="btn btn-flat btn-sm "
                                                    style="background-color: var(--iee-white);border-color: var(--iee-white);"
                                                    @click.prevent="desactivar(5, tr.idSeguimiento, 2)">
                                                    <span class="material-symbols-rounded"
                                                        style="color: var(--text-color);">
                                                        visibility_off
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
                                        :length="$vs.getLength($vs.getSearch(cat_seguimiento, search4), max)"
                                        style="background-color: var(--iee-white) !important;" />
                                </template>
                            </vs-table>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row col-md-6 col-6 mx-auto card-info px-0 pr-sm-5 pb-4">
                    <div class="card-header d-flex justify-content-between align-items-center container-fluid"
                        style="height: 8vh;">
                        <h3 class="card-title font-weight-bold">Catalogo de Áreas</h3>
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
                    <div class="card-body container-fluid" style="background-color: var(--iee-white); height: 90%">
                        <div class="center">
                            <vs-table>
                                <template #header>
                                    <vs-input v-model="search5" border placeholder="Escribe un área"
                                        class="inputSearchPreguntas" />
                                </template>
                                <template #thead>
                                    <vs-tr>
                                        <vs-th style="width:100px; background-color: var(--iee-white);">
                                            #
                                        </vs-th>
                                        <vs-th sort
                                            @click="cat_departamentos = $vs.sortData($event, cat_departamentos, 'nombre')"
                                            style=" background-color: var(--iee-white);">
                                            Área
                                        </vs-th>
                                        <vs-th style=" background-color: var(--iee-white);">
                                            Accion
                                        </vs-th>
                                    </vs-tr>
                                </template>
                                <template #tbody>
                                    <vs-tr :key="i"
                                        v-for="(tr, i) in $vs.getPage($vs.getSearch(cat_departamentos, search5), pageDepartamento, max)"
                                        :data="tr" style="max-height: 100px !important">
                                        <vs-td class="tableRowHeight">
                                            {{ i + 1 }}
                                        </vs-td>
                                        <vs-td class="tableRowHeight">
                                            {{ tr.nombre }}
                                        </vs-td>
                                        <vs-td class="d-flex align-items-center justify-content-center">
                                            <el-tooltip class="item h-100" effect="dark" content="Editar"
                                                placement="top">
                                                <vs-button class="btn btn-flat btn-sm "
                                                    style="background-color: var(--iee-white);border-color: var(--iee-white);"
                                                    @click.prevent="Abrirmodal(6, 2, tr.id, tr.nombre)">
                                                    <span class="material-symbols-rounded"
                                                        style="color: var(--text-color);">
                                                        edit
                                                    </span>
                                                </vs-button>
                                            </el-tooltip>
                                            <el-tooltip class="item h-100" effect="dark" content="Desactivar"
                                                placement="top" v-if="tr.status == 'A'">
                                                <vs-button class="btn btn-flat btn-sm "
                                                    style="background-color: var(--iee-white);border-color: var(--iee-white);"
                                                    @click.prevent="desactivar(6, tr.id, 1)">
                                                    <span class="material-symbols-rounded"
                                                        style="color: var(--text-color);">
                                                        visibility
                                                    </span>
                                                </vs-button>
                                            </el-tooltip>

                                            <el-tooltip class="item h-100" effect="dark" content="Activar"
                                                placement="top" v-else-if="tr.status == 'I'">
                                                <vs-button class="btn btn-flat btn-sm "
                                                    style="background-color: var(--iee-white);border-color: var(--iee-white);"
                                                    @click.prevent="desactivar(6, tr.id, 2)">
                                                    <span class="material-symbols-rounded"
                                                        style="color: var(--text-color);">
                                                        visibility_off
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
                                        :length="$vs.getLength($vs.getSearch(cat_departamentos, search5), max)"
                                        style="background-color: var(--iee-white) !important;" />
                                </template>
                            </vs-table>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row col-md-6 col-6 mx-auto card-info px-0 pr-sm-5 pb-4">
                    <div class="card-header d-flex justify-content-between align-items-center container-fluid"
                        style="height: 8vh;">
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
                    <div class="card-body container-fluid" style="background-color: var(--iee-white); height: 90%">
                        <div class="center">
                            <vs-table>
                                <template #header>
                                    <vs-input v-model="search6" border placeholder="Escribe un estatus"
                                        class="inputSearchPreguntas" />
                                </template>
                                <template #thead>
                                    <vs-tr>
                                        <vs-th style="width:100px; background-color: var(--iee-white);">
                                            #
                                        </vs-th>
                                        <vs-th sort @click="cat_estutus = $vs.sortData($event, cat_estutus, 'nombre')"
                                            style=" background-color: var(--iee-white);">
                                            Estatus
                                        </vs-th>
                                        <vs-th style=" background-color: var(--iee-white);">
                                            Accion
                                        </vs-th>
                                    </vs-tr>
                                </template>
                                <template #tbody>
                                    <vs-tr :key="i"
                                        v-for="(tr, i) in $vs.getPage($vs.getSearch(cat_estutus, search6), pageEstatus, max)"
                                        :data="tr" style="max-height: 100px !important">
                                        <vs-td class="tableRowHeight">
                                            {{ i + 1 }}
                                        </vs-td>
                                        <vs-td class="tableRowHeight">
                                            {{ tr.nombre }}
                                        </vs-td>
                                        <vs-td class="d-flex align-items-center justify-content-center">
                                            <el-tooltip class="item h-100" effect="dark" content="Editar"
                                                placement="top">
                                                <vs-button class="btn btn-flat btn-sm "
                                                    style="background-color: var(--iee-white);border-color: var(--iee-white);"
                                                    @click.prevent="Abrirmodal(8, 2, tr.id, tr.nombre)">
                                                    <span class="material-symbols-rounded"
                                                        style="color: var(--text-color);">
                                                        edit
                                                    </span>
                                                </vs-button>
                                            </el-tooltip>
                                            <el-tooltip class="item h-100" effect="dark" content="Desactivar"
                                                placement="top" v-if="tr.status == 'A'">
                                                <vs-button class="btn btn-flat btn-sm "
                                                    style="background-color: var(--iee-white);border-color: var(--iee-white);"
                                                    @click.prevent="desactivar(8, tr.id, 1)">
                                                    <span class="material-symbols-rounded"
                                                        style="color: var(--text-color);">
                                                        visibility
                                                    </span>
                                                </vs-button>
                                            </el-tooltip>

                                            <el-tooltip class="item h-100" effect="dark" content="Activar"
                                                placement="top" v-else-if="tr.status == 'I'">
                                                <vs-button class="btn btn-flat btn-sm "
                                                    style="background-color: var(--iee-white);border-color: var(--iee-white);"
                                                    @click.prevent="desactivar(8, tr.id, 2)">
                                                    <span class="material-symbols-rounded"
                                                        style="color: var(--text-color);">
                                                        visibility_off
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
                                        :length="$vs.getLength($vs.getSearch(cat_estutus, search6), max)"
                                        style="background-color: var(--iee-white) !important;" />
                                </template>
                            </vs-table>
                        </div>
                    </div>
                </div>
                <br>
                <div class="row col-md-6 col-6 mx-auto card-info px-0 pr-sm-5 pb-4">
                    <div class="card-header d-flex justify-content-between align-items-center container-fluid"
                        style="height: 8vh;">
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
                    <div class="card-body container-fluid" style="background-color: var(--iee-white); height: 87%">
                        <div class="center">
                            <vs-table>
                                <template #header>
                                    <vs-input v-model="search7" border placeholder="Escribe el tipo"
                                        class="inputSearchPreguntas" />
                                </template>
                                <template #thead>
                                    <vs-tr>
                                        <vs-th style="width:100px; background-color: var(--iee-white);">
                                            #
                                        </vs-th>
                                        <vs-th sort @click="cat_tipo = $vs.sortData($event, cat_tipo, 'nombre')"
                                            style=" background-color: var(--iee-white);">
                                            Tipo
                                        </vs-th>
                                        <vs-th style=" background-color: var(--iee-white);">
                                            Accion
                                        </vs-th>
                                    </vs-tr>
                                </template>
                                <template #tbody>
                                    <vs-tr :key="i"
                                        v-for="(tr, i) in $vs.getPage($vs.getSearch(cat_tipo, search7), pageTipo, max)"
                                        :data="tr" style="max-height: 100px !important">
                                        <vs-td class="tableRowHeight">
                                            {{ i + 1 }}
                                        </vs-td>
                                        <vs-td class="tableRowHeight">
                                            {{ tr.nombre }}
                                        </vs-td>
                                        <vs-td class="d-flex align-items-center justify-content-center">
                                            <el-tooltip class="item h-100" effect="dark" content="Editar"
                                                placement="top">
                                                <vs-button class="btn btn-flat btn-sm "
                                                    style="background-color: var(--iee-white);border-color: var(--iee-white);"
                                                    @click.prevent="Abrirmodal(7, 2, tr.id, tr.nombre)">
                                                    <span class="material-symbols-rounded"
                                                        style="color: var(--text-color);">
                                                        edit
                                                    </span>
                                                </vs-button>
                                            </el-tooltip>
                                            <el-tooltip class="item h-100" effect="dark" content="Desactivar"
                                                placement="top" v-if="tr.status == 'A'">
                                                <vs-button class="btn btn-flat btn-sm "
                                                    style="background-color: var(--iee-white);border-color: var(--iee-white);"
                                                    @click.prevent="desactivar(7, tr.id, 1)">
                                                    <span class="material-symbols-rounded"
                                                        style="color: var(--text-color);">
                                                        visibility
                                                    </span>
                                                </vs-button>
                                            </el-tooltip>

                                            <el-tooltip class="item h-100" effect="dark" content="Activar"
                                                placement="top" v-else-if="tr.status == 'I'">
                                                <vs-button class="btn btn-flat btn-sm "
                                                    style="background-color: var(--iee-white);border-color: var(--iee-white);"
                                                    @click.prevent="desactivar(7, tr.id, 2)">
                                                    <span class="material-symbols-rounded"
                                                        style="color: var(--text-color);">
                                                        visibility_off
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
                                        :length="$vs.getLength($vs.getSearch(cat_tipo, search7), max)"
                                        style="background-color: var(--iee-white) !important;" />
                                </template>
                            </vs-table>
                        </div>
                    </div>
                </div>
                <div class="row col-md-6 col-6 mx-auto card-info px-0 pr-sm-5 pb-4">
                    <div class="card-header d-flex justify-content-between align-items-center container-fluid"
                        style="height: 8vh;">
                        <h3 class="card-title font-weight-bold">Catalogo de Saludos</h3>
                        <div class="col card-tools d-flex justify-content-end">
                            <vs-button @click.prevent="Abrirmodal(9, 1, 0, '')"
                                style="background-color: var(--iee-white) !important; color: var(--text-color) !important">
                                <b>
                                    <span class="material-symbols-rounded v-align-icon-bc"> add </span>
                                    Agregar
                                </b>
                            </vs-button>
                        </div>
                    </div>
                    <div class="card-body container-fluid" style="background-color: var(--iee-white); height: 87%">
                        <div class="center">
                            <vs-table>
                                <template #header>
                                    <vs-input v-model="search8" border placeholder="Escribe el saludo"
                                        class="inputSearchPreguntas" />
                                </template>
                                <template #thead>
                                    <vs-tr>
                                        <vs-th style="width:100px; background-color: var(--iee-white);">
                                            #
                                        </vs-th>
                                        <vs-th sort @click="cat_tipo = $vs.sortData($event, cat_saludos, 'mensaje')"
                                            style=" background-color: var(--iee-white);">
                                            Mensaje
                                        </vs-th>
                                        <vs-th style=" background-color: var(--iee-white);">
                                            Accion
                                        </vs-th>
                                    </vs-tr>
                                </template>
                                <template #tbody>
                                    <vs-tr :key="i"
                                        v-for="(tr, i) in $vs.getPage($vs.getSearch(cat_saludos, search8), pageTipo, max)"
                                        :data="tr" style="max-height: 100px !important">
                                        <vs-td class="tableRowHeight">
                                            {{ i + 1 }}
                                        </vs-td>
                                        <vs-td class="tableRowHeight">
                                            {{ tr.mensaje }}
                                        </vs-td>
                                        <vs-td class="d-flex align-items-center justify-content-center">
                                            <el-tooltip class="item h-100" effect="dark" content="Editar"
                                                placement="top">
                                                <vs-button class="btn btn-flat btn-sm "
                                                    style="background-color: var(--iee-white);border-color: var(--iee-white);"
                                                    @click.prevent="Abrirmodal(9, 2, tr.id, tr.mensaje)">
                                                    <span class="material-symbols-rounded"
                                                        style="color: var(--text-color);">
                                                        edit
                                                    </span>
                                                </vs-button>
                                            </el-tooltip>
                                            <el-tooltip class="item h-100" effect="dark" content="Desactivar"
                                                placement="top" v-if="tr.estatus == 'A'">
                                                <vs-button class="btn btn-flat btn-sm "
                                                    style="background-color: var(--iee-white);border-color: var(--iee-white);"
                                                    @click.prevent="desactivar(9, tr.id, 1)">
                                                    <span class="material-symbols-rounded"
                                                        style="color: var(--text-color);">
                                                        visibility
                                                    </span>
                                                </vs-button>
                                            </el-tooltip>

                                            <el-tooltip class="item h-100" effect="dark" content="Activar"
                                                placement="top" v-else-if="tr.estatus == 'I'">
                                                <vs-button class="btn btn-flat btn-sm "
                                                    style="background-color: var(--iee-white);border-color: var(--iee-white);"
                                                    @click.prevent="desactivar(9, tr.id, 2)">
                                                    <span class="material-symbols-rounded"
                                                        style="color: var(--text-color);">
                                                        visibility_off
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
                                        :length="$vs.getLength($vs.getSearch(cat_saludos, search8), max)"
                                        style="background-color: var(--iee-white) !important;" />
                                </template>
                            </vs-table>
                        </div>
                    </div>
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
                <label class="col-form-label">{{nombreTabla}}</label>
                <vs-input type="text" :placeholder="nombreTabla" v-model="registro" autocomplete="off" id="asunto5">
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
                <label class="col-form-label">{{ nombreTabla }}</label>
                <vs-input type="text" :placeholder="nombreTabla" v-model="nombreEditado" autocomplete="off" id="asunto6">
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
            max: 5,
            search: '',
            search2: '',
            search3: '',
            search4: '',
            search5: '',
            search6: '',
            search7: '',
            search8: '',
            catRemitente: [],
            catCargos: [],
            catTermino: [],
            cat_seguimiento: [],
            cat_departamentos: [],
            cat_tipo: [],
            cat_estutus: [],
            cat_saludos: [],
            active: false,
            active2: false,
            table: 0,
            nombreTabla: '',
            registro: '',
            nombreEditado: '',
            idEditar: 0,
            datoActualizar: '',
            datosDuplicados: '',
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
        this.obtenerDatos(9)
    },
    methods: {
        obtenerDatos(tipo) {
            let url = '/administracion/usuario/obtenerDatos'
            axios.get(url, {
                params: {
                    'tipo': tipo,
                    'consulta': 2
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
                    case 9:
                        this.cat_saludos = response.data
                        break;
                    default:
                        break;
                }
            }).catch(error => {
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3], this.$router);

            });
        },
        Abrirmodal(tipo, modal, id, nom) {
            this.registro = ''
            this.datoActualizar = ''
            this.idEditar = 0
            this.nombreEditado = ''
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
                case 9:
                    this.table = 9
                    this.nombreTabla = 'Saludos'
                    break;
                default:
                    break;
            }
        },
        async registrar() {
            await this.consultarRegistros(this.table, this.registro)
            if (this.datosDuplicados >= 1) {
                Swal.fire({
                    icon: 'info',
                    title: 'Se cuenta con un registro igual',
                    showConfirmButton: true,
                    confirmButtonText: 'De acuerdo'
                });
            } else {
                this.validar(1)

                if (this.error == 1) {
                    return
                } else {
                    let url = '/administracion/usuario/registrar'
                    axios.post(url, {
                        'tipo': this.table,
                        'nombre': this.registro
                    }).then(response => {

                        this.obtenerDatos(this.table)
                        this.active = !this.active
                        this.registro = ''
                        Swal.fire({
                            icon: 'success',
                            title: 'Registrado correctamente',
                            showConfirmButton: true,
                            confirmButtonText: 'De acuerdo'
                        });
                    }).catch((error) => {
                        let nombreMetodo = url.split('/');
                        methods.catchHandler(error, nombreMetodo[3], this.$router);
                    })
                }
            }
        },
        async editar() {
            await this.consultarRegistros(this.table, this.nombreEditado)
            if (this.datosDuplicados >= 1) {
                Swal.fire({
                    icon: 'info',
                    title: 'Se cuenta con un registro igual',
                    showConfirmButton: true,
                    confirmButtonText: 'De acuerdo'
                });
            } else {

                this.validar(2)
                if (this.error == 1) {
                    return
                } else {
                    let url = '/administracion/usuario/editar'
                    axios.post(url, {
                        'tipo': this.table,
                        'id': this.idEditar,
                        'nombre': this.nombreEditado

                    }).then(response => {
                        this.obtenerDatos(this.table)
                        this.active2 = !this.active2
                        this.nombreEditado = ''
                        Swal.fire({
                            icon: 'success',
                            title: 'Registro actualizado correctamente',
                            showConfirmButton: true,
                            confirmButtonText: 'De acuerdo'
                        });
                    }).catch((error) => {
                        let nombreMetodo = url.split('/');
                        methods.catchHandler(error, nombreMetodo[3], this.$router);
                    })
                }
            }
        },
        validar(tipo) {
            this.error = 0;
            this.errorGuardar = ''
            this.errorEditar = ''
            if (tipo == 1) {
                if (this.registro.length == 0) {
                    this.registro.trim()
                    if (/^[0-9]{0,10}$/.test(this.registro)) {
                        this.error = 1;
                        this.errorGuardar = 'Caracteres no validos'
                    }
                }
            } else {
                if (this.nombreEditado.length == 0) {
                    this.nombreEditado.trim()
                    if (/^[0-9]{0,10}$/.test(this.nombreEditado)) {
                        this.error = 1;
                        this.errorEditar = 'Caracteres no validos'
                    }
                }
            }
        },
        async consultarRegistros(tipo, nombre) {
            this.datosDuplicados = 0
            let url = '/administracion/usuario/consultarRegistros'
            await axios.get(url, {
                params: {
                    'tipo': tipo,
                    'nombre': nombre
                }
            }).then(response => {
                this.datosDuplicados = response.data[0].total
            }).catch(error => {
                let nombreMetodo = url.split('/');
                methods.catchHandler(error, nombreMetodo[3], this.$router);

            });
        },
        desactivar(tipo, id, op) {
            Swal.fire({
                icon: 'warning',
                title: '¿Está seguro de ' + ((op == 1) ? 'desactivar' : 'activar') + ' el registro?',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: ((op == 1) ? 'Sí, desactivar' : 'Sí, activar'),
                cancelButtonText: "Cancelar",
                reverseButtons: true
            }).then((result) => {
                if (result.value) {
                    let url = '/administracion/usuario/desactivar'
                    axios.post(url, {
                        'tipo': tipo,
                        'id': id,
                        'estatus': (op == 1) ? 'I' : 'A'
                    }).then(response => {
                        this.obtenerDatos(tipo)
                        Swal.fire({
                            icon: 'success',
                            title: 'Se ' + ((op == 1) ? 'desactivo' : 'activo') + ' el registro',
                            showConfirmButton: true,
                            confirmButtonText: 'De acuerdo'
                        });
                    }).catch(error => {
                        let nombreMetodo = url.split('/');
                        methods.catchHandler(error, nombreMetodo[3], this.$router);

                    });
                }
            })
        }

    }
}
</script>

<style></style>