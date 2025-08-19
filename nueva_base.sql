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

-- Volcando datos para la tabla admin.cat_birthday: ~31 rows (aproximadamente)
/*DELETE FROM `cat_birthday`;*/
INSERT INTO `cat_birthday` (`id`, `id_adscripcion`, `nombre`, `dia`, `mes`) VALUES
	(1, 5, 'MA. DE LA LUZ LOURDES PÉREZ ZEPEDA', 23, 1),
	(2, 5, 'OSCAR ALFREDO POBLANO REYNOSO', 27, 1),
	(3, 1, 'SUSANA RIVAS VERA', 31, 1),
	(4, 5, 'ELISA LEÓN MARTÍNEZ', 10, 2),
	(5, 5, 'DANIEL ARENAS TLELO', 16, 2),
	(6, 5, 'ITZEL ALINE VELAZCO GÓMEZ', 27, 2),
	(7, 5, 'SAÚL VALENCIA CUAUTLE', 12, 2),
	(8, 5, 'EDER IVÁN RAMOS ORTEGA', 6, 3),
	(9, 5, 'BENJAMÍN VÁZQUEZ LÓPEZ', 8, 3),
	(10, 1, 'EVANGELINA MENDOZA CORONA', 12, 3),
	(11, 3, 'JOSÉ COSIJOEZA RUÍZ MERLÍN', 19, 3),
	(12, 5, 'VIOLETA CÁRCAMO JUÁREZ', 30, 3),
	(13, 13, 'JOSEFINA STEFFANONI LEÓN', 31, 3),
	(14, 5, 'ALEJANDRA MANTILLA ARENAS', 12, 3),
	(15, 5, 'CAROLINA JAQUELINE CANO CUEVAS', 1, 4),
	(16, 18, 'RUBÉN ORTEGA RAMÍREZ', 15, 4),
	(17, 5, 'JUAN CARLOS GALVÁN RODRÍGUEZ', 4, 5),
	(18, 5, 'MERCEDES CAMPOS VALENZUELA', 5, 5),
	(19, 5, 'LUIS ÁNGEL BARRIOS MONTES', 22, 5),
	(21, 18, 'ALEXIS ACOCAL CAPILLA', 27, 5),
	(22, 3, 'JORGE ORTEGA PINEDA', 5, 6),
	(23, 5, 'ARANXXA LÓPEZ LÓPEZ', 6, 6),
	(24, 5, 'JULIETA PALACIOS TEPOX', 16, 6),
	(25, 5, 'BERNARDINA ROSA MARÍA ALARCÓN DE MARTINO', 19, 6),
	(26, 5, 'DERIAN GALINDO SOSA', 19, 6),
	(27, 5, 'ÁNGEL GARGÍA MÉNDEZ', 25, 6),
	(28, 5, 'TOMASA PATRICIA HERNÁNDEZ GÓMEZ', 6, 7),
	(29, 5, 'MARÍA DEL CARMEN PORTILLO BRAVO', 16, 7),
	(30, 1, 'JUAN CARLOS RODRÍGUEZ LÓPEZ', 22, 7),
	(31, 1, 'JESÚS ARTURO BALTAZAR TRUJANO', 23, 7),
	(32, 10, 'IVONNE VILLEGAS LAGUNES', 25, 7);

-- Volcando estructura para tabla admin.cat_meses
CREATE TABLE IF NOT EXISTS `cat_meses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mes` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla admin.cat_meses: ~12 rows (aproximadamente)
/*DELETE FROM `cat_meses`;*/
INSERT INTO `cat_meses` (`id`, `mes`) VALUES
	(1, 'ENERO'),
	(2, 'FEBRERO'),
	(3, 'MARZO'),
	(4, 'ABRIL'),
	(5, 'MAYO'),
	(6, 'JUNIO'),
	(7, 'JULIO'),
	(8, 'AGOSTO'),
	(9, 'SEPTIEMBRE'),
	(10, 'OCTUBRE'),
	(11, 'NOVIEMBRE'),
	(12, 'DICIEMBRE');


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
    (31, 'distribucion.captura', 'Captura Distribucion', '2025-08-19 21:29:05', '2025-08-19 21:29:06');


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


-- Volcando estructura para tabla admin.permiso_has_rol
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
	(1, 'Super', 'Administrador', NULL, 'superadmin', '$2y$10$yCV/HFXNBL2Rk39w41vS7.n7.1nxhM9A9yz5WnWEP15I0rncm3cra', '2024-09-13 17:21:05', 'A', NULL, NULL, NULL, 0, NULL, NULL, NULL, 1),
	(2, 'LUIS', 'Prueba', '', 'prueba', '$2y$10$yCV/HFXNBL2Rk39w41vS7.n7.1nxhM9A9yz5WnWEP15I0rncm3cra', '2023-06-30 09:13:49', 'A', NULL, NULL, NULL, 0, 'prueba@prueba.com', '2024-11-04 15:56:38', NULL, 1),
	(3, 'Jefe', 'Departamento', '', 'jefedepar', '$2y$10$M7uzIW28ncxDuoe/Oo/NxuXHeGN8TTltIw8jzHoXaINU4WCQof6xa', '2024-09-13 17:46:52', 'A', NULL, NULL, NULL, 0, 'jefe.prueba@test.com', '2024-11-14 18:25:32', 8, 0),
	(4, 'Nombre', 'Apellido', NULL, 'nuevaPrueba', '$2y$10$e.v.zovgMzeVqUDrye2wJeL1.fOSsz85uyn5kYG1kJ.Yp9W8.RDyG', '2024-09-13 17:47:23', 'A', NULL, NULL, NULL, 0, NULL, NULL, 2, 0),
	(5, 'Capturista', 'Prueba', '', 'capturista', '$2y$10$xO70wDC7yaJGCnqkXuw9ce/hlVXHRM.74rYcZ5JVqrKOqwM5UwHoi', '2024-09-13 17:47:58', 'A', NULL, NULL, NULL, 0, 'correo.test@gmail.com', '2024-11-14 17:42:14', 8, 0),
	(6, 'Supervisor', 'Prueba', '', 'supervisor', '$2y$10$GeMPHEmqGFX8IOCwtLHeROtAvXgwRPvWZ2HHBeqojm1apJDIv/uu6', '2024-09-23 20:38:19', 'A', NULL, NULL, NULL, 0, 'test@test.com', '2024-11-14 18:01:25', 8, 0),
	(7, 'Nuevo', 'APP', '', 'otraPrueba', '$2y$10$vB0SfRMEAWSIoDum1mqrE.HBxTC.d3YzLdlAEewqK/0b5/3x8kBWa', '2024-09-23 21:08:14', 'A', NULL, NULL, NULL, 0, 'test2@test.com', NULL, 18, 0),
	(8, 'Prueba', 'Prueba', 'Prueba', 'prueba01', '$2y$10$v/Qy.mKt..ZPDkBZ5IkSnuITNWaCB3qkOn9FI4TAxbI4Y8Hc6v6F6', '2024-09-23 23:51:11', 'I', NULL, NULL, NULL, 1, 'prueba@gmail.com', NULL, 1, 0),
	(9, 'Administrador', 'Uno', '', 'adminsda', '$2y$10$RkCAyZMCg50f8Kkv0Wfwhe0Bw//U7dTsFV/ML2q1F5nYGbe.pRGve', '2024-11-14 18:16:47', 'A', NULL, NULL, NULL, 0, 'admin@test.com', '2025-01-09 17:53:28', NULL, 1),
	(10, 'Jefe', 'DA', '', 'jefedpto01', '$2y$10$EINfThDpEvA/8Fd9VW9NMOVOT0hGRpUkfE2MGNOgl0KXBfbDI0UD2', '2024-11-21 19:21:19', 'A', NULL, NULL, NULL, 0, 'test.01@test.com', NULL, 1, 0),
	(11, 'Supervisor', 'DA', '', 'supervis01', '$2y$10$D6n0znQYqFq80AHaLIbbSeA./4OmKZ8zcnFaY1qi8OajnLoZ.KOTS', '2024-11-21 19:22:36', 'A', NULL, NULL, NULL, 0, 'test.02@test.com', NULL, 1, 0),
	(12, 'Capturista', 'DA', '', 'capturis01', '$2y$10$xFuXaLEGhqi1s5m6/Rg3qe6uy0t44x43HtEDS6oGzM8bfm.tRT9NS', '2024-11-21 19:23:37', 'A', NULL, NULL, NULL, 0, 'test.03@test.com', NULL, 1, 0),
	(13, 'Jefe', 'Coordinación Financiera', '', 'jefedpto02', '$2y$10$5ITVa3ZwVDmbMFge1.FSYu0EJws.2Bi/8nSqxLkoet71iXAYL0Ezu', '2024-11-21 19:30:35', 'A', NULL, NULL, NULL, 0, 'test.04@test.com', NULL, 2, 0),
	(14, 'Supervisor', 'Coordinación Financiera', '', 'supervis02', '$2y$10$lgoYE1ZVsB4kgltfeWd95uCkLt/ZyyIQ.mZBFkVY6wIlXwOGnuxSa', '2024-11-21 19:32:37', 'A', NULL, NULL, NULL, 0, 'test.05@test.com', NULL, 2, 0),
	(15, 'Capturista', 'Coordinación Financiera', '', 'capturis02', '$2y$10$hIcfhUapK.UnbR6Evk9gCOgFHF2d1f0zW56AoD2xJ5Jq1syJqCqYK', '2024-11-21 19:33:59', 'A', NULL, NULL, NULL, 0, 'test.06@test.com', NULL, 2, 0),
	(16, 'Jefe', 'Nómina', '', 'jefedpto03', '$2y$10$AFlAskcp.zLn7dGcXFWfluCpMoNxC/jr9EY4VL3WyalUQbYbBfBLm', '2024-11-21 19:35:36', 'A', NULL, NULL, NULL, 2, 'test.07@test.com', NULL, 3, 0),
	(17, 'Supervisor', 'Nómina', '', 'supervis03', '$2y$10$i8CRme4pfcSAfppSc/cxwebNngsyghvX8x.DTAvwZ77/3/lbfIUrC', '2024-11-21 19:36:46', 'A', NULL, NULL, NULL, 0, 'test.08@test.com', NULL, 3, 0),
	(18, 'Capturista', 'Nómina', '', 'capturis03', '$2y$10$/Xeo.0bYhmDCQZDR0Ts6Zu5K5/9Qd63i268rDqr9xDUCtFekhA9tq', '2024-11-21 19:37:59', 'A', NULL, NULL, NULL, 0, 'test.09@test.com', NULL, 3, 0),
	(19, 'Jefe', 'Contabilidad', '', 'jefedpto04', '$2y$10$D4G892j1sT8Hetq8ayQCwO1AEjIGHDOmacMRSNapGayq4hy4AB6J6', '2024-11-21 19:52:57', 'A', NULL, NULL, NULL, 0, 'test@test.com', NULL, 4, 0),
	(20, 'Supervisor', 'Contabilidad', '', 'supervis04', '$2y$10$amM4naOSD0CdO.OtgkCCgOsgbjIK.hKfRvA0tbHRRGp2FqkQdHHHa', '2024-11-21 19:53:41', 'A', NULL, NULL, NULL, 0, 'test@test.com', NULL, 4, 0),
	(21, 'Capturista', 'Contabilidad', '', 'capturis04', '$2y$10$q4bd9eBiPpGMDsmt4ESpOO/8uZQSznREsJn9kNSwzFRheKTqJcU/C', '2024-11-21 19:54:49', 'A', NULL, NULL, NULL, 0, 'test@test.com', NULL, 4, 0),
	(22, 'Jefe', 'Presupuesto', '', 'jefedpto05', '$2y$10$xt2NmiSqFyhR/pFTr6KwWereTLb2nXWvqbYOEtUHS7Zr15zQXqGua', '2024-11-21 19:55:45', 'A', NULL, NULL, NULL, 0, 'test@test.com', NULL, 5, 0),
	(23, 'Supervisor', 'Presupuesto', '', 'supervis05', '$2y$10$n0rvVPCQktDi4H1Wbu.gHeW2hX46dI83q8jADQP5UjkFLq.kQzGKy', '2024-11-21 19:57:05', 'A', NULL, NULL, NULL, 0, 'test@test.com', NULL, 5, 0),
	(24, 'Capturista', 'Presupuesto', '', 'capturis05', '$2y$10$diRzEPswnjM53PZLPybQ4Oigk3uk/eDYJ.Qg0vW7fPOAcQpII5WMe', '2024-11-21 19:58:02', 'A', NULL, NULL, NULL, 0, 'test@test.com', NULL, 5, 0),
	(25, 'Jefe', 'Tesorería', '', 'jefedpto06', '$2y$10$DKCMy9nTDnpqIFnsyfsy3O/l5fSUchHT3MEzojNQorU3U21bqkgEO', '2024-11-21 19:59:20', 'A', NULL, NULL, NULL, 0, 'test@test.com', NULL, 6, 0),
	(26, 'Supervisor', 'Tesorería', '', 'supervis06', '$2y$10$1pIs3bOxaALJ78Mgx0N2fOizaukLB08mDDhCOVTjjRHaPrZYCkujW', '2024-11-21 20:00:00', 'A', NULL, NULL, NULL, 0, 'test@test.com', NULL, 6, 0),
	(27, 'Capturista', 'Tesorería', '', 'capturis06', '$2y$10$8HnMJ.2ttMMenvjqZsN55OpGk.9lCQX5hLQbvbqxX7ZbwYzN28zqm', '2024-11-21 20:01:10', 'A', NULL, NULL, NULL, 0, 'test@test.com', NULL, 6, 0),
	(28, 'Jefe', 'Viáticos', '', 'jefedpto07', '$2y$10$W.f/7VH2m8yCjDX7V.dL0eRmkowqEiPEtzoh8eemcALoX1cstvi.S', '2024-11-21 20:02:30', 'A', NULL, NULL, NULL, 0, 'test@test.com', NULL, 7, 0),
	(29, 'Supervisor', 'Viáticos', '', 'supervis07', '$2y$10$0hxMcUEm2RQI5GzdHpsDIOmx3VhmFbgt0/hHU80Pnbr8qqhUAEPWe', '2024-11-21 20:03:30', 'A', NULL, NULL, NULL, 0, 'test@test.com', NULL, 7, 0),
	(30, 'Capturista', 'Viáticos', '', 'capturis07', '$2y$10$uGkbkBiRDwLO2pey8hpzpO1vZe/iPCw0/EzEaRMMHDT07EA9IsHOi', '2024-11-21 20:04:11', 'A', NULL, NULL, NULL, 0, 'test@test.com', NULL, 7, 0),
	(31, 'Jefe', 'Normatividad', '', 'jefedpto08', '$2y$10$peuqUirl6.M4G2rUeAC61eE1Q2S6JIhJC2zlUKNRmK7n0HxLWDNxi', '2024-11-21 20:05:14', 'A', NULL, NULL, NULL, 0, 'test@test.com', NULL, 8, 0),
	(32, 'Supervisor', 'Normatividad', '', 'supervis08', '$2y$10$PIeTgO76k1/IuoqMYX3qpesJv2ZCpR1CKOScOLE7UIwpIF/6CHZpS', '2024-11-21 20:05:53', 'A', NULL, NULL, NULL, 0, 'test@test.com', NULL, 8, 0),
	(33, 'Capturista', 'Normatividad', '', 'capturis08', '$2y$10$6183K1yPV73WB9WJKdms2urmcojouqCwiXmtTWClo05TutLMzaWEG', '2024-11-21 20:06:38', 'A', NULL, NULL, NULL, 0, 'test@test.com', NULL, 8, 0),
	(34, 'Jefe', 'CIN', '', 'jefedpto09', '$2y$10$keW0hk9t4x70mJ6dGkQoUe20ZqD2QUrzcNY/V5uBfF7TC43B.v41y', '2024-11-21 20:08:03', 'A', NULL, NULL, NULL, 0, 'test@test.com', NULL, 9, 0),
	(35, 'Supervisor', 'CIN', '', 'supervis09', '$2y$10$TV8fqOPb80Jki2rdCd1pju3u8BKPPdDK9QDoW0sq3DNEk/cZ5NMxK', '2024-11-21 20:08:43', 'A', NULL, NULL, NULL, 0, 'test@test.com', NULL, 9, 0),
	(36, 'Capturista', 'CIN', '', 'capturis09', '$2y$10$fdzzD9goaHU2eugieNyDm.Ckicyb/ZtVfoS1oqGBR115SgHQXEWjC', '2024-11-21 20:09:19', 'A', NULL, NULL, NULL, 0, 'test@test.com', NULL, 9, 0),
	(37, 'Jefe', 'Recursos Materiales', '', 'jefedpto10', '$2y$10$3tJqop4e8bEUVqsP4lQjyOWICJudCY2txFjyJVvikbOPxbXFYahau', '2024-11-21 20:10:08', 'A', NULL, NULL, NULL, 0, 'test@test.com', NULL, 10, 0),
	(38, 'Supervisor', 'Recursos Materiales', '', 'supervis10', '$2y$10$bvbfcyk26bk0NFRyg4wsOenVH9Jsmn.TfQvMuEWTojKsHX18qDhzK', '2024-11-21 20:11:05', 'A', NULL, NULL, NULL, 0, 'test@test.com', NULL, 10, 0),
	(39, 'Capturista', 'Recursos Materiales', '', 'capturis10', '$2y$10$UWqyn6jkDVMfzR3bqYQ8YuYosX6dRQjGFUu49hlMPhhLCe0KbHPRe', '2024-11-21 20:11:53', 'A', NULL, NULL, NULL, 0, 'test@test.com', NULL, 10, 0),
	(40, 'Jefe', 'Parque Vehicular', '', 'jefedpto11', '$2y$10$bYGlzdoUZJlH52wNDT4KW.g5UTjQGwzooUNgfs35CbmJXLZlEH.2e', '2024-11-21 20:12:42', 'A', NULL, NULL, NULL, 0, 'test@test.com', NULL, 11, 0),
	(41, 'Supevisor', 'Parque Vehicular', '', 'supervis11', '$2y$10$mmLNHdUkZqX.ik/kQzLMV.314LfxTLh8C2FbaelrYfO5I32R8n/9C', '2024-11-21 20:13:20', 'A', NULL, NULL, NULL, 0, 'test@test.com', NULL, 11, 0),
	(42, 'Capturista', 'Parque Vehicular', '', 'capturis11', '$2y$10$OnA9rjXIpwSkLTpwQ0dYYeEg941SYQVavkXqa1SdN/HV2E3GJY256', '2024-11-21 20:14:00', 'A', NULL, NULL, NULL, 0, 'test@test.com', NULL, 11, 0),
	(43, 'Jefe', 'Seguridad e Higiene', '', 'jefedpto12', '$2y$10$FYnPUHmv2h6OgWUyjqql0OpiaV1fULlj6nu1SD3KPsGG2.0zS9Ley', '2024-11-21 20:14:58', 'A', NULL, NULL, NULL, 0, 'test@test.com', NULL, 12, 0),
	(44, 'Supervisor', 'Seguridad e Higiene', '', 'supervis12', '$2y$10$BYNmvxeyR/XhLHYzJlX9SOk7LsOeQx4a15bXNLHn0RsTxf1waXRoa', '2024-11-21 20:15:39', 'A', NULL, NULL, NULL, 0, 'test@test.com', NULL, 12, 0),
	(45, 'Capturista', 'Seguridad e Higiene', '', 'capturis12', '$2y$10$3F.XGjod7H.DPjEvXTU1c.QSIew/HX6Z7dSw6O5hgQujjwoNLguyq', '2024-11-21 20:16:21', 'A', NULL, NULL, NULL, 0, 'test@test.com', NULL, 12, 0),
	(46, 'Capturista', 'Administrativo', '', 'capadmin01', '$2y$10$ZcoYSaleswvKtxjs1ntOl.IBut5tyr/fEFc79gAemWF8U.4QddEbO', '2025-01-20 15:47:03', 'A', NULL, NULL, NULL, 0, 'admin@admin.com', NULL, 1, 0),
	(47, 'Aranxxa', 'Lopez', 'Lopez', 'aranxxa1', '$2y$10$zkYe6Ocy8DTI5fphWx0Nku3LuCb00ZCRrhZBe7q4htHHm/NuZOaM.', '2025-05-07 15:19:56', 'A', NULL, NULL, NULL, 0, 'admin@admin.com', NULL, 1, 0);

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

