-- --------------------------------------------------------
-- Host:                         192.168.0.250
-- Versión del servidor:         8.0.25 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para admin
CREATE DATABASE IF NOT EXISTS `admin` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `admin`;

-- Volcando estructura para tabla admin.cat_adscripcion
CREATE TABLE IF NOT EXISTS `cat_adscripcion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla admin.cat_adscripcion: ~18 rows (aproximadamente)
/*DELETE FROM `cat_adscripcion`;*/
INSERT INTO `cat_adscripcion` (`id`, `nombre`, `status`) VALUES
	(1, 'CONSEJO GENERAL', 'A'),
	(2, 'PRESIDENCIA', 'A'),
	(3, 'SECRETARIA EJECUTIVA', 'A'),
	(4, 'CONTRALORIA INTERNA', 'A'),
	(5, 'DIRECCION ADMINISTRATIVA', 'A'),
	(6, 'DIRECCION JURIDICA', 'A'),
	(7, 'DIRECCION TECNICA DEL SECRETARIADO', 'A'),
	(8, 'DIRECCION DE PRERROGATIVAS Y P. P.', 'A'),
	(9, 'DIRECCION DE ORGANIZACION ELECTORAL', 'A'),
	(10, 'DIRECCION DE IGUALDAD Y NO DISCRIMINACION ', 'A'),
	(11, 'DIRECCION DE CAP. ELEC. Y E. CIVICA', 'A'),
	(12, 'DIRECCION DE ARCHIVOS', 'A'),
	(13, 'SUBDIRECCION DE PLANEACION Y EVALUACION', 'A'),
	(14, 'UNIDAD DE FORMACION Y DESARROLLO', 'A'),
	(15, 'UNIDAD DE TRANSPARENCIA', 'A'),
	(16, 'UNIDAD TECNICA DE FISCALIZACION', 'A'),
	(17, 'COORDINACION DE COMUNICACION SOCIAL', 'A'),
	(18, 'COORDINACION DE INFORMATICA', 'A');

-- Volcando estructura para tabla admin.cat_birthday
CREATE TABLE IF NOT EXISTS `cat_birthday` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_adscripcion` int NOT NULL,
  `nombre` varchar(500) NOT NULL,
  `dia` int DEFAULT NULL,
  `mes` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK__cat_adscripcion` (`id_adscripcion`),
  CONSTRAINT `FK__cat_adscripcion` FOREIGN KEY (`id_adscripcion`) REFERENCES `cat_adscripcion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Volcando estructura para tabla admin.cat_departamentos