-- Volcando datos para la tabla admin.fechas: ~4 rows (aproximadamente)
/*DELETE FROM `fechas`;*/
INSERT INTO `fechas` (`idFecha`, `nombre`, `descripcion`, `fechaInicio`, `horaInicio`, `fechaFin`, `horaFin`, `verCalendario`) VALUES
	(1, 'Registro', 'Presentación de solicitudes de registros de candidaturas', '2024-03-04', '00:00:00', '2024-04-07', '23:59:59', 1),
	(2, 'Validacion', 'Verificación de Cumplimiento de requisitos', '2024-03-11', '00:00:00', '2024-05-29', '23:59:59', 1),
	(3, 'Solventacion', 'Plazo de 72 horas para cumplir prevención', '2024-03-22', '00:00:00', '2024-05-29', '23:59:59', 1),
	(4, 'Revision', 'Plazo para revisión de cumplimiento e informe sobre procedencia del registro de candidaturas pendientes ', '2024-03-24', '00:00:00', '2024-05-29', '23:59:59', 1);

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



-- Volcando estructura para procedimiento admin.sp_ActualizarCatalogos
DELIMITER //
CREATE PROCEDURE `sp_ActualizarCatalogos`(
	IN `tipo` INT,
	IN `_id` INT,
	IN `_nombre` VARCHAR(1000)
)
BEGIN
	if tipo = 1  THEN
		UPDATE cat_cargos SET 
			cat_cargos.nombre = _nombre 
			WHERE cat_cargos.idCargo = _id;		
ELSEIF tipo = 2   THEN
		UPDATE cat_remitentes SET 
			cat_remitentes.nombre = _nombre 
			WHERE cat_remitentes.idRemitente = _id;
ELSEIF tipo = 3   THEN
		UPDATE cat_terminos SET 
			cat_terminos.nombre = _nombre 
			WHERE cat_terminos.idTermino = _id;
ELSEIF tipo = 5   THEN
		UPDATE cat_seguimiento SET 
			cat_seguimiento.nombre = _nombre 
			WHERE cat_seguimiento.idSeguimiento = _id;
ELSEIF tipo = 6   THEN
		UPDATE cat_departamentos SET 
			cat_departamentos.nombre = _nombre 
			WHERE cat_departamentos.id = _id;
ELSEIF tipo = 7   THEN
		UPDATE cat_tipo SET 
			cat_tipo.nombre = _nombre 
			WHERE cat_tipo.id = _id;
ELSEIF tipo = 8   THEN
		UPDATE cat_estatus SET 
			cat_estatus.nombre = _nombre 
			WHERE cat_estatus.id = _id;
ELSEIF tipo = 9   THEN
		UPDATE saludos SET 
			saludos.mensaje = _nombre 
			WHERE saludos.id = _id;
END if;
END//
DELIMITER ;



-- Volcando estructura para procedimiento admin.sp_Actualizar_Estatus_Solicitud
DELIMITER //
CREATE PROCEDURE `sp_Actualizar_Estatus_Solicitud`(
	IN `idEstatus` INT,
	IN `_idSolicitud` INT
)
BEGIN
	UPDATE solicitudes SET 
	solicitudes.estatus = idEstatus
	WHERE solicitudes.id = _idSolicitud;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Actualizar_Solicitudes
DELIMITER //
CREATE PROCEDURE `sp_Actualizar_Solicitudes`(
	IN `_numeroConsecutivo` INT,
	IN `_numeroSolicitud` INT,
	IN `_fechaRecibido` DATE,
	IN `_remitente` INT,
	IN `_otroRemitente` VARCHAR(1000),
	IN `_cargo` INT,
	IN `_otroCargo` VARCHAR(1000),
	IN `_asunto` VARCHAR(1000),
	IN `_termino` INT,
	IN `_fechaTermino` DATE,
	IN `_diasTermino` INT,
	IN `_respuesta` INT,
	IN `_seguimiento` INT,
	IN `_areaAsignada` INT,
	IN `_tipo` INT,
	IN `_fechaAsignacion` DATE,
	IN `_observaciones` VARCHAR(2500),
	IN `supervisa_` INT,
	IN `_idArchivo` INT,
	IN `_id` INT
)
BEGIN
if _idArchivo = 0 then
	UPDATE solicitudes SET 
		numeroConsecutivo = _numeroConsecutivo,
		numeroSolicitud = _numeroSolicitud,
		fechaRecibido = _fechaRecibido,
		remitente = _remitente,
		otroRemitente = _otroRemitente,
		cargo = _cargo,
		otroCargo =_otroCargo,
		asunto = _asunto,
		termino = _termino,
		fechaTermino = _fechaTermino,
		diasTermino = _diasTermino,
		respuesta = _respuesta,
		seguimiento = _seguimiento,
		areaAsignada = _areaAsignada,
		tipo = _tipo,
		fechaAsignacion = _fechaAsignacion,
		observaciones = _observaciones,
		supervisa = supervisa_
	WHERE id = _id;
ELSE 

UPDATE solicitudes SET 
		numeroConsecutivo = _numeroConsecutivo,
		numeroSolicitud = _numeroSolicitud,
		fechaRecibido = _fechaRecibido,
		remitente = _remitente,
		otroRemitente = _otroRemitente,
		cargo = _cargo,
		otroCargo =_otroCargo,
		asunto = _asunto,
		termino = _termino,
		fechaTermino = _fechaTermino,
		diasTermino = _diasTermino,
		respuesta = _respuesta,
		seguimiento = _seguimiento,
		areaAsignada = _areaAsignada,
		tipo = _tipo,
		fechaAsignacion = _fechaAsignacion,
		observaciones = _observaciones,
		supervisa = supervisa_,
		idArchivo = _idArchivo
	WHERE id = _id;
END if;
END//
DELIMITER ;

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

-- Volcando estructura para procedimiento admin.sp_Archivo_subirArchivo
DELIMITER //
CREATE PROCEDURE `sp_Archivo_subirArchivo`(
	IN `_ruta` VARCHAR(255),
	IN `_nombre` VARCHAR(255)
)
BEGIN
	INSERT INTO files ( files.RUTA, files.FILENAME, files.CREADO_AT, files.ACTUALIZADO_AT ) VALUES ( _ruta, _nombre, NOW(), NOW() ); 
	SELECT MAX(files.idDOCUMENTO)AS idDOCUMENTO FROM  files;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Archivo_subirArchivoSolicitud
DELIMITER //
CREATE PROCEDURE `sp_Archivo_subirArchivoSolicitud`(
	IN `_ruta` VARCHAR(255),
	IN `_nombre` VARCHAR(255),
	IN `_tipo` INT
)
BEGIN
	INSERT INTO files ( files.RUTA, files.FILENAME, files.TIPO, files.CREADO_AT, files.ACTUALIZADO_AT ) VALUES ( _ruta, _nombre, _tipo, NOW(), NOW() ); 
	SELECT LAST_INSERT_ID() AS idDOCUMENTO;
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

-- Volcando estructura para procedimiento admin.sp_ConsultarTipoDoc
DELIMITER //
CREATE PROCEDURE `sp_ConsultarTipoDoc`()
BEGIN
	SELECT * FROM cat_doc;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Consultar_CopiasCononcimientoID
DELIMITER //
CREATE PROCEDURE `sp_Consultar_CopiasCononcimientoID`(
	IN `id_` INT
)
BEGIN
select copias_conocimiento.id_solicitud AS id_solicitud,
group_concat(copias_conocimiento.id_departamento separator ',') AS departamentosEnterados FROM 
copias_conocimiento 
WHERE 
copias_conocimiento.id_solicitud = id_;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Consultar_RegistrosDuplicados
DELIMITER //
CREATE PROCEDURE `sp_Consultar_RegistrosDuplicados`(
	IN `tipo` INT,
	IN `buscar` VARCHAR(1000)
)
BEGIN
	if tipo = 1  THEN
	SELECT COUNT(*) AS total FROM cat_cargos  WHERE cat_cargos.nombre LIKE CONCAT('%', buscar, '%') AND status = 'A' ;
ELSEIF tipo = 2   THEN
		SELECT COUNT(*) AS total FROM cat_remitentes WHERE cat_remitentes.nombre LIKE CONCAT('%', buscar, '%') AND status = 'A' ;
ELSEIF tipo = 3   THEN
		SELECT COUNT(*) AS total FROM cat_terminos WHERE cat_terminos.nombre LIKE CONCAT('%', buscar, '%') AND status = 'A' ;
ELSEIF tipo = 5   THEN
		SELECT COUNT(*) AS total FROM cat_seguimiento WHERE cat_seguimiento.nombre LIKE CONCAT('%', buscar, '%') AND status = 'A' ;
ELSEIF tipo = 6   THEN
		SELECT COUNT(*) AS total FROM cat_departamentos WHERE cat_departamentos.nombre LIKE CONCAT('%', buscar, '%') AND status = 'A' ;
ELSEIF tipo = 7   THEN
		SELECT COUNT(*) AS total FROM cat_tipo WHERE cat_tipo.nombre LIKE CONCAT('%', buscar, '%') AND status = 'A' ;
ELSEIF tipo = 8   THEN
		SELECT COUNT(*) AS total FROM cat_estatus WHERE cat_estatus.nombre LIKE CONCAT('%', buscar, '%') AND status = 'A' ;
ELSEIF tipo = 9   THEN
		SELECT COUNT(*) AS total FROM saludos WHERE saludos.mensaje= buscar AND status = 'A' ;
END if;
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

-- Volcando estructura para procedimiento admin.sp_Copia_Enterado
DELIMITER //
CREATE PROCEDURE `sp_Copia_Enterado`(
	IN `solicitud` INT,
	IN `departamento` INT
)
BEGIN
	UPDATE copias_conocimiento SET 
		copias_conocimiento.enterado = 'S'
	WHERE 
	copias_conocimiento.id_solicitud = solicitud and
	copias_conocimiento.id_departamento = departamento;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_DesactivarRegistros
DELIMITER //
CREATE PROCEDURE `sp_DesactivarRegistros`(
	IN `tipo` INT,
	IN `_id` INT,
	IN `_estatus` CHAR(9)
)
BEGIN
	if tipo = 1  THEN
		UPDATE cat_cargos SET 
			cat_cargos.status = _estatus 
			WHERE cat_cargos.idCargo = _id;		
ELSEIF tipo = 2   THEN
		UPDATE cat_remitentes SET 
			cat_remitentes.status = _estatus
			WHERE cat_remitentes.idRemitente = _id;
ELSEIF tipo = 3   THEN
		UPDATE cat_terminos SET 
			cat_terminos.status = _estatus 
			WHERE cat_terminos.idTermino = _id;
ELSEIF tipo = 5   THEN
		UPDATE cat_seguimiento SET 
			cat_seguimiento.status = _estatus 
			WHERE cat_seguimiento.idSeguimiento = _id;
ELSEIF tipo = 6   THEN
		UPDATE cat_departamentos SET 
			cat_departamentos.status = _estatus 
			WHERE cat_departamentos.id = _id;
ELSEIF tipo = 7   THEN
		UPDATE cat_tipo SET 
			cat_tipo.status = _estatus 
			WHERE cat_tipo.id = _id;
ELSEIF tipo = 8   THEN
		UPDATE cat_estatus SET 
			cat_estatus.status = _estatus 
			WHERE cat_estatus.id = _id;
ELSEIF tipo = 9   THEN
		UPDATE saludos SET 
			saludos.estatus = _estatus 
			WHERE saludos.id = _id;
			
END if;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_EliminarCopiasConocimiento
DELIMITER //
CREATE PROCEDURE `sp_EliminarCopiasConocimiento`(
	IN `id_` INT
)
BEGIN
 DELETE FROM copias_conocimiento WHERE copias_conocimiento.id_solicitud = id_;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Equipo_getEstado
DELIMITER //
CREATE PROCEDURE `sp_Equipo_getEstado`(
	IN `listaEstados` INT
)
BEGIN
	SELECT * FROM cat_estadoequipo;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Equipo_getListarMarcasModelos
DELIMITER //
CREATE PROCEDURE `sp_Equipo_getListarMarcasModelos`()
BEGIN
	SELECT DISTINCT
		cm.nombre AS marca,
		ct.nombre AS modelo,
		cte.nombre AS tipoEquipo,
		GROUP_CONCAT(DISTINCT cy.`year` ORDER BY cy.`year` ASC SEPARATOR ', ') AS aniosEquipos,
		cm.id AS idMarca,	
		ct.id AS idModelo,
		cte.id AS idTipoEquipo
	FROM cat_marca cm
	LEFT JOIN cat_modelo ct ON ct.marca = cm.id
	LEFT JOIN equipo ON equipo.modelo = ct.id
	LEFT JOIN cat_years cy ON cy.id = equipo.`year`
	LEFT JOIN cat_tipoequipo cte ON cte.id = ct.tipoEquipo AND cte.id <> 9
	GROUP BY cm.id, cm.nombre, ct.nombre, cte.nombre
	ORDER BY cm.nombre ASC;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Equipo_getMarcas
DELIMITER //
CREATE PROCEDURE `sp_Equipo_getMarcas`()
BEGIN
	SELECT * FROM cat_marca;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Equipo_getModelos
DELIMITER //
CREATE PROCEDURE `sp_Equipo_getModelos`()
BEGIN
	SELECT * FROM cat_modelo;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Equipo_getTipoEquipo
DELIMITER //
CREATE PROCEDURE `sp_Equipo_getTipoEquipo`()
BEGIN
	SELECT * FROM cat_tipoequipo;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Equipo_getYears
DELIMITER //
CREATE PROCEDURE `sp_Equipo_getYears`()
BEGIN
	SELECT * FROM cat_years ORDER BY `year` DESC;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Equipo_getYearsFiltro
DELIMITER //
CREATE PROCEDURE `sp_Equipo_getYearsFiltro`(
	IN `nTIpoEquipo` INT,
	IN `nMarca` INT,
	IN `nModelo` INT
)
BEGIN
	SET @tipo = nTipoEquipo;
	SET @marca = nMarca;
	SET @modelo = nModelo;
	SELECT 
		EQ.`year` AS `id`,
		YEARS.`year`
	FROM equipo EQ 
	LEFT JOIN cat_years YEARS ON YEARS.id = EQ.`year`
	WHERE 
		(CASE 
			WHEN @tipo > 0 AND @marca > 0 AND @modelo > 0 THEN EQ.tipo = @tipo AND EQ.marca = @marca AND EQ.modelo = @modelo
			WHEN @tipo > 0 AND @marca > 0 AND @modelo = 0 THEN EQ.tipo = @tipo AND EQ.marca = @marca 
			WHEN @tipo > 0 AND @marca = 0 AND @modelo > 0 THEN EQ.tipo = @tipo AND EQ.modelo = @modelo
			WHEN @tipo > 0 AND @marca = 0 AND @modelo = 0 THEN EQ.tipo = @tipo
			WHEN @tipo = 0 AND @marca > 0 AND @modelo > 0 THEN EQ.marca = @marca AND EQ.modelo = @modelo
			WHEN @tipo = 0 AND @marca > 0 AND @modelo = 0 THEN EQ.marca = @marca
			WHEN @tipo = 0 AND @marca = 0 AND @modelo > 0 THEN EQ.modelo = @modelo
			ELSE EQ.tipo = 0
		END)
	GROUP BY EQ.`year`
	ORDER BY YEARS.`year` DESC;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Equipo_registrarMarca
DELIMITER //
CREATE PROCEDURE `sp_Equipo_registrarMarca`(
	IN `param_nombre` VARCHAR(50),
	OUT `resInsercion` INT
)
BEGIN
	INSERT INTO cat_marca(nombre)
	VALUES (
		param_nombre
	);
	-- SI SE INSERTÓ DE MANERA CORRECTA, SE RETORNA 1 COMO RESULTADO
	SET resInsercion = 1;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Equipo_registrarMarcaHandler
DELIMITER //
CREATE PROCEDURE `sp_Equipo_registrarMarcaHandler`(
	IN `param_nombre` VARCHAR(50)
)
BEGIN
	DECLARE existeMarca INT;
	DECLARE resInsercion INT DEFAULT 0;
	DECLARE marcaResultado INT;
	
	SELECT EXISTS(SELECT cat_marca.id FROM cat_marca WHERE cat_marca.nombre = param_nombre) INTO existeMarca;
		
	IF existeMarca = 1 THEN
		-- Se retorna -1 para indicar que la red que se quiere registrar ya se encuentra en la lista
		SET marcaResultado = -1;
	ELSE
		CALL sp_Equipo_registrarMarca(param_nombre, resInsercion);
		SET marcaResultado = resInsercion;
	END IF;
	
	SELECT marcaResultado;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Equipo_registrarModelo
DELIMITER //
CREATE PROCEDURE `sp_Equipo_registrarModelo`(
	IN `param_idTipo` INT,
	IN `param_idMarca` INT,
	IN `param_nombre` VARCHAR(100),
	OUT `resInsercion` INT
)
BEGIN
	INSERT INTO cat_modelo(tipoEquipo, marca, nombre )
	VALUES(
		param_idTipo,
		param_idMarca,
		param_nombre
	);
	
	SET resInsercion = 1;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Equipo_registrarModeloHandler
DELIMITER //
CREATE PROCEDURE `sp_Equipo_registrarModeloHandler`(
	IN `param_idTipo` INT,
	IN `param_idMarca` INT,
	IN `param_nombre` VARCHAR(100)
)
BEGIN
	DECLARE existeModelo INT;
	DECLARE resInsercion INT DEFAULT 0;
	DECLARE modeloResultado INT;
	
	SELECT EXISTS(SELECT id FROM cat_modelo WHERE cat_modelo.marca = param_idMarca AND cat_modelo.nombre = param_nombre) INTO existeModelo;
		
	IF existeModelo = 1 THEN
		-- Se retorna -1 para indicar que la red que se quiere registrar ya se encuentra en la lista
		SET modeloResultado = -1;
	ELSE
		CALL sp_Equipo_registrarModelo(param_idTipo, param_idMarca, param_nombre, resInsercion);
		SET modeloResultado = resInsercion;
	END IF;
	
	SELECT modeloResultado;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Equipo_registrarTipo
DELIMITER //
CREATE PROCEDURE `sp_Equipo_registrarTipo`(
	IN `param_nombre` VARCHAR(50),
	OUT `resInsercion` INT
)
BEGIN
	INSERT INTO cat_tipoequipo (nombre) 
	VALUES (
		param_nombre
	);
	-- SI SE INSERTÓ DE MANERA CORRECTA, SE RETORNA 1 COMO RESULTADO
	SET resInsercion = 1;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Equipo_registrarTipoHandler
DELIMITER //
CREATE PROCEDURE `sp_Equipo_registrarTipoHandler`(
	IN `param_nombre` VARCHAR(50)
)
BEGIN
	DECLARE existeTipo INT;
	DECLARE resInsercion INT DEFAULT 0;
	DECLARE tipoEqResultado INT;
	
	SELECT EXISTS(SELECT cat_tipoequipo.id FROM cat_tipoequipo WHERE cat_tipoequipo.nombre = param_nombre) INTO existeTipo;
		
	IF existeTipo = 1 THEN
		-- Se retorna -1 para indicar que la red que se quiere registrar ya se encuentra en la lista
		SET tipoEqResultado = -1;
	ELSE
		CALL sp_Equipo_registrarTipo(param_nombre, resInsercion);
		SET tipoEqResultado = resInsercion;
	END IF;
	
	SELECT tipoEqResultado;
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


-- Volcando estructura para procedimiento admin.sp_getDepartamentos
DELIMITER //
CREATE PROCEDURE `sp_getDepartamentos`()
BEGIN
	SELECT 
		id,
		nombre 
	FROM cat_departamentos WHERE STATUS = 'A';
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

-- Volcando estructura para procedimiento admin.sp_insertarCopiasConocimiento
DELIMITER //
CREATE PROCEDURE `sp_insertarCopiasConocimiento`(
	IN `solicitud` INT,
	IN `departamento` INT,
	IN `estatus` CHAR(1)
)
BEGIN
	INSERT INTO copias_conocimiento  (id_solicitud,id_departamento,enterado) VALUES (solicitud, departamento, estatus);
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