CREATE TABLE IF NOT EXISTS `cat_departamentos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` enum('A','I') DEFAULT 'A',
  `correo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Volcando estructura para tabla admin.cat_marca
CREATE TABLE IF NOT EXISTS `cat_marca` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- SET FOREIGN_KEY_CHECKS = 0;
-- Volcando estructura para tabla admin.cat_permiso
CREATE TABLE IF NOT EXISTS `cat_permiso` (
  `idPermiso` int NOT NULL AUTO_INCREMENT,
  `slug` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL,
  `updated_at` timestamp NOT NULL,
  PRIMARY KEY (`idPermiso`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla admin.cat_permiso: ~30 rows (aproximadamente)
/*DELETE FROM `cat_permiso`;*/
INSERT INTO `cat_permiso` (`idPermiso`, `slug`, `nombre`, `created_at`, `updated_at`) VALUES
	(1, 'dashboard.index', 'Dashboard', '2023-06-30 19:41:14', '2023-06-30 19:41:15'),
	(2, 'faq.index', 'FAQ', '2023-07-05 18:59:00', '2023-07-05 18:59:03'),
	(3, 'solicitudes.captura', 'Captura', '2023-07-05 18:59:23', '2023-07-05 18:59:25'),
	(4, 'solicitudes.ver', 'Solicitudes', '2023-10-12 20:12:03', '2023-10-12 20:12:04'),
	(5, 'admin.catalogos', 'Ver Catalogos', '2023-10-13 22:55:49', '2023-10-13 22:55:50'),
	(6, 'catalogo.editar', 'Editar Catalogos', '2023-10-14 01:23:33', '2023-10-14 01:23:34'),
	(7, 'catalogo.activar', 'Activar Catalogo', '2023-10-17 19:55:51', '2023-10-17 19:55:52'),
	(8, 'catalogo.desactivar', 'Desactivar Catalogo', '2023-10-18 19:45:15', '2023-10-18 19:45:16'),
	(9, 'perfil.index', 'Ver Perfil', '2023-10-18 22:43:30', '2023-10-18 22:43:31'),
	(10, 'solicitudes.archivo', 'Cargar Solicitudes ', '2023-10-19 17:16:33', '2023-10-19 17:16:34'),
	(11, 'solicitudes.estatus', 'Estatus Solicitudes', '2023-10-19 17:25:09', '2023-10-19 17:25:10'),
	(12, 'admin.preferencias', 'Preferencias administrador', '2024-09-13 15:49:12', '2024-09-13 15:49:13'),
	(13, 'errores.index', 'Errores Index', '2024-09-13 15:49:49', '2024-09-13 15:49:50'),
	(14, 'recordatorios.captura', 'Recordatorio Captura', '2024-09-13 15:53:09', '2024-09-13 15:53:11'),
	(15, 'usuario.lista', 'Lista de usuarios', '2024-09-13 15:54:10', '2024-09-13 15:54:11'),
	(16, 'solicitudes.terminos', 'Ver terminos', '2024-09-13 18:17:30', '2024-09-13 18:17:31'),
	(17, 'editar.solicitud', 'Solicitud Editar', '2024-09-13 18:21:55', '2024-09-13 18:21:56'),
	(18, 'perfil.editar', 'Perfil editar', '2024-09-18 14:51:39', '2024-09-18 14:51:40'),
	(19, 'admin.usuarios', 'Index usuarios', '2024-09-20 16:22:00', '2024-09-20 16:22:01'),
	(20, 'usuario.ver', 'Ver usuario', '2024-09-20 16:22:00', '2024-09-20 16:22:01'),
	(21, 'usuario.editar', 'Editar usuario', '2024-09-20 16:22:00', '2024-09-20 16:22:01'),
	(22, 'usuario.permiso', 'Editar permisos usuario', '2024-09-20 16:22:00', '2024-09-20 16:22:01'),
	(23, 'usuario.desactivar', 'Desactivar usuario', '2024-09-20 16:22:00', '2024-09-20 16:22:01'),
	(24, 'usuario.activar', 'Activar usuario', '2024-09-20 16:22:00', '2024-09-20 16:22:01'),
	(25, 'captura.index', 'Capturar Solicitud', '2024-10-17 17:04:24', '2024-10-17 17:04:25'),
	(26, 'solicitudes.index', 'Index Solicitudes', '2024-11-06 18:33:30', '2024-11-06 18:33:31'),
	(27, 'birthday.index', 'Index Cumpleaños', '2024-11-06 18:33:30', '2024-11-06 18:33:31'),
	(28, 'personal.index', 'Index Personal', '2024-12-16 17:17:17', '2024-12-16 17:17:18'),
	(29, 'updatePersonal.index', 'Editar Datos del Personal', '2024-12-16 21:28:16', '2024-12-16 21:28:17'),
	(30, 'updatePersonalStatus.index', 'Editar Estado del Personal', '2024-12-16 21:29:05', '2024-12-16 21:29:06'),
    (31, 'distribucion.captura', 'Captura Distribucion', '2025-08-19 21:29:05', '2025-08-19 21:29:06'),
    (32, 'ministracion.captura', 'Captura Ministraciones', '2025-08-22 21:29:05', '2025-08-22 21:29:06');

-- Volcando estructura para tabla admin.cat_rol
CREATE TABLE IF NOT EXISTS `cat_rol` (
  `idRol` int NOT NULL AUTO_INCREMENT,
  `slug` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla admin.cat_rol: ~5 rows (aproximadamente)
/*DELETE FROM `cat_rol`;*/
INSERT INTO `cat_rol` (`idRol`, `slug`, `nombre`, `created_at`, `updated_at`) VALUES
	(1, 'rol.administrador', 'Administrador', '2024-09-13 15:36:29', '2024-09-13 15:36:30'),
	(2, 'rol.jefes', 'Jefes', '2024-09-13 15:36:29', '2024-09-13 15:36:30'),
	(3, 'rol.supervisor', 'Supervisor', '2024-09-13 15:36:29', '2024-09-13 15:36:30'),
	(4, 'rol.capturista', 'Capturista', '2024-09-13 15:36:29', '2024-09-13 15:36:30'),
	(5, 'rol.superAdministrador', 'Super Administrador', '2024-09-13 15:36:29', '2024-09-13 15:36:30');

-- Volcando estructura para tabla admin.cat_seguimiento
CREATE TABLE IF NOT EXISTS `cat_seguimiento` (
  `idSeguimiento` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) DEFAULT NULL,
  `status` enum('A','I') DEFAULT 'A',
  `correo` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`idSeguimiento`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Volcando estructura para tabla admin.cat_terminos
CREATE TABLE IF NOT EXISTS `cat_terminos` (
  `idTermino` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) DEFAULT NULL,
  `status` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`idTermino`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Volcando estructura para tabla admin.datos_personal
CREATE TABLE IF NOT EXISTS `datos_personal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` int NOT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `numCelular` varchar(12) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_created_by` (`created_by`),
  KEY `FK_updated_by` (`updated_by`),
  KEY `FK_idUser` (`user`),
  CONSTRAINT `FK_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_idUser` FOREIGN KEY (`user`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla admin.datos_personal: ~4 rows (aproximadamente)
/*DELETE FROM `datos_personal`;*/
INSERT INTO `datos_personal` (`id`, `user`, `fechaNacimiento`, `edad`, `numCelular`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
	(1, 2, '2000-09-19', NULL, '2220000000', '2024-09-17 23:16:42', 2, '2024-11-04 15:56:38', 2),
	(2, 6, '2006-08-27', NULL, '2220000006', '2024-09-24 16:52:13', 2, '2024-11-14 18:00:56', 2),
	(3, 5, '2006-11-14', NULL, '2220000011', '2024-11-14 17:39:56', 2, NULL, NULL),
	(4, 3, '1989-01-02', NULL, '2220000022', '2024-11-14 18:24:43', 2, NULL, NULL);

-- Volcando estructura para tabla admin.fechas
CREATE TABLE IF NOT EXISTS `fechas` (
  `idFecha` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL DEFAULT '0',
  `descripcion` varchar(255) DEFAULT NULL,
  `fechaInicio` date DEFAULT NULL,
  `horaInicio` time DEFAULT NULL,
  `fechaFin` date DEFAULT NULL,
  `horaFin` time DEFAULT NULL,
  `verCalendario` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idFecha`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando estructura para tabla admin.fotos_personal
CREATE TABLE IF NOT EXISTS `fotos_personal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` int NOT NULL,
  `ruta` varchar(255) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user` (`user`),
  KEY `FK_img_created_by` (`created_by`),
  KEY `FK_img_updated_by` (`updated_by`),
  CONSTRAINT `FK_img_created_by` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_img_updated_by` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_img_user` FOREIGN KEY (`user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Volcando estructura para tabla admin.files
CREATE TABLE IF NOT EXISTS `files` (
  `idDOCUMENTO` int NOT NULL AUTO_INCREMENT,
  `RUTA` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `TIPO` int DEFAULT NULL,
  `CREADO_AT` timestamp NOT NULL,
  `ACTUALIZADO_AT` timestamp NOT NULL,
  PRIMARY KEY (`idDOCUMENTO`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2869 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- Volcando estructura para tabla admin.permiso_has_rol
DROP TABLE IF EXISTS permiso_has_rol;
CREATE TABLE IF NOT EXISTS `permiso_has_rol` (
  `idPERMISO` int NOT NULL,
  `idROL` int NOT NULL,
  PRIMARY KEY (`idPERMISO`,`idROL`),
  KEY `FK__cat_rol` (`idROL`),
  KEY `idPERMISO` (`idPERMISO`),
  CONSTRAINT `FK__cat_rol` FOREIGN KEY (`idROL`) REFERENCES `cat_rol` (`idRol`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_permiso_has_rol_cat_permiso` FOREIGN KEY (`idPERMISO`) REFERENCES `cat_permiso` (`idPermiso`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla admin.permiso_has_rol: ~80 rows (aproximadamente)
/*DELETE FROM `permiso_has_rol`;*/
INSERT INTO `permiso_has_rol` (`idPERMISO`, `idROL`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(6, 1),
	(7, 1),
	(8, 1),
	(9, 1),
	(10, 1),
	(11, 1),
	(16, 1),
	(17, 1),
	(18, 1),
	(19, 1),
	(21, 1),
	(23, 1),
	(24, 1),
	(25, 1),
	(26, 1),
	(27, 1),
	(28, 1),
	(29, 1),
	(30, 1),
    (31, 1),
    (32, 1),
	(1, 2),
	(2, 2),
	(3, 2),
	(4, 2),
	(9, 2),
	(10, 2),
	(11, 2),
	(16, 2),
	(17, 2),
	(18, 2),
	(25, 2),
	(26, 2),
	(27, 2),
	(1, 3),
	(2, 3),
	(3, 3),
	(4, 3),
	(9, 3),
	(10, 3),
	(11, 3),
	(16, 3),
	(17, 3),
	(18, 3),
	(26, 3),
	(1, 4),
	(2, 4),
	(3, 4),
	(9, 4),
	(17, 4),
	(18, 4),
	(25, 4),
	(26, 4),
	(27, 4),
	(1, 5),
	(2, 5),
	(3, 5),
	(4, 5),
	(5, 5),
	(6, 5),
	(7, 5),
	(8, 5),
	(9, 5),
	(10, 5),
	(11, 5),
	(12, 5),
	(13, 5),
	(14, 5),
	(15, 5),
	(16, 5),
	(17, 5),
	(18, 5),
	(19, 5),
	(23, 5),
	(24, 5),
	(25, 5),
	(26, 5),
	(27, 5);

-- Volcando estructura para tabla admin.recordatorios
CREATE TABLE IF NOT EXISTS `recordatorios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `solicitudId` int NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_recordatorios_solicitudes` (`solicitudId`),
  CONSTRAINT `FK_recordatorios_solicitudes` FOREIGN KEY (`solicitudId`) REFERENCES `solicitudes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla admin.recordatorios: ~0 rows (aproximadamente)
/*DELETE FROM `recordatorios`;*/

-- Volcando estructura para tabla admin.saludos
CREATE TABLE IF NOT EXISTS `saludos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mensaje` varchar(255) DEFAULT '',
  `estatus` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla admin.saludos: ~5 rows (aproximadamente)
/*DELETE FROM `saludos`;*/
INSERT INTO `saludos` (`id`, `mensaje`, `estatus`) VALUES
	(1, '¡Ten un buen día para trabajar 1!', 'A'),
	(2, '¡Ten un buen día para trabajar 2!', 'A'),
	(3, '¡Ten un buen día para trabajar 3!', 'A'),
	(4, '¡Ten un buen día para trabajar 4!', 'A'),
	(5, '¡Ten un buen día para trabajar 5!', 'A');

-- Volcando estructura para tabla admin.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Apaterno` varchar(50) NOT NULL,
  `Amaterno` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `creado_at` timestamp NOT NULL,
  `state` enum('A','I') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'A',
  `curp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `clave_elector` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `inicio_sesion` timestamp NULL DEFAULT NULL,
  `INTENTOS_LOGIN` int DEFAULT '0',
  `email` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `departamento` int DEFAULT NULL,
  `ghost` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla admin.users: ~47 rows (aproximadamente)
/*DELETE FROM `users`;*/
INSERT INTO `users` (`id`, `Nombre`, `Apaterno`, `Amaterno`, `username`, `password`, `creado_at`, `state`, `curp`, `clave_elector`, `inicio_sesion`, `INTENTOS_LOGIN`, `email`, `updated_at`, `departamento`, `ghost`) VALUES
	(2, 'LUIS', 'Prueba', '', 'prueba', '$2y$10$yCV/HFXNBL2Rk39w41vS7.n7.1nxhM9A9yz5WnWEP15I0rncm3cra', '2023-06-30 09:13:49', 'A', NULL, NULL, NULL, 0, 'prueba@prueba.com', '2024-11-04 15:56:38', NULL, 1);
	
-- Volcando estructura para tabla admin.usuario_permiso
CREATE TABLE IF NOT EXISTS `usuario_permiso` (
  `idPermiso` int NOT NULL,
  `idUsuario` int NOT NULL,
  PRIMARY KEY (`idPermiso`,`idUsuario`),
  KEY `FK__user` (`idUsuario`),
  CONSTRAINT `FK__cat_permiso` FOREIGN KEY (`idPermiso`) REFERENCES `cat_permiso` (`idPermiso`),
  CONSTRAINT `FK__user` FOREIGN KEY (`idUsuario`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla admin.usuario_permiso: ~0 rows (aproximadamente)
/*DELETE FROM `usuario_permiso`;*/

-- Volcando estructura para tabla admin.usuario_rol
CREATE TABLE IF NOT EXISTS `usuario_rol` (
  `idRol` int NOT NULL,
  `idUsuario` int NOT NULL,
  PRIMARY KEY (`idRol`,`idUsuario`) USING BTREE,
  KEY `FK_usuario_rol_user` (`idUsuario`),
  CONSTRAINT `FK_usuario_rol_cat_rol` FOREIGN KEY (`idRol`) REFERENCES `cat_rol` (`idRol`),
  CONSTRAINT `FK_usuario_rol_user` FOREIGN KEY (`idUsuario`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla admin.usuario_rol: ~47 rows (aproximadamente)
/*DELETE FROM `usuario_rol`;*/
INSERT INTO `usuario_rol` (`idRol`, `idUsuario`) VALUES
	(5, 1),
	(1, 2),
	(2, 3),
	(3, 4),
	(4, 5),
	(3, 6),
	(4, 7),
	(2, 8),
	(1, 9),
	(2, 10),
	(3, 11),
	(4, 12),
	(2, 13),
	(3, 14),
	(4, 15),
	(2, 16),
	(3, 17),
	(4, 18),
	(2, 19),
	(3, 20),
	(4, 21),
	(2, 22),
	(3, 23),
	(4, 24),
	(2, 25),
	(3, 26),
	(4, 27),
	(2, 28),
	(3, 29),
	(4, 30),
	(2, 31),
	(3, 32),
	(4, 33),
	(2, 34),
	(3, 35),
	(4, 36),
	(2, 37),
	(3, 38),
	(4, 39),
	(2, 40),
	(3, 41),
	(4, 42),
	(2, 43),
	(3, 44),
	(4, 45),
	(4, 46),
	(4, 47);

/* INICIA TABLAS DE FINANCIAMIENTO */

DROP TABLE IF EXISTS anios_fiscales;
-- Volcando estructura para tabla admin.años fiscales
CREATE TABLE IF NOT EXISTS `anios_fiscales` (
  `anio` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO anios_fiscales (anio) VALUES
(2025),
(2026),
(2027),
(2028),
(2029),
(2030),
(2031),
(2032),
(2033),
(2034),
(2035);

DROP TABLE IF EXISTS cat_partido; -- Actualizamos el nombre del catálogo
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS cat_partido_sin_repr;
SET FOREIGN_KEY_CHECKS = 0;
CREATE TABLE IF NOT EXISTS `cat_partido_sin_repr` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siglas` varchar(10) DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tipo` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  logo varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla src2025.cat_partido: ~19 rows (aproximadamente)
INSERT INTO `cat_partido_sin_repr` (`id`, `siglas`, `nombre`, `tipo`, logo) VALUES
	(1, 'PSI', 'PACTO SOCIAL DE INTEGRACIÓN, PARTIDO POLÍTICO', 'PP','PSI_Small.webp'),
	(2, 'NAP', 'NUEVA ALIANZA PUEBLA', 'PP','NAP_Small.webp'),
	(3, 'FXMP', 'FUERZA POR MÉXICO PUEBLA', 'PP','FXMP_Small.webp');
    

DROP TABLE IF EXISTS cat_partido_conRepresentacion; -- Actualizamos el nombre del catálogo
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS cat_partido_con_repr;
SET FOREIGN_KEY_CHECKS = 1;
CREATE TABLE IF NOT EXISTS `cat_partido_con_repr` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siglas` varchar(10) DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tipo` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  logo varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla src2025.cat_partido: ~19 rows (aproximadamente)
INSERT INTO `cat_partido_con_repr` (`id`, `siglas`, `nombre`, `tipo`, logo) VALUES
	(1, 'PAN', 'PARTIDO ACCIÓN NACIONAL', 'PP','PAN_Small.webp'),
	(2, 'PRI', 'PARTIDO REVOLUCIONARIO INSTITUCIONAL', 'PP','PRI_Small.webp'),
	(3, 'PT', 'PARTIDO DEL TRABAJO', 'PP','PT_Small.webp'),
	(4, 'PVEM', 'PARTIDO VERDE ECOLOGISTA DE MÉXICO', 'PP','PVEM_Small.webp'),
	(5, 'MC', 'MOVIMIENTO CIUDADANO', 'PP','MC_Small.webp'),
	(6, 'PSI', 'PACTO SOCIAL DE INTEGRACIÓN, PARTIDO POLÍTICO', 'PP','PSI_Small.webp'),
	(7, 'MORENA', 'MORENA', 'PP','MORENA_Small.webp'),
	(8, 'NAP', 'NUEVA ALIANZA PUEBLA', 'PP', 'NAP_Small.webp'),
	(9, 'FXMP', 'FUERZA POR MÉXICO PUEBLA', 'PP', 'FXMP_Small.webp');


/*tabla calculo*/
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS calculo_dppp;
SET FOREIGN_KEY_CHECKS = 1;
/*
* @table Tabla de calculos para Financiamiento
* @description Personal de la DPPP
*/
CREATE TABLE calculo_dppp (
    id_calculo INT PRIMARY KEY AUTO_INCREMENT,
    anio_ejercicio YEAR NOT NULL COMMENT 'Año del ejercicio',
    fecha_publicacion DATE NOT NULL COMMENT 'Fecha de publicación de la UMA',
    uma DECIMAL(30,15) NOT NULL COMMENT 'Unidad de Medida y Actualización -> Calcula al insertar',
    uma_65 DECIMAL(30,15) NOT NULL COMMENT '65% de UMA -> Calcula al insertar',
    personas_padron INT UNSIGNED NOT NULL DEFAULT 0 COMMENT 'No de personas en padrón electoral',
    financiamiento_aop DECIMAL(30,15) NULL COMMENT  'fx=(uma_65 * personas_padron)',
    pp_sin_repr VARCHAR(255) NULL DEFAULT '' COMMENT "Id's de partidos sin representación en el congreso -> Ej: '1,2,3'",
    num_pp_sin_repr INT UNSIGNED NULL DEFAULT 0  COMMENT 'Número de partidos políticos con representación en el congreso',
    pp_sin_repr_siglas VARCHAR(255) NULL DEFAULT '' COMMENT "Siglas de partidos sin representación en el congreso -> Ej: 'PSI, NAP, FXMP'",
    pp_con_repr VARCHAR(255) NULL DEFAULT '' COMMENT "Id's de partidos con representación en el congreso -> Ej: '2,4,6,9'",
    pp_con_repr_siglas VARCHAR(255) NULL DEFAULT '' COMMENT "Siglas de partidos con representación en el congreso -> Ej: 'PAN, MORENA, PRI, PSI'",
    num_pp_con_repr INT UNSIGNED NULL DEFAULT 0  COMMENT 'Número de partidos políticos con representación en el congreso',
    -- Calculos que pueden ser NULL, ya que se van agregar durante la inserción
    total_fp_sin_repr DECIMAL(30,15) NOT NULL default 0.00 COMMENT'%2 del FPAOP para cada partido sin representación en el congreso 
     -> SUM((financiamiento_aop)  * 0.02) // Se calculará al guardar y recorrer cada partido_sin_repr',
    monto_total_efectivo DECIMAL(30,15) NOT NULL DEFAULT 0.00 COMMENT 'Monto total efectivo -> financiamiento_aop - total_fp_sin_repr',
    monto_30_por_ciento DECIMAL(30,15) NOT NULL DEFAULT 0.00 COMMENT '30% Monto total efectivo -> monto_total_efectivo * 0.3',
    monto_70_por_ciento DECIMAL(30,15) NOT NULL DEFAULT 0.00 COMMENT '70% Monto total efectivo -> monto_total_efectivo * 0.7',
    comprobacion_monto DECIMAL(30,15) NOT NULL DEFAULT 0.00 COMMENT 'Comprobación del monto total de financiamiento público para AOP',
    -- -> monto_30_por_ciento * monto_70_por_ciento + monto_total_efectivo
	created_at TIMESTAMP  NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

/*tabla intermedia*/
DROP TABLE IF EXISTS calculo_partido_sin_repr;
CREATE TABLE calculo_partido_sin_repr (
    id_calculo INT NOT NULL,
    id_partido INT NOT NULL,
    monto_2_por_ciento DECIMAL(30,15) NOT NULL COMMENT '2% del FPAOP por partido sin representación en el congreso',
    D_monto_2_por_ciento DECIMAL(30,15) NOT NULL COMMENT 'Distribución -> monto_2_por_ciento * Factor de cálculo',
    mintr_diciembre DECIMAL(30,15) NULL COMMENT 'Ministraciones - <<diciembre>> campo de ajuste de décimas de centavo',
    PRIMARY KEY (id_calculo, id_partido),
    FOREIGN KEY (id_calculo) REFERENCES calculo_dppp(id_calculo)
		ON DELETE RESTRICT,
    FOREIGN KEY (id_partido) REFERENCES cat_partido_sin_repr(id)
		ON DELETE RESTRICT
);

DROP TABLE IF EXISTS calculo_partido_con_repr;
CREATE TABLE calculo_partido_con_repr (
    id_calculo INT NOT NULL,
    id_partido INT NOT NULL,
    -- Nuevos campos para distribución
    porcentaje_votacion DECIMAL(30,15) NULL DEFAULT 0.00 COMMENT 'Distribución -> % de votación por cada partido político en elección inmediata anterior de diputaciones',
    A_30_por_ciento DECIMAL(30,15) NULL DEFAULT 0.00 COMMENT 'Distribución -> A. 30% en forma igualitaria',
    B_70_por_ciento DECIMAL(30,15) NULL DEFAULT 0.00 COMMENT 'Distribución -> B. 70% conforme al % de votación',
	ajuste DECIMAL(30,15) NOT NULL DEFAULT 0.00 COMMENT 'Distribución -> Ajuste decimas de centavos',
    B_Ajuste_70_por_ciento DECIMAL(30,15) NULL DEFAULT 0.00 COMMENT 'Distribución -> Total de B. 70% conforme al % de votación después del ajuste',
    C_fpaop DECIMAL(30,15) NULL DEFAULT 0.00 COMMENT 'Distribución -> Financiamiento público para actividades ordinarias permanentes (A+B)',
    D_fpatov DECIMAL(30,15) NULL DEFAULT 0.00 COMMENT 'Distribución -> Financiamiento público para actividades tendientes a la obtención del voto (D=C*Factor%)',
    mintr_diciembre DECIMAL(30,15) NULL COMMENT 'Ministraciones - <<diciembre>> campo de ajuste de décimas de centavo',
    PRIMARY KEY (id_calculo, id_partido),
    FOREIGN KEY (id_calculo) REFERENCES calculo_dppp(id_calculo)
		ON DELETE RESTRICT,
    FOREIGN KEY (id_partido) REFERENCES cat_partido_con_repr(id)
		ON DELETE RESTRICT
);

DROP TABlE IF EXISTS cat_tipo_distribucion;
/*
* table Tipo de distribucion de financiamiento
*/
CREATE TABLE cat_tipo_distribucion (
    id_tipo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(200) NOT NULL
);

insert into `cat_tipo_distribucion` (`id_tipo`, `nombre`) VALUES (1, "Financiamiento público para actividades ordinarias permanentes"), 
(2, "Financiamiento público para actividades tendientes a la obtención del voto");

DROP TABlE IF EXISTS distribucion_dppp;
/*
* @table Tabla de distribución para Financiamiento
* @description Personal de la DPPP
*/
CREATE TABLE distribucion_dppp(
	-- id_dist INT PRIMARY KEY COMMENT 'Será el mismo que cálculo', -- AUTO_INCREMENT,
    id_calculo INT NOT NULL COMMENT 'Id ligado a un cálculo',
    anio_ejercicio YEAR NOT NULL COMMENT 'Año del ejercicio apartado de distribución',
    tipo_distribucion VARCHAR(25) COMMENT 'id de tipo de distribución 1 | 2',
    monto_30_por_ciento DECIMAL(30,15) default 0.00 COMMENT '30% Monto manual',
    monto_70_por_ciento DECIMAL(30,15) default 0.00 COMMENT '70% Monto manual',
    tipoPorcentaje INT NULL DEFAULT 1 COMMENT '1 = A. 50% Gubernatura, 2 = B. 30% Intermedia, -> Factor de cálculo',
    -- Sumatorias de los totales
    subtotal_A_30_por_ciento DECIMAL(30,15) NULL DEFAULT 0.00 COMMENT ' Sumatoria -> A. 30% en forma igualitaria',
    subtotal_B_70_por_ciento DECIMAL(30,15) NULL DEFAULT 0.00 COMMENT 'Sumatoria -> B. 70% conforme al % de votación',
    subtotal_B_Ajuste_70_por_ciento DECIMAL(30,15) NULL DEFAULT 0.00 COMMENT 'Sumatoria -> Total de B. 70% conforme al % de votación después del ajuste',
    subtotal_C_fpaop DECIMAL(30,15) NULL DEFAULT 0.00 COMMENT 'Sumatoria -> Financiamiento público para actividades ordinarias permanentes (A+B)',
    subtotal_D_fpatov DECIMAL(30,15) NULL DEFAULT 0.00 COMMENT 'Sumatoria -> Financiamiento público para actividades tendientes a la obtención del voto SUBTOTAL->(D=C*FactorCalculo)',
    subtotal_2_por_ciento_fpaop_ppsr DECIMAL(30,15) NULL DEFAULT 0.00 COMMENT 'Sumatoria -> 2% del monto de financiamiento público para actividades ordinarias permanentes Partidos Políticos Sin Representación en el Congreso',
    subtotal_D_2_por_ciento_ppsr DECIMAL(30,15) NULL DEFAULT 0.00 COMMENT 'Sumatoria -> Financiamiento público para actividades tendientes a la obtención del voto -> (2_por_ciento_ppsr) * FactorCalculo)',
	subtotal_D_candidatura DECIMAL(30,15) NULL DEFAULT 0.00 COMMENT '(subtotal_D_fpatov + subtotal_D_2_por_ciento_ppsr) * 0.02',
	created_at TIMESTAMP  NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    PRIMARY KEY (id_calculo),
	FOREIGN KEY (id_calculo) REFERENCES calculo_dppp(id_calculo)
		ON DELETE RESTRICT
);


DROP TABlE IF EXISTS ministraciones_dppp;
/*
* @table Tabla de ministraciones para Financiamiento
* @description Personal de la DPPP
*/
CREATE TABLE ministraciones_dppp (
    -- id_ministracion INT PRIMARY KEY AUTO_INCREMENT,
    -- id_calculo INT NOT NULL COMMENT 'Id ligado a un cálculo y distribución',
    id_calculo INT NOT NULL COMMENT 'Id ligado a un cálculo y distribución',
    -- total_financiamiento DECIMAL(30,15) COMMENT 'Total de Financiamiento público para actividades ordinarias permanentes, por cada partido político.',
    total_enero DECIMAL(30,15),
    total_febrero DECIMAL(30,15),
    total_marzo DECIMAL(30,15),
    total_abril DECIMAL(30,15),
    total_mayo DECIMAL(30,15),
    total_junio DECIMAL(30,15),
    total_julio DECIMAL(30,15),
    total_agosto DECIMAL(30,15),
    total_septiembre DECIMAL(30,15),
    total_octubre DECIMAL(30,15),
    total_noviembre DECIMAL(30,15),
    total_diciembre DECIMAL(30,15),
    gran_total DECIMAL(30,15) COMMENT 'es la suma de todos los totales',
	PRIMARY KEY (id_calculo),
	FOREIGN KEY (id_calculo) REFERENCES calculo_dppp(id_calculo)
		ON DELETE RESTRICT
);

/* FIN TABLAS */

-- Volcando estructura para procedimiento admin.sp_Admin_validUserToEdit
DELIMITER //
CREATE PROCEDURE `sp_Admin_validUserToEdit`(
	IN `nId` INT
)
BEGIN
	SELECT 
		1 AS `valido`
	FROM users 
	WHERE users.id = nId AND users.state = 'A' AND users.ghost = 0;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_birthday_acciones
DELIMITER //
CREATE PROCEDURE `sp_birthday_acciones`(
	IN `tipo` INT,
	IN `adscripcion_` INT,
	IN `nombre_` VARCHAR(500),
	IN `dia_` INT,
	IN `mes_` INT,
	IN `id_` INT
)
BEGIN
	if tipo = 1 then 
		INSERT INTO cat_birthday ( id_adscripcion,nombre,dia,mes ) VALUES ( adscripcion_,nombre_,dia_, mes_);
	ELSEIF tipo = 2 then
		UPDATE cat_birthday SET 
		id_adscripcion = adscripcion_,
		nombre = nombre_,
		dia = dia_,
		mes = mes_
		WHERE cat_birthday.id = id_;
	END if;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Birthday_getTodayDates
DELIMITER //
CREATE PROCEDURE `sp_Birthday_getTodayDates`()
BEGIN
	SET @stamp = NOW();
	SET @matchDia = DAY(@stamp);
	SET @matchMes = MONTH(@stamp);
	
	SELECT 
		BDAY.nombre,
		DPTOS.nombre AS `adscripcion`
	FROM cat_birthday BDAY 
	LEFT JOIN cat_adscripcion DPTOS ON DPTOS.id = BDAY.id_adscripcion
	WHERE BDAY.dia = @matchDia AND BDAY.mes = @matchMes;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_ConsultarRolUsuario
DELIMITER //
CREATE PROCEDURE `sp_ConsultarRolUsuario`(
	IN `idUsers` INT
)
BEGIN
	SELECT 
		usuario_rol.*, 
		IFNULL(users.departamento, 0) AS `idDepartamento`
	FROM usuario_rol 
	LEFT JOIN users ON users.id = usuario_rol.idUsuario
	WHERE usuario_rol.idUsuario = idUsers;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Consultar_Usuairo
DELIMITER //
CREATE PROCEDURE `sp_Consultar_Usuairo`(
	IN `user` VARCHAR(50),
	IN `correo` VARCHAR(255)
)
BEGIN
	SELECT * FROM users WHERE users.username = USER AND users.email = correo LIMIT 1;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_getCurrentTime
DELIMITER //
CREATE PROCEDURE `sp_getCurrentTime`()
BEGIN
	SELECT DATE_FORMAT(NOW(), "%d/%m/%Y  %H:%i") AS 'currentTime';
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_getDatosPersonalesById
DELIMITER //
CREATE PROCEDURE `sp_getDatosPersonalesById`(
	IN `nId` INT
)
BEGIN
	SELECT 
		users.Nombre,
		IFNULL(users.Apaterno, '') AS `Apaterno`, 
		IFNULL(users.Amaterno, '') AS `Amaterno`, 
		users.email,
		DP.id AS `id_DP`,
		IFNULL(DP.fechaNacimiento, '') AS `fechaNacimiento`,
		IFNULL(DP.numCelular, '') AS `numCelular`,
		CTRL.nombre AS `rol`,
		IFNULL(FP.id, 0) AS `id_FP`,
		FP.ruta AS `rutaFP`
	FROM users 
	LEFT JOIN datos_personal DP ON DP.`user` = users.id
	LEFT JOIN usuario_rol USRL ON USRL.idUsuario = users.id
	LEFT JOIN cat_rol CTRL ON CTRL.idRol = USRL.idRol
	LEFT JOIN fotos_personal FP ON FP.`user` = users.id
	WHERE users.id = nId;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_getRoles
DELIMITER //
CREATE PROCEDURE `sp_getRoles`(
	IN `nIdRol` INT
)
BEGIN
	-- recibe el id de rol de quien lo llama para filtrar el catalogo
	SELECT 
		idRol, 
		slug, 
		nombre
	FROM cat_rol
	WHERE (
		case 
			when nIdRol = 1 then cat_rol.idRol != 1 AND cat_rol.idRol != 5
			when nIdRol = 5 then cat_rol.idRol > 0
			ELSE cat_rol.idRol < 1
		END);
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_getSaludoInicio
DELIMITER //
CREATE PROCEDURE `sp_getSaludoInicio`()
BEGIN
	SELECT * FROM saludos WHERE saludos.estatus = 'A' ORDER BY RAND() LIMIT 1;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_listado_birthday
DELIMITER //
CREATE PROCEDURE `sp_listado_birthday`()
BEGIN
SELECT 
cat_birthday.id,
cat_birthday.nombre,
cat_birthday.mes AS idMes,
cat_birthday.id_adscripcion,
 cat_adscripcion.nombre AS adscripcion,
 cat_birthday.dia,
 cat_meses.mes
FROM cat_birthday
INNER JOIN cat_adscripcion ON cat_adscripcion.id = cat_birthday.id_adscripcion
INNER JOIN cat_meses ON cat_meses.id = cat_birthday.mes

ORDER BY cat_birthday.dia,cat_birthday.mes DESC;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Periodos_getFechas
DELIMITER //
CREATE PROCEDURE `sp_Periodos_getFechas`()
BEGIN
	SELECT * FROM fechas;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Personal_obtenerPersonal
DELIMITER //
CREATE PROCEDURE `sp_Personal_obtenerPersonal`()
BEGIN
	SELECT
	personal.id,
	personal.nombre,
	personal.apellidop,
	personal.apellidom,
	personal.dpto,
	ca.nombre AS nombreAdscripcion,
	personal.`status`
	FROM personal
	LEFT JOIN cat_adscripcion ca ON ca.id = personal.dpto;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Solicitud_getAniosFiscales
DELIMITER //
CREATE PROCEDURE `sp_Solicitud_getAniosFiscales`()
BEGIN
	SELECT anio FROM anios_fiscales ORDER BY anio;
END//
DELIMITER

-- Volcando estructura para procedimiento admin.sp_Solicitud_setUpdateSysNotify
DELIMITER //
CREATE PROCEDURE `sp_Solicitud_setUpdateSysNotify`(
	IN `nSolicitud` INT,
	IN `fAccion` TIMESTAMP
)
BEGIN
	UPDATE cap_solicitud SET 
		sysNotify = fAccion
	WHERE id = nSolicitud;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Usuario_checkUsername
DELIMITER //
CREATE PROCEDURE `sp_Usuario_checkUsername`(
	IN `cUser` VARCHAR(255)
)
BEGIN
	SELECT users.id FROM users WHERE users.username = cUser;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Usuario_getDatosRolById
DELIMITER //
CREATE PROCEDURE `sp_Usuario_getDatosRolById`(
	IN `nId` INT
)
BEGIN
	SELECT 
		IFNULL(users.departamento, '') AS `idDPTO`,
		CTRL.idRol,
		CTRL.nombre AS `nombreRol`
	FROM users 
	LEFT JOIN usuario_rol USRL ON USRL.idUsuario = users.id
	LEFT JOIN cat_rol CTRL ON CTRL.idRol = USRL.idRol
	WHERE users.id = nId;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Usuario_getIdUsuario
DELIMITER //
CREATE PROCEDURE `sp_Usuario_getIdUsuario`(
	IN `numTel` VARCHAR(10)
)
BEGIN
SELECT users.id FROM users WHERE users.username = numTel;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Usuario_getListarAllUsers
DELIMITER //
CREATE PROCEDURE `sp_Usuario_getListarAllUsers`()
BEGIN
	SELECT	usuario.id,
			CONCAT_WS(' ', usuario.NOMBRE, usuario.APATERNO, usuario.AMATERNO)	AS	fullname,
			usuario.NOMBRE,
			usuario.APATERNO,
			usuario.AMATERNO,
			usuario.username,
			usuario.email,
			CTRL.nombre AS `nombreRol`,

			CASE	IFNULL(usuario.state, '')	WHEN	'A'	THEN	'ACTIVO'
																		ELSE	'INACTIVO'
																		END	state_alias,
			IFNULL(usuario.state, '')	AS	state,

			usuario_rol.idROL AS rol
			FROM users usuario

			LEFT JOIN usuario_rol ON usuario_rol.idUsuario = usuario.id
			LEFT JOIN cat_rol CTRL ON CTRL.idRol = usuario_rol.idRol
			WHERE usuario.ghost != 1
			#AND usuario.ghost != 1
				
	ORDER	BY	usuario.NOMBRE, usuario.APATERNO, usuario.AMATERNO;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Usuario_getListarRolPermisosByUsuario
DELIMITER //
CREATE PROCEDURE `sp_Usuario_getListarRolPermisosByUsuario`(
	IN `nidusuario` INT
)
BEGIN
	SET @rolUsuario := (
		SELECT usuario_rol.idROL FROM usuario_rol WHERE usuario_rol.idUSUARIO = 2
	);
	
	IF @rolUsuario = 3 THEN
		SELECT 
			permiso.idPERMISO,
			permiso.NOMBRE,
			permiso.SLUG
		FROM cat_permiso permiso
			INNER JOIN usuario_permiso user_permiso 
			ON permiso.idPERMISO = user_permiso.idPERMISO AND user_permiso.idUSUARIO = nidusuario;
	ELSE
		SELECT 
			permiso.idPERMISO,
			permiso.NOMBRE,
			permiso.SLUG
		FROM cat_permiso permiso
			INNER JOIN usuario_permiso user_permiso 
			ON permiso.idPERMISO = user_permiso.idPERMISO AND user_permiso.idUSUARIO = nidusuario
		
		UNION 
		
		SELECT p.idPERMISO, 
			p.NOMBRE,
			p.SLUG
		FROM  usuario_rol ur 
			INNER JOIN permiso_has_rol rp ON ur.idROL = rp.idROL
		INNER JOIN cat_permiso  p ON rp.idPERMISO = p.idPERMISO
		WHERE ur.idUSUARIO = nidusuario;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Usuario_getListarUsuarios
DELIMITER //
CREATE PROCEDURE `sp_Usuario_getListarUsuarios`(
	IN `nidusuario` INT,
	IN `cnombre` VARCHAR(255),
	IN `cusuario` VARCHAR(10),
	IN `cestado` CHAR(1)
)
BEGIN
		SELECT	usuario.id,
				CONCAT_WS(' ', usuario.NOMBRE, usuario.APATERNO, usuario.AMATERNO)	AS	fullname,
				usuario.NOMBRE,
				usuario.APATERNO,
				usuario.AMATERNO,
				usuario.username,

				CASE	IFNULL(usuario.state, '')	WHEN	'A'	THEN	'ACTIVO'
																			ELSE	'INACTIVO'
																			END	state_alias,
				IFNULL(usuario.state, '')	AS	state,

				usuario_rol.idROL AS rol,
				roles.nombre AS `nombreRol`
				FROM users usuario

				LEFT JOIN usuario_rol ON usuario_rol.idUsuario = usuario.id
				LEFT JOIN cat_rol roles ON roles.idRol = usuario_rol.idRol
	WHERE		CONCAT_WS(' ', usuario.NOMBRE, usuario.APATERNO, usuario.AMATERNO)	LIKE	CONCAT('%', cnombre, '%')
				AND	CONCAT_WS(' ', usuario.username)	LIKE	CONCAT('%', cusuario, '%')

				AND	(usuario.state	=	cestado	OR	cestado	=	'')
				AND 	(usuario.id = nidusuario OR nidusuario = 0)
				#AND usuario.ghost != 1
				
	ORDER	BY	usuario.NOMBRE, usuario.APATERNO, usuario.AMATERNO;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Usuario_GetTotalIntentos
DELIMITER //
CREATE PROCEDURE `sp_Usuario_GetTotalIntentos`(
	IN `usrTel` VARCHAR(50)
)
BEGIN
	SELECT users.INTENTOS_LOGIN FROM users WHERE users.username=usrTel;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Usuario_setCambiarEstadoById
DELIMITER //
CREATE PROCEDURE `sp_Usuario_setCambiarEstadoById`(
	IN `user_id` INT,
	IN `estado` VARCHAR(15)
)
BEGIN
	IF estado = 'INACTIVO' THEN
		UPDATE users SET state = 'I' WHERE users.id = user_id;
	ELSE
		UPDATE users SET state = 'A', users.INTENTOS_LOGIN = 0 WHERE users.id = user_id;
	END IF;
	SELECT users.id, users.username FROM users WHERE users.id = user_id;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Usuario_setRegistrarUser
DELIMITER //
CREATE PROCEDURE `sp_Usuario_setRegistrarUser`(
	IN `cNombre` VARCHAR(50),
	IN `cApaterno` VARCHAR(50),
	IN `cAmaterno` VARCHAR(50),
	IN `cUser` VARCHAR(255),
	IN `cHash` VARCHAR(255),
	IN `cEmail` VARCHAR(255),
	IN `nIdDPTO` INT,
	IN `nIdRol` INT,
	IN `fRegistro` TIMESTAMP
)
BEGIN
	INSERT INTO users (Nombre, Apaterno, Amaterno, username, `password`, email, creado_at, departamento)
	VALUES (cNombre, cAPaterno, cAmaterno, cUser, cHash, cEmail, fRegistro, nIdDPTO);
	
	SET @id_User := LAST_INSERT_ID();
	
	INSERT INTO usuario_rol (idRol, idUsuario)
	VALUES (nIdRol, @id_User);
	
	SELECT @id_User AS `idUser`;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Usuario_SetTotalIntentos
DELIMITER //
CREATE PROCEDURE `sp_Usuario_SetTotalIntentos`(
	IN `valor` INT,
	IN `usrTel` VARCHAR(50)
)
BEGIN
	-- Hace el set a 0 si el usuario logró iniciar sesión (recibe 0), de otra forma, se sumará 1 al total de intentos
	UPDATE users SET INTENTOS_LOGIN = IF(valor = 0, valor, (INTENTOS_LOGIN + 1))  WHERE users.username = usrTel;
	
   SET @totalIntentos := (	SELECT INTENTOS_LOGIN FROM users WHERE users.username = usrTel );
   
   -- Verifica si el total de intentos es igual a 3 y desactiva la cuenta si es así
	IF @totalIntentos >= 3 Then
	   UPDATE users SET state = 'I' WHERE users.username = usrTel;
	END IF;	
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Usuario_setUpdateDPTOById
DELIMITER //
CREATE PROCEDURE `sp_Usuario_setUpdateDPTOById`(
	IN `nId` INT,
	IN `nIdDPTO` INT,
	IN `fAccion` TIMESTAMP
)
BEGIN
	UPDATE users SET 
		users.departamento = nIdDPTO,
		users.updated_at = fAccion
	WHERE users.id = nId;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Usuario_setUpdateRolById
DELIMITER //
CREATE PROCEDURE `sp_Usuario_setUpdateRolById`(
	IN `nId` INT,
	IN `nIdRol` INT
)
BEGIN
	UPDATE usuario_rol SET
		usuario_rol.idRol = nIdRol
	WHERE usuario_rol.idUsuario = nId;
END//
DELIMITER ;


/* INICIAN LOS PROCEDURED DE FINANCIAMIENTO */

DROP PROCEDURE  IF EXISTS `sp_ConsultarDatos`;
-- Volcando estructura para procedimiento admin.sp_ConsultarDatos
DELIMITER //
CREATE PROCEDURE `sp_ConsultarDatos`(
	IN `tipo` INT,
	IN `consulta` INT
)
BEGIN
if consulta = 1 then
if tipo = 1  THEN
	SELECT * FROM cat_cargos WHERE status = 'A';
ELSEIF tipo = 2   THEN
		SELECT * FROM cat_remitentes WHERE status = 'A';
ELSEIF tipo = 3   THEN
		SELECT * FROM cat_terminos WHERE status = 'A' ;
ELSEIF tipo = 4   THEN
		SELECT * FROM cat_dias_termino ORDER BY cat_dias_termino.idDiasTermino desc ;
ELSEIF tipo = 5   THEN
		SELECT * FROM cat_seguimiento WHERE status = 'A';
ELSEIF tipo = 6   THEN
		SELECT * FROM cat_departamentos WHERE status = 'A';
ELSEIF tipo = 7   THEN
		SELECT * FROM cat_tipo WHERE status = 'A';
ELSEIF tipo = 8   THEN
		SELECT * FROM cat_estatus WHERE status = 'A';
ELSEIF tipo = 9   THEN
		SELECT * FROM cat_partido_sin_repr;
ELSEIF tipo = 10   THEN
		SELECT * FROM cat_partido_con_repr;
ELSEIF tipo = 11   THEN
		SELECT * FROM cat_tipo_distribucion;
END if;
ELSEIF  consulta = 2 then
	if tipo = 1  THEN
			SELECT * FROM cat_cargos;
	ELSEIF tipo = 2   THEN
			SELECT * FROM cat_remitentes;
	ELSEIF tipo = 3   THEN
			SELECT * FROM cat_terminos;
	ELSEIF tipo = 5   THEN
			SELECT * FROM cat_seguimiento;
	ELSEIF tipo = 6   THEN
			SELECT * FROM cat_departamentos;
	ELSEIF tipo = 7   THEN
			SELECT * FROM cat_tipo;
	ELSEIF tipo = 8   THEN
			SELECT * FROM cat_estatus;	
	ELSEIF tipo = 9   THEN
			SELECT * FROM saludos;
	ELSEIF tipo = 10   THEN
			SELECT * FROM cat_adscripcion;	
	ELSEIF tipo = 11   THEN
			SELECT * FROM cat_meses;	
	END if;	
END if;
END//
DELIMITER ;


DROP PROCEDURE IF EXISTS sp_insert_calculo;
DELIMITER //
/*
* @name Almacena los cálculos para Financiamiento
* @description Guarda la primera parte y después de guardar los partidos póliticos involucrados actualiza el resto de cálculos
* @example
	CALL `admin`.`sp_insert_calculo`(2025, '2015-06-12', 3500.43, 23, '1,3,4,5', '1,3',true, @Id );
	CALL `admin`.`sp_insert_calculo`(2035, '2025-02-13', 1231.43, 23, '1,4,5', '3',true, @Id );
	CALL `admin`.`sp_insert_calculo`(2024, '2025-04-08', 1000.00, 4, '1,2,4,5', '1,2',true, @Id );
	SELECT @ID;
*/
CREATE PROCEDURE sp_insert_calculo (
  IN p_anio YEAR,
  IN p_fecha_publicacion DATE,
  IN p_uma DECIMAL (30,15),
  IN p_personas_padron INT UNSIGNED,
  IN p_pp_sin_repr VARCHAR(255), -- ID
  IN p_pp_sin_repr_siglas VARCHAR(255), -- Siglas
  IN p_pp_con_repr VARCHAR(255), -- ID
  IN p_pp_con_repr_siglas VARCHAR(255), -- Siglas
  IN p_use_transaction BOOLEAN,
  OUT p_new_id INT UNSIGNED
)
BEGIN
-- Declaración de variables
  DECLARE v_uma65 DECIMAL(30,15);
  DECLARE v_fin_aop DECIMAL(30,15);
  DECLARE v_total_fp_sin_repr DECIMAL(30,15) DEFAULT 0; 
  DECLARE v_monto_total_efectivo DECIMAL(30,15);
  DECLARE v_num_pp_con_repr INT UNSIGNED DEFAULT 0; -- Número de particos con representación
  DECLARE v_monto30 DECIMAL(30,15);
  DECLARE v_monto70 DECIMAL(30,15);
  
    -- Manejador de errores
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		IF p_use_transaction THEN
			ROLLBACK;
		END IF;
		-- Propaga el error original
		RESIGNAL;
	END;
    -- Inicia transacción si está habilitado
    IF p_use_transaction THEN
        START TRANSACTION;
    END IF;
	-- Hace los primeros cálculos
  SET v_uma65 = p_uma * 0.65;
  SET v_fin_aop = v_uma65 * p_personas_padron;
  -- SET v_monto_total_efectivo = v_fin_aop; -- luego se descuenta el total de partidos sin representación
  -- SET v_monto30 = v_monto_total_efectivo * 0.3;
  -- SET v_monto70 = v_monto_total_efectivo * 0.7;

  INSERT INTO calculo_dppp(
	-- id_calculo, -- AutoIncrement
	anio_ejercicio,	fecha_publicacion, uma,	uma_65, personas_padron, financiamiento_aop, pp_sin_repr, pp_con_repr,
    pp_sin_repr_siglas, pp_con_repr_siglas
	-- num_pp_con_repr,
	-- total_fp_sin_repr,
	-- monto_total_efectivo,
	-- monto_30_por_ciento,
	-- monto_70_por_ciento,
	-- comprobacion_monto
  ) VALUES (
    p_anio, p_fecha_publicacion, p_uma, v_uma65, p_personas_padron, v_fin_aop, p_pp_sin_repr, p_pp_con_repr,
		p_pp_sin_repr_siglas, p_pp_con_repr_siglas
  );
  
  SET p_new_id = LAST_INSERT_ID(); -- Se obtiene el último Id de la tabla de los calculos
  -- Se agregan los registros de los partidos en tablas
   CALL sp_insert_partidos_sin_repr(p_new_id, p_pp_sin_repr);
   CALL sp_insert_partidos_con_repr(p_new_id, p_pp_con_repr);
  
    IF p_use_transaction THEN
        COMMIT;
    END IF;
END;//
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_insert_partidos_sin_repr;
/*guardar datos de partidos sin representantes*/
/*
* @name Procedimiento para vincular un cálculo con cartidos politicos sin representación
* @description Procedimiento que es llamado por sp_insert_calculo
* @param IN p_id_calculo INT,
* @param IN p_partidos VARCHAR(255) -- IDs separados por coma, e.g. '1,2'
* @example Solo para pruebas individuales
	CALL sp_insert_partidos_sin_repr(1,'2');
*/
DELIMITER //
CREATE PROCEDURE sp_insert_partidos_sin_repr (
	IN p_id_calculo INT,
	IN p_partidos VARCHAR(255)
)
BEGIN
	DECLARE v_fin_aop DECIMAL(30,15); -- Variable de consulta
	-- Variables para iterar el ciclo
	DECLARE v_partido_id INT;
	DECLARE v_count INT DEFAULT 0;
	DECLARE v_monto2 DECIMAL(30,15); -- Variable temporal para monto de financiamiento * 0.02
	DECLARE v_total_fp_sin_repr DECIMAL(30,15) DEFAULT 0;
	-- Variables para hacer los cálculos
	DECLARE v_monto_total_efectivo DECIMAL(30,15);
	DECLARE v_num_pp_con_repr INT UNSIGNED DEFAULT 0; -- Número de particos con representación
	DECLARE v_monto30 DECIMAL(30,15);
	DECLARE v_monto70 DECIMAL(30,15);
	    
	  -- COALESC: si financiamiento_aop es NULL, se usará 0 
	  SELECT COALESCE(financiamiento_aop, 0) INTO v_fin_aop FROM calculo_dppp 
		WHERE id_calculo = p_id_calculo
	  FOR UPDATE; -- Evita que otros procesos modifiquen estos registros hasta que termine la transacción actual
	  -- SELECT financiamiento_aop INTO v_fin_aop FROM calculo_dppp WHERE id_calculo = p_id_calculo;
      
	  SET v_monto2 = v_fin_aop * 0.02;
      
	  -- Borra registros previos si existen
	  DELETE FROM calculo_partido_sin_repr WHERE id_calculo = p_id_calculo;

	  WHILE LENGTH(p_partidos) > 0 DO
		SET v_partido_id = CAST(SUBSTRING_INDEX(p_partidos, ',', 1) AS UNSIGNED);
		SET p_partidos =  -- Busca la siguiente coma, entonces extrae la subcadena saltando la coma con +1
		  IF(INSTR(p_partidos, ',') > 0, SUBSTRING(p_partidos, INSTR(p_partidos, ',') + 1), '');
		
		-- Inserta el id del calculo y del partido encontrado, más el monto de financiamiento público AOP * 0.02, por cada partido
		INSERT INTO calculo_partido_sin_repr(id_calculo, id_partido, monto_2_por_ciento)
		  VALUES (p_id_calculo, v_partido_id, v_monto2);
		SET v_count = v_count + 1; -- incrementa conteo de partidos
		SET v_total_fp_sin_repr = v_total_fp_sin_repr + v_monto2; -- Sumatoria de los montos por partido
	  END WHILE;
      
	-- Asignamos los nuevos cálculos antes de actualizar la tabla de cálculos
	  SET v_monto_total_efectivo = v_fin_aop - v_total_fp_sin_repr;
      SET v_monto30 = v_monto_total_efectivo * 0.3;
      SET v_monto70 = v_monto_total_efectivo * 0.7;
      
	  -- Actualiza cálculo con total de FP sin representación y monto efectivo y comprobaciones
	  UPDATE calculo_dppp
	  SET num_pp_sin_repr = v_count,
		  total_fp_sin_repr = v_total_fp_sin_repr,
		  monto_total_efectivo = v_monto_total_efectivo,
		  monto_30_por_ciento = v_monto30,
		  monto_70_por_ciento = v_monto70,
		  comprobacion_monto = (v_monto30 + v_monto70 + v_total_fp_sin_repr)
	  WHERE id_calculo = p_id_calculo;
END;
//
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_insert_partidos_con_repr;
/*guardar datoos de partidos con representantes*/
DELIMITER //
/*
* @name Procedimiento para vincular un cálculo con cartidos politicos con representación
* @description Procedimiento que es llamado por sp_insert_calculo
* @param IN p_id_calculo INT,
* @param IN p_partidos VARCHAR(255) -- IDs separados por coma, e.g. '1,2,6'
* @example Solo para pruebas individuales
	CALL sp_insert_partidos_sin_repr(1,'1,2');
*/
CREATE PROCEDURE sp_insert_partidos_con_repr (
	IN p_id_calculo Varchar(250),
	IN p_partidos Varchar(250) -- IDs separados '3,5,7'
)
BEGIN
	DECLARE v_partido_id INT;
	DECLARE v_count INT DEFAULT 0;

	  DELETE FROM calculo_partido_con_repr WHERE id_calculo = p_id_calculo;

	  WHILE LENGTH(p_partidos) > 0 DO
		SET v_partido_id = CAST(SUBSTRING_INDEX(p_partidos, ',', 1) AS UNSIGNED);
		SET p_partidos =  -- Busca la siguiente coma, entonces extrae la subcadena saltando la coma con +1
		  IF(INSTR(p_partidos, ',') > 0, SUBSTRING(p_partidos, INSTR(p_partidos, ',') + 1), '');
          -- Inserta el id del calculo y del partido encontrado
		INSERT INTO calculo_partido_con_repr(id_calculo, id_partido)
		  VALUES (p_id_calculo, v_partido_id);
		SET v_count = v_count + 1;  -- incrementa conteo de partidos
	  END WHILE;

	  UPDATE calculo_dppp SET num_pp_con_repr = v_count WHERE id_calculo = p_id_calculo;
END;
//
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_get_calculo_completo;
/*obtener datos completos del calculo*/
DELIMITER //
/*
* @name Procedimiento para listar los cálculos de Financiamiento
* @description Retorna todos los cálculos financieros registrados
* @param p_id_calculo -- opcional
* -- Todos los registros
* CALL sp_get_calculo_completo(NULL);
* -- Un registro específico
* CALL sp_get_calculo_completo(2);
* @note
* DATE_FORMAT(fecha_publicacion, '%d/%m/%Y') AS 'fecha_pub' se cambia a '%Y-%m-%d'
*/
CREATE PROCEDURE sp_get_calculo_completo(IN p_id_calculo INT UNSIGNED)
BEGIN
	-- Variables locales
	DECLARE strQ2 VARCHAR(25);
	-- Variable de usuario para la consulta
    SET @strQuery = "SELECT id_calculo AS 'id', anio_ejercicio AS 'anioFiscal', DATE_FORMAT(fecha_publicacion, '%Y-%m-%d') AS 'fecha_pub', uma, uma_65, personas_padron, financiamiento_aop, 
		pp_sin_repr, pp_con_repr, pp_sin_repr_siglas, pp_con_repr_siglas, num_pp_sin_repr, num_pp_con_repr, 
		total_fp_sin_repr, monto_total_efectivo, monto_30_por_ciento, monto_70_por_ciento, comprobacion_monto 
		FROM calculo_dppp WHERE ? IS NULL OR id_calculo = ?;";
    SET @id = p_id_calculo;
	PREPARE stmt FROM @strQuery;
	EXECUTE stmt USING @id, @id;
	DEALLOCATE PREPARE stmt;
    
	SET @strQuery = NULL;
END;
//
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_get_Partidos_Calculo_porId;
DELIMiTER //
/*
* @name Procedimiento para obtener Partidos Políticos Con Representación y Sin Representación
* @description Va de la mano con sp_get_calculo_completo, se llama por separado para poder listar los partidos políticos de un cálculo determinado
* 	y poder llamarse en el Frontend para agregarlos a una columna y darles formato en la exportación a Excel
* @param id_calculo
* @example
* CALL sp_get_PartidosporIdCalculo(2);
*/
CREATE PROCEDURE sp_get_Partidos_Calculo_porId(IN p_id_calculo INT UNSIGNED)
BEGIN
	-- Retornamos los partidos sin representación
	SELECT cat_psr.siglas, cat_psr.nombre, cat_psr.logo, 
		psr.id_calculo, psr.id_partido, psr.monto_2_por_ciento,
        psr.D_monto_2_por_ciento,
        -- Datos de Ministraciones
        psr.mintr_diciembre
		FROM calculo_partido_sin_repr psr 
        INNER JOIN cat_partido_sin_repr cat_psr ON psr.id_partido = cat_psr.id 
        WHERE psr.id_calculo = p_id_calculo;
	-- Retornamos los partidos con representación
	SELECT cat_pcr.siglas, cat_pcr.nombre, cat_pcr.logo,
		-- Se agregar los campos del apartado de distribución y de Partido con representación
		pcr.id_calculo, pcr.id_partido, pcr.porcentaje_votacion, pcr.ajuste,
        pcr.A_30_por_ciento, pcr.B_70_por_ciento, pcr.B_Ajuste_70_por_ciento, pcr.C_fpaop, D_fpatov,
        -- Datos de Ministraciones
        pcr.mintr_diciembre
		FROM calculo_partido_con_repr pcr
		INNER JOIN cat_partido_con_repr cat_pcr ON pcr.id_partido = cat_pcr.id 
		WHERE pcr.id_calculo = p_id_calculo;
END;
//DELIMITER ;

-- ***** DEPRECATED *****
DROP PROCEDURE IF EXISTS sp_Distribucion_get_Partidos_Con_Representacion;
DELIMiTER //
/*
* @name Procedimiento para obtener Partidos Políticos Con Representación en el Congreso
* @description Obtiene los partidos con representación en el Congreso a partir de un Id cálculo
* @param id_calculo
* @example
* CALL sp_Distribucion_get_Partidos_Con_Representacion(2);
*/
CREATE PROCEDURE sp_Distribucion_get_Partidos_Con_Representacion(IN id_calculo INT UNSIGNED)
BEGIN
	-- Retornamos los partidos con representación
	SELECT
		ROW_NUMBER() OVER (ORDER BY cat_pcr.siglas) AS num_fila,
        pcr.id_calculo as 'id_calculo',
		cat_pcr.siglas, cat_pcr.nombre, cat_pcr.logo
		FROM calculo_partido_con_repr pcr
		INNER JOIN cat_partido_con_repr cat_pcr ON pcr.id_partido = cat_pcr.id
		WHERE pcr.id_calculo = id_calculo;
END;
//DELIMITER ;

-- use admin;
 
DROP PROCEDURE IF EXISTS sp_Distr_Get_Insert_Update_distribucion_dppp;
DELIMITER //
/*
* @name Obtener los datos del apartado de Distribución
* @description Retorna los datos de distribución, es decir los campos llenados y las sumas de totales realizados
* 	que esten ligados a un id_calculo, tanto para llenar los campos previamente llenados como para los reportes
* @param p_use_transaction -- true: CALL desde Mysql, false: CALL desde Laravel
* @param p_comando -- 'UPDATE': Update, 'GET': Select, 'INSERT': Insert
* @param p_id_dist
* @example
* CALL admin.sp_Distr_Get_Insert_Update_distribucion_dppp(0, 'UPDATE', 1, 2025, '1,2', 123213, 123123, 1, 0, 0, 0, 246336, 123168, 341176.797, 170588.3985, 5875.12797);
*/
CREATE PROCEDURE sp_Distr_Get_Insert_Update_distribucion_dppp(
	IN p_use_transaction BOOLEAN,
    IN p_comando VARCHAR(6),
	IN p_id_calculo INT UNSIGNED, -- Primary key
    IN p_anio_ejercicio YEAR, -- dato manual
    IN p_tipo_distribucion varchar(25), -- dato manual
    IN p_monto_30_por_ciento DECIMAL(30,15), -- dato manual
    IN p_monto_70_por_ciento DECIMAL(30,15), -- dato manual
    IN p_tipoPorcentaje INT UNSIGNED, -- dato manual
    IN p_subtotal_A_30_por_ciento DECIMAL(30,15), -- cálculo
    IN p_subtotal_B_70_por_ciento DECIMAL(30,15), -- cálculo
    IN p_subtotal_B_Ajuste_70_por_ciento DECIMAL(30,15), -- cálculo
    IN p_subtotal_C_fpaop DECIMAL(30,15), -- cálculo
    IN p_subtotal_D_fpatov DECIMAL(30,15), -- cálculo
    IN p_subtotal_2_por_ciento_fpaop_ppsr DECIMAL(30,15), -- cálculo
    IN p_subtotal_D_2_por_ciento_ppsr DECIMAL(30,15), -- cálculo 
    IN p_subtotal_D_candidatura DECIMAL(30,15) -- cálculo 
)
BEGIN
    -- Manejador de errores
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		IF p_use_transaction THEN
			ROLLBACK;
		END IF;
		-- Propaga el error original
		RESIGNAL;
	END;
    -- Inicia transacción si está habilitado
    IF p_use_transaction THEN
        START TRANSACTION;
    END IF;
    IF p_comando = 'INSERT' OR p_comando = 'UPDATE' THEN
		-- Verificar si ya existe un registro con el ID: p_id_calculo
		SET @record_count = (SELECT COUNT(*) FROM distribucion_dppp WHERE id_calculo = p_id_calculo);
		IF @record_count = 0 THEN -- Si No existe 'INSERT'
			INSERT INTO distribucion_dppp (id_calculo, anio_ejercicio, tipo_distribucion, monto_30_por_ciento, monto_70_por_ciento, tipoPorcentaje,
				subtotal_A_30_por_ciento, subtotal_B_70_por_ciento, subtotal_B_Ajuste_70_por_ciento, subtotal_C_fpaop, subtotal_D_fpatov,
                subtotal_2_por_ciento_fpaop_ppsr, subtotal_D_2_por_ciento_ppsr, subtotal_D_candidatura) VALUES 
				(p_id_calculo, p_anio_ejercicio, p_tipo_distribucion, p_monto_30_por_ciento, p_monto_70_por_ciento, p_tipoPorcentaje,
                p_subtotal_A_30_por_ciento, p_subtotal_B_70_por_ciento, p_subtotal_B_Ajuste_70_por_ciento, p_subtotal_C_fpaop, p_subtotal_D_fpatov,
                p_subtotal_2_por_ciento_fpaop_ppsr, p_subtotal_D_2_por_ciento_ppsr, p_subtotal_D_candidatura);
			-- SELECT LAST_INSERT_ID() AS id; -- Solo funciona con columnas AUTO_INCREMENT.
            SELECT p_id_calculo AS id;
		ELSE -- Si existe 'UPDATE'
			UPDATE distribucion_dppp
				SET anio_ejercicio = p_anio_ejercicio, tipo_distribucion = p_tipo_distribucion, 
				monto_30_por_ciento = p_monto_30_por_ciento, monto_70_por_ciento = p_monto_70_por_ciento, tipoPorcentaje = p_tipoPorcentaje, 
				subtotal_A_30_por_ciento = p_subtotal_A_30_por_ciento, subtotal_B_70_por_ciento = p_subtotal_B_70_por_ciento,
				subtotal_B_Ajuste_70_por_ciento = p_subtotal_B_Ajuste_70_por_ciento, subtotal_C_fpaop = p_subtotal_C_fpaop,
				subtotal_D_fpatov = p_subtotal_D_fpatov,
                subtotal_2_por_ciento_fpaop_ppsr = p_subtotal_2_por_ciento_fpaop_ppsr, subtotal_D_2_por_ciento_ppsr = p_subtotal_D_2_por_ciento_ppsr,
                subtotal_D_candidatura = p_subtotal_D_candidatura
				-- created_at = p_created_at: CURRENT_TIMESTAMP, updated_at = p_updated_at: CURRENT_TIMESTAMP
				WHERE id_calculo = p_id_calculo;
			SELECT p_id_calculo AS id;
		END IF;
    ELSEIF p_comando = 'GET' THEN
		SELECT id_calculo, anio_ejercicio, tipo_distribucion, monto_30_por_ciento, monto_70_por_ciento, tipoPorcentaje,
			subtotal_A_30_por_ciento, subtotal_B_70_por_ciento, subtotal_B_Ajuste_70_por_ciento, subtotal_C_fpaop, subtotal_D_fpatov,
            subtotal_2_por_ciento_fpaop_ppsr, subtotal_D_2_por_ciento_ppsr,
            subtotal_D_candidatura
			FROM distribucion_dppp WHERE id_calculo = p_id_calculo;
	END IF;
	IF p_use_transaction THEN
        COMMIT;
    END IF;
END;
//DELIMITER ;

DROP PROCEDURE IF EXISTS sp_Distr_Update_Partidos_Con_Representacion;
DELIMiTER //
/*
* @name Actualizar datos de distribución para Partidos Politicos Con Representación en el Congreso
* @description Actualiza una tabla creada previamente por sp_insert_partidos_con_repr al insertar un nuevo Cálculo
* @example
*/
CREATE PROCEDURE sp_Distr_Update_Partidos_Con_Representacion(
    IN p_use_transaction BOOLEAN,
	IN p_id_calculo INT UNSIGNED,
    IN p_id_partido INT UNSIGNED,
    IN p_porcentaje_votacion DECIMAL (30,15),
	IN p_A_30_por_ciento DECIMAL (30,15),
    IN p_B_70_por_ciento DECIMAL (30,15),
    IN p_ajuste DECIMAL (30,15),
    IN p_B_Ajuste_70_por_ciento DECIMAL (30,15),
    IN p_C_fpaop DECIMAL (30,15),
    IN p_D_fpatov DECIMAL (30,15)
)
BEGIN
    -- Manejador de errores
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		IF p_use_transaction THEN
			ROLLBACK;
		END IF;
		-- Propaga el error original
		RESIGNAL;
	END;
    -- Inicia transacción si está habilitado
    IF p_use_transaction THEN
        START TRANSACTION;
    END IF;
    
    -- Empieza la sentencia para actualizar
	UPDATE calculo_partido_con_repr SET porcentaje_votacion = p_porcentaje_votacion,
		A_30_por_ciento = p_A_30_por_ciento, B_70_por_ciento = p_B_70_por_ciento,
        ajuste = p_ajuste, B_Ajuste_70_por_ciento = p_B_Ajuste_70_por_ciento,
        C_fpaop = p_C_fpaop, D_fpatov = p_D_fpatov
		WHERE id_calculo = p_id_calculo AND id_partido = p_id_partido;
	SELECT concat('C:', p_id_calculo,'_P:', p_id_partido) AS 'ids';
    
	IF p_use_transaction THEN
        COMMIT;
    END IF;
END;
//DELIMiTER ;


DROP PROCEDURE IF EXISTS sp_Distr_Update_Partidos_Sin_Representacion;
DELIMiTER //
/*
* @name Actualizar datos de distribución para Partidos Politicos Sin Representación en el Congreso
* @description Actualiza una tabla creada previamente por sp_insert_partidos_sin_repr al insertar un nuevo Cálculo
* @example
*/
CREATE PROCEDURE sp_Distr_Update_Partidos_Sin_Representacion(
    IN p_use_transaction BOOLEAN,
	IN p_id_calculo INT UNSIGNED,
    IN p_id_partido INT UNSIGNED,
    IN p_D_monto_2_por_ciento DECIMAL(30,15)
)
BEGIN
    -- Manejador de errores
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		IF p_use_transaction THEN
			ROLLBACK;
		END IF;
		-- Propaga el error original
		RESIGNAL;
	END;
    
    -- Inicia transacción si está habilitado
    UPDATE calculo_partido_sin_repr SET D_monto_2_por_ciento =  p_D_monto_2_por_ciento;
    SELECT concat('C:', p_id_calculo,'_P:', p_id_partido) AS 'ids';
    
    IF p_use_transaction THEN
        START TRANSACTION;
    END IF;
	IF p_use_transaction THEN
        COMMIT;
    END IF;
END;
//DELIMiTER ;

-- MINISTRACIONES

DROP PROCEDURE IF EXISTS sp_GetDistribucionesPorAnio;
DELIMITER //
/*
* @example CALL sp_GetDistribucionesPorAnio(2025);
*/
CREATE PROCEDURE sp_GetDistribucionesPorAnio(IN p_anio INT)
BEGIN
    -- 1. Todos los cálculos de ese año
    SELECT * FROM calculo_dppp WHERE anio_ejercicio = p_anio;

    -- 2. Todas las distribuciones asociadas
    SELECT * FROM distribucion_dppp WHERE anio_ejercicio = p_anio;

    -- 3. Partidos con representación por cada cálculo, incluyendo montos
    SELECT 
        c.id_calculo,
        pcr.id AS id_partido,
        pcr.siglas,
        pcr.nombre,
        pcr.logo,
        cpcr.porcentaje_votacion,
        cpcr.A_30_por_ciento,
        cpcr.B_70_por_ciento,
        cpcr.ajuste,
        cpcr.B_Ajuste_70_por_ciento,
        cpcr.C_fpaop,
        cpcr.D_fpatov,
        cpcr.mintr_diciembre
    FROM calculo_dppp c
    JOIN (
        SELECT id_calculo, SUBSTRING_INDEX(SUBSTRING_INDEX(pp_con_repr, ',', n.n), ',', -1) AS id_partido
        FROM calculo_dppp
        JOIN (
            SELECT 1 AS n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 
            UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10
        ) AS n
        WHERE anio_ejercicio = p_anio
        AND n.n <= 1 + LENGTH(pp_con_repr) - LENGTH(REPLACE(pp_con_repr, ',', ''))
    ) AS ids_con
    ON c.id_calculo = ids_con.id_calculo
    JOIN cat_partido_con_repr pcr ON pcr.id = ids_con.id_partido
    LEFT JOIN calculo_partido_con_repr cpcr 
        ON cpcr.id_calculo = c.id_calculo AND cpcr.id_partido = pcr.id;

    -- 4. Partidos sin representación por cada cálculo, incluyendo montos
    SELECT 
        c.id_calculo,
        psr.id AS id_partido,
        psr.siglas,
        psr.nombre,
        psr.logo,
        cpsr.monto_2_por_ciento,
        cpsr.mintr_diciembre
    FROM calculo_dppp c
    JOIN (
        SELECT id_calculo, SUBSTRING_INDEX(SUBSTRING_INDEX(pp_sin_repr, ',', n.n), ',', -1) AS id_partido
        FROM calculo_dppp
        JOIN (
            SELECT 1 AS n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 
            UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10
        ) AS n
        WHERE anio_ejercicio = p_anio
        AND n.n <= 1 + LENGTH(pp_sin_repr) - LENGTH(REPLACE(pp_sin_repr, ',', ''))
    ) AS ids_sin
    ON c.id_calculo = ids_sin.id_calculo
    JOIN cat_partido_sin_repr psr ON psr.id = ids_sin.id_partido
    LEFT JOIN calculo_partido_sin_repr cpsr 
        ON cpsr.id_calculo = c.id_calculo AND cpsr.id_partido = psr.id;
END;
//
DELIMITER ;

DROP PROCEDURE IF EXISTS sp_Mintr_Get_Insert_Update_ministraciones_dppp;
DELIMITER //
/*
* @name Obtener o actualizar los datos del apartado de Ministraciones
* @description
* @param p_use_transaction -- true: CALL desde Mysql, false: CALL desde Laravel
* @param p_comando -- 'UPDATE': Update, 'GET': Select, 'INSERT': Insert
* @example 
* CALL sp_Mintr_Get_Insert_Update_ministraciones_dppp(true, 'GET', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
* CALL sp_Mintr_Get_Insert_Update_ministraciones_dppp(0, 'UPDATE', 1, 352684.851, 352684.851, 352684.851, 352684.851, 352684.851, 352684.851, 352684.851, 352684.851, 352684.851, 352684.851, 352684.851, 352684.85099999, 4232218.212);
*/
CREATE PROCEDURE sp_Mintr_Get_Insert_Update_ministraciones_dppp(
	IN p_use_transaction BOOLEAN,
    IN p_comando VARCHAR(6),
	IN p_id_calculo INT UNSIGNED, -- Primary key
    -- IN p_total_financiamiento DECIMAL (30,15), 
	IN p_total_enero DECIMAL (30,15), 
    IN p_total_febrero DECIMAL (30,15),
    IN p_total_marzo DECIMAL (30,15), 
    IN p_total_abril DECIMAL (30,15), 
    IN p_total_mayo DECIMAL (30,15),
    IN p_total_junio DECIMAL (30,15),
    IN p_total_julio DECIMAL (30,15),
    IN p_total_agosto DECIMAL (30,15),
    IN p_total_septiembre DECIMAL (30,15), 
    IN p_total_octubre DECIMAL (30,15),
    IN p_total_noviembre DECIMAL (30,15), 
    IN p_total_diciembre DECIMAL (30,15),
    IN p_gran_total DECIMAL (30,15)
)
BEGIN
    -- Manejador de errores
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		IF p_use_transaction THEN
			ROLLBACK;
		END IF;
		-- Propaga el error original
		RESIGNAL;
	END;
    -- Inicia transacción si está habilitado
    IF p_use_transaction THEN
        START TRANSACTION;
    END IF;
    -- Inicia las consulta
    IF p_comando = 'INSERT' OR p_comando = 'UPDATE' THEN
		-- Verificar si ya existe un registro con el ID: p_id_calculo
		SET @record_count = (SELECT COUNT(*) FROM ministraciones_dppp WHERE id_calculo = p_id_calculo);
        IF @record_count = 0 THEN -- Si No existe 'INSERT'
			INSERT INTO ministraciones_dppp(id_calculo, -- total_financiamiento, 
				total_enero, total_febrero, total_marzo, total_abril, total_mayo, 
				total_junio, total_julio, total_agosto, total_septiembre, total_octubre,
				total_noviembre, total_diciembre,
                gran_total
				) VALUES
                (p_id_calculo, -- p_total_financiamiento, 
				p_total_enero, p_total_febrero, p_total_marzo, p_total_abril, p_total_mayo, 
				p_total_junio, p_total_julio, total_agosto, p_total_septiembre, p_total_octubre,
				p_total_noviembre, p_total_diciembre,
                p_gran_total);
			SELECT p_id_calculo AS id; -- Solo para retornar el ID
        ELSE -- Si existe 'UPDATE'
			UPDATE ministraciones_dppp SET id_calculo = p_id_calculo, -- total_financiamiento = p_total_financiamiento, 
				total_enero = p_total_enero, total_febrero = p_total_febrero, total_marzo = p_total_marzo, total_abril = p_total_abril, total_mayo = p_total_mayo, 
				total_junio = p_total_junio, total_julio = p_total_julio, total_agosto = p_total_agosto, total_septiembre = p_total_septiembre, total_octubre = p_total_octubre,
				total_noviembre = p_total_noviembre, total_diciembre = p_total_diciembre,
                gran_total = p_gran_total
                WHERE id_calculo = p_id_calculo;
			SELECT p_id_calculo AS id; -- Solo para retornar el ID
		END IF;
    ELSEIF p_comando = 'GET' THEN
		SELECT id_calculo, -- total_financiamiento, 
			total_enero, total_febrero, total_marzo, total_abril, total_mayo, 
			total_junio, total_julio, total_agosto, total_septiembre, total_octubre,
			total_noviembre, total_diciembre,
            gran_total
			FROM ministraciones_dppp WHERE id_calculo = p_id_calculo;
	END IF;
    -- Termina la consulta
	IF p_use_transaction THEN
        COMMIT;
    END IF;
END;
//DELIMITER ;

DROP PROCEDURE IF EXISTS sp_Mintr_Update_Partidos;
DELIMITER //
/*
* @name Actualizar datos de distribución para Partidos Politicos Con y Sin Representación en el Congreso
* @description Actualiza un dato en común de los partidos <<p_mintr_diciembre>>
* @param p_use_transaction -- true: CALL desde Mysql, false: CALL desde Laravel
* @
* @example
*/
CREATE PROCEDURE sp_Mintr_Update_Partidos(
    IN p_use_transaction BOOLEAN,
	IN p_id_calculo INT UNSIGNED,
    IN p_id_partido INT UNSIGNED,
    IN p_tipo_partido ENUM('CON','SIN'),
    IN p_mintr_diciembre DECIMAL (30,15)
)
BEGIN
    -- Manejador de errores
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
		IF p_use_transaction THEN
			ROLLBACK;
		END IF;
		-- Propaga el error original
		RESIGNAL;
	END;
	
    -- Validar tipo de partido
    IF p_tipo_partido NOT IN ('CON', 'SIN') THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El parámetro tipo_Partido debe ser "CON" o "SIN"';
    END IF;
    
    -- Inicia transacción si está habilitado
    IF p_use_transaction THEN
        START TRANSACTION;
    END IF;

    -- Empieza la sentencia para actualizar
	IF p_tipo_partido = 'CON' THEN
		UPDATE calculo_partido_con_repr SET mintr_diciembre = p_mintr_diciembre
			WHERE id_calculo = p_id_calculo AND id_partido = p_id_partido;
	ELSEIF p_tipo_partido = 'SIN' THEN
		UPDATE calculo_partido_sin_repr SET mintr_diciembre =  p_mintr_diciembre
			WHERE id_calculo = p_id_calculo AND id_partido = p_id_partido;
	END IF;
    SELECT concat(p_tipo_partido, ' -> C:', p_id_calculo,'_P:', p_id_partido) AS 'ids';
    
	IF p_use_transaction THEN
        COMMIT;
    END IF;
END;
//DELIMITER ;

-- FIN MINISTRACIONES
/* FIN PROCEDURE */