-- Volcando estructura para procedimiento admin.sp_listarSolicitudes
DELIMITER //
CREATE PROCEDURE `sp_listarSolicitudes`(
	IN `tipo` INT
)
BEGIN
if tipo = 0 then
	/*SELECT 
	datosSolicitudes.*,
	files.RUTA AS rutaContestacion,
	if( copias_conocimiento_estatus.NoEnterados IS NULL, 0, copias_conocimiento_estatus.NoEnterados) AS NoEnterados , 
	if( copias_conocimiento_estatus.Enterados IS NULL, 0, copias_conocimiento_estatus.Enterados) AS Enterados , 
	if( copias_conocimiento_estatus.departamentosNoEnterados IS NULL, 0, copias_conocimiento_estatus.departamentosNoEnterados) AS departamentosNoEnterados , 
	if( copias_conocimiento_estatus.departamentosEnterados IS NULL, 0, copias_conocimiento_estatus.departamentosEnterados) AS departamentosEnterados  
	from datosSolicitudes
	LEFT JOIN files ON files.idDOCUMENTO = datosSolicitudes.idArchivoContestacion
	LEFT JOIN copias_conocimiento_estatus ON copias_conocimiento_estatus.id_solicitud = datossolicitudes.id;*/
	SELECT	datosSolicitudes.*,
	files.RUTA AS rutaContestacion,
	if( copias_conocimiento_estatus.NoEnterados IS NULL, 0, copias_conocimiento_estatus.NoEnterados) AS NoEnterados , 
	if( copias_conocimiento_estatus.Enterados IS NULL, 0, copias_conocimiento_estatus.Enterados) AS Enterados , 
	if( copias_conocimiento_estatus.departamentosNoEnterados IS NULL, '', copias_conocimiento_estatus.departamentosNoEnterados) AS departamentosNoEnterados , 
	if( copias_conocimiento_estatus.departamentosEnterados IS NULL, '', copias_conocimiento_estatus.departamentosEnterados) AS departamentosEnterados  
	from datosSolicitudes
	LEFT JOIN files ON files.idDOCUMENTO = datosSolicitudes.idArchivoContestacion
	LEFT JOIN copias_conocimiento_estatus ON copias_conocimiento_estatus.id_solicitud = datossolicitudes.id;
ELSE 
	SELECT 
	datosSolicitudes.*,
	files.RUTA AS rutaContestacion,
	if( copias_conocimiento_estatus.NoEnterados IS NULL, 0, copias_conocimiento_estatus.NoEnterados) AS NoEnterados , 
	if( copias_conocimiento_estatus.Enterados IS NULL, 0, copias_conocimiento_estatus.Enterados) AS Enterados , 
	if( copias_conocimiento_estatus.departamentosNoEnterados IS NULL, 0, copias_conocimiento_estatus.departamentosNoEnterados) AS departamentosNoEnterados , 
	if( copias_conocimiento_estatus.departamentosEnterados IS NULL, 0, copias_conocimiento_estatus.departamentosEnterados) AS departamentosEnterados  
	from datosSolicitudes
	LEFT JOIN files ON files.idDOCUMENTO = datosSolicitudes.idArchivoContestacion
	LEFT JOIN copias_conocimiento_estatus ON copias_conocimiento_estatus.id_solicitud = datossolicitudes.id
	WHERE  
	copias_conocimiento_estatus.departamentosNoEnterados  LIKE CONCAT('%', tipo, '%') OR copias_conocimiento_estatus.departamentosEnterados   LIKE CONCAT('%', tipo, '%') ;
END if;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_ObtenerCapitulos
DELIMITER //
CREATE PROCEDURE `sp_ObtenerCapitulos`()
BEGIN
	SELECT * FROM cat_capitulos;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Periodos_getFechas
DELIMITER //
CREATE PROCEDURE `sp_Periodos_getFechas`()
BEGIN
	SELECT * FROM fechas;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Personal_editarPersonal
DELIMITER //
CREATE PROCEDURE `sp_Personal_editarPersonal`(
	IN `param_nombre` VARCHAR(100),
	IN `param_apellidop` VARCHAR(100),
	IN `param_apellidom` VARCHAR(100),
	IN `param_dpto` INT,
	IN `param_idpersonal` INT,
	OUT `respuesta` INT
)
BEGIN
	UPDATE personal SET
	personal.nombre = param_nombre,
	personal.apellidop = param_apellidop,
	personal.apellidom = param_apellidom,
	personal.dpto = param_dpto
	WHERE personal.id = param_idpersonal;
	
	-- SI SE ACTUALIZÓ DE MANERA CORRECTA, SE RETORNA 1 COMO RESULTADO
	SET respuesta = 1;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Personal_editarPersonalHandler
DELIMITER //
CREATE PROCEDURE `sp_Personal_editarPersonalHandler`(
	IN `param_nombre` VARCHAR(100),
	IN `param_apellidop` VARCHAR(100),
	IN `param_apellidom` VARCHAR(100),
	IN `param_dpto` INT,
	IN `param_idpersonal` INT
)
BEGIN
	DECLARE existeDpto INT;
	DECLARE personalDuplicado VARCHAR(255) DEFAULT '';
	DECLARE personalDuplicadoConDpto INT;
	DECLARE respuesta INT DEFAULT 0;
	DECLARE personalResultado INT;
	
	SELECT EXISTS(SELECT nombre FROM cat_adscripcion WHERE cat_adscripcion.id = param_dpto) INTO existeDpto;
		
	IF existeDpto = 0 THEN
		-- SE RETORNA EL VALOR -1 PARA INDICAR QUE EL DEPARTAMENTO INDICADO NO EXISTE
		SET personalResultado = -1;
	ELSE
		SELECT IFNULL((SELECT GROUP_CONCAT(personal.id) FROM personal WHERE personal.nombre = param_nombre AND personal.apellidop = param_apellidop AND personal.apellidom = param_apellidom), 0) INTO personalDuplicado;
		
		IF LENGTH(personalDuplicado) = 1 AND personalDuplicado = '0' THEN
			CALL sp_Personal_editarPersonal(param_nombre, param_apellidop, param_apellidom, param_dpto, param_idpersonal, respuesta);
			
			SET personalResultado = respuesta;
		ELSE
			SELECT IFNULL(
				(SELECT GROUP_CONCAT(personal.id) FROM personal WHERE personal.nombre = param_nombre AND personal.apellidop = param_apellidop AND personal.apellidom = param_apellidom AND personal.dpto = param_dpto),
				0
			) INTO personalDuplicadoConDpto;
			
			IF personalDuplicadoConDpto = 0 THEN
				-- SE RETORNA EL VALOR -2 PARA INDICAR QUE EL PERSONAL YA SE ENCUENTRA 
				-- REGISTRADO EL NOMBRE DEL PERSONAL EN OTRA FILA (SE PREGUNTARÁ SI AÚN ASÍ DESEA REGISTRARLO)
				SELECT 
					-2 AS personalResultado, 
					(
						SELECT 
							GROUP_CONCAT(personal.dpto)
						FROM personal 
						WHERE personal.nombre = param_nombre 
						AND personal.apellidop = param_apellidop 
						AND personal.apellidom = param_apellidom
					) AS dptosPersonalDuplicado;
			ELSE
				-- SE RETORNA EL VALOR -3 PARA INDICAR QUE EL PERSONAL QUE SE ESTÁ INTENTANDO INSERTAR
				-- NUEVAMENTE (NOMBRE COMPLETO Y DPTO)
				SELECT 
					-3 INTO personalResultado;
			END IF;
		END IF;
	END IF;
	
	SELECT personalResultado;
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

-- Volcando estructura para procedimiento admin.sp_Personal_registrarPersonal
DELIMITER //
CREATE PROCEDURE `sp_Personal_registrarPersonal`(
	IN `param_nombre` VARCHAR(100),
	IN `param_apellidop` VARCHAR(100),
	IN `param_apellidom` VARCHAR(100),
	IN `param_dpto` INT,
	OUT `resultado` INT
)
BEGIN
	INSERT INTO personal (nombre, apellidop, apellidom, dpto) VALUES
	(
		param_nombre, param_apellidop, param_apellidom, param_dpto
	);
	-- SI SE INSERTÓ DE MANERA CORRECTA, SE RETORNA 1 COMO RESULTADO
	SET resultado = 1;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Personal_registrarPersonalHandler
DELIMITER //
CREATE PROCEDURE `sp_Personal_registrarPersonalHandler`(
	IN `param_nombre` VARCHAR(100),
	IN `param_apellidop` VARCHAR(100),
	IN `param_apellidom` VARCHAR(100),
	IN `param_dpto` INT
)
BEGIN
	DECLARE existeDpto INT;
	DECLARE personalDuplicado VARCHAR(255) DEFAULT '';
	DECLARE personalDuplicadoConDpto INT;
	DECLARE resInsercion INT DEFAULT 0;
	DECLARE personalResultado INT;

	SELECT EXISTS(SELECT cat_adscripcion.id FROM cat_adscripcion WHERE cat_adscripcion.id = param_dpto) INTO existeDpto;
		
	IF existeDpto = 0 THEN
		-- SE RETORNA EL VALOR -1 PARA INDICAR QUE EL DEPARTAMENTO NO EXISTE
		SET personalResultado = -1;
	ELSE
		SELECT IFNULL((SELECT GROUP_CONCAT(personal.id) FROM personal WHERE personal.nombre = param_nombre AND personal.apellidop = param_apellidop AND personal.apellidom = param_apellidom), 0) INTO personalDuplicado;
		
		IF LENGTH(personalDuplicado) = 1 AND personalDuplicado = '0' THEN
			CALL sp_Personal_registrarPersonal(param_nombre, param_apellidop, param_apellidom, param_dpto, resInsercion);
			
			SET personalResultado = resInsercion;
		ELSE
			SELECT IFNULL((SELECT GROUP_CONCAT(personal.id) FROM personal WHERE personal.nombre = param_nombre AND personal.apellidop = param_apellidop AND personal.apellidom = param_apellidom AND personal.dpto = param_dpto), 0) INTO personalDuplicadoConDpto;
			
			IF personalDuplicadoConDpto = 0 THEN
				-- SE RETORNA EL VALOR -2 PARA INDICAR QUE EL PERSONAL YA SE ENCUENTRA 
				-- REGISTRADO EL NOMBRE DEL PERSONAL EN OTRA FILA (SE PREGUNTARÁ SI AÚN ASÍ DESEA REGISTRARLO)
				SELECT 
					-2 AS personalResultado, 
					(
						SELECT 
							GROUP_CONCAT(personal.dpto)
						FROM personal 
						WHERE personal.nombre = param_nombre 
						AND personal.apellidop = param_apellidop 
						AND personal.apellidom = param_apellidom
					) AS dptosPersonalDuplicado;
			ELSE
				-- SE RETORNA EL VALOR -3 PARA INDICAR QUE EL PERSONAL QUE SE ESTÁ INTENTANDO INSERTAR
				-- NUEVAMENTE (NOMBRE COMPLETO Y DPTO)
				SELECT 
					-3 INTO personalResultado;
			END IF;
		END IF;
	END IF;
	
	SELECT personalResultado;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_RegistrarSolicitud
DELIMITER //
CREATE PROCEDURE `sp_RegistrarSolicitud`(
	IN `_numeroConsecutivo` INT,
	IN `_numeroSolicitud` INT,
	IN `_fechaRecibido` DATE,
	IN `_remitente` INT,
	IN `_otroRemitente` VARCHAR(1000),
	IN `_cargo` INT,
	IN `_otroCargo` VARCHAR(1000),
	IN `_asunto` VARCHAR(1000),
	IN `_termino` INT,
	IN `_fechaTermino` DATE,
	IN `_diasTermino` INT,
	IN `_respuesta` INT,
	IN `_seguimiento` INT,
	IN `_areaAsignada` INT,
	IN `_tipo` INT,
	IN `_fechaAsignacion` DATE,
	IN `_estatus` INT,
	IN `_observaciones` VARCHAR(2500),
	IN `_idArchivo` INT,
	IN `supervisa_` INT
)
BEGIN
	INSERT INTO solicitudes ( 
	numeroConsecutivo, numeroSolicitud, fechaRecibido, remitente, otroRemitente, cargo,	otroCargo, asunto, termino, fechaTermino, diasTermino, respuesta,	seguimiento, areaAsignada, tipo, fechaAsignacion, estatus, observaciones,idArchivo,supervisa) 
	VALUES (
	 _numeroConsecutivo, _numeroSolicitud, _fechaRecibido, _remitente, _otroRemitente, _cargo, _otroCargo, _asunto, _termino, _fechaTermino, _diasTermino, _respuesta, _seguimiento, _areaAsignada, _tipo, _fechaAsignacion, _estatus, _observaciones,_idArchivo,supervisa_);
	 
	 
	 SET @idSolicitud :=  ( 	SELECT MAX(id) AS id FROM  solicitudes );
		
		SELECT id FROM solicitudes WHERE id = @idSolicitud;
		
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Registrar_Datos
DELIMITER //
CREATE PROCEDURE `sp_Registrar_Datos`(
	IN `nombre` VARCHAR(1000),
	IN `tipo` INT
)
BEGIN
	if tipo = 1  THEN
		INSERT INTO cat_cargos( cat_cargos.nombre ) VALUES (nombre);
ELSEIF tipo = 2   THEN
		INSERT INTO cat_remitentes( cat_remitentes.nombre ) VALUES (nombre);
ELSEIF tipo = 3   THEN
		INSERT INTO cat_terminos( cat_terminos.nombre ) VALUES (nombre);
ELSEIF tipo = 5   THEN
		INSERT INTO cat_seguimiento( cat_seguimiento.nombre ) VALUES (nombre);
ELSEIF tipo = 6   THEN
		INSERT INTO cat_departamentos( cat_departamentos.nombre ) VALUES (nombre);
ELSEIF tipo = 7   THEN
		INSERT INTO cat_tipo( cat_tipo.nombre ) VALUES (nombre);
ELSEIF tipo = 8   THEN
		INSERT INTO cat_estatus( cat_estatus.nombre ) VALUES (nombre);
END if;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_setInterfaceSettings
DELIMITER //
CREATE PROCEDURE `sp_setInterfaceSettings`(
	IN `watermarkValue` CHAR(1)
)
BEGIN
	UPDATE interfaz set
	STATUS = watermarkValue;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_setSubirFP
DELIMITER //
CREATE PROCEDURE `sp_setSubirFP`(
	IN `nIdUser` INT,
	IN `cRuta` VARCHAR(255),
	IN `nIdAuth` INT,
	IN `fAccion` TIMESTAMP
)
BEGIN
	INSERT INTO fotos_personal (`user`, ruta, created_by, created_at)
	VALUES (nIdUser, cRuta, nIdAuth, fAccion ) 
	ON DUPLICATE KEY 
	UPDATE 
		ruta = cRuta,
		updated_by = nIdAuth,
		updated_at = fAccion
	;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_setUpdateDatosPById
DELIMITER //
CREATE PROCEDURE `sp_setUpdateDatosPById`(
	IN `nIdRegistro` INT,
	IN `nIdUsuario` INT,
	IN `fNacimiento` DATE,
	IN `cCelular` VARCHAR(12),
	IN `nIdAuth` INT,
	IN `fAccion` TIMESTAMP
)
BEGIN
	if nIdRegistro = 0 then
		INSERT INTO datos_personal (`user`, fechaNacimiento, numCelular, created_by, created_at )
		VALUES (nIdUsuario, fNacimiento, cCelular, nIdAuth, fAccion);
		
		SELECT LAST_INSERT_ID() AS `id_DP`;
	else
		UPDATE datos_personal SET 
			datos_personal.fechaNacimiento = fNacimiento, 
			datos_personal.numCelular = cCelular,
			datos_personal.updated_by = nIdAuth,
			datos_personal.updated_at = fAccion
		WHERE datos_personal.id = nIdRegistro AND datos_personal.`user` = nIdUsuario;
		
		SELECT nIdRegistro AS `id_DP`;
	END if;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_setUpdateInfoUserbyId
DELIMITER //
CREATE PROCEDURE `sp_setUpdateInfoUserbyId`(
	IN `nId` INT,
	IN `cNombre` VARCHAR(50),
	IN `cApaterno` VARCHAR(50),
	IN `cAmaterno` VARCHAR(50),
	IN `cEmail` VARCHAR(255),
	IN `fActualizado` TIMESTAMP
)
BEGIN
	UPDATE users SET
		users.Nombre = cNombre,
		users.Apaterno = cApaterno,
		users.Amaterno = cAmaterno,
		users.email = cEmail,
		users.updated_at = fActualizado
	WHERE users.id = nId;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_setUpdatePassById
DELIMITER //
CREATE PROCEDURE `sp_setUpdatePassById`(
	IN `nId` INT,
	IN `cHash` VARCHAR(255),
	IN `fAccion` TIMESTAMP
)
BEGIN
	UPDATE users SET 
		users.password = cHash,
		users.updated_at = fAccion
	WHERE users.id = nId;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Solicitudes_ConsultarID
DELIMITER //
CREATE PROCEDURE `sp_Solicitudes_ConsultarID`(
	IN `id_` INT
)
BEGIN
	SELECT * FROM solicitudes WHERE solicitudes.id = id_ AND solicitudes.estatus <> 4;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Solicitudes_Contestacion
DELIMITER //
CREATE PROCEDURE `sp_Solicitudes_Contestacion`(
	IN `_idContestacion` INT,
	IN `_idSolicitud` INT
)
BEGIN
	UPDATE solicitudes SET 
	solicitudes.idArchivoContestacion = _idContestacion,
	solicitudes.estatus = 4
	WHERE solicitudes.id = _idSolicitud;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Solicitud_deleteCopiaCon
DELIMITER //
CREATE PROCEDURE `sp_Solicitud_deleteCopiaCon`(
	IN `nIdSolicitud` INT,
	IN `nIdDPTO` INT
)
BEGIN
	DELETE FROM cap_copiacon 
	WHERE id_solicitud = nIdSolicitud AND id_departamento = nIdDPTO;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Solicitud_getAllByType
DELIMITER //
CREATE PROCEDURE `sp_Solicitud_getAllByType`(
	IN `nTipo` INT,
	IN `nDPTO` INT
)
BEGIN
	SET @dptoUsuario := IFNULL(nDPTO, 0);
	IF nTipo = 1 then
		SELECT 
			SOLIC.id AS `idSolicitud`,
			cat_doc.nombre AS `solicitud`,
			CAPITULO.serie AS `capitulo`,
			SOLIC.numFolio,
			DATE_FORMAT(SOLIC.fechaRecibido, "%d/%m/%Y") AS `fechaRecibido`,
			SOLIC.horaRecibido,
			DPTO_Solicita.nombre AS `areaSolicita`,
			DPTO_Asignar.nombre AS `areaAsignar`,
			files.RUTA AS `rutaDoc`,
			FL_CONTE.RUTA AS `rutaContestacion`,
			ESTATUS.nombre AS `estatus`,
			SOLIC.fechaTermino,
			SOLIC.motivoCambio
		FROM cap_solicitud SOLIC
		LEFT JOIN cat_departamentos DPTO_Solicita ON DPTO_Solicita.id = SOLIC.areaSolicita
		LEFT JOIN cat_seguimiento DPTO_Asignar ON DPTO_Asignar.idSeguimiento = SOLIC.areaAsignar
		LEFT JOIN cat_capitulos CAPITULO ON CAPITULO.id = SOLIC.capitulo 
		LEFT JOIN cat_doc ON cat_doc.id = SOLIC.tipo
		LEFT JOIN files ON files.idDOCUMENTO = SOLIC.idArchivo
		LEFT JOIN cap_contestacion CONTE ON CONTE.idSolicitud = SOLIC.id
		LEFT JOIN files FL_CONTE ON FL_CONTE.idDOCUMENTO = CONTE.idArchivo
		LEFT JOIN cat_estatus ESTATUS ON ESTATUS.id = SOLIC.idStatus
		WHERE SOLIC.tipo = nTipo AND NOT(SOLIC.idStatus = 4 OR SOLIC.idStatus = 7 OR SOLIC.idStatus = 10) AND 
			(CASE 
				WHEN @dptoUsuario > 0 THEN SOLIC.areaAsignar = @dptoUsuario
				ELSE TRUE
			END)
		ORDER BY SOLIC.created_at DESC;	
	ELSEIF nTIpo = 2 THEN
		SELECT 
			SOLIC.id AS `idSolicitud`,
			cat_doc.nombre AS `solicitud`,
			DPTO_Solicita.nombre AS `areaSolicita`,
			SOLIC.numMemo,
			SOLIC.asunto,
			DATE_FORMAT(SOLIC.fechaRecibido, "%d/%m/%Y") AS `fechaRecibido`,
			SOLIC.horaRecibido,
			TERMINO.nombre AS `termino`,
			DATE_FORMAT(SOLIC.fechaTermino, "%d/%m/%Y") AS `fechaTermino`,
			DPTO_Asignar.nombre AS `areaAsignar`,
			SOLIC.respuesta,
			files.RUTA AS `rutaDoc`,
			FL_CONTE.RUTA AS `rutaContestacion`,
			ESTATUS.nombre AS `estatus`,
			SOLIC.motivoCambio
		FROM cap_solicitud SOLIC
		LEFT JOIN cat_departamentos DPTO_Solicita ON DPTO_Solicita.id = SOLIC.areaSolicita
		LEFT JOIN cat_seguimiento DPTO_Asignar ON DPTO_Asignar.idSeguimiento = SOLIC.areaAsignar
		LEFT JOIN cat_terminos TERMINO ON TERMINO.idTermino = SOLIC.termino
		LEFT JOIN cat_doc ON cat_doc.id = SOLIC.tipo
		LEFT JOIN files ON files.idDOCUMENTO = SOLIC.idArchivo
		LEFT JOIN cap_contestacion CONTE ON CONTE.idSolicitud = SOLIC.id
		LEFT JOIN files FL_CONTE ON FL_CONTE.idDOCUMENTO = CONTE.idArchivo
		LEFT JOIN cat_estatus ESTATUS ON ESTATUS.id = SOLIC.idStatus
		WHERE SOLIC.tipo = nTipo AND NOT(SOLIC.idStatus = 4 OR SOLIC.idStatus = 7 OR SOLIC.idStatus = 10) AND 
			(CASE 
				WHEN @dptoUsuario > 0 THEN SOLIC.areaAsignar = @dptoUsuario
				ELSE TRUE
			END)
		ORDER BY SOLIC.created_at DESC;
	ELSEIF nTipo = 3 THEN
		SELECT 
			SOLIC.id AS `idSolicitud`,
			cat_doc.nombre AS `solicitud`,
			SOLIC.numOficio,
			SOLIC.remitente,
			SOLIC.cargo,
			SOLIC.asunto,
			DATE_FORMAT(SOLIC.fechaRecibido, "%d/%m/%Y") AS `fechaRecibido`,
			SOLIC.horaRecibido,
			TERMINO.nombre AS `termino`,
			DATE_FORMAT(SOLIC.fechaTermino, "%d/%m/%Y") AS `fechaTermino`,
			DPTO_Asignar.nombre AS `areaAsignar`,
			files.RUTA AS `rutaDoc`,
			FL_CONTE.RUTA AS `rutaContestacion`,
			ESTATUS.nombre AS `estatus`,
			SOLIC.motivoCambio
		FROM cap_solicitud SOLIC
		LEFT JOIN cat_seguimiento DPTO_Asignar ON DPTO_Asignar.idSeguimiento = SOLIC.areaAsignar
		LEFT JOIN cat_terminos TERMINO ON TERMINO.idTermino = SOLIC.termino
		LEFT JOIN cat_doc ON cat_doc.id = SOLIC.tipo
		LEFT JOIN files ON files.idDOCUMENTO = SOLIC.idArchivo
		LEFT JOIN cap_contestacion CONTE ON CONTE.idSolicitud = SOLIC.id
		LEFT JOIN files FL_CONTE ON FL_CONTE.idDOCUMENTO = CONTE.idArchivo
		LEFT JOIN cat_estatus ESTATUS ON ESTATUS.id = SOLIC.idStatus
		WHERE SOLIC.tipo = nTipo AND NOT(SOLIC.idStatus = 4 OR SOLIC.idStatus = 7 OR SOLIC.idStatus = 10) AND 
			(CASE 
				WHEN @dptoUsuario > 0 THEN SOLIC.areaAsignar = @dptoUsuario
				ELSE TRUE
			END) 
		ORDER BY SOLIC.created_at DESC;
	ELSEIF nTipo = 4 THEN
		SELECT 
			SOLIC.id AS `idSolicitud`,
			cat_doc.nombre AS `solicitud`,
			DATE_FORMAT(SOLIC.fechaRecibido, "%d/%m/%Y") AS `fechaRecibido`,
			DPTO_Emite.nombre AS `areaEmite`,
			SOLIC.horaRecibido,
			SOLIC.asunto,
			files.RUTA AS `rutaDoc`,
			ESTATUS.nombre AS `estatus`,
			SOLIC.motivoCambio
		FROM cap_solicitud SOLIC
		LEFT JOIN cat_departamentos DPTO_Emite ON DPTO_Emite.id = SOLIC.areaEmite
		LEFT JOIN cat_doc ON cat_doc.id = SOLIC.tipo
		LEFT JOIN files ON files.idDOCUMENTO = SOLIC.idArchivo
		LEFT JOIN cat_estatus ESTATUS ON ESTATUS.id = SOLIC.idStatus
		WHERE SOLIC.tipo = nTipo AND NOT(SOLIC.idStatus = 4 OR SOLIC.idStatus = 7 OR SOLIC.idStatus = 10) AND 
			(CASE 
				WHEN @dptoUsuario > 0 THEN JSON_CONTAINS(SOLIC.seguimiento, JSON_OBJECT('id', @dptoUsuario))
				ELSE TRUE
			END)
			ORDER BY SOLIC.created_at DESC;
	ELSEIF nTipo = 5 THEN
	-- consulta base para historial
		SELECT 
			SOLIC.id AS `idSolicitud`,
			cat_doc.nombre AS `solicitud`,
			DPTO_Solicita.nombre AS `areaSolicita`,
			DPTO_Asignar.nombre AS `areaAsignar`,
			DPTO_Emite.nombre AS `areaEmite`,
			SOLIC.asunto,
			SOLIC.cargo,
			SOLIC.remitente,
			SOLIC.numOficio, 
			SOLIC.numFolio,
			SOLIC.numMemo,
			CAPITULO.serie AS `capitulo`,
			TERMINO.nombre AS `termino`,
			SOLIC.respuesta,
			DATE_FORMAT(SOLIC.fechaRecibido, "%d/%m/%Y") AS `fechaRecibido`,
			SOLIC.horaRecibido,
			DATE_FORMAT(SOLIC.fechaTermino, "%d/%m/%Y") AS `fechaTermino`,
			files.RUTA AS `rutaDoc`,
			FL_CONTE.RUTA AS `rutaContestacion`,
			ESTATUS.nombre AS `estatus`,
			SOLIC.motivoCambio
		FROM cap_solicitud SOLIC
		LEFT JOIN cat_departamentos DPTO_Solicita ON DPTO_Solicita.id = SOLIC.areaSolicita
		LEFT JOIN cat_seguimiento DPTO_Asignar ON DPTO_Asignar.idSeguimiento = SOLIC.areaAsignar
		LEFT JOIN cat_departamentos DPTO_Emite ON DPTO_Emite.id = SOLIC.areaEmite
		LEFT JOIN cat_capitulos CAPITULO ON CAPITULO.id = SOLIC.capitulo 
		LEFT JOIN cat_terminos TERMINO ON TERMINO.idTermino = SOLIC.termino
		LEFT JOIN cat_doc ON cat_doc.id = SOLIC.tipo
		LEFT JOIN files ON files.idDOCUMENTO = SOLIC.idArchivo
		LEFT JOIN cap_contestacion CONTE ON CONTE.idSolicitud = SOLIC.id
		LEFT JOIN files FL_CONTE ON FL_CONTE.idDOCUMENTO = CONTE.idArchivo
		LEFT JOIN cat_estatus ESTATUS ON ESTATUS.id = SOLIC.idStatus		
		WHERE  
			(CASE 
				WHEN @dptoUsuario > 0 THEN SOLIC.areaAsignar = @dptoUsuario OR JSON_CONTAINS(SOLIC.seguimiento, JSON_OBJECT('id', @dptoUsuario))
				ELSE TRUE
			END)
		ORDER BY SOLIC.created_at DESC;
	ELSEIF nTipo = 6 OR nTipo = 7 OR nTipo = 8 THEN 
	-- Para escrito, tarjeta y correo
		SELECT 
			SOLIC.id AS `idSolicitud`,
			cat_doc.nombre AS `solicitud`,
			DPTO_Solicita.nombre AS `areaSolicita`,
			SOLIC.asunto,
			DATE_FORMAT(SOLIC.fechaRecibido, "%d/%m/%Y") AS `fechaRecibido`,
			SOLIC.horaRecibido,
			TERMINO.nombre AS `termino`,
			DATE_FORMAT(SOLIC.fechaTermino, "%d/%m/%Y") AS `fechaTermino`,
			DPTO_Asignar.nombre AS `areaAsignar`,
			SOLIC.respuesta,
			files.RUTA AS `rutaDoc`,
			FL_CONTE.RUTA AS `rutaContestacion`,
			ESTATUS.nombre AS `estatus`,
			SOLIC.motivoCambio
		FROM cap_solicitud SOLIC
		LEFT JOIN cat_departamentos DPTO_Solicita ON DPTO_Solicita.id = SOLIC.areaSolicita
		LEFT JOIN cat_seguimiento DPTO_Asignar ON DPTO_Asignar.idSeguimiento = SOLIC.areaAsignar
		LEFT JOIN cat_terminos TERMINO ON TERMINO.idTermino = SOLIC.termino
		LEFT JOIN cat_doc ON cat_doc.id = SOLIC.tipo
		LEFT JOIN files ON files.idDOCUMENTO = SOLIC.idArchivo
		LEFT JOIN cap_contestacion CONTE ON CONTE.idSolicitud = SOLIC.id
		LEFT JOIN files FL_CONTE ON FL_CONTE.idDOCUMENTO = CONTE.idArchivo
		LEFT JOIN cat_estatus ESTATUS ON ESTATUS.id = SOLIC.idStatus
		WHERE SOLIC.tipo = (nTipo - 1)AND NOT(SOLIC.idStatus = 4 OR SOLIC.idStatus = 7 OR SOLIC.idStatus = 10) AND 
			(CASE 
				WHEN @dptoUsuario > 0 THEN SOLIC.areaAsignar = @dptoUsuario
				ELSE TRUE
			END)
		ORDER BY SOLIC.created_at DESC;	
	END if;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Solicitud_getAllByUser
DELIMITER //
CREATE PROCEDURE `sp_Solicitud_getAllByUser`(
	IN `nTipo` INT,
	IN `nUser` INT
)
BEGIN
	IF nTipo = 1 then
		SELECT 
			SOLIC.id AS `idSolicitud`,
			cat_doc.nombre AS `solicitud`,
			CAPITULO.serie AS `capitulo`,
			SOLIC.numFolio,
			DATE_FORMAT(SOLIC.fechaRecibido, "%d/%m/%Y") AS `fechaRecibido`,
			SOLIC.horaRecibido,
			DPTO_Solicita.nombre AS `areaSolicita`,
			DPTO_Asignar.nombre AS `areaAsignar`,
			files.RUTA AS `rutaDoc`,
			FL_CONTE.RUTA AS `rutaContestacion`,
			SOLIC.motivoCambio,
			SOLIC.fechaTermino,
			ESTATUS.nombre AS `estatus`
		FROM cap_solicitud SOLIC
		LEFT JOIN cat_departamentos DPTO_Solicita ON DPTO_Solicita.id = SOLIC.areaSolicita
		LEFT JOIN cat_seguimiento DPTO_Asignar ON DPTO_Asignar.idSeguimiento = SOLIC.areaAsignar
		LEFT JOIN cat_capitulos CAPITULO ON CAPITULO.id = SOLIC.capitulo 
		LEFT JOIN cat_doc ON cat_doc.id = SOLIC.tipo
		LEFT JOIN files ON files.idDOCUMENTO = SOLIC.idArchivo
		LEFT JOIN cap_contestacion CONTE ON CONTE.idSolicitud = SOLIC.id
		LEFT JOIN files FL_CONTE ON FL_CONTE.idDOCUMENTO = CONTE.idArchivo
		LEFT JOIN cat_estatus ESTATUS ON ESTATUS.id = SOLIC.idStatus
		WHERE SOLIC.tipo = nTipo AND SOLIC.created_by = nUser AND NOT(SOLIC.idStatus = 4 OR SOLIC.idStatus = 7 OR SOLIC.idStatus = 10)
		ORDER BY SOLIC.created_at DESC;
	ELSEIF nTIpo = 2 THEN
		SELECT 
			SOLIC.id AS `idSolicitud`,
			cat_doc.nombre AS `solicitud`,
			DPTO_Solicita.nombre AS `areaSolicita`,
			SOLIC.numMemo,
			SOLIC.asunto,
			DATE_FORMAT(SOLIC.fechaRecibido, "%d/%m/%Y") AS `fechaRecibido`,
			SOLIC.horaRecibido,
			TERMINO.nombre AS `termino`,
			DATE_FORMAT(SOLIC.fechaTermino, "%d/%m/%Y") AS `fechaTermino`,
			DPTO_Asignar.nombre AS `areaAsignar`,
			SOLIC.respuesta,
			files.RUTA AS `rutaDoc`,
			FL_CONTE.RUTA AS `rutaContestacion`,
			ESTATUS.nombre AS `estatus`,
			SOLIC.motivoCambio
		FROM cap_solicitud SOLIC
		LEFT JOIN cat_departamentos DPTO_Solicita ON DPTO_Solicita.id = SOLIC.areaSolicita
		LEFT JOIN cat_seguimiento DPTO_Asignar ON DPTO_Asignar.idSeguimiento = SOLIC.areaAsignar
		LEFT JOIN cat_terminos TERMINO ON TERMINO.idTermino = SOLIC.termino
		LEFT JOIN cat_doc ON cat_doc.id = SOLIC.tipo
		LEFT JOIN files ON files.idDOCUMENTO = SOLIC.idArchivo
		LEFT JOIN cap_contestacion CONTE ON CONTE.idSolicitud = SOLIC.id
		LEFT JOIN files FL_CONTE ON FL_CONTE.idDOCUMENTO = CONTE.idArchivo
		LEFT JOIN cat_estatus ESTATUS ON ESTATUS.id = SOLIC.idStatus
		WHERE SOLIC.tipo = nTipo AND SOLIC.created_by = nUser AND NOT(SOLIC.idStatus = 4 OR SOLIC.idStatus = 7 OR SOLIC.idStatus = 10)
		ORDER BY SOLIC.created_at DESC;
	ELSEIF nTipo = 3 THEN
		SELECT 
			SOLIC.id AS `idSolicitud`,
			cat_doc.nombre AS `solicitud`,
			SOLIC.numOficio,
			SOLIC.remitente,
			SOLIC.cargo,
			SOLIC.asunto,
			DATE_FORMAT(SOLIC.fechaRecibido, "%d/%m/%Y") AS `fechaRecibido`,
			SOLIC.horaRecibido,
			TERMINO.nombre AS `termino`,
			DATE_FORMAT(SOLIC.fechaTermino, "%d/%m/%Y") AS `fechaTermino`,
			DPTO_Asignar.nombre AS `areaAsignar`,
			files.RUTA AS `rutaDoc`,
			FL_CONTE.RUTA AS `rutaContestacion`,
			ESTATUS.nombre AS `estatus`,
			SOLIC.motivoCambio
		FROM cap_solicitud SOLIC
		LEFT JOIN cat_seguimiento DPTO_Asignar ON DPTO_Asignar.idSeguimiento = SOLIC.areaAsignar
		LEFT JOIN cat_terminos TERMINO ON TERMINO.idTermino = SOLIC.termino
		LEFT JOIN cat_doc ON cat_doc.id = SOLIC.tipo
		LEFT JOIN files ON files.idDOCUMENTO = SOLIC.idArchivo
		LEFT JOIN cap_contestacion CONTE ON CONTE.idSolicitud = SOLIC.id
		LEFT JOIN files FL_CONTE ON FL_CONTE.idDOCUMENTO = CONTE.idArchivo
		LEFT JOIN cat_estatus ESTATUS ON ESTATUS.id = SOLIC.idStatus
		WHERE SOLIC.tipo = nTipo AND SOLIC.created_by = nUser AND NOT(SOLIC.idStatus = 4 OR SOLIC.idStatus = 7 OR SOLIC.idStatus = 10)
		ORDER BY SOLIC.created_at DESC;
	ELSEIF nTipo = 4 THEN
		SELECT 
			SOLIC.id AS `idSolicitud`,
			cat_doc.nombre AS `solicitud`,
			DATE_FORMAT(SOLIC.fechaRecibido, "%d/%m/%Y") AS `fechaRecibido`,
			DPTO_Emite.nombre AS `areaEmite`,
			SOLIC.horaRecibido,
			SOLIC.asunto,
			files.RUTA AS `rutaDoc`,
			ESTATUS.nombre AS `estatus`,
			SOLIC.motivoCambio
		FROM cap_solicitud SOLIC
		LEFT JOIN cat_departamentos DPTO_Emite ON DPTO_Emite.id = SOLIC.areaEmite
		LEFT JOIN cat_doc ON cat_doc.id = SOLIC.tipo
		LEFT JOIN files ON files.idDOCUMENTO = SOLIC.idArchivo
		LEFT JOIN cat_estatus ESTATUS ON ESTATUS.id = SOLIC.idStatus
		WHERE SOLIC.tipo = nTipo AND SOLIC.created_by = nUser AND NOT(SOLIC.idStatus = 4 OR SOLIC.idStatus = 7 OR SOLIC.idStatus = 10)
		ORDER BY SOLIC.created_at DESC;
	ELSEIF nTipo = 5 THEN
	-- consulta base - historial
		SELECT 
			SOLIC.id AS `idSolicitud`,
			cat_doc.nombre AS `solicitud`,
			DPTO_Solicita.nombre AS `areaSolicita`,
			DPTO_Asignar.nombre AS `areaAsignar`,
			DPTO_Emite.nombre AS `areaEmite`,
			SOLIC.asunto,
			SOLIC.cargo,
			SOLIC.remitente,
			SOLIC.numOficio, 
			SOLIC.numFolio,
			SOLIC.numMemo,
			CAPITULO.serie AS `capitulo`,
			TERMINO.nombre AS `termino`,
			SOLIC.respuesta,
			DATE_FORMAT(SOLIC.fechaRecibido, "%d/%m/%Y") AS `fechaRecibido`,
			SOLIC.horaRecibido,
			DATE_FORMAT(SOLIC.fechaTermino, "%d/%m/%Y") AS `fechaTermino`,
			files.RUTA AS `rutaDoc`,
			FL_CONTE.RUTA AS `rutaContestacion`,
			ESTATUS.nombre AS `estatus`,
			SOLIC.motivoCambio
		FROM cap_solicitud SOLIC
		LEFT JOIN cat_departamentos DPTO_Solicita ON DPTO_Solicita.id = SOLIC.areaSolicita
		LEFT JOIN cat_seguimiento DPTO_Asignar ON DPTO_Asignar.idSeguimiento = SOLIC.areaAsignar
		LEFT JOIN cat_departamentos DPTO_Emite ON DPTO_Emite.id = SOLIC.areaEmite
		LEFT JOIN cat_capitulos CAPITULO ON CAPITULO.id = SOLIC.capitulo 
		LEFT JOIN cat_terminos TERMINO ON TERMINO.idTermino = SOLIC.termino
		LEFT JOIN cat_doc ON cat_doc.id = SOLIC.tipo
		LEFT JOIN files ON files.idDOCUMENTO = SOLIC.idArchivo
		LEFT JOIN cap_contestacion CONTE ON CONTE.idSolicitud = SOLIC.id
		LEFT JOIN files FL_CONTE ON FL_CONTE.idDOCUMENTO = CONTE.idArchivo
		LEFT JOIN cat_estatus ESTATUS ON ESTATUS.id = SOLIC.idStatus		
		WHERE SOLIC.created_by = nUser 
		ORDER BY SOLIC.created_at DESC;
	ELSEIF (nTipo = 6 OR nTipo = 7 OR nTipo = 8) THEN
	-- para escrito, tarjeta y correo
		SELECT 
			SOLIC.id AS `idSolicitud`,
			cat_doc.nombre AS `solicitud`,
			DPTO_Solicita.nombre AS `areaSolicita`,
			SOLIC.asunto,
			DATE_FORMAT(SOLIC.fechaRecibido, "%d/%m/%Y") AS `fechaRecibido`,
			SOLIC.horaRecibido,
			TERMINO.nombre AS `termino`,
			DATE_FORMAT(SOLIC.fechaTermino, "%d/%m/%Y") AS `fechaTermino`,
			DPTO_Asignar.nombre AS `areaAsignar`,
			SOLIC.respuesta,
			files.RUTA AS `rutaDoc`,
			FL_CONTE.RUTA AS `rutaContestacion`,
			ESTATUS.nombre AS `estatus`,
			SOLIC.motivoCambio
		FROM cap_solicitud SOLIC
		LEFT JOIN cat_departamentos DPTO_Solicita ON DPTO_Solicita.id = SOLIC.areaSolicita
		LEFT JOIN cat_seguimiento DPTO_Asignar ON DPTO_Asignar.idSeguimiento = SOLIC.areaAsignar
		LEFT JOIN cat_terminos TERMINO ON TERMINO.idTermino = SOLIC.termino
		LEFT JOIN cat_doc ON cat_doc.id = SOLIC.tipo
		LEFT JOIN files ON files.idDOCUMENTO = SOLIC.idArchivo
		LEFT JOIN cap_contestacion CONTE ON CONTE.idSolicitud = SOLIC.id
		LEFT JOIN files FL_CONTE ON FL_CONTE.idDOCUMENTO = CONTE.idArchivo
		LEFT JOIN cat_estatus ESTATUS ON ESTATUS.id = SOLIC.idStatus
		WHERE SOLIC.tipo = (nTipo - 1) AND SOLIC.created_by = nUser AND NOT(SOLIC.idStatus = 4 OR SOLIC.idStatus = 7 OR SOLIC.idStatus = 10)
		ORDER BY SOLIC.created_at DESC;
	END if;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Solicitud_getAnios
DELIMITER //
CREATE PROCEDURE `sp_Solicitud_getAnios`()
BEGIN
	SELECT anio FROM view_cat_anios ORDER BY anio DESC;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Solicitud_getAniosFiscales
DELIMITER //
CREATE PROCEDURE `sp_Solicitud_getAniosFiscales`()
BEGIN
	SELECT anio FROM anios_fiscales ORDER BY anio;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Solicitud_getArchivoById
DELIMITER //
CREATE PROCEDURE `sp_Solicitud_getArchivoById`(
	IN `nIdArchivo` INT
)
BEGIN
	SELECT * FROM files WHERE idDOCUMENTO = nIdArchivo;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Solicitud_getCopiasById
DELIMITER //
CREATE PROCEDURE `sp_Solicitud_getCopiasById`(
	IN `nIdSolicitud` INT
)
BEGIN
	SELECT * FROM cap_copiacon WHERE id_solicitud = nIdSolicitud;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Solicitud_getCopiasCon
DELIMITER //
CREATE PROCEDURE `sp_Solicitud_getCopiasCon`(
	IN `nDPTO` INT
)
BEGIN
	SELECT 
		COPIA.id AS `idCopia`,
		COPIA_SE.nombre AS `dptoCopia`,
		COPIA.enterado,
		SOLIC.id AS `idSolicitud`,
		cat_doc.nombre AS `solicitud`,
		DPTO_Solicita.nombre AS `areaSolicita`,
		DPTO_Asignar.nombre AS `areaAsignar`,
		DPTO_Emite.nombre AS `areaEmite`,
		SOLIC.asunto,
		SOLIC.cargo,
		SOLIC.remitente,
		SOLIC.numOficio, 
		SOLIC.numFolio,
		SOLIC.numMemo,
		CAPITULO.serie AS `capitulo`,
		TERMINO.nombre AS `termino`,
		SOLIC.respuesta,
		DATE_FORMAT(SOLIC.fechaRecibido, "%d/%m/%Y") AS `fechaRecibido`,
		SOLIC.horaRecibido,
		DATE_FORMAT(SOLIC.fechaTermino, "%d/%m/%Y") AS `fechaTermino`,
		files.RUTA AS `rutaDoc`,
		FL_CONTE.RUTA AS `rutaContestacion`,
		ESTATUS.nombre AS `estatus`
	FROM cap_copiacon COPIA
	LEFT JOIN cap_solicitud SOLIC ON SOLIC.id = COPIA.id_solicitud
	LEFT JOIN cat_departamentos DPTO_Solicita ON DPTO_Solicita.id = SOLIC.areaSolicita
	LEFT JOIN cat_seguimiento DPTO_Asignar ON DPTO_Asignar.idSeguimiento = SOLIC.areaAsignar
	LEFT JOIN cat_departamentos DPTO_Emite ON DPTO_Emite.id = SOLIC.areaEmite
	LEFT JOIN cat_capitulos CAPITULO ON CAPITULO.id = SOLIC.capitulo 
	LEFT JOIN cat_terminos TERMINO ON TERMINO.idTermino = SOLIC.termino
	LEFT JOIN cat_doc ON cat_doc.id = SOLIC.tipo
	LEFT JOIN files ON files.idDOCUMENTO = SOLIC.idArchivo
	LEFT JOIN cap_contestacion CONTE ON CONTE.idSolicitud = SOLIC.id
	LEFT JOIN files FL_CONTE ON FL_CONTE.idDOCUMENTO = CONTE.idArchivo
	LEFT JOIN cat_estatus ESTATUS ON ESTATUS.id = SOLIC.idStatus
	LEFT JOIN cat_seguimiento COPIA_SE ON COPIA_SE.idSeguimiento = COPIA.id_departamento
	WHERE (CASE 
				WHEN nDPTO > 0 THEN COPIA.id_departamento = nDPTO
				ELSE TRUE
			END)
	ORDER BY SOLIC.created_at DESC;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Solicitud_getDatosById
DELIMITER //
CREATE PROCEDURE `sp_Solicitud_getDatosById`(
	IN `nIdSolicitud` INT
)
BEGIN
	SELECT * FROM cap_solicitud WHERE id = nIdSolicitud;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Solicitud_getHistorial
DELIMITER //
CREATE PROCEDURE `sp_Solicitud_getHistorial`(
	IN `nUsuario` INT,
	IN `nRol` INT,
	IN `nDPTO` INT,
	IN `fInicio` DATE,
	IN `fFin` DATE
)
BEGIN
	IF nRol != 4 THEN -- 
		SELECT 
			SOLIC.id AS `idSolicitud`,
			cat_doc.nombre AS `solicitud`,
			DPTO_Solicita.nombre AS `areaSolicita`,
			DPTO_Asignar.nombre AS `areaAsignar`,
			DPTO_Emite.nombre AS `areaEmite`,
			SOLIC.asunto,
			SOLIC.cargo,
			SOLIC.remitente,
			SOLIC.numOficio, 
			SOLIC.numFolio,
			SOLIC.numMemo,
			CAPITULO.serie AS `capitulo`,
			TERMINO.nombre AS `termino`,
			SOLIC.respuesta,
			DATE_FORMAT(SOLIC.fechaRecibido, "%d/%m/%Y") AS `fechaRecibido`,
			SOLIC.horaRecibido,
			DATE_FORMAT(SOLIC.fechaTermino, "%d/%m/%Y") AS `fechaTermino`,
			files.RUTA AS `rutaDoc`,
			FL_CONTE.RUTA AS `rutaContestacion`,
			ESTATUS.nombre AS `estatus`,
			SOLIC.motivoCambio
		FROM cap_solicitud SOLIC
		LEFT JOIN cat_departamentos DPTO_Solicita ON DPTO_Solicita.id = SOLIC.areaSolicita
		LEFT JOIN cat_seguimiento DPTO_Asignar ON DPTO_Asignar.idSeguimiento = SOLIC.areaAsignar
		LEFT JOIN cat_departamentos DPTO_Emite ON DPTO_Emite.id = SOLIC.areaEmite
		LEFT JOIN cat_capitulos CAPITULO ON CAPITULO.id = SOLIC.capitulo 
		LEFT JOIN cat_terminos TERMINO ON TERMINO.idTermino = SOLIC.termino
		LEFT JOIN cat_doc ON cat_doc.id = SOLIC.tipo
		LEFT JOIN files ON files.idDOCUMENTO = SOLIC.idArchivo
		LEFT JOIN cap_contestacion CONTE ON CONTE.idSolicitud = SOLIC.id
		LEFT JOIN files FL_CONTE ON FL_CONTE.idDOCUMENTO = CONTE.idArchivo
		LEFT JOIN cat_estatus ESTATUS ON ESTATUS.id = SOLIC.idStatus		
		WHERE SOLIC.fechaRecibido >= fInicio AND SOLIC.fechaRecibido <= fFin AND 
			(CASE 
				WHEN nDPTO > 0 THEN SOLIC.areaAsignar = nDPTO OR JSON_CONTAINS(SOLIC.seguimiento, JSON_OBJECT('id', nDPTO))
				ELSE TRUE
			END)
		ORDER BY SOLIC.created_at DESC;	
	ELSE 
		SELECT 
			SOLIC.id AS `idSolicitud`,
			cat_doc.nombre AS `solicitud`,
			DPTO_Solicita.nombre AS `areaSolicita`,
			DPTO_Asignar.nombre AS `areaAsignar`,
			DPTO_Emite.nombre AS `areaEmite`,
			SOLIC.asunto,
			SOLIC.cargo,
			SOLIC.remitente,
			SOLIC.numOficio, 
			SOLIC.numFolio,
			SOLIC.numMemo,
			CAPITULO.serie AS `capitulo`,
			TERMINO.nombre AS `termino`,
			SOLIC.respuesta,
			DATE_FORMAT(SOLIC.fechaRecibido, "%d/%m/%Y") AS `fechaRecibido`,
			SOLIC.horaRecibido,
			DATE_FORMAT(SOLIC.fechaTermino, "%d/%m/%Y") AS `fechaTermino`,
			files.RUTA AS `rutaDoc`,
			FL_CONTE.RUTA AS `rutaContestacion`,
			ESTATUS.nombre AS `estatus`
		FROM cap_solicitud SOLIC
		LEFT JOIN cat_departamentos DPTO_Solicita ON DPTO_Solicita.id = SOLIC.areaSolicita
		LEFT JOIN cat_seguimiento DPTO_Asignar ON DPTO_Asignar.idSeguimiento = SOLIC.areaAsignar
		LEFT JOIN cat_departamentos DPTO_Emite ON DPTO_Emite.id = SOLIC.areaEmite
		LEFT JOIN cat_capitulos CAPITULO ON CAPITULO.id = SOLIC.capitulo 
		LEFT JOIN cat_terminos TERMINO ON TERMINO.idTermino = SOLIC.termino
		LEFT JOIN cat_doc ON cat_doc.id = SOLIC.tipo
		LEFT JOIN files ON files.idDOCUMENTO = SOLIC.idArchivo
		LEFT JOIN cap_contestacion CONTE ON CONTE.idSolicitud = SOLIC.id
		LEFT JOIN files FL_CONTE ON FL_CONTE.idDOCUMENTO = CONTE.idArchivo
		LEFT JOIN cat_estatus ESTATUS ON ESTATUS.id = SOLIC.idStatus
		WHERE SOLIC.fechaRecibido >= fInicio AND SOLIC.fechaRecibido <= fFIN AND SOLIC.created_by = nUsuario
		ORDER BY SOLIC.created_at DESC;
	END IF;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Solicitud_getSeguimiento
DELIMITER //
CREATE PROCEDURE `sp_Solicitud_getSeguimiento`(
	IN `nDPTO` INT,
	IN `fAhora` TIMESTAMP
)
BEGIN
	SELECT 
		SOLIC.id AS `idSolicitud`,
		SOLIC.areaAsignar AS `dptoAsignar`,
		cat_doc.nombre AS `solicitud`,
		DPTO_Solicita.nombre AS `areaSolicita`,
		DPTO_Asignar.nombre AS `areaAsignar`,
		DPTO_Emite.nombre AS `areaEmite`,
		SOLIC.asunto,
		SOLIC.cargo,
		SOLIC.remitente,
		SOLIC.numOficio, 
		SOLIC.numFolio,
		SOLIC.numMemo,
		CAPITULO.serie AS `capitulo`,
		TERMINO.nombre AS `termino`,
		SOLIC.respuesta,
		DATE_FORMAT(SOLIC.fechaRecibido, "%d/%m/%Y") AS `fechaRecibido`,
		SOLIC.horaRecibido,
		DATE_FORMAT(SOLIC.fechaTermino, "%d/%m/%Y") AS `fechaTermino`,
		files.RUTA AS `rutaDoc`,
		FL_CONTE.RUTA AS `rutaContestacion`,
		ESTATUS.nombre AS `estatus`,
		TIMESTAMPDIFF(HOUR, SOLIC.recordatorio, fAhora) AS `horasRecordatorio`,
		TIMESTAMPDIFF(MINUTE, SOLIC.sysNotify, fAhora) AS `minSysNotify`,
		IFNULL(DPTO_Asignar.correo, 'ricardo.cordero@ieepuebla.org.mx') AS `correoNotificar`,
		SOLIC.motivoCambio
	FROM cap_solicitud SOLIC
	LEFT JOIN cat_departamentos DPTO_Solicita ON DPTO_Solicita.id = SOLIC.areaSolicita
	LEFT JOIN cat_seguimiento DPTO_Asignar ON DPTO_Asignar.idSeguimiento = SOLIC.areaAsignar
	LEFT JOIN cat_departamentos DPTO_Emite ON DPTO_Emite.id = SOLIC.areaEmite
	LEFT JOIN cat_capitulos CAPITULO ON CAPITULO.id = SOLIC.capitulo 
	LEFT JOIN cat_terminos TERMINO ON TERMINO.idTermino = SOLIC.termino
	LEFT JOIN cat_doc ON cat_doc.id = SOLIC.tipo
	LEFT JOIN files ON files.idDOCUMENTO = SOLIC.idArchivo
	LEFT JOIN cap_contestacion CONTE ON CONTE.idSolicitud = SOLIC.id
	LEFT JOIN files FL_CONTE ON FL_CONTE.idDOCUMENTO = CONTE.idArchivo
	LEFT JOIN cat_estatus ESTATUS ON ESTATUS.id = SOLIC.idStatus
	WHERE SOLIC.idStatus != 4 AND 
		(CASE 
			WHEN nDPTO > 0 THEN JSON_CONTAINS(SOLIC.seguimiento, JSON_OBJECT('id', nDPTO))
			ELSE TRUE
		END)
	ORDER BY SOLIC.created_at DESC;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Solicitud_setEnteradoCopia
DELIMITER //
CREATE PROCEDURE `sp_Solicitud_setEnteradoCopia`(
	IN `nIdCopia` INT,
	IN `nIdSolicitud` INT
)
BEGIN
	SET @valEnterado := (SELECT TEMP_CC.enterado FROM cap_copiacon TEMP_CC WHERE TEMP_CC.id = nIdCopia AND TEMP_CC.id_solicitud = nIdSolicitud);

	UPDATE cap_copiacon SET
		cap_copiacon.enterado = (
			CASE
				WHEN @valEnterado = 'N' THEN 'S'
				ELSE 'N'
			END
		),
		cap_copiacon.updated_at = NOW()
	WHERE cap_copiacon.id = nIdCopia AND cap_copiacon.id_solicitud = nIdSolicitud;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Solicitud_setGuardaContestacion
DELIMITER //
CREATE PROCEDURE `sp_Solicitud_setGuardaContestacion`(
	IN `nIdSolicitud` INT,
	IN `nIdArchivo` INT,
	IN `nIdAuth` INT,
	IN `fAccion` TIMESTAMP
)
BEGIN
	INSERT INTO cap_contestacion (idSolicitud, idArchivo, created_at, created_by)
	VALUES (nIdSolicitud, nIdArchivo, fAccion, nIdAuth);
END//
DELIMITER ;


-- Volcando estructura para procedimiento admin.sp_Solicitud_setRegistrarCopiaCon
DELIMITER //
CREATE PROCEDURE `sp_Solicitud_setRegistrarCopiaCon`(
	IN `nIdSolicitud` INT,
	IN `nIdDPTO` INT,
	IN `fAccion` TIMESTAMP
)
BEGIN
	INSERT INTO cap_copiacon (id_solicitud,id_departamento, created_at)
	VALUES (nIdSolicitud, nIdDPTO, fAccion);
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Solicitud_setRegistrarExtra
DELIMITER //
CREATE PROCEDURE `sp_Solicitud_setRegistrarExtra`(
	IN `nTipo` INT,
	IN `nAreaSolicita` INT,
	IN `cAsunto` VARCHAR(55),
	IN `fRecibido` DATE,
	IN `hRecibido` TIME,
	IN `nTermino` INT,
	IN `fTermino` DATE,
	IN `nAsignacion` INT,
	IN `nRespuesta` INT,
	IN `nIdArchivo` INT,
	IN `jsonSeguimiento` JSON,
	IN `nIdAuth` INT,
	IN `fAccion` TIMESTAMP
)
BEGIN
	INSERT INTO cap_solicitud (
		tipo,
		areaSolicita,
		asunto,
		fechaRecibido,
		horaRecibido,
		termino,
		fechaTermino,
		areaAsignar,
		respuesta,
		idArchivo,
		seguimiento,
		created_by,
		created_at
	)
	VALUES (
		nTipo,
		nAreaSolicita,
		cAsunto,
		fRecibido,
		hRecibido,
		nTermino,
		fTermino,
		nAsignacion,
		nRespuesta,
		nIdArchivo,
		jsonSeguimiento,
		nIdAuth,
		fAccion
	);
	
	SELECT LAST_INSERT_ID() AS `idSOLICITUD`;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Solicitud_setRegistrarMemo
DELIMITER //
CREATE PROCEDURE `sp_Solicitud_setRegistrarMemo`(
	IN `nTipo` INT,
	IN `nAreaSolicita` INT,
	IN `nMemo` VARCHAR(55),
	IN `cAsunto` VARCHAR(55),
	IN `fRecibido` DATE,
	IN `hRecibido` TIME,
	IN `nTermino` INT,
	IN `fTermino` DATE,
	IN `nAsignacion` INT,
	IN `nRespuesta` INT,
	IN `nIdArchivo` INT,
	IN `jsonSeguimiento` JSON,
	IN `nIdAuth` INT,
	IN `fAccion` TIMESTAMP
)
BEGIN
	INSERT INTO cap_solicitud (
		tipo,
		areaSolicita,
		numMemo,
		asunto,
		fechaRecibido,
		horaRecibido,
		termino,
		fechaTermino,
		areaAsignar,
		respuesta,
		idArchivo,
		seguimiento,
		created_by,
		created_at
	)
	VALUES (
		nTipo,
		nAreaSolicita,
		nMemo,
		cAsunto,
		fRecibido,
		hRecibido,
		nTermino,
		fTermino,
		nAsignacion,
		nRespuesta,
		nIdArchivo,
		jsonSeguimiento,
		nIdAuth,
		fAccion
	);
	
	SELECT LAST_INSERT_ID() AS `idSOLICITUD`;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Solicitud_setRegistrarOficio
DELIMITER //
CREATE PROCEDURE `sp_Solicitud_setRegistrarOficio`(
	IN `nTipo` INT,
	IN `nOficio` VARCHAR(55),
	IN `cRemitente` VARCHAR(55),
	IN `cCargo` VARCHAR(55),
	IN `cAsunto` VARCHAR(55),
	IN `nTermino` INT,
	IN `fTermino` DATE,
	IN `nAsignacion` INT,
	IN `fRecibido` DATE,
	IN `hRecibido` TIME,
	IN `nIdArchivo` INT,
	IN `jsonSeguimiento` JSON,
	IN `nIdAuth` INT,
	IN `fAccion` TIMESTAMP
)
BEGIN
	INSERT INTO cap_solicitud (
		tipo,
		numOficio, 
		remitente,
		cargo,
		asunto,
		termino,
		fechaTermino,
		areaAsignar,
		fechaRecibido,
		horaRecibido,
		idArchivo,
		seguimiento,
		created_by,
		created_at
	) 
	VALUES (
		nTipo,
		nOficio,
		cRemitente,
		cCargo,
		cAsunto,
		nTermino,
		fTermino,
		nAsignacion,
		fRecibido,
		hRecibido,
		nIdArchivo,
		jsonSeguimiento,
		nIdAuth,
		fAccion
	);
	
	SELECT LAST_INSERT_ID() AS `idSOLICITUD`;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Solicitud_setRegistrarRequi
DELIMITER //
CREATE PROCEDURE `sp_Solicitud_setRegistrarRequi`(
	IN `nTipo` INT,
	IN `nCapitulo` INT,
	IN `nFolio` VARCHAR(55),
	IN `fRecibido` DATE,
	IN `hRecibido` TIME,
	IN `nAreaSolicita` INT,
	IN `nAsignacion` INT,
	IN `nIdArchivo` INT,
	IN `jsonSeguimiento` JSON,
	IN `fAccion` TIMESTAMP,
	IN `nIdAuth` INT
)
BEGIN
	INSERT INTO cap_solicitud (
		tipo, 
		capitulo, 
		numFolio, 
		fechaRecibido, 
		horaRecibido, 
		fechaTermino,
		areaSolicita, 
		areaAsignar, 
		idArchivo, 
		seguimiento, 
		created_at, 
		created_by
	)
	VALUES (
		nTipo,
		nCapitulo,
		nFolio,
		fRecibido,
		hRecibido,
		CAST(DATE_ADD(fRecibido, INTERVAL 5 DAY) AS DATE),
		nAreaSolicita,
		nAsignacion,
		nIdArchivo,
		jsonSeguimiento,
		fAccion,
		nIdAuth
	);
	
	SELECT LAST_INSERT_ID() AS `idSOLICITUD`;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Solicitud_setUpdateCaptura
DELIMITER //
CREATE PROCEDURE `sp_Solicitud_setUpdateCaptura`(
	IN `nIdSolicitud` INT,
	IN `nTipo` INT,
	IN `nIdArchivo` INT,
	IN `nAreaSolicita` INT,
	IN `nAreaEmite` INT,
	IN `nAreaAsignar` INT,
	IN `cOficio` VARCHAR(55),
	IN `cAsunto` VARCHAR(55),
	IN `cCargo` VARCHAR(255),
	IN `cRemitente` VARCHAR(255),
	IN `cFolio` VARCHAR(55),
	IN `cMemo` VARCHAR(55),
	IN `nCapitulo` INT,
	IN `nTermino` INT,
	IN `nRespuesta` INT,
	IN `fFechaRecibido` DATE,
	IN `hHoraRecibido` TIME,
	IN `fFechaTermino` DATE,
	IN `jSeguimiento` JSON,
	IN `fAccion` TIMESTAMP,
	IN `nIdAuth` INT,
	IN `cMotivo` LONGTEXT
)
BEGIN
	UPDATE cap_solicitud SOL SET
		SOL.idArchivo = nIdArchivo,
		SOL.areaSolicita = nAreaSolicita,
		SOL.areaEmite = nAreaEmite,
		SOL.areaAsignar = nAreaAsignar,
		SOL.numOficio = cOficio,
		SOL.asunto = cAsunto,
		SOL.cargo = cCargo,
		SOL.remitente = cRemitente,
		SOL.numFolio = cFolio,
		SOL.numMemo = cMemo,
		SOL.capitulo = nCapitulo,
		SOL.termino = nTermino,
		SOL.respuesta = nRespuesta,
		SOL.fechaRecibido = fFechaRecibido,
		SOL.horaRecibido = hHoraRecibido,
		SOL.fechaTermino = fFechaTermino,
		SOL.seguimiento = jSeguimiento,
		SOL.updated_at = fAccion,
		SOL.updated_by = nIdAuth,
		SOL.motivoCambio = cMotivo
	WHERE SOL.id = nIdSolicitud AND SOL.tipo = nTipo;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Solicitud_setUpdateEstatus
DELIMITER //
CREATE PROCEDURE `sp_Solicitud_setUpdateEstatus`(
	IN `nIdSolicitud` INT,
	IN `nIdEstatus` INT,
	IN `nIdAuth` INT,
	IN `fAccion` TIMESTAMP,
	IN `cMotivo` LONGTEXT
)
BEGIN
	SET @motivoDefault := IFNULL(cMotivo, 'Actualización de estatus de solicitud');
	UPDATE cap_solicitud SOLIC SET 
		SOLIC.idStatus = nIdEstatus,
		SOLIC.updated_by = nIdAuth,
		SOLIC.updated_at = fAccion,
		SOLIC.motivoCambio = @motivoDefault
	WHERE SOLIC.id = nIdSolicitud;
END//
DELIMITER ;

-- Volcando estructura para procedimiento admin.sp_Solicitud_setUpdateRecordatorio
DELIMITER //
CREATE PROCEDURE `sp_Solicitud_setUpdateRecordatorio`(
	IN `nSolicitud` INT,
	IN `fAccion` TIMESTAMP
)
BEGIN
	UPDATE cap_solicitud SET
		recordatorio = fAccion
	WHERE id = nSolicitud;
END//
DELIMITER ;

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

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;


-- EMPIEZAN LOS NUEVOS QUERYS -> CREACION DE TABLAS


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


-- FIN DE CREACION DE TABLAS

-- INICIO DE CREACION DE STORE PROCEDURES

DROP PROCEDURE IF EXISTS `sp_ConsultarDatos`;
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
        psr.D_monto_2_por_ciento
		FROM calculo_partido_sin_repr psr 
        INNER JOIN cat_partido_sin_repr cat_psr ON psr.id_partido = cat_psr.id 
        WHERE psr.id_calculo = p_id_calculo;
	-- Retornamos los partidos con representación
	SELECT cat_pcr.siglas, cat_pcr.nombre, cat_pcr.logo,
		-- Se agregar los campos del apartado de distribución y de Partido con representación
		pcr.id_calculo, pcr.id_partido, pcr.porcentaje_votacion, pcr.ajuste,
        pcr.A_30_por_ciento, pcr.B_70_por_ciento, pcr.B_Ajuste_70_por_ciento, pcr.C_fpaop, D_fpatov
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

DROP PROCEDURE IF EXISTS sp_Distr_Get_Insert_Update_distribucion_dppp;
DELIMITER //
/*
* @name Obtener los datos del apartado de Distribución
* @description Retorna los datos de distribución, es decir los campos llenados y las sumas de totales realizados
* 	que esten ligados a un id_calculo, tanto para llenar los campos previamente llenados como para los reportes
* @param p_use_transaction -- true: CALL desde Mysql, false: CALL desde Laravel
* @param p_comando -- 'UPDATE': Update, 'GET': Select, 'INSERT': Insert
* @param p_id_dist
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
			SELECT LAST_INSERT_ID() AS id; -- Solo funciona con columnas AUTO_INCREMENT.
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
-- FIN DE STORE PROCEDURES
