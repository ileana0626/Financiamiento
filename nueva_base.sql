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

-- Volcando estructura para tabla admin.equipo
CREATE TABLE IF NOT EXISTS `equipo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estado` int DEFAULT '0',
  `tipo` int DEFAULT NULL,
  `marca` int DEFAULT NULL,
  `modelo` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `serie` tinytext,
  `inventario` varchar(17) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `costo` double DEFAULT NULL,
  `caracteristicas` text,
  `observaciones` text,
  `bienes` varchar(10) DEFAULT NULL,
  `created_at` int NOT NULL,
  `updated_at` int DEFAULT NULL,
  `created_by` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_estadoequipo` (`estado`),
  KEY `FK_marcaequipo` (`marca`),
  KEY `FK_modeloequipo` (`modelo`),
  KEY `FK_tipoequipo` (`tipo`),
  KEY `FK_yearsequipo` (`year`),
  CONSTRAINT `FK_estadoequipo` FOREIGN KEY (`estado`) REFERENCES `cat_estadoequipo` (`id`),
  CONSTRAINT `FK_marcaequipo` FOREIGN KEY (`marca`) REFERENCES `cat_marca` (`id`),
  CONSTRAINT `FK_modeloequipo` FOREIGN KEY (`modelo`) REFERENCES `cat_modelo` (`id`),
  CONSTRAINT `FK_tipoequipo` FOREIGN KEY (`tipo`) REFERENCES `cat_tipoequipo` (`id`),
  CONSTRAINT `FK_yearsequipo` FOREIGN KEY (`year`) REFERENCES `cat_years` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla admin.equipo: ~0 rows (aproximadamente)
/*DELETE FROM `equipo`;*/

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

-- Volcando datos para la tabla admin.files: ~2,865 rows (aproximadamente)
/*DELETE FROM `files`;*/
INSERT INTO `files` (`idDOCUMENTO`, `RUTA`, `FILENAME`, `TIPO`, `CREADO_AT`, `ACTUALIZADO_AT`) VALUES
	(1, 'storage/documentos/circular/prAKdLxYNs_SECRETARÍA circular-010-2025 Horario de labores para el PELE 2025 a todo el personal.pdf', 'prAKdLxYNs_SECRETARÍA circular-010-2025 Horario de labores para el PELE 2025 a todo el personal.pdf', 4, '2025-01-08 16:42:25', '2025-01-08 16:42:25'),
	(2, 'storage/documentos/escrito/CPZcHdPciL_CORREO sivople ACTIVIDAD sivople pue-2025-011-00002 información para actas de cierre Emir-Saúl-Eder.pdf', 'CPZcHdPciL_CORREO sivople ACTIVIDAD sivople pue-2025-011-00002 información para actas de cierre Emir-Saúl-Eder.pdf', 5, '2025-01-08 20:53:45', '2025-01-08 20:53:45'),
	(3, 'storage/documentos/circular/UcDcMUwLDI_TRANSPARENCIA circular-001-2025 se solicita agenda de actividades  Yaz.pdf', 'UcDcMUwLDI_TRANSPARENCIA circular-001-2025 se solicita agenda de actividades  Yaz.pdf', 4, '2025-01-08 20:57:59', '2025-01-08 20:57:59'),
	(4, 'storage/documentos/memorandum/4KafI1DWDf_JURÍDICO memo-0018-2025 se soicita información  a más tardar viernes 10 de enero.pdf', '4KafI1DWDf_JURÍDICO memo-0018-2025 se soicita información  a más tardar viernes 10 de enero.pdf', 2, '2025-01-08 21:01:04', '2025-01-08 21:01:04'),
	(5, 'storage/documentos/circular/TxJz2Wl4nt_DTS circular-002-2025 temas a someter a junta ejecutiva Huoston.pdf', 'TxJz2Wl4nt_DTS circular-002-2025 temas a someter a junta ejecutiva Huoston.pdf', 4, '2025-01-08 21:04:06', '2025-01-08 21:04:06'),
	(6, 'storage/documentos/memorandum/rmQEOiHeWH_JURÍDICO memo-0017-2025 se solicita información a más tardar el 10 de enero a las tardar a las 13 horas Huoston-Yaz.pdf', 'rmQEOiHeWH_JURÍDICO memo-0017-2025 se solicita información a más tardar el 10 de enero a las tardar a las 13 horas Huoston-Yaz.pdf', 2, '2025-01-08 21:06:37', '2025-01-08 21:06:37'),
	(7, 'storage/documentos/memorandum/srOBgqKqGi_JURÍDICO memo-021-2025 se solicita información a más tardar el 10 de enero a las 13 horas Huoston-Yaz.pdf', 'srOBgqKqGi_JURÍDICO memo-021-2025 se solicita información a más tardar el 10 de enero a las 13 horas Huoston-Yaz.pdf', 2, '2025-01-08 21:08:35', '2025-01-08 21:08:35'),
	(8, 'storage/documentos/memorandum/eUdCzFIu3T_JURÍDICO memo-019-2025 se solicita inf a más tardar 10 de enero del año en curso Huoston-Yaz.pdf', 'eUdCzFIu3T_JURÍDICO memo-019-2025 se solicita inf a más tardar 10 de enero del año en curso Huoston-Yaz.pdf', 2, '2025-01-08 21:11:33', '2025-01-08 21:11:33'),
	(9, 'storage/documentos/memorandum/YfGZvtoyZf_COMUNICACIÓN memo-010-2025 boletín 01 Archivo.pdf', 'YfGZvtoyZf_COMUNICACIÓN memo-010-2025 boletín 01 Archivo.pdf', 2, '2025-01-08 21:22:43', '2025-01-08 21:22:43'),
	(10, 'storage/documentos/memorandum/yLJnf1lRRV_PRERROGATIVAS memo-0018-2025 distribución de financiamiento publico a más tardar el 20 de enero del presente Emir-Saúl.pdf', 'yLJnf1lRRV_PRERROGATIVAS memo-0018-2025 distribución de financiamiento publico a más tardar el 20 de enero del presente Emir-Saúl.pdf', 2, '2025-01-08 21:27:11', '2025-01-08 21:27:11'),
	(11, 'storage/documentos/memorandum/B1Eso3HgBo_Informe de Simulacro 1.pdf', 'B1Eso3HgBo_Informe de Simulacro 1.pdf', 2, '2025-01-09 15:15:05', '2025-01-09 15:15:05'),
	(15, 'storage/documentos/contestacion/solicitud/11/B1Eso3HgBo_Informe de Simulacro 1.pdf', 'B1Eso3HgBo_Informe de Simulacro 1.pdf', 5, '2025-01-09 15:42:50', '2025-01-09 15:42:50'),
	(16, 'storage/documentos/contestacion/solicitud/11/B1Eso3HgBo_Informe de Simulacro 1.pdf', 'B1Eso3HgBo_Informe de Simulacro 1.pdf', 5, '2025-01-09 15:43:08', '2025-01-09 15:43:08'),
	(17, 'storage/documentos/contestacion/solicitud/11/B1Eso3HgBo_Informe de Simulacro 1.pdf', 'B1Eso3HgBo_Informe de Simulacro 1.pdf', 5, '2025-01-09 16:00:17', '2025-01-09 16:00:17'),
	(18, 'storage/documentos/contestacion/solicitud/11/B1Eso3HgBo_Informe de Simulacro 1.pdf', 'B1Eso3HgBo_Informe de Simulacro 1.pdf', 5, '2025-01-09 16:28:01', '2025-01-09 16:28:01'),
	(19, 'storage/documentos/contestacion/solicitud/11/B1Eso3HgBo_Informe de Simulacro 1.pdf', 'B1Eso3HgBo_Informe de Simulacro 1.pdf', 5, '2025-01-09 16:36:06', '2025-01-09 16:36:06'),
	(20, 'storage/documentos/contestacion/solicitud/11/B1Eso3HgBo_Informe de Simulacro 1.pdf', 'B1Eso3HgBo_Informe de Simulacro 1.pdf', 5, '2025-01-09 16:39:38', '2025-01-09 16:39:38'),
	(21, 'storage/documentos/memorandum/kUaeOdbfYH_UFD memo- 017-2025 se remite información Cuarto.pdf', 'kUaeOdbfYH_UFD memo- 017-2025 se remite información Cuarto.pdf', 2, '2025-01-10 14:01:05', '2025-01-10 14:01:05'),
	(22, 'storage/documentos/memorandum/H8J0NErhoe_SECRETARÍA circular-0008-2025 se remite acuerdo cg-ac-0008-2025 Huoston.pdf', 'H8J0NErhoe_SECRETARÍA circular-0008-2025 se remite acuerdo cg-ac-0008-2025 Huoston.pdf', 2, '2025-01-10 14:06:20', '2025-01-10 14:06:20'),
	(23, 'storage/documentos/circular/MEmfZ6lf5s_SECRETARÍA circular-0007-2025 remite acuerdo cg-ac-0006-2025 Huoston.pdf', 'MEmfZ6lf5s_SECRETARÍA circular-0007-2025 remite acuerdo cg-ac-0006-2025 Huoston.pdf', 4, '2025-01-10 14:09:01', '2025-01-10 14:09:01'),
	(24, 'storage/documentos/circular/vCMYjYaEVA_SECRETARÍA circular-0006-2025 remite acuerdo cg-ac-0004-2025 Huoston.pdf', 'vCMYjYaEVA_SECRETARÍA circular-0006-2025 remite acuerdo cg-ac-0004-2025 Huoston.pdf', 4, '2025-01-10 14:10:24', '2025-01-10 14:10:24'),
	(25, 'storage/documentos/circular/pRdlod5sBK_SECRETARÍA circular-0005-2025 remite acuerdo cg-ac-0003-2025 Huoston.pdf', 'pRdlod5sBK_SECRETARÍA circular-0005-2025 remite acuerdo cg-ac-0003-2025 Huoston.pdf', 4, '2025-01-10 14:12:52', '2025-01-10 14:12:52'),
	(26, 'storage/documentos/circular/B9eQG2Cvuv_SECRETARÍA circular-0004-2025 remite acuerdo cg-ac-0002-2025 Huoston.pdf', 'B9eQG2Cvuv_SECRETARÍA circular-0004-2025 remite acuerdo cg-ac-0002-2025 Huoston.pdf', 4, '2025-01-10 14:16:10', '2025-01-10 14:16:10'),
	(27, 'storage/documentos/oficio/DpDllGtEAW_PRERROGATIVAS oficio-0003-2025 seguimiento a similar iee-dppp-0665-2024 Saúl.pdf', 'DpDllGtEAW_PRERROGATIVAS oficio-0003-2025 seguimiento a similar iee-dppp-0665-2024 Saúl.pdf', 3, '2025-01-10 14:27:31', '2025-01-10 14:27:31'),
	(28, 'storage/documentos/memorandum/YNVrZyRRC4_TRANSPARENCIA memo-029-2025 se da respuesta a circular iee-se-011-2025 Cuarto.pdf', 'YNVrZyRRC4_TRANSPARENCIA memo-029-2025 se da respuesta a circular iee-se-011-2025 Cuarto.pdf', 2, '2025-01-10 14:32:14', '2025-01-10 14:32:14'),
	(29, 'storage/documentos/memorandum/QLvNoGEY1O_DTS memo-0039-2025 se informa personal comisionado Cuarto.pdf', 'QLvNoGEY1O_DTS memo-0039-2025 se informa personal comisionado Cuarto.pdf', 2, '2025-01-11 14:22:27', '2025-01-11 14:22:27'),
	(30, 'storage/documentos/memorandum/CZt1ur0HAQ_UFD memo-018-2025 se informa encargadurías de despacho Cuarto.pdf', 'CZt1ur0HAQ_UFD memo-018-2025 se informa encargadurías de despacho Cuarto.pdf', 2, '2025-01-11 14:25:55', '2025-01-11 14:25:55'),
	(31, 'storage/documentos/memorandum/fDnqj1dnTi_JURÍDICO memo-0064-2025 se solicita información Huoston.pdf', 'fDnqj1dnTi_JURÍDICO memo-0064-2025 se solicita información Huoston.pdf', 2, '2025-01-11 14:33:05', '2025-01-11 14:33:05'),
	(32, 'storage/documentos/memorandum/RjAZlA8PiZ_CONTRALORÍA memo-016-2025 acta final de auditoría remite actas rubircadas Miroslava.pdf', 'RjAZlA8PiZ_CONTRALORÍA memo-016-2025 acta final de auditoría remite actas rubircadas Miroslava.pdf', 2, '2025-01-11 15:02:35', '2025-01-11 15:02:35'),
	(33, 'storage/documentos/memorandum/wmQjbMu4q4_DTS memo-0045-2025 se informa sobre personal  Cuarto.pdf', 'wmQjbMu4q4_DTS memo-0045-2025 se informa sobre personal  Cuarto.pdf', 2, '2025-01-11 15:14:48', '2025-01-11 15:14:48'),
	(34, 'storage/documentos/circular/NClTu7Fdam_ARCHIVOS circular-001-25 invitación al curso en materia archivística jefes deptos.pdf', 'NClTu7Fdam_ARCHIVOS circular-001-25 invitación al curso en materia archivística jefes deptos.pdf', 4, '2025-01-11 15:16:50', '2025-01-11 15:16:50'),
	(35, 'storage/documentos/memorandum/Hw8YLUgWO5_IGUALDAD memo-003-2025 se informa terminación de contrato Cuarto.pdf', 'Hw8YLUgWO5_IGUALDAD memo-003-2025 se informa terminación de contrato Cuarto.pdf', 2, '2025-01-11 15:20:46', '2025-01-11 15:20:46'),
	(36, 'storage/documentos/memorandum/xdeHv8F3aQ_CONTRALORÍA memo-14-2025 atención a circular iee-se-011-2025 Cuarto.pdf', 'xdeHv8F3aQ_CONTRALORÍA memo-14-2025 atención a circular iee-se-011-2025 Cuarto.pdf', 2, '2025-01-11 15:23:57', '2025-01-11 15:23:57'),
	(37, 'storage/documentos/oficio/Iu2h4xXsfG_PRERROGATIVAS oficio-0001-2025 atención a oficio de Morena Saúl.pdf', 'Iu2h4xXsfG_PRERROGATIVAS oficio-0001-2025 atención a oficio de Morena Saúl.pdf', 3, '2025-01-11 15:28:07', '2025-01-11 15:28:07'),
	(38, 'storage/documentos/memorandum/NClG3gofM5_UFD memo-004-2025 desincorporación de personal Cuarto.pdf', 'NClG3gofM5_UFD memo-004-2025 desincorporación de personal Cuarto.pdf', 2, '2025-01-11 15:35:21', '2025-01-11 15:35:21'),
	(39, 'storage/documentos/circular/zX5WJ4Y2jA_CONSEJERA EVA circular-001-2025 solicitud de información Eder-Miros.pdf', 'zX5WJ4Y2jA_CONSEJERA EVA circular-001-2025 solicitud de información Eder-Miros.pdf', 4, '2025-01-11 15:40:57', '2025-01-11 15:40:57'),
	(40, 'storage/documentos/memorandum/JiNyh0PUQi_COMUNICACIÓN memo-007-2025 subir galería fotográfica web Archivo.pdf', 'JiNyh0PUQi_COMUNICACIÓN memo-007-2025 subir galería fotográfica web Archivo.pdf', 2, '2025-01-11 15:45:49', '2025-01-11 15:45:49'),
	(41, 'storage/documentos/memorandum/0F04IJOgu3_JURÍDICO memo-0006-2025 se remite relación de taxis.pdf', '0F04IJOgu3_JURÍDICO memo-0006-2025 se remite relación de taxis.pdf', 2, '2025-01-11 15:48:36', '2025-01-11 15:48:36'),
	(42, 'storage/documentos/circular/MIQGjHkpJI_PLANEACIÓN circuar-001-2025 retificación de enlace.pdf', 'MIQGjHkpJI_PLANEACIÓN circuar-001-2025 retificación de enlace.pdf', 4, '2025-01-11 15:51:36', '2025-01-11 15:51:36'),
	(43, 'storage/documentos/escrito/Jzc7yQSHhZ_CORREO Alejandro Lima Scretaría de función pública designación de enlaces Eder-Emir.pdf', 'Jzc7yQSHhZ_CORREO Alejandro Lima Scretaría de función pública designación de enlaces Eder-Emir.pdf', 5, '2025-01-11 15:59:00', '2025-01-11 15:59:00'),
	(44, 'storage/documentos/circular/NThLnQMYYc_SECRETARÍA circular-002-2025 a todo el personal.pdf', 'NThLnQMYYc_SECRETARÍA circular-002-2025 a todo el personal.pdf', 4, '2025-01-11 16:03:34', '2025-01-11 16:03:34'),
	(45, 'storage/documentos/memorandum/IckbzFlI6a_PRERROGATIVAS-0008-2025 acreditación partidos políticos Saúl.pdf', 'IckbzFlI6a_PRERROGATIVAS-0008-2025 acreditación partidos políticos Saúl.pdf', 2, '2025-01-11 16:07:28', '2025-01-11 16:07:28'),
	(46, 'storage/documentos/memorandum/2Z7A56GEzb_PRERROGATIVAS memo-0005-2025 procedimiento acreditación partidos politicos Saul.pdf', '2Z7A56GEzb_PRERROGATIVAS memo-0005-2025 procedimiento acreditación partidos politicos Saul.pdf', 2, '2025-01-11 16:11:26', '2025-01-11 16:11:26'),
	(47, 'storage/documentos/memorandum/Xlh6mdDauY_ARCHIVOS memo-002-25 sobre procedimiento de transferencia de exp.pdf', 'Xlh6mdDauY_ARCHIVOS memo-002-25 sobre procedimiento de transferencia de exp.pdf', 2, '2025-01-11 16:30:30', '2025-01-11 16:30:30'),
	(48, 'storage/documentos/circular/zELraQLBlj_DTS circular-001-2025 temas a tratar a consejo general Huoston.pdf', 'zELraQLBlj_DTS circular-001-2025 temas a tratar a consejo general Huoston.pdf', 4, '2025-01-11 16:35:02', '2025-01-11 16:35:02'),
	(49, 'storage/documentos/correo/uJsQltePRz_UFD reporte de incidencias segunda quincena diciembre 2024 coordinación financiera recursos Cuarto.pdf', 'uJsQltePRz_UFD reporte de incidencias segunda quincena diciembre 2024 coordinación financiera recursos Cuarto.pdf', 7, '2025-01-11 16:46:38', '2025-01-11 16:46:38'),
	(50, 'storage/documentos/circular/9abCxhQot3_COMUNICACIÓN circular-ccs-01-2025 cobertura de eventos.pdf', '9abCxhQot3_COMUNICACIÓN circular-ccs-01-2025 cobertura de eventos.pdf', 4, '2025-01-11 17:04:46', '2025-01-11 17:04:46'),
	(51, 'storage/documentos/memorandum/PJqfXfEv8f_DTS memo-0018-2025 se informa solicitus de alta de personal Cuarto.pdf', 'PJqfXfEv8f_DTS memo-0018-2025 se informa solicitus de alta de personal Cuarto.pdf', 2, '2025-01-11 17:09:58', '2025-01-11 17:09:58'),
	(52, 'storage/documentos/circular/RoHK15Pc9N_TRANSPARENCIA circular-002-2025 enlaces de transparencia Cuarto.pdf', 'RoHK15Pc9N_TRANSPARENCIA circular-002-2025 enlaces de transparencia Cuarto.pdf', 4, '2025-01-11 17:11:41', '2025-01-11 17:11:41'),
	(53, 'storage/documentos/memorandum/GPEskoJNEt_PRERROGATIVAS memo-0020-2025 procedimiento a Partidos Pólíticos Saúl.pdf', 'GPEskoJNEt_PRERROGATIVAS memo-0020-2025 procedimiento a Partidos Pólíticos Saúl.pdf', 2, '2025-01-11 17:14:02', '2025-01-11 17:14:02'),
	(54, 'storage/documentos/oficio/JTjXsSsZkg_SECRETARÍA oficio-0049-2025 se remiten acuerdos Huoston.pdf', 'JTjXsSsZkg_SECRETARÍA oficio-0049-2025 se remiten acuerdos Huoston.pdf', 3, '2025-01-11 17:18:26', '2025-01-11 17:18:26'),
	(55, 'storage/documentos/memorandum/rsD1wy7D3T_COMUNICACIÓN memo-015-2025 video cotaprep Archivo.pdf', 'rsD1wy7D3T_COMUNICACIÓN memo-015-2025 video cotaprep Archivo.pdf', 2, '2025-01-11 17:22:50', '2025-01-11 17:22:50'),
	(56, 'storage/documentos/escrito/Ps3pdGLJXj_SECRETARÍA circular-0003-2025 se remite acuerdo cg-ac-0001-2025 Huoston.pdf', 'Ps3pdGLJXj_SECRETARÍA circular-0003-2025 se remite acuerdo cg-ac-0001-2025 Huoston.pdf', 5, '2025-01-11 17:26:26', '2025-01-11 17:26:26'),
	(57, 'storage/documentos/memorandum/rWAiBrYWAQ_SECRETARÍA memo-0078-2025 se remite acuerdo cg-ac-0007-2025 Huoston.pdf', 'rWAiBrYWAQ_SECRETARÍA memo-0078-2025 se remite acuerdo cg-ac-0007-2025 Huoston.pdf', 2, '2025-01-11 17:28:35', '2025-01-11 17:28:35'),
	(58, 'storage/documentos/memorandum/LGEv1Fdw4M_SECRETARÍA circular-0074-2025 se remite acuerdo cg-ac-0006-2025 Huoston.pdf', 'LGEv1Fdw4M_SECRETARÍA circular-0074-2025 se remite acuerdo cg-ac-0006-2025 Huoston.pdf', 2, '2025-01-11 17:30:34', '2025-01-11 17:30:34'),
	(59, 'storage/documentos/circular/9FJDLK2cIs_SECRETARÍA circular-011-2025 se solicita informacion Cuarto.pdf', '9FJDLK2cIs_SECRETARÍA circular-011-2025 se solicita informacion Cuarto.pdf', 4, '2025-01-11 17:37:57', '2025-01-11 17:37:57'),
	(60, 'storage/documentos/circular/GE4vVNHzqF_SECRETARÍA circular-009-2025 se solicita inf.pdf', 'GE4vVNHzqF_SECRETARÍA circular-009-2025 se solicita inf.pdf', 4, '2025-01-11 17:41:10', '2025-01-11 17:41:10'),
	(61, 'storage/documentos/circular/I59tu4nC4V_UFD circular-002-2025 se solicita actualización de exámenes Cuarto.pdf', 'I59tu4nC4V_UFD circular-002-2025 se solicita actualización de exámenes Cuarto.pdf', 4, '2025-01-11 17:44:30', '2025-01-11 17:44:30'),
	(62, 'storage/documentos/circular/PqrkIBGley_UFD circular-001-2025 se solicita enlace para que esté a cargo de los trámites de ufd Cuarto.pdf', 'PqrkIBGley_UFD circular-001-2025 se solicita enlace para que esté a cargo de los trámites de ufd Cuarto.pdf', 4, '2025-01-11 17:52:56', '2025-01-11 17:52:56'),
	(63, 'storage/documentos/memorandum/KdJJe9wX2T_COMUNICACIÓN memo-015-2025 video cotaprep Archivo.pdf', 'KdJJe9wX2T_COMUNICACIÓN memo-015-2025 video cotaprep Archivo.pdf', 2, '2025-01-11 18:49:33', '2025-01-11 18:49:33'),
	(64, 'storage/documentos/memorandum/rACu8vPWVt_COMUNICACIÓN memo-015-2025 video cotaprep Archivo.pdf', 'rACu8vPWVt_COMUNICACIÓN memo-015-2025 video cotaprep Archivo.pdf', 2, '2025-01-13 13:35:36', '2025-01-13 13:35:36'),
	(65, 'storage/documentos/escrito/4JFHJj18Q6_SECRETARÍA circular-0003-2025 se remite acuerdo cg-ac-0001-2025 Huoston.pdf', '4JFHJj18Q6_SECRETARÍA circular-0003-2025 se remite acuerdo cg-ac-0001-2025 Huoston.pdf', 5, '2025-01-13 13:40:56', '2025-01-13 13:40:56'),
	(66, 'storage/documentos/memorandum/ub2VvFrte8_TRANSPARENCIA memo-ut-sol-007-2025 Solicitud de Información.pdf', 'ub2VvFrte8_TRANSPARENCIA memo-ut-sol-007-2025 Solicitud de Información.pdf', 2, '2025-01-17 15:15:27', '2025-01-17 15:15:27'),
	(67, 'storage/documentos/memorandum/xRPa61a8Nh_COMUNICACIÓN memo-028-2025 Subir galería fotográfica a la página web Archivo.pdf', 'xRPa61a8Nh_COMUNICACIÓN memo-028-2025 Subir galería fotográfica a la página web Archivo.pdf', 2, '2025-01-17 15:24:28', '2025-01-17 15:24:28'),
	(68, 'storage/documentos/escrito/czSUOS2LMC_CORREO S.pdf', 'czSUOS2LMC_CORREO S.pdf', 5, '2025-01-20 16:16:32', '2025-01-20 16:16:32'),
	(69, 'storage/documentos/circular/78ABIsUEAP_SECRETARÍA circular-002-2025 a todo el personal.pdf', '78ABIsUEAP_SECRETARÍA circular-002-2025 a todo el personal.pdf', 4, '2025-01-20 16:29:25', '2025-01-20 16:29:25'),
	(70, 'storage/documentos/circular/tU1db8ke9s_SECRETARÍA circular-0004-2025 remite acuerdo cg-ac-0002-2025 Huoston.pdf', 'tU1db8ke9s_SECRETARÍA circular-0004-2025 remite acuerdo cg-ac-0002-2025 Huoston.pdf', 4, '2025-01-20 16:37:55', '2025-01-20 16:37:55'),
	(71, 'storage/documentos/circular/9WmTAzbhOt_SECRETARÍA circular-0005-2025 remite acuerdo cg-ac-0003-2025 Huoston.pdf', '9WmTAzbhOt_SECRETARÍA circular-0005-2025 remite acuerdo cg-ac-0003-2025 Huoston.pdf', 4, '2025-01-20 16:40:09', '2025-01-20 16:40:09'),
	(72, 'storage/documentos/circular/D4LLUURGx6_SECRETARÍA circular-0006-2025 remite acuerdo cg-ac-0004-2025 Huoston.pdf', 'D4LLUURGx6_SECRETARÍA circular-0006-2025 remite acuerdo cg-ac-0004-2025 Huoston.pdf', 4, '2025-01-20 16:41:51', '2025-01-20 16:41:51'),
	(73, 'storage/documentos/circular/0vmAAsRXkx_SECRETARÍA circular-0007-2025 remite acuerdo cg-ac-0006-2025 Huoston.pdf', '0vmAAsRXkx_SECRETARÍA circular-0007-2025 remite acuerdo cg-ac-0006-2025 Huoston.pdf', 4, '2025-01-20 16:44:12', '2025-01-20 16:44:12'),
	(74, 'storage/documentos/circular/EBmP9aqB9v_SECRETARÍA circular-0008-2025 se remite acuerdo cg-ac-0008-2025 Huoston.pdf', 'EBmP9aqB9v_SECRETARÍA circular-0008-2025 se remite acuerdo cg-ac-0008-2025 Huoston.pdf', 4, '2025-01-20 16:46:30', '2025-01-20 16:46:30'),
	(75, 'storage/documentos/circular/dNvF4RYI8a_SECRETARÍA circular-009-2025 se solicita inf.pdf', 'dNvF4RYI8a_SECRETARÍA circular-009-2025 se solicita inf.pdf', 4, '2025-01-20 16:54:10', '2025-01-20 16:54:10'),
	(76, 'storage/documentos/circular/Pj3WQMZ3qN_SECRETARÍA circular-010-2025 Horario de labores para el PELE 2025 a todo el personal.pdf', 'Pj3WQMZ3qN_SECRETARÍA circular-010-2025 Horario de labores para el PELE 2025 a todo el personal.pdf', 4, '2025-01-20 16:56:43', '2025-01-20 16:56:43'),
	(77, 'storage/documentos/circular/mlFSwBhyIp_SECRETARÍA circular-011-2025 se solicita informacion Cuarto.pdf', 'mlFSwBhyIp_SECRETARÍA circular-011-2025 se solicita informacion Cuarto.pdf', 4, '2025-01-20 16:57:55', '2025-01-20 16:57:55'),
	(78, 'storage/documentos/circular/5Tk1ZlV0mT_SECRETARÍA circular-012-2025 invitación a presentación de Libro Yaz-Sol.pdf', '5Tk1ZlV0mT_SECRETARÍA circular-012-2025 invitación a presentación de Libro Yaz-Sol.pdf', 4, '2025-01-20 17:15:36', '2025-01-20 17:15:36'),
	(79, 'storage/documentos/memorandum/nUnM9jspuD_SECRETARÍA memo-0033-2025 se remite oficio sería de planeación y finanzas SPF-SE-593-2024 FOLIO 057 Emir-Eder.pdf', 'nUnM9jspuD_SECRETARÍA memo-0033-2025 se remite oficio sería de planeación y finanzas SPF-SE-593-2024 FOLIO 057 Emir-Eder.pdf', 2, '2025-01-20 17:26:46', '2025-01-20 17:26:46'),
	(80, 'storage/documentos/memorandum/fDogZYo2Uc_SECRETARÍA memo-0074-2025 se remite acuerdo cg-ac-0006-2025 Huoston.pdf', 'fDogZYo2Uc_SECRETARÍA memo-0074-2025 se remite acuerdo cg-ac-0006-2025 Huoston.pdf', 2, '2025-01-20 17:36:26', '2025-01-20 17:36:26'),
	(81, 'storage/documentos/memorandum/BsZKJFI94u_SECRETARÍA memo-0078-2025 se remite acuerdo cg-ac-0007-2025 Huoston.pdf', 'BsZKJFI94u_SECRETARÍA memo-0078-2025 se remite acuerdo cg-ac-0007-2025 Huoston.pdf', 2, '2025-01-20 17:38:56', '2025-01-20 17:38:56'),
	(82, 'storage/documentos/memorandum/UKt8rv0eC1_SECRETARÍA memo-0135-2025  propuesta de personl para ser retabulado C.pdf', 'UKt8rv0eC1_SECRETARÍA memo-0135-2025  propuesta de personl para ser retabulado C.pdf', 2, '2025-01-20 17:46:07', '2025-01-20 17:46:07'),
	(83, 'storage/documentos/memorandum/Tf0BX3oMOH_SECRETARÍA memo-0165-2025 autorización para certificar documentación.pdf', 'Tf0BX3oMOH_SECRETARÍA memo-0165-2025 autorización para certificar documentación.pdf', 2, '2025-01-20 17:51:02', '2025-01-20 17:51:02'),
	(84, 'storage/documentos/memorandum/3c8fAJ0LQx_SECRETARÍA memo-0195-2025 autorización para certificar documentos Huoston.pdf', '3c8fAJ0LQx_SECRETARÍA memo-0195-2025 autorización para certificar documentos Huoston.pdf', 2, '2025-01-20 17:53:02', '2025-01-20 17:53:02'),
	(85, 'storage/documentos/memorandum/87bBHDqVNk_SECRETARÍA memo-0200-2025 se remite oficio de la secretaría de spf- designación de enlaces Emir.pdf', '87bBHDqVNk_SECRETARÍA memo-0200-2025 se remite oficio de la secretaría de spf- designación de enlaces Emir.pdf', 2, '2025-01-20 17:57:28', '2025-01-20 17:57:28'),
	(86, 'storage/documentos/memorandum/5tYSFsulHQ_SECRETARÍA memo-0237-2025 se remite cálculo de indemnización atn.pdf', '5tYSFsulHQ_SECRETARÍA memo-0237-2025 se remite cálculo de indemnización atn.pdf', 2, '2025-01-20 18:03:03', '2025-01-20 18:03:03'),
	(87, 'storage/documentos/oficio/A2Jn8deSf9_SECRETARÍA oficio-0049-2025 se remiten acuerdos Huoston.pdf', 'A2Jn8deSf9_SECRETARÍA oficio-0049-2025 se remiten acuerdos Huoston.pdf', 3, '2025-01-20 18:07:47', '2025-01-20 18:07:47'),
	(88, 'storage/documentos/oficio/gl4Zso46F3_SECRETARIA EJEC.pdf', 'gl4Zso46F3_SECRETARIA EJEC.pdf', 3, '2025-01-20 18:16:11', '2025-01-20 18:16:11'),
	(89, 'storage/documentos/oficio/PdTdzxgRvX_SECRETARÍA oficio-0150-2025 se remite acuerdo cg-ac-0010-2025 Huoston.pdf', 'PdTdzxgRvX_SECRETARÍA oficio-0150-2025 se remite acuerdo cg-ac-0010-2025 Huoston.pdf', 3, '2025-01-20 18:18:56', '2025-01-20 18:18:56'),
	(90, 'storage/documentos/memorandum/dwH4FccjwK_UFD memo-004-2025 desincorporación de personal Cuarto.pdf', 'dwH4FccjwK_UFD memo-004-2025 desincorporación de personal Cuarto.pdf', 2, '2025-01-20 18:31:58', '2025-01-20 18:31:58'),
	(91, 'storage/documentos/memorandum/WkhwQgV732_UFD memo- 017-2025 se remite información Cuarto.pdf', 'WkhwQgV732_UFD memo- 017-2025 se remite información Cuarto.pdf', 2, '2025-01-20 18:34:56', '2025-01-20 18:34:56'),
	(92, 'storage/documentos/memorandum/SgbRqnjvP7_UFD memo-018-2025 se informa encargadurías de despacho Cuarto.pdf', 'SgbRqnjvP7_UFD memo-018-2025 se informa encargadurías de despacho Cuarto.pdf', 2, '2025-01-20 18:40:09', '2025-01-20 18:40:09'),
	(93, 'storage/documentos/memorandum/xSjzQnzRbo_UFD memo-027-2025 se solicit desincorporción de personal Cuarto.pdf', 'xSjzQnzRbo_UFD memo-027-2025 se solicit desincorporción de personal Cuarto.pdf', 2, '2025-01-20 18:43:29', '2025-01-20 18:43:29'),
	(94, 'storage/documentos/memorandum/0Xno2kGZDy_UFD memo-034-2025 se solicita someter a Junta ejecutiva altas de personal en fechas distints de las establecidas en la normatividad Cuarto.pdf', '0Xno2kGZDy_UFD memo-034-2025 se solicita someter a Junta ejecutiva altas de personal en fechas distints de las establecidas en la normatividad Cuarto.pdf', 2, '2025-01-20 18:48:18', '2025-01-20 18:48:18'),
	(95, 'storage/documentos/memorandum/unOs7U1nEm_UFD memo-039-2025 se solicita alta de personal Cuarto.pdf', 'unOs7U1nEm_UFD memo-039-2025 se solicita alta de personal Cuarto.pdf', 2, '2025-01-20 18:55:06', '2025-01-20 18:55:06'),
	(96, 'storage/documentos/memorandum/dK9mlwfNIs_UFD memo-040-2025 se solicita alta de personal Lic.pdf', 'dK9mlwfNIs_UFD memo-040-2025 se solicita alta de personal Lic.pdf', 2, '2025-01-20 18:57:37', '2025-01-20 18:57:37'),
	(97, 'storage/documentos/memorandum/v6Wyi5F2EQ_UFD-041-2025 se solicita desincorporación de personal Cuarto.pdf', 'v6Wyi5F2EQ_UFD-041-2025 se solicita desincorporación de personal Cuarto.pdf', 2, '2025-01-20 18:59:45', '2025-01-20 18:59:45'),
	(98, 'storage/documentos/memorandum/AYPfauVbao_UFD memo-061-2025 Se solicita desincorporación de personal aranza Cuarto.pdf', 'AYPfauVbao_UFD memo-061-2025 Se solicita desincorporación de personal aranza Cuarto.pdf', 2, '2025-01-20 20:09:15', '2025-01-20 20:09:15'),
	(99, 'storage/documentos/memorandum/tXVAbmzPKP_UFD MEMORANDUM No.pdf', 'tXVAbmzPKP_UFD MEMORANDUM No.pdf', 2, '2025-01-20 20:16:17', '2025-01-20 20:16:17'),
	(100, 'storage/documentos/memorandum/pmk2ELgvNW_UFD memo-069-2025 se soicita desincorporación de personal Cuarto.pdf', 'pmk2ELgvNW_UFD memo-069-2025 se soicita desincorporación de personal Cuarto.pdf', 2, '2025-01-20 20:20:19', '2025-01-20 20:20:19'),
	(101, 'storage/documentos/circular/OthvBusMEw_UFD circular-001-2025 se solicita enlace para que esté a cargo de los trámites de ufd Cuarto.pdf', 'OthvBusMEw_UFD circular-001-2025 se solicita enlace para que esté a cargo de los trámites de ufd Cuarto.pdf', 4, '2025-01-20 20:24:08', '2025-01-20 20:24:08'),
	(102, 'storage/documentos/circular/uddbbMG8SG_UFD circular-002-2025 se solicita actualización de exámenes Cuarto.pdf', 'uddbbMG8SG_UFD circular-002-2025 se solicita actualización de exámenes Cuarto.pdf', 4, '2025-01-20 20:26:31', '2025-01-20 20:26:31'),
	(103, 'storage/documentos/escrito/xnuO0fC0sF_UFD correo remite reporte de entradas de aystec enero del 1 al 15  Caro-Sol-Cuarto.pdf', 'xnuO0fC0sF_UFD correo remite reporte de entradas de aystec enero del 1 al 15  Caro-Sol-Cuarto.pdf', 5, '2025-01-20 20:30:46', '2025-01-20 20:30:46'),
	(104, 'storage/documentos/escrito/Pl74a0WQOr_UFD correo-reporte general asystec del 16 al 31 d dic 2024 Caro-Sol-Cuarto.pdf', 'Pl74a0WQOr_UFD correo-reporte general asystec del 16 al 31 d dic 2024 Caro-Sol-Cuarto.pdf', 5, '2025-01-20 20:32:07', '2025-01-20 20:32:07'),
	(105, 'storage/documentos/memorandum/2VpsVMmS6F_JURÍDICO memo-0003-2025 se remite relación de asuntos laborales.pdf', '2VpsVMmS6F_JURÍDICO memo-0003-2025 se remite relación de asuntos laborales.pdf', 2, '2025-01-20 20:46:28', '2025-01-20 20:46:28'),
	(106, 'storage/documentos/memorandum/6jVQaGKYDx_JURÍDICO memo-0006-2025 se remite relación de taxis.pdf', '6jVQaGKYDx_JURÍDICO memo-0006-2025 se remite relación de taxis.pdf', 2, '2025-01-20 20:50:01', '2025-01-20 20:50:01'),
	(107, 'storage/documentos/memorandum/1zfhSwzgBj_JURÍDICO memo-059-2025 se informa personal comisionado Cuarto.pdf', '1zfhSwzgBj_JURÍDICO memo-059-2025 se informa personal comisionado Cuarto.pdf', 2, '2025-01-20 21:06:52', '2025-01-20 21:06:52'),
	(108, 'storage/documentos/escrito/lFe4JTM9MN_DOE CORREO EPATLAN-CONVENIO DE PLEBISCITOS 2025.pdf', 'lFe4JTM9MN_DOE CORREO EPATLAN-CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-20 21:40:53', '2025-01-20 21:40:53'),
	(109, 'storage/documentos/memorandum/fPRkg8PJ6y_18_2.jpg', 'fPRkg8PJ6y_18_2.jpg', 2, '2025-01-20 22:22:14', '2025-01-20 22:22:14'),
	(110, 'storage/documentos/memorandum/Lt9HPYtfEC_JURÍDICO memo-0016-2025 se solicita información a más tardar viernes 10 de enero Huoston.pdf', 'Lt9HPYtfEC_JURÍDICO memo-0016-2025 se solicita información a más tardar viernes 10 de enero Huoston.pdf', 2, '2025-01-20 22:42:50', '2025-01-20 22:42:50'),
	(111, 'storage/documentos/memorandum/cT6aB2EirB_JURÍDICO memo-0017-2025 se solicita información a más tardar el 10 de enero a las tardar a las 13 horas Huoston-Yaz.pdf', 'cT6aB2EirB_JURÍDICO memo-0017-2025 se solicita información a más tardar el 10 de enero a las tardar a las 13 horas Huoston-Yaz.pdf', 2, '2025-01-20 22:46:25', '2025-01-20 22:46:25'),
	(112, 'storage/documentos/memorandum/BZYpSjwNhn_JURÍDICO memo-0018-2025 se soicita información  a más tardar viernes 10 de enero.pdf', 'BZYpSjwNhn_JURÍDICO memo-0018-2025 se soicita información  a más tardar viernes 10 de enero.pdf', 2, '2025-01-20 22:48:46', '2025-01-20 22:48:46'),
	(113, 'storage/documentos/memorandum/BHicFynz3Y_JURÍDICO memo-019-2025 se solicita inf a más tardar 10 de enero del año en curso Huoston-Yaz.pdf', 'BHicFynz3Y_JURÍDICO memo-019-2025 se solicita inf a más tardar 10 de enero del año en curso Huoston-Yaz.pdf', 2, '2025-01-20 22:50:16', '2025-01-20 22:50:16'),
	(114, 'storage/documentos/memorandum/NxeLittmvM_JURÍDICO memo-021-2025 se solicita información a más tardar el 10 de enero a las 13 horas Huoston-Yaz.pdf', 'NxeLittmvM_JURÍDICO memo-021-2025 se solicita información a más tardar el 10 de enero a las 13 horas Huoston-Yaz.pdf', 2, '2025-01-20 22:52:38', '2025-01-20 22:52:38'),
	(115, 'storage/documentos/memorandum/N8XZ35Ybox_ARCHIVOS memo-030-25 solicitud de baja de resgusrdo Daniel.pdf', 'N8XZ35Ybox_ARCHIVOS memo-030-25 solicitud de baja de resgusrdo Daniel.pdf', 2, '2025-01-21 13:37:19', '2025-01-21 13:37:19'),
	(116, 'storage/documentos/memorandum/wseo1BgUgA_CONSEJERO ARTURO memo-02-2025 se informaque no será posible participar en sesión ordinaria COPEAD Huoston.pdf', 'wseo1BgUgA_CONSEJERO ARTURO memo-02-2025 se informaque no será posible participar en sesión ordinaria COPEAD Huoston.pdf', 2, '2025-01-21 13:39:40', '2025-01-21 13:39:40'),
	(117, 'storage/documentos/escrito/pPMD1RaVqt_CORREO comisión plevisitaria ocoyucan 2025 Eder-Huoston.pdf', 'pPMD1RaVqt_CORREO comisión plevisitaria ocoyucan 2025 Eder-Huoston.pdf', 5, '2025-01-21 13:42:19', '2025-01-21 13:42:19'),
	(118, 'storage/documentos/escrito/GVks6sUwHM_CORREO comisión plevisitaria ocoyucan 2025 Eder-Huoston.pdf', 'GVks6sUwHM_CORREO comisión plevisitaria ocoyucan 2025 Eder-Huoston.pdf', 5, '2025-01-21 13:43:45', '2025-01-21 13:43:45'),
	(119, 'storage/documentos/memorandum/z55cP1Geh6_INFORMÁTICA memo-ii-prep-007-2025 Archivo.pdf', 'z55cP1Geh6_INFORMÁTICA memo-ii-prep-007-2025 Archivo.pdf', 2, '2025-01-21 13:45:09', '2025-01-21 13:45:09'),
	(120, 'storage/documentos/memorandum/XoSmfVDcxh_JURÍDICO memo-0161-2025 se remiten renuncias Cuarto.pdf', 'XoSmfVDcxh_JURÍDICO memo-0161-2025 se remiten renuncias Cuarto.pdf', 2, '2025-01-21 13:50:04', '2025-01-21 13:50:04'),
	(121, 'storage/documentos/memorandum/4dXsnk1mzH_JURÍDICO memo-0064-2025 se solicita información Huoston.pdf', '4dXsnk1mzH_JURÍDICO memo-0064-2025 se solicita información Huoston.pdf', 2, '2025-01-21 14:22:33', '2025-01-21 14:22:33'),
	(122, 'storage/documentos/memorandum/FQhS8pzWS8_JURÍDICO MEMORANDUM IEE-DJ-00892025 SE SOLICITA INFORMACION.pdf', 'FQhS8pzWS8_JURÍDICO MEMORANDUM IEE-DJ-00892025 SE SOLICITA INFORMACION.pdf', 2, '2025-01-21 14:29:30', '2025-01-21 14:29:30'),
	(123, 'storage/documentos/escrito/zJrI0Ae0eu_DOE CORREO TLACOTEPEC CONVENIO DE PLEBISCITOS 2025.pdf', 'zJrI0Ae0eu_DOE CORREO TLACOTEPEC CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 14:50:12', '2025-01-21 14:50:12'),
	(124, 'storage/documentos/escrito/gCLdZXuiGi_DOE CORREO ACAJETE CONVENIO DE PLEBISCITOS 2025.pdf', 'gCLdZXuiGi_DOE CORREO ACAJETE CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 14:52:09', '2025-01-21 14:52:09'),
	(125, 'storage/documentos/escrito/1q1URTitdH_DOE CORREO TEHUACÁN CONVENIO DE PLEBISCITOS 2025.pdf', '1q1URTitdH_DOE CORREO TEHUACÁN CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 14:54:37', '2025-01-21 14:54:37'),
	(126, 'storage/documentos/escrito/CFSuKUHvC7_DOE CORREO ZACATLÁN SE REMITEN ESPECIFICACIONES PARA PRESTAMO DE MATERIAL ELECTORAL.pdf', 'CFSuKUHvC7_DOE CORREO ZACATLÁN SE REMITEN ESPECIFICACIONES PARA PRESTAMO DE MATERIAL ELECTORAL.pdf', 5, '2025-01-21 14:57:03', '2025-01-21 14:57:03'),
	(127, 'storage/documentos/escrito/b867Np8Zse_DOE CORREO SAN ANDRÉS CHOLULA CONVENIO DE PLEBISCITOS 2025.pdf', 'b867Np8Zse_DOE CORREO SAN ANDRÉS CHOLULA CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 14:58:32', '2025-01-21 14:58:32'),
	(128, 'storage/documentos/escrito/fSzKVWc8hr_DOE CORREO JUAN C.pdf', 'fSzKVWc8hr_DOE CORREO JUAN C.pdf', 5, '2025-01-21 14:59:48', '2025-01-21 14:59:48'),
	(129, 'storage/documentos/escrito/TtgjDsI2Qt_DOE requerimientos de mobiliario para consejos municipales proyección Daniel Eder.pdf', 'TtgjDsI2Qt_DOE requerimientos de mobiliario para consejos municipales proyección Daniel Eder.pdf', 5, '2025-01-21 15:10:27', '2025-01-21 15:10:27'),
	(130, 'storage/documentos/escrito/uuI10ijmg9_DOE correo costos de materiales plebiscitos 2025 Eder-Daniel.pdf', 'uuI10ijmg9_DOE correo costos de materiales plebiscitos 2025 Eder-Daniel.pdf', 5, '2025-01-21 15:15:21', '2025-01-21 15:15:21'),
	(131, 'storage/documentos/escrito/ov1bI3fBrX_DOE correo-anexo convenio validación Eder-Daniel.pdf', 'ov1bI3fBrX_DOE correo-anexo convenio validación Eder-Daniel.pdf', 5, '2025-01-21 15:18:54', '2025-01-21 15:18:54'),
	(132, 'storage/documentos/escrito/y0goRaQJiP_DOE CORREO SAN MATIAS TLALANCALECA SE REMITE ESPECIFICACIONES PARA PRESTAMO DE MATERIAL ELECTORAL.pdf', 'y0goRaQJiP_DOE CORREO SAN MATIAS TLALANCALECA SE REMITE ESPECIFICACIONES PARA PRESTAMO DE MATERIAL ELECTORAL.pdf', 5, '2025-01-21 15:37:01', '2025-01-21 15:37:01'),
	(133, 'storage/documentos/escrito/BbI6k3MkZ3_DOE CORREO HUEJOTZINGO CONVENIO DE PLEBISCIOS 2025.pdf', 'BbI6k3MkZ3_DOE CORREO HUEJOTZINGO CONVENIO DE PLEBISCIOS 2025.pdf', 5, '2025-01-21 15:39:16', '2025-01-21 15:39:16'),
	(134, 'storage/documentos/escrito/mvKQJykPjj_DOE CORREO TEPEACA CONVENIO DE PLEBISCITOS 2025.pdf', 'mvKQJykPjj_DOE CORREO TEPEACA CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 15:41:01', '2025-01-21 15:41:01'),
	(135, 'storage/documentos/escrito/gv28DhL4vv_DOE CORREO TLATLAUQUITEPEC CONVENIO DE PLEBISCITOS 2025.pdf', 'gv28DhL4vv_DOE CORREO TLATLAUQUITEPEC CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 15:43:02', '2025-01-21 15:43:02'),
	(136, 'storage/documentos/escrito/fT1j2e8B4D_DOE CORREO CORONANGO CONVENIO D EPLEBISCITOS 2025.pdf', 'fT1j2e8B4D_DOE CORREO CORONANGO CONVENIO D EPLEBISCITOS 2025.pdf', 5, '2025-01-21 15:44:29', '2025-01-21 15:44:29'),
	(137, 'storage/documentos/escrito/IjXoSvGoNu_DOE CORREO MOLCAXAC CONVENIO DE PLEBISCITOS 2025.pdf', 'IjXoSvGoNu_DOE CORREO MOLCAXAC CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 15:45:55', '2025-01-21 15:45:55'),
	(138, 'storage/documentos/escrito/c6Y2mBko69_DOE CORREO PUEBLA CONVENIO DE PLEBISCITOS 2025.pdf', 'c6Y2mBko69_DOE CORREO PUEBLA CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 15:47:33', '2025-01-21 15:47:33'),
	(139, 'storage/documentos/escrito/rvc3NtBiOP_DOE CORREO ACATZINGO CONVENIO DE PLEBISCITOS 2025.pdf', 'rvc3NtBiOP_DOE CORREO ACATZINGO CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 15:49:12', '2025-01-21 15:49:12'),
	(140, 'storage/documentos/escrito/uJyJ8S1Jtu_DOE CORREO XICOTEPEC CONVENIO DE PLEBISCITOS 2025.pdf', 'uJyJ8S1Jtu_DOE CORREO XICOTEPEC CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 15:50:37', '2025-01-21 15:50:37'),
	(141, 'storage/documentos/escrito/l6m7PIM4iF_DOE CORREO SAN MARTIN TEXMELUCAN CONVENIO DE PLEBISCITOS 2025.pdf', 'l6m7PIM4iF_DOE CORREO SAN MARTIN TEXMELUCAN CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 15:52:08', '2025-01-21 15:52:08'),
	(142, 'storage/documentos/escrito/C7YVtiJltw_DOE CORREO HUAQUECHULA CONVENIO DE PLEBISCITOS 2025.pdf', 'C7YVtiJltw_DOE CORREO HUAQUECHULA CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 15:53:42', '2025-01-21 15:53:42'),
	(143, 'storage/documentos/escrito/QMTLCKvGIc_DOE CORREO ATLIXCO CONVENIO DE PLABISCITOS 2025.pdf', 'QMTLCKvGIc_DOE CORREO ATLIXCO CONVENIO DE PLABISCITOS 2025.pdf', 5, '2025-01-21 15:55:21', '2025-01-21 15:55:21'),
	(144, 'storage/documentos/escrito/BX00ibdOUA_DOE CORREO RAFAEL LARA GRAJALES CONVENIO DE PLEBISCITOS 2025.pdf', 'BX00ibdOUA_DOE CORREO RAFAEL LARA GRAJALES CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 15:56:57', '2025-01-21 15:56:57'),
	(145, 'storage/documentos/escrito/hyxX1kfejU_ACAJETE CONVENIO DE PLEBISCITOS 2025.pdf', 'hyxX1kfejU_ACAJETE CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 15:58:25', '2025-01-21 15:58:25'),
	(146, 'storage/documentos/escrito/7Bn03Vu1qt_DOE CORREO NAUZONTLA CONVENIO DE PLEBISCITOS 2025.pdf', '7Bn03Vu1qt_DOE CORREO NAUZONTLA CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 16:12:46', '2025-01-21 16:12:46'),
	(147, 'storage/documentos/escrito/BLfDSA8ZgH_DOE CORREO PALMAR DE BRAVO CONVENIO DE PLEBISCITOS 2025.pdf', 'BLfDSA8ZgH_DOE CORREO PALMAR DE BRAVO CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 16:14:34', '2025-01-21 16:14:34'),
	(148, 'storage/documentos/escrito/jWAM8cSMxY_DOE CORREO LAFRAGUA CONVENIO PLEBISCITOS 2025.pdf', 'jWAM8cSMxY_DOE CORREO LAFRAGUA CONVENIO PLEBISCITOS 2025.pdf', 5, '2025-01-21 16:16:06', '2025-01-21 16:16:06'),
	(149, 'storage/documentos/escrito/j2dQyzBXpi_DOE CORREO AQUIXTLA CONVENIO DE PLEBISCITOS 2025.pdf', 'j2dQyzBXpi_DOE CORREO AQUIXTLA CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 16:17:49', '2025-01-21 16:17:49'),
	(150, 'storage/documentos/escrito/RQDINpxXJ6_DOE CORREO TEPEYAHUALCO CONVENIO DE PLEBISCITOS 2025.pdf', 'RQDINpxXJ6_DOE CORREO TEPEYAHUALCO CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 16:19:16', '2025-01-21 16:19:16'),
	(151, 'storage/documentos/escrito/TlfAylS07B_DOE CORREO VENUSTIANO CARRANZA CONVENIO DE PLEBISCITOS 2025.pdf', 'TlfAylS07B_DOE CORREO VENUSTIANO CARRANZA CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 16:20:57', '2025-01-21 16:20:57'),
	(152, 'storage/documentos/escrito/pWsU6zidA1_DOE CORREO TECAMACHALCO CONVENIO D EPLEBISCITOS 2025.pdf', 'pWsU6zidA1_DOE CORREO TECAMACHALCO CONVENIO D EPLEBISCITOS 2025.pdf', 5, '2025-01-21 16:22:47', '2025-01-21 16:22:47'),
	(153, 'storage/documentos/escrito/YJGGWzs0dh_DOE CORREO CHIETLA CONVENIO DE PLEBISCITOS 2025.pdf', 'YJGGWzs0dh_DOE CORREO CHIETLA CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 16:24:26', '2025-01-21 16:24:26'),
	(154, 'storage/documentos/escrito/dPoy3iis8w_DOE CORREO TEPANCO DE LOPEZ CONVENIO DE PLEBISCITOS 2025.pdf', 'dPoy3iis8w_DOE CORREO TEPANCO DE LOPEZ CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 16:25:55', '2025-01-21 16:25:55'),
	(155, 'storage/documentos/escrito/FUvSK9Og0K_DOE CORREO CALPAN CONVENIO DE PLEBISCITOS 2025.pdf', 'FUvSK9Og0K_DOE CORREO CALPAN CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 16:27:31', '2025-01-21 16:27:31'),
	(156, 'storage/documentos/escrito/AzBp42Kter_DOE CORREO AMOZOC DE MOTA CONVENIO DE PLEBISCITOS 2025.pdf', 'AzBp42Kter_DOE CORREO AMOZOC DE MOTA CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 16:30:21', '2025-01-21 16:30:21'),
	(157, 'storage/documentos/escrito/9c1PsBaA8h_DOE CORREO TEHUACAN CONVENIO DE PLEBISCITOS 2025.pdf', '9c1PsBaA8h_DOE CORREO TEHUACAN CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 16:31:53', '2025-01-21 16:31:53'),
	(158, 'storage/documentos/escrito/npTa0HpxI7_DOE CORREO AHUAZOTEPEC CONVENIO DE PLEBISCITOS 2025.pdf', 'npTa0HpxI7_DOE CORREO AHUAZOTEPEC CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 16:33:40', '2025-01-21 16:33:40'),
	(159, 'storage/documentos/escrito/mbWpgE3z9D_DOE SAN PEDRO CHOLULA CONVENIO DE PLEBISCITOS 2025.pdf', 'mbWpgE3z9D_DOE SAN PEDRO CHOLULA CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 16:39:14', '2025-01-21 16:39:14'),
	(160, 'storage/documentos/escrito/IkCEkqgfqw_DOE CORREO ZAUTLA CONVENIO DE PLEBISCITOS 2025.pdf', 'IkCEkqgfqw_DOE CORREO ZAUTLA CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 16:41:10', '2025-01-21 16:41:10'),
	(161, 'storage/documentos/escrito/HJOvDw98P2_DOE CORREO ZACATLAN CONVENIO DE PLEBISCITOS 2025.pdf', 'HJOvDw98P2_DOE CORREO ZACATLAN CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 16:43:00', '2025-01-21 16:43:00'),
	(162, 'storage/documentos/escrito/3HC4OT2VgA_DOE CORREO SAN MATÍAS TLALANCALECA  CONVENIO DE PLEBISCITOS 2025.pdf', '3HC4OT2VgA_DOE CORREO SAN MATÍAS TLALANCALECA  CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 16:45:16', '2025-01-21 16:45:16'),
	(163, 'storage/documentos/escrito/R7hYQxh0o3_DOE CORREO CUAUTEMPAN CONVENIO DE PLEBISCITOS 2025.pdf', 'R7hYQxh0o3_DOE CORREO CUAUTEMPAN CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 16:46:46', '2025-01-21 16:46:46'),
	(164, 'storage/documentos/escrito/hGJtsKVBaH_DOE CORREO ALJOJUCA CONVENIO DE PLEBISCITOS 2025.pdf', 'hGJtsKVBaH_DOE CORREO ALJOJUCA CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 16:48:17', '2025-01-21 16:48:17'),
	(165, 'storage/documentos/escrito/GjPX5SXnRa_DOE CORREO QUECHOLAC CONVENIO DE PLEBISCITOS 2025.pdf', 'GjPX5SXnRa_DOE CORREO QUECHOLAC CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 16:50:16', '2025-01-21 16:50:16'),
	(166, 'storage/documentos/escrito/KC2cSBg5Nz_DOE CORREO PANTEPEC CONVENIO DE PLEBISCITOS 2025.pdf', 'KC2cSBg5Nz_DOE CORREO PANTEPEC CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 16:51:50', '2025-01-21 16:51:50'),
	(167, 'storage/documentos/escrito/Xh6lQNGoQQ_DOE CORREO TLACOTEPEC DE BENITO JUÁREZ 2025.pdf', 'Xh6lQNGoQQ_DOE CORREO TLACOTEPEC DE BENITO JUÁREZ 2025.pdf', 5, '2025-01-21 16:53:50', '2025-01-21 16:53:50'),
	(168, 'storage/documentos/escrito/xOyT0AkwdV_DOE CORREO JUAN GALINDO CONVENIO DE PLEBISCITOS 2025.pdf', 'xOyT0AkwdV_DOE CORREO JUAN GALINDO CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 16:56:01', '2025-01-21 16:56:01'),
	(169, 'storage/documentos/escrito/Hv9OKxre9c_DOE CORREO SAN SALVADOR EL VERDE CONVENIO DE PLEBISCITOS.pdf', 'Hv9OKxre9c_DOE CORREO SAN SALVADOR EL VERDE CONVENIO DE PLEBISCITOS.pdf', 5, '2025-01-21 16:58:04', '2025-01-21 16:58:04'),
	(170, 'storage/documentos/escrito/atfPqFIQrG_DOE CORREO SAN NICOLÁS DE LOS RANCHOS CONVENIO DE PLEBISCITOS 2025.pdf', 'atfPqFIQrG_DOE CORREO SAN NICOLÁS DE LOS RANCHOS CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 17:00:15', '2025-01-21 17:00:15'),
	(171, 'storage/documentos/escrito/JhE07nRpnL_DOE CORREO YEHUALTEPEC CONVENIO PLEBISCITOS 2025.pdf', 'JhE07nRpnL_DOE CORREO YEHUALTEPEC CONVENIO PLEBISCITOS 2025.pdf', 5, '2025-01-21 17:14:28', '2025-01-21 17:14:28'),
	(172, 'storage/documentos/escrito/N3CyiK7IRZ_DOE CORREO SAN GERONIMO ATZOMPA CONVENIO PLEBISCITOS 2025.pdf', 'N3CyiK7IRZ_DOE CORREO SAN GERONIMO ATZOMPA CONVENIO PLEBISCITOS 2025.pdf', 5, '2025-01-21 17:21:19', '2025-01-21 17:21:19'),
	(173, 'storage/documentos/escrito/MMTk9YFeHp_DOE CORREO TEPEXCO CONVENIO DE PLEBISCITOS 2025.pdf', 'MMTk9YFeHp_DOE CORREO TEPEXCO CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 17:23:08', '2025-01-21 17:23:08'),
	(174, 'storage/documentos/escrito/530GorWzib_DOE CORREO HUAUCHINANGO CONVENIO D EPLEBISCITOS 2025.pdf', '530GorWzib_DOE CORREO HUAUCHINANGO CONVENIO D EPLEBISCITOS 2025.pdf', 5, '2025-01-21 17:26:39', '2025-01-21 17:26:39'),
	(175, 'storage/documentos/escrito/XpWPr6UDYP_DOE CORREO TEOPATLÁN CONVENIO DE PLEBISCITOS 2025.pdf', 'XpWPr6UDYP_DOE CORREO TEOPATLÁN CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 17:29:02', '2025-01-21 17:29:02'),
	(176, 'storage/documentos/escrito/83drwBEVNB_DOE CORREO CAÑADA MORELOS CONVENIO DE PLEBISCITOS 2025.pdf', '83drwBEVNB_DOE CORREO CAÑADA MORELOS CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 17:30:37', '2025-01-21 17:30:37'),
	(177, 'storage/documentos/escrito/hKhR0IRiPc_DOE CORREO ACATLÁN CONVENIO DE PLEBISCITOS 2025.pdf', 'hKhR0IRiPc_DOE CORREO ACATLÁN CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 17:36:00', '2025-01-21 17:36:00'),
	(178, 'storage/documentos/escrito/D9HhPiIIEd_DOE CORREO EPATLÁN CONVENIO DE PLEBISCITOS 2025.pdf', 'D9HhPiIIEd_DOE CORREO EPATLÁN CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 17:37:51', '2025-01-21 17:37:51'),
	(179, 'storage/documentos/escrito/rBB5IlD5Rx_DOE CORREO SAN JERÓNIMO TECUANIPAN CONVENIO DE PLEBISCITOS 2025.pdf', 'rBB5IlD5Rx_DOE CORREO SAN JERÓNIMO TECUANIPAN CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 17:39:47', '2025-01-21 17:39:47'),
	(180, 'storage/documentos/escrito/GtjIsRziPY_DOE CORREO SANTO TOMÁS HUEYOTLIPAN CONVENIO PLEBISCITOS 2025.pdf', 'GtjIsRziPY_DOE CORREO SANTO TOMÁS HUEYOTLIPAN CONVENIO PLEBISCITOS 2025.pdf', 5, '2025-01-21 17:41:43', '2025-01-21 17:41:43'),
	(181, 'storage/documentos/escrito/X72hA7y2ZF_DOE CORREO TEZIUTLÁN CONVENIO PLEBISCITOS 2025.pdf', 'X72hA7y2ZF_DOE CORREO TEZIUTLÁN CONVENIO PLEBISCITOS 2025.pdf', 5, '2025-01-21 17:43:39', '2025-01-21 17:43:39'),
	(182, 'storage/documentos/escrito/wMdHWw8FKf_DOE CORREO TECALI DE HERRERA CONVENIO DE PLEBISCITOS 2025.pdf', 'wMdHWw8FKf_DOE CORREO TECALI DE HERRERA CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 17:45:24', '2025-01-21 17:45:24'),
	(183, 'storage/documentos/escrito/o4DpLO2pVJ_DOE CORREO ZACAPOAXTLA CONVENIO DE PLEBISCITOS 2025.pdf', 'o4DpLO2pVJ_DOE CORREO ZACAPOAXTLA CONVENIO DE PLEBISCITOS 2025.pdf', 5, '2025-01-21 17:48:01', '2025-01-21 17:48:01'),
	(184, 'storage/documentos/escrito/WK1g5EpHoU_DOE CORREO JUAN C.pdf', 'WK1g5EpHoU_DOE CORREO JUAN C.pdf', 5, '2025-01-21 17:49:46', '2025-01-21 17:49:46'),
	(185, 'storage/documentos/escrito/VP4CizUoR2_DOE correo se remite modelo de oficio Eder.pdf', 'VP4CizUoR2_DOE correo se remite modelo de oficio Eder.pdf', 5, '2025-01-21 17:53:30', '2025-01-21 17:53:30'),
	(186, 'storage/documentos/memorandum/7S6V1dC4Gk_DOE MEMORANDUM IEE-DOE-0021-2025 SE REMITE INFORMACION.pdf', '7S6V1dC4Gk_DOE MEMORANDUM IEE-DOE-0021-2025 SE REMITE INFORMACION.pdf', 2, '2025-01-21 18:08:14', '2025-01-21 18:08:14'),
	(187, 'storage/documentos/memorandum/jz9RYenbZv_DOE MEMORANDUM IEE-DOE-0022-2025 SE REMITE INFORMACION.pdf', 'jz9RYenbZv_DOE MEMORANDUM IEE-DOE-0022-2025 SE REMITE INFORMACION.pdf', 2, '2025-01-21 18:10:21', '2025-01-21 18:10:21'),
	(188, 'storage/documentos/memorandum/HKO2K29g79_DOE MEMORANDUM IEE-DOE-0023-2025 SE REMITE INFORMACION.pdf', 'HKO2K29g79_DOE MEMORANDUM IEE-DOE-0023-2025 SE REMITE INFORMACION.pdf', 2, '2025-01-21 18:18:27', '2025-01-21 18:18:27'),
	(189, 'storage/documentos/memorandum/8ne4Q5DPtG_DOE MEMORANDUM IEE-DOE-0024-2025 SE REMITE INFORMACION.pdf', '8ne4Q5DPtG_DOE MEMORANDUM IEE-DOE-0024-2025 SE REMITE INFORMACION.pdf', 2, '2025-01-21 18:20:10', '2025-01-21 18:20:10'),
	(190, 'storage/documentos/memorandum/pSz0LID33C_DOE memo-0030-2025 contratación de inmuebles Daniel.pdf', 'pSz0LID33C_DOE memo-0030-2025 contratación de inmuebles Daniel.pdf', 2, '2025-01-21 18:31:18', '2025-01-21 18:31:18'),
	(191, 'storage/documentos/memorandum/lx86ryLAxo_DOE memo-0035-2025 equipamiento consejos municipales Daniel.pdf', 'lx86ryLAxo_DOE memo-0035-2025 equipamiento consejos municipales Daniel.pdf', 2, '2025-01-21 18:34:14', '2025-01-21 18:34:14'),
	(192, 'storage/documentos/memorandum/MIwsk8jOpq_DOE memo-0037-2025 se remite información a iee-da-0037-2025 Huoston.pdf', 'MIwsk8jOpq_DOE memo-0037-2025 se remite información a iee-da-0037-2025 Huoston.pdf', 2, '2025-01-21 18:36:24', '2025-01-21 18:36:24'),
	(193, 'storage/documentos/memorandum/wREVgP03JW_DOE memo-0039-2025 se solicita desincorporación de mobiliario Daniel.pdf', 'wREVgP03JW_DOE memo-0039-2025 se solicita desincorporación de mobiliario Daniel.pdf', 2, '2025-01-21 18:38:08', '2025-01-21 18:38:08'),
	(194, 'storage/documentos/memorandum/7PTaGA2Oki_DOE memo-0042-2025 Retabulación de personal Cuarto.pdf', '7PTaGA2Oki_DOE memo-0042-2025 Retabulación de personal Cuarto.pdf', 2, '2025-01-21 18:40:09', '2025-01-21 18:40:09'),
	(195, 'storage/documentos/memorandum/WfgOTp1mVH_DOE MEMORANDUM IEE-DOE-0044-2025 COSTO DE LIQUIDO INDELEBLE.pdf', 'WfgOTp1mVH_DOE MEMORANDUM IEE-DOE-0044-2025 COSTO DE LIQUIDO INDELEBLE.pdf', 2, '2025-01-21 18:47:08', '2025-01-21 18:47:08'),
	(196, 'storage/documentos/circular/3RRgDVfJRE_TRANSPARENCIA CIRCULAR IEE-UT-001-2025 SE SOLICITA AGENDA DE ACTIVIDADES.pdf', '3RRgDVfJRE_TRANSPARENCIA CIRCULAR IEE-UT-001-2025 SE SOLICITA AGENDA DE ACTIVIDADES.pdf', 4, '2025-01-21 18:55:53', '2025-01-21 18:55:53'),
	(197, 'storage/documentos/circular/4kCV6KiYIN_TRANSPARENCIA CIRCULAR IEE-UT-002-2025 ENLACES DE TRANSPARENCIA.pdf', '4kCV6KiYIN_TRANSPARENCIA CIRCULAR IEE-UT-002-2025 ENLACES DE TRANSPARENCIA.pdf', 4, '2025-01-21 18:56:41', '2025-01-21 18:56:41'),
	(198, 'storage/documentos/oficio/qYba6iGCaj_PRERROGATIVAS oficio-0001-2025 atención a oficio de Morena Saúl.pdf', 'qYba6iGCaj_PRERROGATIVAS oficio-0001-2025 atención a oficio de Morena Saúl.pdf', 3, '2025-01-21 19:04:18', '2025-01-21 19:04:18'),
	(199, 'storage/documentos/oficio/Gn9YwdZZr2_PRERROGATIVAS oficio-0002-2025 fuerza por méxico Saúl.pdf', 'Gn9YwdZZr2_PRERROGATIVAS oficio-0002-2025 fuerza por méxico Saúl.pdf', 3, '2025-01-21 19:10:07', '2025-01-21 19:10:07'),
	(200, 'storage/documentos/oficio/vykCaMZQ0X_PRERROGATIVAS oficio-0003-2025 seguimiento a similar iee-dppp-0665-2024 Saúl.pdf', 'vykCaMZQ0X_PRERROGATIVAS oficio-0003-2025 seguimiento a similar iee-dppp-0665-2024 Saúl.pdf', 3, '2025-01-21 19:13:30', '2025-01-21 19:13:30'),
	(201, 'storage/documentos/oficio/z87HCUr1sR_PRERROGATIVAS oficio-0004-2025 movimiento ciudadano Saúl.pdf', 'z87HCUr1sR_PRERROGATIVAS oficio-0004-2025 movimiento ciudadano Saúl.pdf', 3, '2025-01-21 19:16:33', '2025-01-21 19:16:33'),
	(202, 'storage/documentos/escrito/QA8YIYNQvG_PRERROGATIVAS CORREO SE INFORMA ACREDITACION PARTIDISTA.pdf', 'QA8YIYNQvG_PRERROGATIVAS CORREO SE INFORMA ACREDITACION PARTIDISTA.pdf', 5, '2025-01-21 20:29:32', '2025-01-21 20:29:32'),
	(203, 'storage/documentos/tarjeta/4VUxK1ElHn_PRERROGATIVAS escrito fredy solicitud de nómina por cheque Cuarto.pdf', '4VUxK1ElHn_PRERROGATIVAS escrito fredy solicitud de nómina por cheque Cuarto.pdf', 6, '2025-01-21 20:31:27', '2025-01-21 20:31:27'),
	(204, 'storage/documentos/memorandum/qK7wCSt9hF_PRERROGATIVAS memo-0005-2025 acreditación y sustitución de representaciones de partidos políticos Saúl.pdf', 'qK7wCSt9hF_PRERROGATIVAS memo-0005-2025 acreditación y sustitución de representaciones de partidos políticos Saúl.pdf', 2, '2025-01-21 20:36:43', '2025-01-21 20:36:43'),
	(205, 'storage/documentos/memorandum/26kLyQ4UTy_PRERROGATIVAS memo-0008-2025 acreditación y sustitución de representacones de partidos políticos Saúl.pdf', '26kLyQ4UTy_PRERROGATIVAS memo-0008-2025 acreditación y sustitución de representacones de partidos políticos Saúl.pdf', 2, '2025-01-21 20:39:03', '2025-01-21 20:39:03'),
	(206, 'storage/documentos/memorandum/N6iJIUmDwJ_PRERROGATIVAS memo-0018-2025 distribución de financiamiento publico a más tardar el 20 de enero del presente Emir-Saúl.pdf', 'N6iJIUmDwJ_PRERROGATIVAS memo-0018-2025 distribución de financiamiento publico a más tardar el 20 de enero del presente Emir-Saúl.pdf', 2, '2025-01-21 20:43:48', '2025-01-21 20:43:48'),
	(207, 'storage/documentos/memorandum/YYVaBvgjLL_PRERROGATIVAS memo-0020-2025 procedimiento a Partidos Pólíticos Saúl.pdf', 'YYVaBvgjLL_PRERROGATIVAS memo-0020-2025 procedimiento a Partidos Pólíticos Saúl.pdf', 2, '2025-01-21 20:47:11', '2025-01-21 20:47:11'),
	(208, 'storage/documentos/memorandum/l2UXkHupQl_PRERROGATIVAS MEMORANDUM No IEE-DPPP-0042-2025 CONSIDERACION DE RETABULACION.pdf', 'l2UXkHupQl_PRERROGATIVAS MEMORANDUM No IEE-DPPP-0042-2025 CONSIDERACION DE RETABULACION.pdf', 2, '2025-01-21 21:03:57', '2025-01-21 21:03:57'),
	(209, 'storage/documentos/memorandum/3kWkr0H053_PRERROGATIVAS memo-0056-2025 partidos políticos Saúl.pdf', '3kWkr0H053_PRERROGATIVAS memo-0056-2025 partidos políticos Saúl.pdf', 2, '2025-01-21 21:06:25', '2025-01-21 21:06:25'),
	(210, 'storage/documentos/memorandum/H9Nv5xWb6g_PRERROGATIVAS memo-0065-2025 sistema para consejos electorales Saúl.pdf', 'H9Nv5xWb6g_PRERROGATIVAS memo-0065-2025 sistema para consejos electorales Saúl.pdf', 2, '2025-01-21 21:08:39', '2025-01-21 21:08:39'),
	(211, 'storage/documentos/memorandum/TlFgWrgdhE_PRERROGATIVAS memo-0073-2025 remiten recibos de financiamiento público Saúl.pdf', 'TlFgWrgdhE_PRERROGATIVAS memo-0073-2025 remiten recibos de financiamiento público Saúl.pdf', 2, '2025-01-21 21:11:55', '2025-01-21 21:11:55'),
	(212, 'storage/documentos/oficio/EfIfWgmzd5_PRESIDENCIA oficio-0010-2025 se infora designación de representante propietario del otrora partido democrática Saúl.pdf', 'EfIfWgmzd5_PRESIDENCIA oficio-0010-2025 se infora designación de representante propietario del otrora partido democrática Saúl.pdf', 3, '2025-01-21 21:22:10', '2025-01-21 21:22:10'),
	(213, 'storage/documentos/oficio/umeWAKmAIt_PRESIDENCIA OFICIO NoIEEPRE-00742025 AMPLIACION INICIO DE PROCESO.pdf', 'umeWAKmAIt_PRESIDENCIA OFICIO NoIEEPRE-00742025 AMPLIACION INICIO DE PROCESO.pdf', 3, '2025-01-21 21:31:29', '2025-01-21 21:31:29'),
	(214, 'storage/documentos/memorandum/E2Adb5c7KU_COMUNICACIÓN memo-007-2025 subir galería fotográfica web Archivo.pdf', 'E2Adb5c7KU_COMUNICACIÓN memo-007-2025 subir galería fotográfica web Archivo.pdf', 2, '2025-01-21 21:37:01', '2025-01-21 21:37:01'),
	(215, 'storage/documentos/memorandum/OqCPRz84cy_COMUNICACIÓN memo-010-2025 boletín 01 Archivo.pdf', 'OqCPRz84cy_COMUNICACIÓN memo-010-2025 boletín 01 Archivo.pdf', 2, '2025-01-21 21:38:51', '2025-01-21 21:38:51'),
	(216, 'storage/documentos/memorandum/HWdJ8JK3MU_COMUNICACIÓN memo-015-2025 video cotaprep Archivo.pdf', 'HWdJ8JK3MU_COMUNICACIÓN memo-015-2025 video cotaprep Archivo.pdf', 2, '2025-01-21 21:41:03', '2025-01-21 21:41:03'),
	(217, 'storage/documentos/memorandum/3thIDHhgVh_COMUNICACIÓN memo-017-2025 resp.pdf', '3thIDHhgVh_COMUNICACIÓN memo-017-2025 resp.pdf', 2, '2025-01-21 21:45:04', '2025-01-21 21:45:04'),
	(218, 'storage/documentos/memorandum/SgOSL4eyHB_COMUNICACIÓN memo-028-2025 Subir galería fotográfica a la página web Archivo.pdf', 'SgOSL4eyHB_COMUNICACIÓN memo-028-2025 Subir galería fotográfica a la página web Archivo.pdf', 2, '2025-01-21 21:48:25', '2025-01-21 21:48:25'),
	(219, 'storage/documentos/memorandum/rZunU43Ogu_COMUNICACIÓN memo-031-2025 boletín 02  Archivo.pdf', 'rZunU43Ogu_COMUNICACIÓN memo-031-2025 boletín 02  Archivo.pdf', 2, '2025-01-21 21:50:03', '2025-01-21 21:50:03'),
	(220, 'storage/documentos/memorandum/f8oS44ib8k_COMUNICACIÓN memo-032-2025 boletín 03 Archivo.pdf', 'f8oS44ib8k_COMUNICACIÓN memo-032-2025 boletín 03 Archivo.pdf', 2, '2025-01-21 21:51:43', '2025-01-21 21:51:43'),
	(221, 'storage/documentos/circular/5LIkosjhSq_COMUNICACIÓN circular-ccs-01-2025 cobertura de eventos.pdf', '5LIkosjhSq_COMUNICACIÓN circular-ccs-01-2025 cobertura de eventos.pdf', 4, '2025-01-21 21:53:31', '2025-01-21 21:53:31'),
	(222, 'storage/documentos/memorandum/3FXvhaGDCY_CONTRALORÍA memo-14-2025 atención a circular iee-se-011-2025 Cuarto.pdf', '3FXvhaGDCY_CONTRALORÍA memo-14-2025 atención a circular iee-se-011-2025 Cuarto.pdf', 2, '2025-01-21 21:58:23', '2025-01-21 21:58:23'),
	(223, 'storage/documentos/memorandum/4SEZKYnZcO_CONTRALORÍA memo-016-2025 acta final de auditoría remite actas rubircadas Miroslava.pdf', '4SEZKYnZcO_CONTRALORÍA memo-016-2025 acta final de auditoría remite actas rubircadas Miroslava.pdf', 2, '2025-01-21 22:00:26', '2025-01-21 22:00:26'),
	(224, 'storage/documentos/memorandum/N91yQxK2Kh_CONTRALORÍA memo024-2025 reporte de contratación de inmuebles para cme Poblano-Eder.pdf', 'N91yQxK2Kh_CONTRALORÍA memo024-2025 reporte de contratación de inmuebles para cme Poblano-Eder.pdf', 2, '2025-01-21 22:02:49', '2025-01-21 22:02:49'),
	(225, 'storage/documentos/memorandum/7HarZItC6U_CONTRALORÍA memo-019-2025 orden de auditoría.pdf', '7HarZItC6U_CONTRALORÍA memo-019-2025 orden de auditoría.pdf', 2, '2025-01-21 22:05:30', '2025-01-21 22:05:30'),
	(226, 'storage/documentos/memorandum/ZycNf4JpMU_CONTRALORÍA memo-030-2025 orden de auditoría Emir.pdf', 'ZycNf4JpMU_CONTRALORÍA memo-030-2025 orden de auditoría Emir.pdf', 2, '2025-01-21 22:07:44', '2025-01-21 22:07:44'),
	(227, 'storage/documentos/memorandum/6kpEZCEPGW_CONTRALORÍA memo-042-2025 pago fotomultas Juan.pdf', '6kpEZCEPGW_CONTRALORÍA memo-042-2025 pago fotomultas Juan.pdf', 2, '2025-01-21 22:11:10', '2025-01-21 22:11:10'),
	(228, 'storage/documentos/memorandum/aqidkYhm27_CONTRALORIA MEMORANDUM No IEE-COI-049-2025M ORDEN DE AUDITORIA.pdf', 'aqidkYhm27_CONTRALORIA MEMORANDUM No IEE-COI-049-2025M ORDEN DE AUDITORIA.pdf', 2, '2025-01-21 22:15:47', '2025-01-21 22:15:47'),
	(229, 'storage/documentos/circular/8XmfVTqISo_CONTRALORÍA circular-001-2025 reembolsos de gastos.pdf', '8XmfVTqISo_CONTRALORÍA circular-001-2025 reembolsos de gastos.pdf', 4, '2025-01-21 22:18:10', '2025-01-21 22:18:10'),
	(230, 'storage/documentos/escrito/Ice5wJLraU_OFICIALIA CORREO TRANSFERENCIAS A CUENTAS BANCARIAS DE TERCEROS.pdf', 'Ice5wJLraU_OFICIALIA CORREO TRANSFERENCIAS A CUENTAS BANCARIAS DE TERCEROS.pdf', 5, '2025-01-21 22:57:13', '2025-01-21 22:57:13'),
	(231, 'storage/documentos/escrito/tQO8Lh0BVi_OFICIALIA CORREO TRANSF.pdf', 'tQO8Lh0BVi_OFICIALIA CORREO TRANSF.pdf', 5, '2025-01-21 23:00:20', '2025-01-21 23:00:20'),
	(232, 'storage/documentos/escrito/ORLTcW2ffu_EXTERNO CORREO SE NOTIFICA OFICIO IEE-PRE-0010-2025.pdf', 'ORLTcW2ffu_EXTERNO CORREO SE NOTIFICA OFICIO IEE-PRE-0010-2025.pdf', 5, '2025-01-21 23:03:44', '2025-01-21 23:03:44'),
	(233, 'storage/documentos/escrito/vuoJbZ4hTE_EXTERNO CORREO SOLICITUD DE ENLACES PARA CUENTA PÚBLICA 2024.pdf', 'vuoJbZ4hTE_EXTERNO CORREO SOLICITUD DE ENLACES PARA CUENTA PÚBLICA 2024.pdf', 5, '2025-01-21 23:07:42', '2025-01-21 23:07:42'),
	(234, 'storage/documentos/escrito/qCxnJRj85X_EXTERNOS CORREO SPF SUBSECRETARIA DE EGRESOS.pdf', 'qCxnJRj85X_EXTERNOS CORREO SPF SUBSECRETARIA DE EGRESOS.pdf', 5, '2025-01-21 23:11:14', '2025-01-21 23:11:14'),
	(235, 'storage/documentos/escrito/4VhV9rFA4q_EXTERNOS CORREO TRAMITE BANCARIO REPRESENTANTE DEL PT.pdf', '4VhV9rFA4q_EXTERNOS CORREO TRAMITE BANCARIO REPRESENTANTE DEL PT.pdf', 5, '2025-01-21 23:13:27', '2025-01-21 23:13:27'),
	(236, 'storage/documentos/circular/AgTwbofHlV_EXTERNOS OFICIO CIRCULAR No SFPPUE-SCA-001-2024 DESIGNACION DE ENLACE DE AUDITORIA.pdf', 'AgTwbofHlV_EXTERNOS OFICIO CIRCULAR No SFPPUE-SCA-001-2024 DESIGNACION DE ENLACE DE AUDITORIA.pdf', 4, '2025-01-22 14:35:22', '2025-01-22 14:35:22'),
	(237, 'storage/documentos/escrito/l10mBMLbqH_EXTERNOS CORREO PROPUESTA DE RENOVACION DE SEGURO DE DAÑOS -IEE.pdf', 'l10mBMLbqH_EXTERNOS CORREO PROPUESTA DE RENOVACION DE SEGURO DE DAÑOS -IEE.pdf', 5, '2025-01-22 14:38:25', '2025-01-22 14:38:25'),
	(238, 'storage/documentos/escrito/u2NvCsvZxj_EXTERNOS CORREO TRAMITE DE ACCESO AL IEE CAJERO AUTOMATICO BNTE N61676.pdf', 'u2NvCsvZxj_EXTERNOS CORREO TRAMITE DE ACCESO AL IEE CAJERO AUTOMATICO BNTE N61676.pdf', 5, '2025-01-22 14:42:35', '2025-01-22 14:42:35'),
	(239, 'storage/documentos/oficio/hCTNdRzrAy_EXTERNOS OFICIO SPF-SE-593-2024 PRESUPUESTO DE EGRESOS PARA EJERCICIO FISCAL 2025.pdf', 'hCTNdRzrAy_EXTERNOS OFICIO SPF-SE-593-2024 PRESUPUESTO DE EGRESOS PARA EJERCICIO FISCAL 2025.pdf', 3, '2025-01-22 14:50:45', '2025-01-22 14:50:45'),
	(240, 'storage/documentos/memorandum/hQsaBwLiVH_PRESIDENCIA MEMORANDUM No IEE-PRE-0254-2025 MINISTRACION DE ENERO.pdf', 'hQsaBwLiVH_PRESIDENCIA MEMORANDUM No IEE-PRE-0254-2025 MINISTRACION DE ENERO.pdf', 2, '2025-01-22 15:27:41', '2025-01-22 15:27:41'),
	(241, 'storage/documentos/memorandum/PHbuNASEv6_INFORMATICA MEMORANDUM IEE-II-PREP-009-2025 LISTADO DE ENTREGABLES PARA EL PROCESO LOCAL EXTRAORDINARIO (PELE) 2025.pdf', 'PHbuNASEv6_INFORMATICA MEMORANDUM IEE-II-PREP-009-2025 LISTADO DE ENTREGABLES PARA EL PROCESO LOCAL EXTRAORDINARIO (PELE) 2025.pdf', 2, '2025-01-22 15:32:09', '2025-01-22 15:32:09'),
	(242, 'storage/documentos/memorandum/g4yJd6nQSL_INFORMATICA MEMORANDUM IEE-II-PREP-008-2025 LISTADO DE ENTREGADOS PARA PROCESO ELECTORAL LOCAL EXTRAORDINARIO (PELE) 2025.pdf', 'g4yJd6nQSL_INFORMATICA MEMORANDUM IEE-II-PREP-008-2025 LISTADO DE ENTREGADOS PARA PROCESO ELECTORAL LOCAL EXTRAORDINARIO (PELE) 2025.pdf', 2, '2025-01-22 15:36:33', '2025-01-22 15:36:33'),
	(243, 'storage/documentos/memorandum/tynbUv1pEs_INFORMATICA MEMORANDUM IEE-II-PREP-009-2025 LISTADO DE ENTREGABLES PARA PROCESO ELECTORAL LOCAL EXTRAORDINARIO (PELE) 2025 INTEGRANTES DEL COMITE TÉCNICO (COTAPREP).pdf', 'tynbUv1pEs_INFORMATICA MEMORANDUM IEE-II-PREP-009-2025 LISTADO DE ENTREGABLES PARA PROCESO ELECTORAL LOCAL EXTRAORDINARIO (PELE) 2025 INTEGRANTES DEL COMITE TÉCNICO (COTAPREP).pdf', 2, '2025-01-22 15:40:10', '2025-01-22 15:40:10'),
	(244, 'storage/documentos/memorandum/e33LLww5eJ_TRANSPARENCIA MEMORANDUM IEE-UT-059-2025 BAJA DE RESGUARDOS DE BIENES MUEBLES.pdf', 'e33LLww5eJ_TRANSPARENCIA MEMORANDUM IEE-UT-059-2025 BAJA DE RESGUARDOS DE BIENES MUEBLES.pdf', 2, '2025-01-22 15:43:42', '2025-01-22 15:43:42'),
	(245, 'storage/documentos/memorandum/znslj8jQ9Y_UFD MEMORANDUM IEEUFD-0632025 SE REMITE CALIFICCION DE EXAMEN.pdf', 'znslj8jQ9Y_UFD MEMORANDUM IEEUFD-0632025 SE REMITE CALIFICCION DE EXAMEN.pdf', 2, '2025-01-22 15:52:03', '2025-01-22 15:52:03'),
	(246, 'storage/documentos/memorandum/hz6ftBt9xA_UFD MEMORANDUM No IEE-UFD-080-2025 SE SOLICITA ALTA DE PERSONAL.pdf', 'hz6ftBt9xA_UFD MEMORANDUM No IEE-UFD-080-2025 SE SOLICITA ALTA DE PERSONAL.pdf', 2, '2025-01-22 15:54:20', '2025-01-22 15:54:20'),
	(247, 'storage/documentos/memorandum/FRdpU2TN1P_UFD MEMORANDUM No IEE-UFD-083-2025 SE SOLICITA DESINCORPORACION DE PERSONAL.pdf', 'FRdpU2TN1P_UFD MEMORANDUM No IEE-UFD-083-2025 SE SOLICITA DESINCORPORACION DE PERSONAL.pdf', 2, '2025-01-22 15:56:44', '2025-01-22 15:56:44'),
	(248, 'storage/documentos/memorandum/QckT0bIKyo_UFD MEMORANDUM No IEE-UFD-081-2025 SE SOLICITA DESINCORPORACION DE PERSONAL.pdf', 'QckT0bIKyo_UFD MEMORANDUM No IEE-UFD-081-2025 SE SOLICITA DESINCORPORACION DE PERSONAL.pdf', 2, '2025-01-22 15:59:10', '2025-01-22 15:59:10'),
	(249, 'storage/documentos/circular/6QpOMSYRop_SECRETARIA CIRCULAR No IEE-SE-009-2025 SE SOLICITA INFORMACION DE PERSONAL AVENTUAL.pdf', '6QpOMSYRop_SECRETARIA CIRCULAR No IEE-SE-009-2025 SE SOLICITA INFORMACION DE PERSONAL AVENTUAL.pdf', 4, '2025-01-22 16:24:59', '2025-01-22 16:24:59'),
	(250, 'storage/documentos/escrito/cdmSyl8KOo_SECRETARIA CORREO CIRCULAR IEE-SE-012-2025 INVITACION A PRESENTACION DE LIBRO.pdf', 'cdmSyl8KOo_SECRETARIA CORREO CIRCULAR IEE-SE-012-2025 INVITACION A PRESENTACION DE LIBRO.pdf', 5, '2025-01-22 16:27:50', '2025-01-22 16:27:50'),
	(251, 'storage/documentos/escrito/Qw93u4e6vW_EXTERNO BANORTE TRANSFERENCIA A CUENTAS DE TERCEROS TEOPATLAN.pdf', 'Qw93u4e6vW_EXTERNO BANORTE TRANSFERENCIA A CUENTAS DE TERCEROS TEOPATLAN.pdf', 5, '2025-01-22 16:29:50', '2025-01-22 16:29:50'),
	(252, 'storage/documentos/escrito/mpTO6jRsWM_EXTERNO CORREO TRANSFERENCIA A TERCEROS TEOPATLAN N REFERENCIA 002.pdf', 'mpTO6jRsWM_EXTERNO CORREO TRANSFERENCIA A TERCEROS TEOPATLAN N REFERENCIA 002.pdf', 5, '2025-01-22 16:32:39', '2025-01-22 16:32:39'),
	(253, 'storage/documentos/escrito/8Gj9QOHEcr_EXTERNO COREO REPORTE CORRESPONDIENTE AL CUARTO TRIMESTRE DEL AÑO 2024 SISTEMA DE EVALUACION DE DESEMPEÑO PRESUPUESTAL.pdf', '8Gj9QOHEcr_EXTERNO COREO REPORTE CORRESPONDIENTE AL CUARTO TRIMESTRE DEL AÑO 2024 SISTEMA DE EVALUACION DE DESEMPEÑO PRESUPUESTAL.pdf', 5, '2025-01-22 16:36:13', '2025-01-22 16:36:13'),
	(254, 'storage/documentos/circular/vQshqUKPXd_PLANEACION CIRCULAR No IEE-SPE-002-2025 REPORTE DEL SISTEMA DE EVALUACION DEL DESEMPEÑO CUARTO TRIMESTRE.pdf', 'vQshqUKPXd_PLANEACION CIRCULAR No IEE-SPE-002-2025 REPORTE DEL SISTEMA DE EVALUACION DEL DESEMPEÑO CUARTO TRIMESTRE.pdf', 4, '2025-01-22 16:39:27', '2025-01-22 16:39:27'),
	(255, 'storage/documentos/oficio/0O3VuI8WWK_SECRETARÍA oficio-0196-2025 designación de encargo de despacho Cuarto.pdf', '0O3VuI8WWK_SECRETARÍA oficio-0196-2025 designación de encargo de despacho Cuarto.pdf', 3, '2025-01-22 16:44:29', '2025-01-22 16:44:29'),
	(256, 'storage/documentos/memorandum/UZtVaMFgbZ_PLANEACION MEMORANDUM IEE-SPE-010-2025 REPORTE DE SISTEMA DE DESEMPEÑO CUARTO TRIMESTRE.pdf', 'UZtVaMFgbZ_PLANEACION MEMORANDUM IEE-SPE-010-2025 REPORTE DE SISTEMA DE DESEMPEÑO CUARTO TRIMESTRE.pdf', 2, '2025-01-22 16:47:01', '2025-01-22 16:47:01'),
	(257, 'storage/documentos/escrito/l7cqlI3psw_UFD correo-observaciones exp.pdf', 'l7cqlI3psw_UFD correo-observaciones exp.pdf', 5, '2025-01-22 16:48:46', '2025-01-22 16:48:46'),
	(258, 'storage/documentos/memorandum/PKTQybhRe6_UFD MEMORANDUM IEE-UFD-085-2025 SE SOLICITA JUNTA EJECUTIVA.pdf', 'PKTQybhRe6_UFD MEMORANDUM IEE-UFD-085-2025 SE SOLICITA JUNTA EJECUTIVA.pdf', 2, '2025-01-22 16:51:12', '2025-01-22 16:51:12'),
	(259, 'storage/documentos/memorandum/VGWIF3Yli1_UFD MEMORANDUM IEE-UFD-086-2025 SE SOLICITA SOMETER A JUNTA EJECUTIVA TABULADOR DE SUELDOS DEL EJERCICIO 2025.pdf', 'VGWIF3Yli1_UFD MEMORANDUM IEE-UFD-086-2025 SE SOLICITA SOMETER A JUNTA EJECUTIVA TABULADOR DE SUELDOS DEL EJERCICIO 2025.pdf', 2, '2025-01-22 17:00:28', '2025-01-22 17:00:28'),
	(260, 'storage/documentos/memorandum/67eLfzw3MS_JURÍDICO memo-0215-2025 resp a memo da-0046-2025 se remiten comprobantes de  indemnizaciones Cuarto.pdf', '67eLfzw3MS_JURÍDICO memo-0215-2025 resp a memo da-0046-2025 se remiten comprobantes de  indemnizaciones Cuarto.pdf', 2, '2025-01-22 17:04:49', '2025-01-22 17:04:49'),
	(261, 'storage/documentos/oficio/QOk3HjA9dW_SECRETARIA OFICIO No IEE-SE-0197-2025 DESIGNACION DE ENCARGO DE DESPACHO.pdf', 'QOk3HjA9dW_SECRETARIA OFICIO No IEE-SE-0197-2025 DESIGNACION DE ENCARGO DE DESPACHO.pdf', 3, '2025-01-22 17:05:00', '2025-01-22 17:05:00'),
	(262, 'storage/documentos/memorandum/whlsGcS7w2_IEE-DOE-070-2025 Se notifica programación.pdf', 'whlsGcS7w2_IEE-DOE-070-2025 Se notifica programación.pdf', 2, '2025-01-22 17:08:14', '2025-01-22 17:08:14'),
	(263, 'storage/documentos/escrito/MD1lgsG2uE_DOE CORREO SE REMITEN ESPECIFICACIONES PARA PRESTAMO DE MATERIAL ELECTORAL TECOMATLAN.pdf', 'MD1lgsG2uE_DOE CORREO SE REMITEN ESPECIFICACIONES PARA PRESTAMO DE MATERIAL ELECTORAL TECOMATLAN.pdf', 5, '2025-01-22 17:13:05', '2025-01-22 17:13:05'),
	(264, 'storage/documentos/escrito/6LOWP9YmTO_ADM CORREO CALENDARIO DE ACTIVIDADES CUARTA EVALUACION SEVAC 2024.pdf', '6LOWP9YmTO_ADM CORREO CALENDARIO DE ACTIVIDADES CUARTA EVALUACION SEVAC 2024.pdf', 5, '2025-01-22 17:17:25', '2025-01-22 17:17:25'),
	(265, 'storage/documentos/escrito/besoYul6Q8_DOE correo pago de garantía de mamaparas y urnas tepeaca puebla Ede-Saúl.pdf', 'besoYul6Q8_DOE correo pago de garantía de mamaparas y urnas tepeaca puebla Ede-Saúl.pdf', 5, '2025-01-22 17:22:38', '2025-01-22 17:22:38'),
	(266, 'storage/documentos/oficio/M7NjrD3832_PRESIDENCIA oficio-0075-2025 solicitud en cambio de administrador y chequeras Saúl.pdf', 'M7NjrD3832_PRESIDENCIA oficio-0075-2025 solicitud en cambio de administrador y chequeras Saúl.pdf', 3, '2025-01-22 17:40:24', '2025-01-22 17:40:24'),
	(267, 'storage/documentos/oficio/ewcUBF9TiA_PRESIDENCIA oficio 0082-2025 Solicitud de administrador Saúl.pdf', 'ewcUBF9TiA_PRESIDENCIA oficio 0082-2025 Solicitud de administrador Saúl.pdf', 3, '2025-01-22 17:43:18', '2025-01-22 17:43:18'),
	(268, 'storage/documentos/oficio/kYNUlntIKL_PRESIDENCIA oficio-0081-2025 soicitud de cheques de bolsillo Saúl.pdf', 'kYNUlntIKL_PRESIDENCIA oficio-0081-2025 soicitud de cheques de bolsillo Saúl.pdf', 3, '2025-01-22 17:49:19', '2025-01-22 17:49:19'),
	(269, 'storage/documentos/memorandum/Zk2MtouOVz_JURÍDICO memo-0161-2025 se remiten renuncias Cuarto.pdf', 'Zk2MtouOVz_JURÍDICO memo-0161-2025 se remiten renuncias Cuarto.pdf', 2, '2025-01-22 17:52:20', '2025-01-22 17:52:20'),
	(270, 'storage/documentos/memorandum/1YP0ua0jzz_INFORMÁTICA memo-ii-prep-007-2025 Archivo.pdf', '1YP0ua0jzz_INFORMÁTICA memo-ii-prep-007-2025 Archivo.pdf', 2, '2025-01-22 17:58:37', '2025-01-22 17:58:37'),
	(271, 'storage/documentos/memorandum/Q8iu1dCGiw_UFD memo-015-2025 se solicita alta de personal Cuarto.pdf', 'Q8iu1dCGiw_UFD memo-015-2025 se solicita alta de personal Cuarto.pdf', 2, '2025-01-22 18:00:15', '2025-01-22 18:00:15'),
	(272, 'storage/documentos/memorandum/sSzmo0Tmv5_CONSEJERO ARTURO memo-002-2025 se informaque no será posible participar en sesión ordinaria COPEAD Huoston.pdf', 'sSzmo0Tmv5_CONSEJERO ARTURO memo-002-2025 se informaque no será posible participar en sesión ordinaria COPEAD Huoston.pdf', 2, '2025-01-22 18:01:44', '2025-01-22 18:01:44'),
	(273, 'storage/documentos/memorandum/BzUBrRhLCt_UFD memo-092-2025 se informa encargos de despacho Cuarto.pdf', 'BzUBrRhLCt_UFD memo-092-2025 se informa encargos de despacho Cuarto.pdf', 2, '2025-01-22 18:03:45', '2025-01-22 18:03:45'),
	(274, 'storage/documentos/escrito/l2KuWjzAps_CORREO comisión plevisitaria ocoyucan 2025 Eder-Huoston.pdf', 'l2KuWjzAps_CORREO comisión plevisitaria ocoyucan 2025 Eder-Huoston.pdf', 5, '2025-01-22 18:08:38', '2025-01-22 18:08:38'),
	(275, 'storage/documentos/escrito/e6FP8k7Vke_CORREO comisión plevisitaria ocoyucan 2025 Eder-Huoston.pdf', 'e6FP8k7Vke_CORREO comisión plevisitaria ocoyucan 2025 Eder-Huoston.pdf', 5, '2025-01-22 18:09:49', '2025-01-22 18:09:49'),
	(276, 'storage/documentos/memorandum/YgMGobmcbP_ARCHIVOS memo-030-25 solicitud de baja de resgusrdo Daniel.pdf', 'YgMGobmcbP_ARCHIVOS memo-030-25 solicitud de baja de resgusrdo Daniel.pdf', 2, '2025-01-22 18:11:52', '2025-01-22 18:11:52'),
	(277, 'storage/documentos/memorandum/qHvVODGUXu_PRERROGATIVAS memo-0077-2025 se informa financiamiento público (pan) Eder-Saúl.pdf', 'qHvVODGUXu_PRERROGATIVAS memo-0077-2025 se informa financiamiento público (pan) Eder-Saúl.pdf', 2, '2025-01-22 18:18:00', '2025-01-22 18:18:00'),
	(278, 'storage/documentos/oficio/bZtQBfKQwi_SECRETARÍA DE PLANEACIÓN Y FINANZAS oficio dppp-0100-2025 sobre reasignación de recursos Eder-Emir.pdf', 'bZtQBfKQwi_SECRETARÍA DE PLANEACIÓN Y FINANZAS oficio dppp-0100-2025 sobre reasignación de recursos Eder-Emir.pdf', 3, '2025-01-22 18:48:37', '2025-01-22 18:48:37'),
	(279, 'storage/documentos/memorandum/a7ZYzjxgcI_DTS MEMORANDUM IEE-DTS-0017-2025 REMITIR GAFETES INSTITUCIONALES DE PERSONAL.pdf', 'a7ZYzjxgcI_DTS MEMORANDUM IEE-DTS-0017-2025 REMITIR GAFETES INSTITUCIONALES DE PERSONAL.pdf', 2, '2025-01-22 18:58:27', '2025-01-22 18:58:27'),
	(280, 'storage/documentos/escrito/jpnNGFQPWw_DTS CORREO SE NOTIFICA CIRCULAR IEE-SE-0013-2025 Y ANEXO.pdf', 'jpnNGFQPWw_DTS CORREO SE NOTIFICA CIRCULAR IEE-SE-0013-2025 Y ANEXO.pdf', 5, '2025-01-22 19:01:16', '2025-01-22 19:01:16'),
	(281, 'storage/documentos/memorandum/ZoEQVbbk1Y_DTS MEMORANDUM IEE-DTS-0018-2025 SOLICITUD DE CONTRATACION DE PERSONAL.pdf', 'ZoEQVbbk1Y_DTS MEMORANDUM IEE-DTS-0018-2025 SOLICITUD DE CONTRATACION DE PERSONAL.pdf', 2, '2025-01-22 19:04:00', '2025-01-22 19:04:00'),
	(282, 'storage/documentos/requisicion/dPFdDuXBQn_REQUISICIÓN No.pdf', 'dPFdDuXBQn_REQUISICIÓN No.pdf', 1, '2025-01-22 20:26:09', '2025-01-22 20:26:09'),
	(283, 'storage/documentos/circular/B7t1uagdjP_DTS CIRCULAR IEE-DTS-001-2025 SE SOLICITA INFORME DE ASUNTOS PENDIENTES A TRATAR EN SESION ORDINARIA.pdf', 'B7t1uagdjP_DTS CIRCULAR IEE-DTS-001-2025 SE SOLICITA INFORME DE ASUNTOS PENDIENTES A TRATAR EN SESION ORDINARIA.pdf', 4, '2025-01-22 20:26:50', '2025-01-22 20:26:50'),
	(284, 'storage/documentos/requisicion/GfcTArqdFo_REQUISICIÓN No.pdf', 'GfcTArqdFo_REQUISICIÓN No.pdf', 1, '2025-01-22 20:28:00', '2025-01-22 20:28:00'),
	(285, 'storage/documentos/memorandum/BhdDtn1ARb_DTS MEMORANDUM No IEE-DTS-0039-2025 PROPUESTA DE PERSONAL PARA SER RETABULADO.pdf', 'BhdDtn1ARb_DTS MEMORANDUM No IEE-DTS-0039-2025 PROPUESTA DE PERSONAL PARA SER RETABULADO.pdf', 2, '2025-01-22 20:29:08', '2025-01-22 20:29:08'),
	(286, 'storage/documentos/requisicion/ZGwh5XlNGr_REQUISICIÓN No.pdf', 'ZGwh5XlNGr_REQUISICIÓN No.pdf', 1, '2025-01-22 20:29:50', '2025-01-22 20:29:50'),
	(287, 'storage/documentos/requisicion/12A90mUTnE_REQUISICIÓN No.pdf', '12A90mUTnE_REQUISICIÓN No.pdf', 1, '2025-01-22 20:31:40', '2025-01-22 20:31:40'),
	(288, 'storage/documentos/memorandum/3R01DrdO3W_DTS MEMORANDUM No IEE-DTS-0045-2025 PERSONAL EVENTUAL QUE CONTINUA.pdf', '3R01DrdO3W_DTS MEMORANDUM No IEE-DTS-0045-2025 PERSONAL EVENTUAL QUE CONTINUA.pdf', 2, '2025-01-22 20:31:47', '2025-01-22 20:31:47'),
	(289, 'storage/documentos/requisicion/Do2shF9Xdf_REQUISICIÓN No.pdf', 'Do2shF9Xdf_REQUISICIÓN No.pdf', 1, '2025-01-22 20:33:23', '2025-01-22 20:33:23'),
	(290, 'storage/documentos/requisicion/QV1h1jDKF7_REQUISICIÓN No.pdf', 'QV1h1jDKF7_REQUISICIÓN No.pdf', 1, '2025-01-22 20:34:35', '2025-01-22 20:34:35'),
	(291, 'storage/documentos/memorandum/FGojWmXqbm_DTS MEMORANDUM No IEE-DTS-0074-2025 RENUNCIA.pdf', 'FGojWmXqbm_DTS MEMORANDUM No IEE-DTS-0074-2025 RENUNCIA.pdf', 2, '2025-01-22 20:34:50', '2025-01-22 20:34:50'),
	(292, 'storage/documentos/requisicion/ehj1ImabYD_REQUISICIÓN No.pdf', 'ehj1ImabYD_REQUISICIÓN No.pdf', 1, '2025-01-22 20:35:51', '2025-01-22 20:35:51'),
	(293, 'storage/documentos/requisicion/WWs2wXnmY8_REQUISICIÓN No.pdf', 'WWs2wXnmY8_REQUISICIÓN No.pdf', 1, '2025-01-22 20:37:11', '2025-01-22 20:37:11'),
	(294, 'storage/documentos/memorandum/8J6MFluu9k_DTS MEMORANDUM No IEE-DTS-0090-2025 INFORME DE RENUNCIA.pdf', '8J6MFluu9k_DTS MEMORANDUM No IEE-DTS-0090-2025 INFORME DE RENUNCIA.pdf', 2, '2025-01-22 20:38:03', '2025-01-22 20:38:03'),
	(295, 'storage/documentos/requisicion/M0y85Y2lVS_REQUISICIÓN No.pdf', 'M0y85Y2lVS_REQUISICIÓN No.pdf', 1, '2025-01-22 20:38:26', '2025-01-22 20:38:26'),
	(296, 'storage/documentos/requisicion/MvLkYCxjJL_REQUISICIÓN No.pdf', 'MvLkYCxjJL_REQUISICIÓN No.pdf', 1, '2025-01-22 20:39:47', '2025-01-22 20:39:47'),
	(297, 'storage/documentos/escrito/OoNvXCXoMT_DTS CORREO SE NOTIFICA OFICIO IEE-PRE-0010-2025 DIRIGIDO A INTERVENTOS PRD.pdf', 'OoNvXCXoMT_DTS CORREO SE NOTIFICA OFICIO IEE-PRE-0010-2025 DIRIGIDO A INTERVENTOS PRD.pdf', 5, '2025-01-22 20:42:04', '2025-01-22 20:42:04'),
	(298, 'storage/documentos/requisicion/0ISAkssEQX_REQUISICIÓN No.pdf', '0ISAkssEQX_REQUISICIÓN No.pdf', 1, '2025-01-22 20:44:07', '2025-01-22 20:44:07'),
	(299, 'storage/documentos/circular/Raz1tyZpPI_DTS CIRCULAS No IEE-DTS-002-2025 SOLICITUD DE INFORME DE ACTIVIDADES MENSUALES DE SU ÁREA.pdf', 'Raz1tyZpPI_DTS CIRCULAS No IEE-DTS-002-2025 SOLICITUD DE INFORME DE ACTIVIDADES MENSUALES DE SU ÁREA.pdf', 4, '2025-01-22 20:44:57', '2025-01-22 20:44:57'),
	(300, 'storage/documentos/requisicion/4ZuzdXfZgl_REQUISICIÓN No.pdf', '4ZuzdXfZgl_REQUISICIÓN No.pdf', 1, '2025-01-22 20:46:10', '2025-01-22 20:46:10'),
	(301, 'storage/documentos/requisicion/6A4kKOqJrw_REQUISICIÓN No.pdf', '6A4kKOqJrw_REQUISICIÓN No.pdf', 1, '2025-01-22 20:48:39', '2025-01-22 20:48:39'),
	(302, 'storage/documentos/circular/1fLAEUby9L_SECRETARIA CIRCULAR No IEE-SE-0003-2025 ACUERDO DEL CONSEJO GRAL POR EL CUAL SE CONVOCA A ELECCIONES EXTRAORDINARIAS 2025.pdf', '1fLAEUby9L_SECRETARIA CIRCULAR No IEE-SE-0003-2025 ACUERDO DEL CONSEJO GRAL POR EL CUAL SE CONVOCA A ELECCIONES EXTRAORDINARIAS 2025.pdf', 4, '2025-01-22 20:49:01', '2025-01-22 20:49:01'),
	(303, 'storage/documentos/requisicion/26CtwC5EF2_REQUISICIÓN No.pdf', '26CtwC5EF2_REQUISICIÓN No.pdf', 1, '2025-01-22 20:50:31', '2025-01-22 20:50:31'),
	(304, 'storage/documentos/requisicion/LPJ1ouO18j_REQUISICIÓN No.pdf', 'LPJ1ouO18j_REQUISICIÓN No.pdf', 1, '2025-01-22 20:59:19', '2025-01-22 20:59:19'),
	(305, 'storage/documentos/requisicion/W3MQvM5jbw_REQUISICIÓN No.pdf', 'W3MQvM5jbw_REQUISICIÓN No.pdf', 1, '2025-01-22 21:00:38', '2025-01-22 21:00:38'),
	(306, 'storage/documentos/requisicion/7Gc2dS7V6o_REQUISICIÓN No.pdf', '7Gc2dS7V6o_REQUISICIÓN No.pdf', 1, '2025-01-22 21:08:10', '2025-01-22 21:08:10'),
	(307, 'storage/documentos/requisicion/lS4L27PvEy_REQUISICIÓN No.pdf', 'lS4L27PvEy_REQUISICIÓN No.pdf', 1, '2025-01-22 21:09:15', '2025-01-22 21:09:15'),
	(308, 'storage/documentos/requisicion/6wl67kvwBP_REQUISICIÓN No.pdf', '6wl67kvwBP_REQUISICIÓN No.pdf', 1, '2025-01-22 21:10:19', '2025-01-22 21:10:19'),
	(309, 'storage/documentos/requisicion/9ANgISB3K4_REQUISICIÓN No.pdf', '9ANgISB3K4_REQUISICIÓN No.pdf', 1, '2025-01-22 21:11:22', '2025-01-22 21:11:22'),
	(310, 'storage/documentos/requisicion/Rzcln7o3dk_REQUISICIÓN No.pdf', 'Rzcln7o3dk_REQUISICIÓN No.pdf', 1, '2025-01-22 21:19:03', '2025-01-22 21:19:03'),
	(311, 'storage/documentos/requisicion/nzyljIE9r2_REQUISICIÓN No.pdf', 'nzyljIE9r2_REQUISICIÓN No.pdf', 1, '2025-01-22 21:22:32', '2025-01-22 21:22:32'),
	(312, 'storage/documentos/requisicion/cGHgLBacTg_REQUISICIÓN No.pdf', 'cGHgLBacTg_REQUISICIÓN No.pdf', 1, '2025-01-22 21:24:10', '2025-01-22 21:24:10'),
	(313, 'storage/documentos/requisicion/N9dlZpx7I6_REQUISICIÓN No.pdf', 'N9dlZpx7I6_REQUISICIÓN No.pdf', 1, '2025-01-22 21:26:53', '2025-01-22 21:26:53'),
	(314, 'storage/documentos/memorandum/rY9OsYZ0CT_PRESIDENCIA memo-0295-2025 solicitud de baja de mbiliario Daniel.pdf', 'rY9OsYZ0CT_PRESIDENCIA memo-0295-2025 solicitud de baja de mbiliario Daniel.pdf', 2, '2025-01-22 21:31:32', '2025-01-22 21:31:32'),
	(315, 'storage/documentos/requisicion/RK0GXhL1ch_REQUISICIÓN No.pdf', 'RK0GXhL1ch_REQUISICIÓN No.pdf', 1, '2025-01-22 21:35:07', '2025-01-22 21:35:07'),
	(316, 'storage/documentos/requisicion/0ODWuKp62y_REQUISICIÓN No.pdf', '0ODWuKp62y_REQUISICIÓN No.pdf', 1, '2025-01-22 21:36:52', '2025-01-22 21:36:52'),
	(317, 'storage/documentos/requisicion/6MMke3RJAj_REQUISICIÓN No.pdf', '6MMke3RJAj_REQUISICIÓN No.pdf', 1, '2025-01-22 21:42:29', '2025-01-22 21:42:29'),
	(318, 'storage/documentos/requisicion/2OsytbCVcK_REQUISICIÓN No.pdf', '2OsytbCVcK_REQUISICIÓN No.pdf', 1, '2025-01-22 21:44:40', '2025-01-22 21:44:40'),
	(319, 'storage/documentos/requisicion/dnkqN8rAUt_REQUISICIÓN No.pdf', 'dnkqN8rAUt_REQUISICIÓN No.pdf', 1, '2025-01-22 21:46:52', '2025-01-22 21:46:52'),
	(320, 'storage/documentos/requisicion/CqP1xdJiDb_REQUISICIÓN No.pdf', 'CqP1xdJiDb_REQUISICIÓN No.pdf', 1, '2025-01-22 21:50:00', '2025-01-22 21:50:00'),
	(321, 'storage/documentos/requisicion/loq8rQTz9m_REQUISICIÓN No.pdf', 'loq8rQTz9m_REQUISICIÓN No.pdf', 1, '2025-01-22 21:51:38', '2025-01-22 21:51:38'),
	(322, 'storage/documentos/requisicion/zYDtnKHybe_REQUISICIÓN No.pdf', 'zYDtnKHybe_REQUISICIÓN No.pdf', 1, '2025-01-22 21:54:13', '2025-01-22 21:54:13'),
	(323, 'storage/documentos/memorandum/zSOYx2rvk9_JURIDICO MEMORANDUM No IEE-DJ-0152-2025 SE SOLICITA INFORMACION DE DOMICILIOS DE DEMANDADOS.pdf', 'zSOYx2rvk9_JURIDICO MEMORANDUM No IEE-DJ-0152-2025 SE SOLICITA INFORMACION DE DOMICILIOS DE DEMANDADOS.pdf', 2, '2025-01-22 22:04:26', '2025-01-22 22:04:26'),
	(324, 'storage/documentos/escrito/rMdp5FI2Dq_IGUALDAD CORREO CONFERENCIA TODOS LOS DIAS SON 25 DE NOVIEMBRE.pdf', 'rMdp5FI2Dq_IGUALDAD CORREO CONFERENCIA TODOS LOS DIAS SON 25 DE NOVIEMBRE.pdf', 5, '2025-01-22 22:07:10', '2025-01-22 22:07:10'),
	(325, 'storage/documentos/circular/4tNsvzWCkE_ARCHIVOS CIRCULAR No IEE-DAR-001-2025 INVITACION AL CURSO EN MATERIA ARCHIVISTA.pdf', '4tNsvzWCkE_ARCHIVOS CIRCULAR No IEE-DAR-001-2025 INVITACION AL CURSO EN MATERIA ARCHIVISTA.pdf', 4, '2025-01-22 22:10:00', '2025-01-22 22:10:00'),
	(326, 'storage/documentos/escrito/l8cwE2CNjM_OFICIALIA CORREO REMITE OFICIO No SACH24.pdf', 'l8cwE2CNjM_OFICIALIA CORREO REMITE OFICIO No SACH24.pdf', 5, '2025-01-22 22:16:04', '2025-01-22 22:16:04'),
	(327, 'storage/documentos/memorandum/q7G2HNkKCb_TRANSPARENCIA MEMORANDUM No IEE-UT-SOL-009-2025 SE SOLICITA INFORMACION DE PRESUPUESTO PROGRAMADO.pdf', 'q7G2HNkKCb_TRANSPARENCIA MEMORANDUM No IEE-UT-SOL-009-2025 SE SOLICITA INFORMACION DE PRESUPUESTO PROGRAMADO.pdf', 2, '2025-01-22 22:20:31', '2025-01-22 22:20:31'),
	(328, 'storage/documentos/escrito/eWu5ICRRJE_OFICIALIA CORREO SE REMITE OFICIO No SG-SSJ-DGAJ-DPOE-034-2025 CON FOLIO.pdf', 'eWu5ICRRJE_OFICIALIA CORREO SE REMITE OFICIO No SG-SSJ-DGAJ-DPOE-034-2025 CON FOLIO.pdf', 5, '2025-01-22 22:27:04', '2025-01-22 22:27:04'),
	(329, 'storage/documentos/memorandum/Y2bHyVNoRL_TRANSPARENCIA MEMORANDUM No IEE-UT-SOL-007-2025 SE SOLICITA INFORMACION RECIBIDA VIA CORREO ELECTRONICO Y REGISTRADA SISAI.pdf', 'Y2bHyVNoRL_TRANSPARENCIA MEMORANDUM No IEE-UT-SOL-007-2025 SE SOLICITA INFORMACION RECIBIDA VIA CORREO ELECTRONICO Y REGISTRADA SISAI.pdf', 2, '2025-01-22 22:30:40', '2025-01-22 22:30:40'),
	(330, 'storage/documentos/memorandum/7Tnk4jZ7yf_COMUNICACIÓN memo-036-2025 bajar boletínes Archivo.pdf', '7Tnk4jZ7yf_COMUNICACIÓN memo-036-2025 bajar boletínes Archivo.pdf', 2, '2025-01-22 22:36:59', '2025-01-22 22:36:59'),
	(331, 'storage/documentos/escrito/czVGAoyhx4_DOE CORREO SE SOLICITA VALIDACION DE MONTOS DE GARANTIAS JUNTAS AUXILIARES.pdf', 'czVGAoyhx4_DOE CORREO SE SOLICITA VALIDACION DE MONTOS DE GARANTIAS JUNTAS AUXILIARES.pdf', 5, '2025-01-22 22:37:13', '2025-01-22 22:37:13'),
	(332, 'storage/documentos/memorandum/s90V0IbH3T_UFD memo-096-2025 se solicita someter a junta ejecutiva retabulación y comsiones del personal permanente Cuarto.pdf', 's90V0IbH3T_UFD memo-096-2025 se solicita someter a junta ejecutiva retabulación y comsiones del personal permanente Cuarto.pdf', 2, '2025-01-22 22:40:51', '2025-01-22 22:40:51'),
	(333, 'storage/documentos/escrito/GAiCo13OAh_SIVOPLE IEE CORREO CALENDARIO DE COORDINACION ELECCION EXTRAORDINARIA EN PUEBLA.pdf', 'GAiCo13OAh_SIVOPLE IEE CORREO CALENDARIO DE COORDINACION ELECCION EXTRAORDINARIA EN PUEBLA.pdf', 5, '2025-01-22 22:42:30', '2025-01-22 22:42:30'),
	(334, 'storage/documentos/escrito/3C80hrXmm4_SIVOPLE IEE INFORMACION PARA ACTAS DE CIERRE.pdf', '3C80hrXmm4_SIVOPLE IEE INFORMACION PARA ACTAS DE CIERRE.pdf', 5, '2025-01-22 22:45:13', '2025-01-22 22:45:13'),
	(335, 'storage/documentos/escrito/EeGDs3a87a_ADMINISTRATIVO MODIFICACION EN BITACORA DE TAREAS DE DICIEMBRE  2024.pdf', 'EeGDs3a87a_ADMINISTRATIVO MODIFICACION EN BITACORA DE TAREAS DE DICIEMBRE  2024.pdf', 5, '2025-01-22 22:50:10', '2025-01-22 22:50:10'),
	(336, 'storage/documentos/oficio/LSa2N7H7yb_PRESIDENCIA OFICIO No IEE-PRE-0010-2025 SE INFORMA DESIGNACION DE REPRESENTANTE PROPIETARIO DEL OTRORA PARTIDO DE LA REVOLUCION DEMOCRATICA.pdf', 'LSa2N7H7yb_PRESIDENCIA OFICIO No IEE-PRE-0010-2025 SE INFORMA DESIGNACION DE REPRESENTANTE PROPIETARIO DEL OTRORA PARTIDO DE LA REVOLUCION DEMOCRATICA.pdf', 3, '2025-01-22 22:56:52', '2025-01-22 22:56:52'),
	(337, 'storage/documentos/circular/UEcNRI2Ocv_PLANEACION CIRCULAR No IEE-SPE-001-2025 SOLICITUD O RATIFICACION DE LA PERSONA QUE DESEMPEÑARA LA FUNCION DE ENLACE CON LA SPE.pdf', 'UEcNRI2Ocv_PLANEACION CIRCULAR No IEE-SPE-001-2025 SOLICITUD O RATIFICACION DE LA PERSONA QUE DESEMPEÑARA LA FUNCION DE ENLACE CON LA SPE.pdf', 4, '2025-01-22 23:01:34', '2025-01-22 23:01:34'),
	(338, 'storage/documentos/oficio/JqLmcvNX39_PRESIDENCIA OFICIO No IEE-PRE-0013-2025 DESIGNACION DE ENLACE PARA AUDITORIA.pdf', 'JqLmcvNX39_PRESIDENCIA OFICIO No IEE-PRE-0013-2025 DESIGNACION DE ENLACE PARA AUDITORIA.pdf', 3, '2025-01-22 23:09:54', '2025-01-22 23:09:54'),
	(339, 'storage/documentos/escrito/SCSEcM9siO_PLANEACIÓN circular-001-2025 solicitud de ratificación de la persona que desempeñará la función de enlace con la spe Emir.pdf', 'SCSEcM9siO_PLANEACIÓN circular-001-2025 solicitud de ratificación de la persona que desempeñará la función de enlace con la spe Emir.pdf', 5, '2025-01-22 23:37:58', '2025-01-22 23:37:58'),
	(340, 'storage/documentos/memorandum/RQ0njEcMjw_IGUALDAD memo-003-2025 se informa terminación de contrato Cuarto.pdf', 'RQ0njEcMjw_IGUALDAD memo-003-2025 se informa terminación de contrato Cuarto.pdf', 2, '2025-01-22 23:42:40', '2025-01-22 23:42:40'),
	(341, 'storage/documentos/memorandum/K3PTb17SLL_INFORMÁTICA memo-009-2025 correos institucionales Archivo.pdf', 'K3PTb17SLL_INFORMÁTICA memo-009-2025 correos institucionales Archivo.pdf', 2, '2025-01-22 23:44:13', '2025-01-22 23:44:13'),
	(342, 'storage/documentos/memorandum/492WVj4xHl_INFORMÁTICA memo-008-2025 sistema curso para personas aspirantes a un cargo de elección popular Archivo.pdf', '492WVj4xHl_INFORMÁTICA memo-008-2025 sistema curso para personas aspirantes a un cargo de elección popular Archivo.pdf', 2, '2025-01-22 23:45:56', '2025-01-22 23:45:56'),
	(343, 'storage/documentos/memorandum/5qshEeBF5R_INFORMÁTICA memo-005-2025 guías e inventarios 2024 Archivo.pdf', '5qshEeBF5R_INFORMÁTICA memo-005-2025 guías e inventarios 2024 Archivo.pdf', 2, '2025-01-22 23:47:44', '2025-01-22 23:47:44'),
	(344, 'storage/documentos/tarjeta/3JIs0Smc4f_INFORMÁTICA escrito víctor alejandro torres espinosa.pdf', '3JIs0Smc4f_INFORMÁTICA escrito víctor alejandro torres espinosa.pdf', 6, '2025-01-22 23:57:11', '2025-01-22 23:57:11'),
	(345, 'storage/documentos/memorandum/fQhwXnYCPh_INFORMÁTICA memo-004-2025 información solicitada Archivo.pdf', 'fQhwXnYCPh_INFORMÁTICA memo-004-2025 información solicitada Archivo.pdf', 2, '2025-01-22 23:59:49', '2025-01-22 23:59:49'),
	(346, 'storage/documentos/memorandum/AEkjnPOY1G_INFORMÁTICA memo-003-2025 correo institucional Archivo.pdf', 'AEkjnPOY1G_INFORMÁTICA memo-003-2025 correo institucional Archivo.pdf', 2, '2025-01-23 00:05:50', '2025-01-23 00:05:50'),
	(347, 'storage/documentos/escrito/aI0lM3QbLD_SIVOPLE IEE CORREO SE REMITE OFICIO INE-UTVOPL-25-2025.pdf', 'aI0lM3QbLD_SIVOPLE IEE CORREO SE REMITE OFICIO INE-UTVOPL-25-2025.pdf', 5, '2025-01-23 14:28:07', '2025-01-23 14:28:07'),
	(348, 'storage/documentos/memorandum/1tU83nH8AX_TRANSPARENCIA MEMORANDUM-UT-009-2025  SE SOLICITA INFORMACION.pdf', '1tU83nH8AX_TRANSPARENCIA MEMORANDUM-UT-009-2025  SE SOLICITA INFORMACION.pdf', 2, '2025-01-23 14:34:05', '2025-01-23 14:34:05'),
	(349, 'storage/documentos/memorandum/ZfTfrvnuMU_INFORMATICA MEMORANDUM NoIEE-CIN-004-2025 SE SOLICITA INFORMACION SOBRE LOS CORREOS INSTITUCIONALES.pdf', 'ZfTfrvnuMU_INFORMATICA MEMORANDUM NoIEE-CIN-004-2025 SE SOLICITA INFORMACION SOBRE LOS CORREOS INSTITUCIONALES.pdf', 2, '2025-01-23 14:37:39', '2025-01-23 14:37:39'),
	(350, 'storage/documentos/circular/btw9D5WzqY_SECRETARIA CIRCULAR No IEE-SE-011-2025 SE SOLICITA INFORMACION DE PROPUESTA PARA RETABULACION DE PERSONAL A CARGO.pdf', 'btw9D5WzqY_SECRETARIA CIRCULAR No IEE-SE-011-2025 SE SOLICITA INFORMACION DE PROPUESTA PARA RETABULACION DE PERSONAL A CARGO.pdf', 4, '2025-01-23 14:42:42', '2025-01-23 14:42:42'),
	(351, 'storage/documentos/memorandum/bgXHNpQDls_FISCALIZACION MEMORANDUM No IEE-UTF-0007-25 PROPUESTA PARA RETABULACION.pdf', 'bgXHNpQDls_FISCALIZACION MEMORANDUM No IEE-UTF-0007-25 PROPUESTA PARA RETABULACION.pdf', 2, '2025-01-23 14:46:03', '2025-01-23 14:46:03'),
	(352, 'storage/documentos/memorandum/DfVCVFrdJp_CAPACITACION MEMORANDUM No IEE-DCEEC-012-2025 PROPUESTA DE RETABULACION.pdf', 'DfVCVFrdJp_CAPACITACION MEMORANDUM No IEE-DCEEC-012-2025 PROPUESTA DE RETABULACION.pdf', 2, '2025-01-23 14:49:10', '2025-01-23 14:49:10'),
	(353, 'storage/documentos/memorandum/YnnPHkwJ1e_Memorándum No.pdf', 'YnnPHkwJ1e_Memorándum No.pdf', 2, '2025-01-23 17:42:19', '2025-01-23 17:42:19'),
	(354, 'storage/documentos/oficio/hNjSixTd3K_SECRETARÍA DE PLANEACIÓN, FINANZAS Y ADMINISTRACIÓN se solicita inventario general de los bienes muebls e intangibles los primeros 10 días de cada mes Daniel.pdf', 'hNjSixTd3K_SECRETARÍA DE PLANEACIÓN, FINANZAS Y ADMINISTRACIÓN se solicita inventario general de los bienes muebls e intangibles los primeros 10 días de cada mes Daniel.pdf', 3, '2025-01-23 18:33:28', '2025-01-23 18:33:28'),
	(355, 'storage/documentos/escrito/6aYiZDotov_CORREO tepeaca constancia de situación fiscal Eder-Saúl.pdf', '6aYiZDotov_CORREO tepeaca constancia de situación fiscal Eder-Saúl.pdf', 5, '2025-01-23 18:56:54', '2025-01-23 18:56:54'),
	(356, 'storage/documentos/escrito/EVN54vhH9K_DOE correo oficio iee-doe-010-2025 solicitud de documentos Eder.pdf', 'EVN54vhH9K_DOE correo oficio iee-doe-010-2025 solicitud de documentos Eder.pdf', 5, '2025-01-23 19:40:31', '2025-01-23 19:40:31'),
	(357, 'storage/documentos/escrito/ztGktQPDoU_DOE correo oficio iee-doe-009-2025 solicitud de documentos Eder.pdf', 'ztGktQPDoU_DOE correo oficio iee-doe-009-2025 solicitud de documentos Eder.pdf', 5, '2025-01-23 19:56:21', '2025-01-23 19:56:21'),
	(358, 'storage/documentos/requisicion/QHOe2T6auB_REQUISICIÓN No.pdf', 'QHOe2T6auB_REQUISICIÓN No.pdf', 1, '2025-01-23 20:00:19', '2025-01-23 20:00:19'),
	(359, 'storage/documentos/requisicion/QwkesEUTNI_REQUISICIÓN No.pdf', 'QwkesEUTNI_REQUISICIÓN No.pdf', 1, '2025-01-23 20:01:57', '2025-01-23 20:01:57'),
	(360, 'storage/documentos/requisicion/F9OB52wK3q_REQUISICIÓN No.pdf', 'F9OB52wK3q_REQUISICIÓN No.pdf', 1, '2025-01-23 20:03:02', '2025-01-23 20:03:02'),
	(361, 'storage/documentos/requisicion/8sjkxNYUwQ_REQUISICIÓN No.pdf', '8sjkxNYUwQ_REQUISICIÓN No.pdf', 1, '2025-01-23 20:04:55', '2025-01-23 20:04:55'),
	(362, 'storage/documentos/requisicion/PoIdy7OPzY_REQUISICIÓN No.pdf', 'PoIdy7OPzY_REQUISICIÓN No.pdf', 1, '2025-01-23 20:30:40', '2025-01-23 20:30:40'),
	(363, 'storage/documentos/requisicion/hUZhYhDvUY_REQUISICIÓN No.pdf', 'hUZhYhDvUY_REQUISICIÓN No.pdf', 1, '2025-01-23 20:34:41', '2025-01-23 20:34:41'),
	(364, 'storage/documentos/requisicion/Fdp82DSTcf_REQUISICIÓN No.pdf', 'Fdp82DSTcf_REQUISICIÓN No.pdf', 1, '2025-01-23 20:38:38', '2025-01-23 20:38:38'),
	(365, 'storage/documentos/requisicion/uZCDJmZnmY_REQUISICIÓN No.pdf', 'uZCDJmZnmY_REQUISICIÓN No.pdf', 1, '2025-01-23 20:41:52', '2025-01-23 20:41:52'),
	(366, 'storage/documentos/requisicion/Zn75BHGSeA_REQUISICIÓN No.pdf', 'Zn75BHGSeA_REQUISICIÓN No.pdf', 1, '2025-01-23 20:43:26', '2025-01-23 20:43:26'),
	(367, 'storage/documentos/requisicion/d8OkDiWSb9_REQUISICIÓN No.pdf', 'd8OkDiWSb9_REQUISICIÓN No.pdf', 1, '2025-01-23 20:44:51', '2025-01-23 20:44:51'),
	(368, 'storage/documentos/requisicion/AnKMiuagiX_REQUISICIÓN No.pdf', 'AnKMiuagiX_REQUISICIÓN No.pdf', 1, '2025-01-23 20:57:31', '2025-01-23 20:57:31'),
	(369, 'storage/documentos/memorandum/lwLcLRQ1Dd_UFD memo-106-2025 se solicita información a la brevedad Emir-Cuarto.pdf', 'lwLcLRQ1Dd_UFD memo-106-2025 se solicita información a la brevedad Emir-Cuarto.pdf', 2, '2025-01-23 21:31:25', '2025-01-23 21:31:25'),
	(370, 'storage/documentos/circular/lVjlaALbm8_CONTRALORÍA circular-ci-c-002-2025 entrega de fotobotones 56 pzas Archivo.pdf', 'lVjlaALbm8_CONTRALORÍA circular-ci-c-002-2025 entrega de fotobotones 56 pzas Archivo.pdf', 4, '2025-01-23 21:46:18', '2025-01-23 21:46:18'),
	(371, 'storage/documentos/escrito/rRCAppIA0k_DOE correo-se remite pago y oficio teopatlan Eder-Saúl.pdf', 'rRCAppIA0k_DOE correo-se remite pago y oficio teopatlan Eder-Saúl.pdf', 5, '2025-01-23 21:48:40', '2025-01-23 21:48:40'),
	(372, 'storage/documentos/memorandum/aQZkUubAYk_CONTRALORÍA memo-072-2025 devoución Daniel.pdf', 'aQZkUubAYk_CONTRALORÍA memo-072-2025 devoución Daniel.pdf', 2, '2025-01-23 22:23:53', '2025-01-23 22:23:53'),
	(373, 'storage/documentos/requisicion/7CJ7fm7KQX_REQUISICIÓN No.pdf', '7CJ7fm7KQX_REQUISICIÓN No.pdf', 1, '2025-01-23 22:30:19', '2025-01-23 22:30:19'),
	(374, 'storage/documentos/memorandum/gNCjNrf4K8_INFORMÁTICA memo-011-2025 Archivo.pdf', 'gNCjNrf4K8_INFORMÁTICA memo-011-2025 Archivo.pdf', 2, '2025-01-23 23:52:23', '2025-01-23 23:52:23'),
	(375, 'storage/documentos/escrito/bkLusIk17Y_CONSEJO DE ARMONIZACIÓN CONTABLE remite oficio dc-sc-0099-2025 confirmación de recursos transferidos ejercicio 2024 Emir-Eder.pdf', 'bkLusIk17Y_CONSEJO DE ARMONIZACIÓN CONTABLE remite oficio dc-sc-0099-2025 confirmación de recursos transferidos ejercicio 2024 Emir-Eder.pdf', 5, '2025-01-23 23:56:54', '2025-01-23 23:56:54'),
	(376, 'storage/documentos/memorandum/9RDc8MfQp0_CONTRALORÍA memo-066-2025 remiten hojas de trabajo mes de julio 2024 Eder-Daniel.pdf', '9RDc8MfQp0_CONTRALORÍA memo-066-2025 remiten hojas de trabajo mes de julio 2024 Eder-Daniel.pdf', 2, '2025-01-23 23:59:50', '2025-01-23 23:59:50'),
	(377, 'storage/documentos/memorandum/XV7SJ3BMOI_UFD memo-070-2025 se solicita alta de personal Cuarto.pdf', 'XV7SJ3BMOI_UFD memo-070-2025 se solicita alta de personal Cuarto.pdf', 2, '2025-01-24 17:00:19', '2025-01-24 17:00:19'),
	(378, 'storage/documentos/memorandum/nQPB8idCqj_UFD memo-109-2025 se solicita desincorporación de personal Cuarto.pdf', 'nQPB8idCqj_UFD memo-109-2025 se solicita desincorporación de personal Cuarto.pdf', 2, '2025-01-24 17:02:50', '2025-01-24 17:02:50'),
	(379, 'storage/documentos/memorandum/Q2gW7m1KGX_PRESIDENCIA memo-pre-je-017-2025 Huoston Eder.pdf', 'Q2gW7m1KGX_PRESIDENCIA memo-pre-je-017-2025 Huoston Eder.pdf', 2, '2025-01-24 17:17:24', '2025-01-24 17:17:24'),
	(380, 'storage/documentos/memorandum/LAgJwHgzdT_DOE memo-084-2025 se notifica programación Eder-Saúl-Daniel.pdf', 'LAgJwHgzdT_DOE memo-084-2025 se notifica programación Eder-Saúl-Daniel.pdf', 2, '2025-01-24 17:21:27', '2025-01-24 17:21:27'),
	(381, 'storage/documentos/memorandum/y7d33oWysA_JURÍDICO memo-0237-2025 se remiten renuncias Cuarto.pdf', 'y7d33oWysA_JURÍDICO memo-0237-2025 se remiten renuncias Cuarto.pdf', 2, '2025-01-24 18:35:24', '2025-01-24 18:35:24'),
	(382, 'storage/documentos/memorandum/nzgu2YhIlK_PRERROGATIVAS memo-0114-2025 se informa partidos políticos Eder-Saúl.pdf', 'nzgu2YhIlK_PRERROGATIVAS memo-0114-2025 se informa partidos políticos Eder-Saúl.pdf', 2, '2025-01-24 18:44:58', '2025-01-24 18:44:58'),
	(383, 'storage/documentos/memorandum/9M1BxDtSqs_PRERROGATIVAS memo-0114-2025 se informa partidos políticos Eder-Saúl.pdf', '9M1BxDtSqs_PRERROGATIVAS memo-0114-2025 se informa partidos políticos Eder-Saúl.pdf', 2, '2025-01-24 19:02:28', '2025-01-24 19:02:28'),
	(384, 'storage/documentos/memorandum/4ErSua5Psh_SECRETARÍA memo-ca-p-0016-2025 sesión de adquisiciones Huoston.pdf', '4ErSua5Psh_SECRETARÍA memo-ca-p-0016-2025 sesión de adquisiciones Huoston.pdf', 2, '2025-01-24 19:09:13', '2025-01-24 19:09:13'),
	(385, 'storage/documentos/tarjeta/BZjDhWcJFl_DA escrito Yazmín Sánchez Bautista Cuarto.pdf', 'BZjDhWcJFl_DA escrito Yazmín Sánchez Bautista Cuarto.pdf', 6, '2025-01-24 19:19:43', '2025-01-24 19:19:43'),
	(386, 'storage/documentos/memorandum/YHIe7ATIZH_PRESIDENCIA memo-0254-2025 Ministración enero Eder-Saúl.pdf', 'YHIe7ATIZH_PRESIDENCIA memo-0254-2025 Ministración enero Eder-Saúl.pdf', 2, '2025-01-24 20:22:17', '2025-01-24 20:22:17'),
	(387, 'storage/documentos/memorandum/q7GRHmzMcJ_INFORMATICA memo-ii-prep-009-2025 listado de entregables Archivo.pdf', 'q7GRHmzMcJ_INFORMATICA memo-ii-prep-009-2025 listado de entregables Archivo.pdf', 2, '2025-01-24 20:41:27', '2025-01-24 20:41:27'),
	(388, 'storage/documentos/memorandum/9aXFPkjfo9_TRANSPARENCIA memo-059-2025 se solicita dar de baja reguldores Daniel.pdf', '9aXFPkjfo9_TRANSPARENCIA memo-059-2025 se solicita dar de baja reguldores Daniel.pdf', 2, '2025-01-24 20:58:33', '2025-01-24 20:58:33'),
	(389, 'storage/documentos/memorandum/zKMxCfb6Hp_UFD memo-063-2025 se remite calificación de exámen Cuarto.pdf', 'zKMxCfb6Hp_UFD memo-063-2025 se remite calificación de exámen Cuarto.pdf', 2, '2025-01-24 21:02:14', '2025-01-24 21:02:14'),
	(390, 'storage/documentos/memorandum/wR06LwZEtP_UFD memo-080-2025 se solicita Alta de personal Cuarto.pdf', 'wR06LwZEtP_UFD memo-080-2025 se solicita Alta de personal Cuarto.pdf', 2, '2025-01-24 21:03:48', '2025-01-24 21:03:48'),
	(391, 'storage/documentos/memorandum/nimditeC6Q_UFD memo-083-2025 se solicita desincorporación de personal Cuarto.pdf', 'nimditeC6Q_UFD memo-083-2025 se solicita desincorporación de personal Cuarto.pdf', 2, '2025-01-24 21:05:36', '2025-01-24 21:05:36'),
	(392, 'storage/documentos/memorandum/hJVdWhZCpq_UFD-081-2025 memo-081-2025 se solicita desincorporación de personal Cuarto.pdf', 'hJVdWhZCpq_UFD-081-2025 memo-081-2025 se solicita desincorporación de personal Cuarto.pdf', 2, '2025-01-24 21:07:33', '2025-01-24 21:07:33'),
	(393, 'storage/documentos/memorandum/3kTJXK7Uvn_COMUNICACIÓN memo-039-2025 boletín 04 Archivo.pdf', '3kTJXK7Uvn_COMUNICACIÓN memo-039-2025 boletín 04 Archivo.pdf', 2, '2025-01-24 21:18:07', '2025-01-24 21:18:07'),
	(394, 'storage/documentos/memorandum/M8C7MSAz3z_UFD-081-2025 memo-081-2025 se solicita desincorporación de personal Cuarto.pdf', 'M8C7MSAz3z_UFD-081-2025 memo-081-2025 se solicita desincorporación de personal Cuarto.pdf', 2, '2025-01-24 21:23:52', '2025-01-24 21:23:52'),
	(395, 'storage/documentos/memorandum/vhXalKFNQ2_TRANSPARENCIA memo-ut-009-2025 se solicita información Eder-Yaz.pdf', 'vhXalKFNQ2_TRANSPARENCIA memo-ut-009-2025 se solicita información Eder-Yaz.pdf', 2, '2025-01-24 21:37:46', '2025-01-24 21:37:46'),
	(396, 'storage/documentos/memorandum/TxBwtFQPO4_FISCALIZACIÓN memo-007-25 se informa personal comisionado Cuarto.pdf', 'TxBwtFQPO4_FISCALIZACIÓN memo-007-25 se informa personal comisionado Cuarto.pdf', 2, '2025-01-24 21:40:58', '2025-01-24 21:40:58'),
	(397, 'storage/documentos/memorandum/F4surLukLd_CONTRALORÍA memo-076-2025 hojas de trabajo del mes de agosto 2024 Eder-Dsniel.pdf', 'F4surLukLd_CONTRALORÍA memo-076-2025 hojas de trabajo del mes de agosto 2024 Eder-Dsniel.pdf', 2, '2025-01-24 22:15:39', '2025-01-24 22:15:39'),
	(398, 'storage/documentos/memorandum/ColEmBAGwF_INFORMÁTICA memo-ii-prep-012-2025 Archivo.pdf', 'ColEmBAGwF_INFORMÁTICA memo-ii-prep-012-2025 Archivo.pdf', 2, '2025-01-24 22:38:34', '2025-01-24 22:38:34'),
	(399, 'storage/documentos/memorandum/nXitD1q54D_SECRETARÍA memo-0398-2025 remite acuerdo Huoston-Alexis.pdf', 'nXitD1q54D_SECRETARÍA memo-0398-2025 remite acuerdo Huoston-Alexis.pdf', 2, '2025-01-24 22:47:26', '2025-01-24 22:47:26'),
	(400, 'storage/documentos/memorandum/voDG2tfVGD_INFORMÁTICA memo-014-2025 sistema curso aspirantes a un cargo de elección popular Archivo.pdf', 'voDG2tfVGD_INFORMÁTICA memo-014-2025 sistema curso aspirantes a un cargo de elección popular Archivo.pdf', 2, '2025-01-24 23:01:45', '2025-01-24 23:01:45'),
	(401, 'storage/documentos/memorandum/W6rai9Mub0_SECRETARÍA memo-0417-2025 remite foio 518 escrito roberto caros ruiz nochebuena Cuarto.pdf', 'W6rai9Mub0_SECRETARÍA memo-0417-2025 remite foio 518 escrito roberto caros ruiz nochebuena Cuarto.pdf', 2, '2025-01-24 23:07:57', '2025-01-24 23:07:57'),
	(402, 'storage/documentos/escrito/WjEiyO9hlh_SIVOPLE solicita remita oficio con recibo de pago Emir-Eder.pdf', 'WjEiyO9hlh_SIVOPLE solicita remita oficio con recibo de pago Emir-Eder.pdf', 5, '2025-01-25 17:40:41', '2025-01-25 17:40:41'),
	(403, 'storage/documentos/escrito/UdxoIUvgBp_SIVOPLE solicita remita oficio con recibo de pago Emir-Eder-.pdf', 'UdxoIUvgBp_SIVOPLE solicita remita oficio con recibo de pago Emir-Eder-.pdf', 5, '2025-01-25 17:42:58', '2025-01-25 17:42:58'),
	(404, 'storage/documentos/escrito/g7EGYzSsMS_SIVOPLE solicita remita oficio con recibo de pago Emir-Eder-.pdf', 'g7EGYzSsMS_SIVOPLE solicita remita oficio con recibo de pago Emir-Eder-.pdf', 5, '2025-01-27 13:56:51', '2025-01-27 13:56:51'),
	(405, 'storage/documentos/memorandum/eBt4sZSQGv_CAPACITACIÓN memo-012-2025 respuesta a circular iee-se-011-2025 Cuarto.pdf', 'eBt4sZSQGv_CAPACITACIÓN memo-012-2025 respuesta a circular iee-se-011-2025 Cuarto.pdf', 2, '2025-01-27 15:37:43', '2025-01-27 15:37:43'),
	(406, 'storage/documentos/circular/NENVTP7wXc_PRESIDENCIA oficio-0013-2025 designación de enlace para auditorías Eder.pdf', 'NENVTP7wXc_PRESIDENCIA oficio-0013-2025 designación de enlace para auditorías Eder.pdf', 4, '2025-01-27 15:39:41', '2025-01-27 15:39:41'),
	(407, 'storage/documentos/escrito/pspoZa0UI4_BANORTE correo tranferencias a cuenta de terceros teopatlán Eder-Saúl.pdf', 'pspoZa0UI4_BANORTE correo tranferencias a cuenta de terceros teopatlán Eder-Saúl.pdf', 5, '2025-01-27 17:29:32', '2025-01-27 17:29:32'),
	(408, 'storage/documentos/escrito/uK6BRiVN5v_BANORTE correo transferencia de cuentas a terceros teopatlán Saíl-Eder.pdf', 'uK6BRiVN5v_BANORTE correo transferencia de cuentas a terceros teopatlán Saíl-Eder.pdf', 5, '2025-01-27 17:31:31', '2025-01-27 17:31:31'),
	(409, 'storage/documentos/circular/pDakdr9sEJ_DOE circular-003-2025 directorio de cme Eder-Daniel, Comprobaciones, Tesorería.pdf', 'pDakdr9sEJ_DOE circular-003-2025 directorio de cme Eder-Daniel, Comprobaciones, Tesorería.pdf', 4, '2025-01-27 18:15:34', '2025-01-27 18:15:34'),
	(410, 'storage/documentos/memorandum/pgDc4BvzcW_JURÍDICO memo-ca-se-0001-2025.pdf', 'pgDc4BvzcW_JURÍDICO memo-ca-se-0001-2025.pdf', 2, '2025-01-27 19:24:26', '2025-01-27 19:24:26'),
	(411, 'storage/documentos/oficio/65FVmDuvdu_PRESIDENCIA oficio-0102-2025 designación de enlaces Cuenta Pública 2024 Eder.pdf', '65FVmDuvdu_PRESIDENCIA oficio-0102-2025 designación de enlaces Cuenta Pública 2024 Eder.pdf', 3, '2025-01-27 19:31:08', '2025-01-27 19:31:08'),
	(412, 'storage/documentos/memorandum/6PqQQR7ahW_DOE memo-092-2025 se notifica programación 25-01-2025 Dniel-Eder.pdf', '6PqQQR7ahW_DOE memo-092-2025 se notifica programación 25-01-2025 Dniel-Eder.pdf', 2, '2025-01-27 19:40:06', '2025-01-27 19:40:06'),
	(413, 'storage/documentos/oficio/RQYtwN6hwJ_Oficio No.pdf', 'RQYtwN6hwJ_Oficio No.pdf', 3, '2025-01-27 19:42:56', '2025-01-27 19:42:56'),
	(414, 'storage/documentos/escrito/jcG5A63bVU_CONTRALORÍA correo informe de acrtividades 1ra.pdf', 'jcG5A63bVU_CONTRALORÍA correo informe de acrtividades 1ra.pdf', 5, '2025-01-27 20:18:14', '2025-01-27 20:18:14'),
	(415, 'storage/documentos/memorandum/q52xFO80Oq_UFD memo-085-2025 se solicita someter a junta ejecutiva plantilla de personal ejerc.pdf', 'q52xFO80Oq_UFD memo-085-2025 se solicita someter a junta ejecutiva plantilla de personal ejerc.pdf', 2, '2025-01-27 21:05:52', '2025-01-27 21:05:52'),
	(416, 'storage/documentos/memorandum/Gaec7bSX1m_UFD memo-086-2025 se solicita someter a junta ejecutiva tabulador de sueldos ejerc.pdf', 'Gaec7bSX1m_UFD memo-086-2025 se solicita someter a junta ejecutiva tabulador de sueldos ejerc.pdf', 2, '2025-01-27 21:08:06', '2025-01-27 21:08:06'),
	(417, 'storage/documentos/oficio/aX3UqsWxke_SECRETRÍA oficio-0197-2025 designación de encargo de despacho Cuarto.pdf', 'aX3UqsWxke_SECRETRÍA oficio-0197-2025 designación de encargo de despacho Cuarto.pdf', 3, '2025-01-27 21:10:01', '2025-01-27 21:10:01'),
	(418, 'storage/documentos/memorandum/PxKmclAvch_PRERROGATIVAS memo-0077-2025 se informa financiamiento público (pan) Eder-Saúl.pdf', 'PxKmclAvch_PRERROGATIVAS memo-0077-2025 se informa financiamiento público (pan) Eder-Saúl.pdf', 2, '2025-01-27 21:19:38', '2025-01-27 21:19:38'),
	(419, 'storage/documentos/memorandum/OKQLfVRHJa_ARCHIVOS memo-030-25 solicitud de baja de resgusrdo Daniel.pdf', 'OKQLfVRHJa_ARCHIVOS memo-030-25 solicitud de baja de resgusrdo Daniel.pdf', 2, '2025-01-27 21:21:49', '2025-01-27 21:21:49'),
	(420, 'storage/documentos/memorandum/cPZ92sipxl_CONSEJERO ARTURO memo-02-2025 se informaque no será posible participar en sesión ordinaria COPEAD Huoston.pdf', 'cPZ92sipxl_CONSEJERO ARTURO memo-02-2025 se informaque no será posible participar en sesión ordinaria COPEAD Huoston.pdf', 2, '2025-01-27 21:24:17', '2025-01-27 21:24:17'),
	(421, 'storage/documentos/oficio/Mv5SActQEw_PRESIDENCIA oficio-0075-2025 solicitud en cambio de administrador y chequeras Saúl.pdf', 'Mv5SActQEw_PRESIDENCIA oficio-0075-2025 solicitud en cambio de administrador y chequeras Saúl.pdf', 3, '2025-01-27 21:28:55', '2025-01-27 21:28:55'),
	(422, 'storage/documentos/oficio/K5UenOabl6_PRESIDENCIA oficio 0082-2025 Solicitud de administrador Saúl.pdf', 'K5UenOabl6_PRESIDENCIA oficio 0082-2025 Solicitud de administrador Saúl.pdf', 3, '2025-01-27 21:35:08', '2025-01-27 21:35:08'),
	(423, 'storage/documentos/oficio/93Z9VDqD8c_PRESIDENCIA oficio-0081-2025 soicitud de cheques de bolsillo Saúl.pdf', '93Z9VDqD8c_PRESIDENCIA oficio-0081-2025 soicitud de cheques de bolsillo Saúl.pdf', 3, '2025-01-27 21:37:35', '2025-01-27 21:37:35'),
	(424, 'storage/documentos/memorandum/fRmtyLpfDx_UFD memo-118-2025 se remite calificación de examen Cuarto.pdf', 'fRmtyLpfDx_UFD memo-118-2025 se remite calificación de examen Cuarto.pdf', 2, '2025-01-27 22:10:33', '2025-01-27 22:10:33'),
	(425, 'storage/documentos/circular/HwPZVxygX8_TRANSPARENCIA circular-ut-005-2025 seguimiento a memo iee-da-063-2025 Luis.pdf', 'HwPZVxygX8_TRANSPARENCIA circular-ut-005-2025 seguimiento a memo iee-da-063-2025 Luis.pdf', 4, '2025-01-28 00:05:47', '2025-01-28 00:05:47'),
	(426, 'storage/documentos/oficio/fTfuiePVJw_SUBSECRETARÍA DE EGRESOS OFICIO DC-SC-006-2025 reunión cuenta pública Eder-Ale.pdf', 'fTfuiePVJw_SUBSECRETARÍA DE EGRESOS OFICIO DC-SC-006-2025 reunión cuenta pública Eder-Ale.pdf', 3, '2025-01-28 00:13:09', '2025-01-28 00:13:09'),
	(427, 'storage/documentos/circular/2lZmjYDK3b_SECRETARÍA circular-014-2025.pdf', '2lZmjYDK3b_SECRETARÍA circular-014-2025.pdf', 4, '2025-01-28 00:17:28', '2025-01-28 00:17:28'),
	(428, 'storage/documentos/escrito/WhLZ6jYELq_CONTRALORÍA observaciones del proyecto del calendario Eder.pdf', 'WhLZ6jYELq_CONTRALORÍA observaciones del proyecto del calendario Eder.pdf', 5, '2025-01-28 00:19:09', '2025-01-28 00:19:09'),
	(429, 'storage/documentos/memorandum/ilzASzQwRT_IGUALDAD MEMORANDUM No IEE-DIN-019-2025 BAJA DE MOBILIARIO.pdf', 'ilzASzQwRT_IGUALDAD MEMORANDUM No IEE-DIN-019-2025 BAJA DE MOBILIARIO.pdf', 2, '2025-01-28 14:46:06', '2025-01-28 14:46:06'),
	(430, 'storage/documentos/circular/PzXJgloZI6_IGUALDAD circular-001-2025  enlaces Eder-Miros-Yaz.pdf', 'PzXJgloZI6_IGUALDAD circular-001-2025  enlaces Eder-Miros-Yaz.pdf', 4, '2025-01-28 14:53:57', '2025-01-28 14:53:57'),
	(431, 'storage/documentos/memorandum/fovOLdAYPn_IGUALDAD memo-008-2025 se informa personal comisionado Cuarto.pdf', 'fovOLdAYPn_IGUALDAD memo-008-2025 se informa personal comisionado Cuarto.pdf', 2, '2025-01-28 14:59:31', '2025-01-28 14:59:31'),
	(432, 'storage/documentos/memorandum/oasvlAjWwM_ARCHIVOS memo-002-25 sobre procedimiento de trasferencia de expedientes 2021  a más tardar 30-01-2024 a las 13 30 horas Ale-Yaz.pdf', 'oasvlAjWwM_ARCHIVOS memo-002-25 sobre procedimiento de trasferencia de expedientes 2021  a más tardar 30-01-2024 a las 13 30 horas Ale-Yaz.pdf', 2, '2025-01-28 15:10:43', '2025-01-28 15:10:43'),
	(433, 'storage/documentos/memorandum/MerZWxl0Kh_ARCHIVO MEMORANDUM No IEE-DAR-028-2025 SOLICITUD DE BAJA DE RESGUARDO.pdf', 'MerZWxl0Kh_ARCHIVO MEMORANDUM No IEE-DAR-028-2025 SOLICITUD DE BAJA DE RESGUARDO.pdf', 2, '2025-01-28 15:15:08', '2025-01-28 15:15:08'),
	(434, 'storage/documentos/memorandum/wHQ8ek4PfL_ARCHIVO MEMORANDUM No IEE-DAR-018-2025 SOLICITUD DE BAJA DE RESGUARDO.pdf', 'wHQ8ek4PfL_ARCHIVO MEMORANDUM No IEE-DAR-018-2025 SOLICITUD DE BAJA DE RESGUARDO.pdf', 2, '2025-01-28 15:20:01', '2025-01-28 15:20:01'),
	(435, 'storage/documentos/memorandum/nNewgJWZ7Q_ARCHIVO MEMORANDUM No IEE-DAR-018-2025 SOLICITUD DE BAJA DE  RESGUARDO.pdf', 'nNewgJWZ7Q_ARCHIVO MEMORANDUM No IEE-DAR-018-2025 SOLICITUD DE BAJA DE  RESGUARDO.pdf', 2, '2025-01-28 15:23:29', '2025-01-28 15:23:29'),
	(436, 'storage/documentos/memorandum/x6W8irwnzY_ARCHIVO MEMORANDUM No IEE-DAR-016-2025 RESPUESTA A LA CIRCULAR No IEE-SE-011-2025.pdf', 'x6W8irwnzY_ARCHIVO MEMORANDUM No IEE-DAR-016-2025 RESPUESTA A LA CIRCULAR No IEE-SE-011-2025.pdf', 2, '2025-01-28 15:36:25', '2025-01-28 15:36:25'),
	(437, 'storage/documentos/memorandum/e6I7hyM58A_ARCHIVO MEMORANDUM No IEE-DAR-021-2025 SOLICITUD DE PROYECTOR.pdf', 'e6I7hyM58A_ARCHIVO MEMORANDUM No IEE-DAR-021-2025 SOLICITUD DE PROYECTOR.pdf', 2, '2025-01-28 15:40:05', '2025-01-28 15:40:05'),
	(438, 'storage/documentos/escrito/980PiiMwtz_DOE CORREO ENTREGA DE MATERIAL DE ACAJETE.pdf', '980PiiMwtz_DOE CORREO ENTREGA DE MATERIAL DE ACAJETE.pdf', 5, '2025-01-28 16:42:07', '2025-01-28 16:42:07'),
	(439, 'storage/documentos/escrito/zyKTbVOcPX_DOE CORREO COMPROBANTES DE PAGO DE LIQUIDO INDELEBLE, MAMPARAS Y URNAS IEE ENERO 2025 TEPEACA.pdf', 'zyKTbVOcPX_DOE CORREO COMPROBANTES DE PAGO DE LIQUIDO INDELEBLE, MAMPARAS Y URNAS IEE ENERO 2025 TEPEACA.pdf', 5, '2025-01-28 16:48:56', '2025-01-28 16:48:56'),
	(440, 'storage/documentos/escrito/erxQO7hNH9_DA CORREO CONOCIMIENTO DEL SAT.pdf', 'erxQO7hNH9_DA CORREO CONOCIMIENTO DEL SAT.pdf', 5, '2025-01-28 16:55:41', '2025-01-28 16:55:41'),
	(441, 'storage/documentos/escrito/4ASXfT3aWY_DOE correo oficio iee-doe-010-2025 solicitud de documentos Eder.pdf', '4ASXfT3aWY_DOE correo oficio iee-doe-010-2025 solicitud de documentos Eder.pdf', 5, '2025-01-28 17:00:24', '2025-01-28 17:00:24'),
	(442, 'storage/documentos/circular/6Ie8DjUdHe_DTS CIRCULAR No IEE-DTS-002-2025 SE SOLICITA A CONSEJO EJECUTIVO SU INFORME DE ACTIVIDADES MENSUAL DE SU ÁREA.pdf', '6Ie8DjUdHe_DTS CIRCULAR No IEE-DTS-002-2025 SE SOLICITA A CONSEJO EJECUTIVO SU INFORME DE ACTIVIDADES MENSUAL DE SU ÁREA.pdf', 4, '2025-01-28 17:04:57', '2025-01-28 17:04:57'),
	(443, 'storage/documentos/memorandum/raaMcvBN6i_INFORMATICA MEMORANDUM No IEE-CIN-003-2025 RESPUESTA A MEMO No IEE-SE-0087-2025 ASIGNACION DE CORREO.pdf', 'raaMcvBN6i_INFORMATICA MEMORANDUM No IEE-CIN-003-2025 RESPUESTA A MEMO No IEE-SE-0087-2025 ASIGNACION DE CORREO.pdf', 2, '2025-01-28 17:12:21', '2025-01-28 17:12:21'),
	(444, 'storage/documentos/memorandum/OG7h5XA2x2_INFORMATICA MEMORANDUM No IEE-CIN-005-2025 GUIAS E INVENTARIOS 2024.pdf', 'OG7h5XA2x2_INFORMATICA MEMORANDUM No IEE-CIN-005-2025 GUIAS E INVENTARIOS 2024.pdf', 2, '2025-01-28 17:15:49', '2025-01-28 17:15:49'),
	(445, 'storage/documentos/memorandum/rtBi2fzVxI_INFORMATICA MEMORANDUM No IEE-CIN-006-2025 CONTESTACION A  MEMO DOE-0053-2025 CORREOS INSTITUCIONALES.pdf', 'rtBi2fzVxI_INFORMATICA MEMORANDUM No IEE-CIN-006-2025 CONTESTACION A  MEMO DOE-0053-2025 CORREOS INSTITUCIONALES.pdf', 2, '2025-01-28 17:20:22', '2025-01-28 17:20:22'),
	(446, 'storage/documentos/memorandum/9pa0d7UahS_INFORMATICA MEMORANDUM No IEE-CIN-007-2025 CONTESTACION A MEMO IEE-DPPP-0065-2025 SISTEMA PARA CM.pdf', '9pa0d7UahS_INFORMATICA MEMORANDUM No IEE-CIN-007-2025 CONTESTACION A MEMO IEE-DPPP-0065-2025 SISTEMA PARA CM.pdf', 2, '2025-01-28 17:25:56', '2025-01-28 17:25:56'),
	(447, 'storage/documentos/memorandum/oVM0pBZCSu_INFORMATICA MEMORANDUM No IEE-CIN-008-2025 SISTEMA CURSO PARA PERSONAS ASPIRANTES A UN CARGO DE ELECCION POPULAR.pdf', 'oVM0pBZCSu_INFORMATICA MEMORANDUM No IEE-CIN-008-2025 SISTEMA CURSO PARA PERSONAS ASPIRANTES A UN CARGO DE ELECCION POPULAR.pdf', 2, '2025-01-28 17:29:49', '2025-01-28 17:29:49'),
	(448, 'storage/documentos/memorandum/hKICRtpuN8_INFORMATICA MEMORANDUM No IEE-CIN-009-2025 CORREOS INSTITUCIONALES.pdf', 'hKICRtpuN8_INFORMATICA MEMORANDUM No IEE-CIN-009-2025 CORREOS INSTITUCIONALES.pdf', 2, '2025-01-28 17:36:25', '2025-01-28 17:36:25'),
	(449, 'storage/documentos/memorandum/7F9VlbkfJY_INFORMATICA MEMORANDUM IEE-II-PREP-005-2025 NOTIFICACION SIVOPLE.pdf', '7F9VlbkfJY_INFORMATICA MEMORANDUM IEE-II-PREP-005-2025 NOTIFICACION SIVOPLE.pdf', 2, '2025-01-28 17:41:16', '2025-01-28 17:41:16'),
	(450, 'storage/documentos/memorandum/YrvyNLcHeA_IGUALDAD MEMORANDUM No IEE-DIND-003-2025 BAJA DE PERSONAL.pdf', 'YrvyNLcHeA_IGUALDAD MEMORANDUM No IEE-DIND-003-2025 BAJA DE PERSONAL.pdf', 2, '2025-01-28 17:46:54', '2025-01-28 17:46:54'),
	(451, 'storage/documentos/memorandum/Rf2aSIRbJk_TRANSPARENCIA MEMORANDUM IEE-UT-008-2025 SE SOLICITA INFORMACION DE COSTOS DE REPRODUCCION DE INFORMACION.pdf', 'Rf2aSIRbJk_TRANSPARENCIA MEMORANDUM IEE-UT-008-2025 SE SOLICITA INFORMACION DE COSTOS DE REPRODUCCION DE INFORMACION.pdf', 2, '2025-01-28 17:50:40', '2025-01-28 17:50:40'),
	(452, 'storage/documentos/memorandum/2q15puHCZJ_SECRETARIA MEMORANDUM No IEE-SE-0417-2025 SE REMITE FOLIO 518.pdf', '2q15puHCZJ_SECRETARIA MEMORANDUM No IEE-SE-0417-2025 SE REMITE FOLIO 518.pdf', 2, '2025-01-28 18:22:08', '2025-01-28 18:22:08'),
	(453, 'storage/documentos/circular/hao0iYtAWo_CONSEJERA ELECTORAL EVANGELINA MENDOZA CORONA.pdf', 'hao0iYtAWo_CONSEJERA ELECTORAL EVANGELINA MENDOZA CORONA.pdf', 4, '2025-01-28 18:26:47', '2025-01-28 18:26:47'),
	(454, 'storage/documentos/tarjeta/jozwkwW8j5_DA ESCRITO DE RENUNCIA.pdf', 'jozwkwW8j5_DA ESCRITO DE RENUNCIA.pdf', 6, '2025-01-28 18:34:06', '2025-01-28 18:34:06'),
	(455, 'storage/documentos/tarjeta/D2dfRQwe01_INFORMATICA ESCRITO DE RENUNCIA VICTOR ALEJANDRO TORRES ESPINOSA.pdf', 'D2dfRQwe01_INFORMATICA ESCRITO DE RENUNCIA VICTOR ALEJANDRO TORRES ESPINOSA.pdf', 6, '2025-01-28 18:37:21', '2025-01-28 18:37:21'),
	(456, 'storage/documentos/escrito/J7RRLcCKfa_BANORTE trámite de acceso a las instalaciones del IEE Amelia-Daniel.pdf', 'J7RRLcCKfa_BANORTE trámite de acceso a las instalaciones del IEE Amelia-Daniel.pdf', 5, '2025-01-28 21:24:14', '2025-01-28 21:24:14'),
	(457, 'storage/documentos/tarjeta/RadZFxFfCr_DOE escrito omar mojica entrega de tarjeta Archivo.pdf', 'RadZFxFfCr_DOE escrito omar mojica entrega de tarjeta Archivo.pdf', 6, '2025-01-28 21:28:42', '2025-01-28 21:28:42'),
	(458, 'storage/documentos/memorandum/VtKwNNgKN8_JURÍDICO memo-ca-se-0003-2025 se remiten bases y anexos Huoston.pdf', 'VtKwNNgKN8_JURÍDICO memo-ca-se-0003-2025 se remiten bases y anexos Huoston.pdf', 2, '2025-01-28 21:32:06', '2025-01-28 21:32:06'),
	(459, 'storage/documentos/escrito/LGtosNQnHz_OFICIALIA DE PARTES folio 549 remite oficio dc-sc-006-2025 Eder-Ale.pdf', 'LGtosNQnHz_OFICIALIA DE PARTES folio 549 remite oficio dc-sc-006-2025 Eder-Ale.pdf', 5, '2025-01-28 22:18:27', '2025-01-28 22:18:27'),
	(460, 'storage/documentos/memorandum/AS6NzK9Ayn_PRERROGATIVAS memo-0122-2025 Eder-Saúl.pdf', 'AS6NzK9Ayn_PRERROGATIVAS memo-0122-2025 Eder-Saúl.pdf', 2, '2025-01-28 22:24:41', '2025-01-28 22:24:41'),
	(461, 'storage/documentos/escrito/Npz9HQgrGh_SECRETARÍA circular-se-015-2025 se informa día inhabil lunes 03 de febrero de 2025.pdf', 'Npz9HQgrGh_SECRETARÍA circular-se-015-2025 se informa día inhabil lunes 03 de febrero de 2025.pdf', 5, '2025-01-28 22:33:44', '2025-01-28 22:33:44'),
	(462, 'storage/documentos/memorandum/SmQnEIBcAd_SECRETARÍA memo-0435-2025 se remite folio 549 oficio-dc-sc-006-2025 Eder-Ale.pdf', 'SmQnEIBcAd_SECRETARÍA memo-0435-2025 se remite folio 549 oficio-dc-sc-006-2025 Eder-Ale.pdf', 2, '2025-01-28 22:44:23', '2025-01-28 22:44:23'),
	(463, 'storage/documentos/circular/nREWtPJHbI_SECRETARÍA circular-014-2025.pdf', 'nREWtPJHbI_SECRETARÍA circular-014-2025.pdf', 4, '2025-01-28 22:58:31', '2025-01-28 22:58:31'),
	(464, 'storage/documentos/circular/JtwAyGCIiR_SECRETARÍA circular-se-015-2025 se informa día inhabil lunes 03 de febrero de 2025.pdf', 'JtwAyGCIiR_SECRETARÍA circular-se-015-2025 se informa día inhabil lunes 03 de febrero de 2025.pdf', 4, '2025-01-28 23:24:40', '2025-01-28 23:24:40'),
	(465, 'storage/documentos/circular/XmSi7OM4FB_PLANEACIÓN circular-003-2025.pdf', 'XmSi7OM4FB_PLANEACIÓN circular-003-2025.pdf', 4, '2025-01-28 23:31:35', '2025-01-28 23:31:35'),
	(466, 'storage/documentos/oficio/5JHVhZmXqn_SECRETARÍA oficio-0234-2025 se remiten acuerdos Huoston.pdf', '5JHVhZmXqn_SECRETARÍA oficio-0234-2025 se remiten acuerdos Huoston.pdf', 3, '2025-01-28 23:35:56', '2025-01-28 23:35:56'),
	(467, 'storage/documentos/memorandum/l3WxD0Bj8q_SECRETARÍA memo-ca-p-0029-2025 reanudación sesión o.pdf', 'l3WxD0Bj8q_SECRETARÍA memo-ca-p-0029-2025 reanudación sesión o.pdf', 2, '2025-01-29 15:30:51', '2025-01-29 15:30:51'),
	(468, 'storage/documentos/circular/J5tGKOB0uV_CONTRALORÍA circular-c-003-2025 entrega de 3 calendarios.pdf', 'J5tGKOB0uV_CONTRALORÍA circular-c-003-2025 entrega de 3 calendarios.pdf', 4, '2025-01-29 18:10:31', '2025-01-29 18:10:31'),
	(469, 'storage/documentos/circular/mPxgNhfr60_ARCHIVOS circular-002-2025 retificación de enlace Berny.pdf', 'mPxgNhfr60_ARCHIVOS circular-002-2025 retificación de enlace Berny.pdf', 4, '2025-01-29 18:11:26', '2025-01-29 18:11:26'),
	(470, 'storage/documentos/memorandum/UUEct1UD57_PRERROGATIVAS memo-0129-2025 revisión de mobiliario Daniel.pdf', 'UUEct1UD57_PRERROGATIVAS memo-0129-2025 revisión de mobiliario Daniel.pdf', 2, '2025-01-29 18:15:58', '2025-01-29 18:15:58'),
	(471, 'storage/documentos/memorandum/4J25WvX2Vr_PRERROGATIVAS memo-0130-2025 devolución de mobiliario Daniel.pdf', '4J25WvX2Vr_PRERROGATIVAS memo-0130-2025 devolución de mobiliario Daniel.pdf', 2, '2025-01-29 18:25:42', '2025-01-29 18:25:42'),
	(472, 'storage/documentos/memorandum/83ZAbSN14G_COMUNICACIÓN memo-017-2025 resp.pdf', '83ZAbSN14G_COMUNICACIÓN memo-017-2025 resp.pdf', 2, '2025-01-30 00:44:17', '2025-01-30 00:44:17'),
	(473, 'storage/documentos/memorandum/yfF5L2Kdxa_COMUNICACIÓN memo-041-2025 Boletín 05 Archivo.pdf', 'yfF5L2Kdxa_COMUNICACIÓN memo-041-2025 Boletín 05 Archivo.pdf', 2, '2025-01-30 00:46:16', '2025-01-30 00:46:16'),
	(474, 'storage/documentos/memorandum/dbl2EaNAbi_DOE memo-0021-2025 se remite información resp a memo da-0006-2025 Huoston.pdf', 'dbl2EaNAbi_DOE memo-0021-2025 se remite información resp a memo da-0006-2025 Huoston.pdf', 2, '2025-01-30 13:44:51', '2025-01-30 13:44:51'),
	(475, 'storage/documentos/memorandum/4IUtaHfotU_DOE memo-0022-2025 se remite información resp a memo-0007-2025 Huoston.pdf', '4IUtaHfotU_DOE memo-0022-2025 se remite información resp a memo-0007-2025 Huoston.pdf', 2, '2025-01-30 13:46:52', '2025-01-30 13:46:52'),
	(476, 'storage/documentos/memorandum/5aVXe1HNGc_DOE memo-0024-2025 se remite información resp.pdf', '5aVXe1HNGc_DOE memo-0024-2025 se remite información resp.pdf', 2, '2025-01-30 13:51:39', '2025-01-30 13:51:39'),
	(477, 'storage/documentos/memorandum/c0NzbTNx53_DTS memo-0192-2025 se informa expediente no localizado Cuarto.pdf', 'c0NzbTNx53_DTS memo-0192-2025 se informa expediente no localizado Cuarto.pdf', 2, '2025-01-30 13:55:09', '2025-01-30 13:55:09'),
	(478, 'storage/documentos/memorandum/7JiQnNLWX8_INFORMÁTICA memo-015-2025 sistema de registro de candidaturas Archivo.pdf', '7JiQnNLWX8_INFORMÁTICA memo-015-2025 sistema de registro de candidaturas Archivo.pdf', 2, '2025-01-30 13:59:09', '2025-01-30 13:59:09'),
	(479, 'storage/documentos/memorandum/LWb8HeMTKH_INFORMÁTICA memo-ii-prep-025-2025 Notificación sivople Archivo.pdf', 'LWb8HeMTKH_INFORMÁTICA memo-ii-prep-025-2025 Notificación sivople Archivo.pdf', 2, '2025-01-30 15:33:49', '2025-01-30 15:33:49'),
	(480, 'storage/documentos/memorandum/oXFe76ezb0_INFORMÁTICA memo-ii-prep-026-2025 notificación sivople Archivo.pdf', 'oXFe76ezb0_INFORMÁTICA memo-ii-prep-026-2025 notificación sivople Archivo.pdf', 2, '2025-01-30 15:35:47', '2025-01-30 15:35:47'),
	(481, 'storage/documentos/escrito/CpvTdvhXfG_JURÍDICO correo versión adecuada-convenio de colaboración iee-ipn Eder-Emir.pdf', 'CpvTdvhXfG_JURÍDICO correo versión adecuada-convenio de colaboración iee-ipn Eder-Emir.pdf', 5, '2025-01-30 15:38:33', '2025-01-30 15:38:33'),
	(482, 'storage/documentos/memorandum/F9xRNOAVqW_PRERROGATIVAS memo-0042-2025 resp circular 011-2025 Cuarto.pdf', 'F9xRNOAVqW_PRERROGATIVAS memo-0042-2025 resp circular 011-2025 Cuarto.pdf', 2, '2025-01-30 15:42:20', '2025-01-30 15:42:20'),
	(483, 'storage/documentos/tarjeta/lJzI8JIRQq_PRESIDENCIA escrito c.pdf', 'lJzI8JIRQq_PRESIDENCIA escrito c.pdf', 6, '2025-01-30 15:44:35', '2025-01-30 15:44:35'),
	(484, 'storage/documentos/escrito/uQd7cARiBO_OFICIALIA DE PARTES remite oficio upp-021-2025 suficiencia presupuestaria Eder-Emir.pdf', 'uQd7cARiBO_OFICIALIA DE PARTES remite oficio upp-021-2025 suficiencia presupuestaria Eder-Emir.pdf', 5, '2025-01-30 15:46:44', '2025-01-30 15:46:44'),
	(485, 'storage/documentos/oficio/maNCTzwN5g_PRESIDENCIA oficio-0074-2025 ampliación inicio de proceso electoral local extraordinario 2025 Emir-Eder.pdf', 'maNCTzwN5g_PRESIDENCIA oficio-0074-2025 ampliación inicio de proceso electoral local extraordinario 2025 Emir-Eder.pdf', 3, '2025-01-30 15:51:13', '2025-01-30 15:51:13'),
	(486, 'storage/documentos/oficio/2P72UNj9ms_SECRETARÍA DE EGRESOS oficio upp-021-2025 Eder-Emir.pdf', '2P72UNj9ms_SECRETARÍA DE EGRESOS oficio upp-021-2025 Eder-Emir.pdf', 3, '2025-01-30 15:56:38', '2025-01-30 15:56:38'),
	(487, 'storage/documentos/memorandum/fZ9Eorh6OZ_UFD-memo-129-2025 se remite incapacidad médica Cuarto.pdf', 'fZ9Eorh6OZ_UFD-memo-129-2025 se remite incapacidad médica Cuarto.pdf', 2, '2025-01-30 16:11:05', '2025-01-30 16:11:05'),
	(488, 'storage/documentos/memorandum/GhgeilvBc6_DOE memo-108-2025 programación para devolución de material electoral Eder-Tesorería.pdf', 'GhgeilvBc6_DOE memo-108-2025 programación para devolución de material electoral Eder-Tesorería.pdf', 2, '2025-01-30 16:13:36', '2025-01-30 16:13:36'),
	(489, 'storage/documentos/memorandum/tmDQ21f3Qx_INFORMÁTICA memo-ii-prep-021-2025 notificación ine Archivo.pdf', 'tmDQ21f3Qx_INFORMÁTICA memo-ii-prep-021-2025 notificación ine Archivo.pdf', 2, '2025-01-30 16:15:26', '2025-01-30 16:15:26'),
	(490, 'storage/documentos/memorandum/WPl7mv7tEV_INFORMÁTICA memo-ii-prep-023-2025 notificación ine Archivo.pdf', 'WPl7mv7tEV_INFORMÁTICA memo-ii-prep-023-2025 notificación ine Archivo.pdf', 2, '2025-01-30 16:16:51', '2025-01-30 16:16:51'),
	(491, 'storage/documentos/memorandum/NO47ZcgCa7_SECRETARÍA memo-0493-2025 se remite folio 623  oficio upp-021-2025 Eder-Emir.pdf', 'NO47ZcgCa7_SECRETARÍA memo-0493-2025 se remite folio 623  oficio upp-021-2025 Eder-Emir.pdf', 2, '2025-01-30 16:19:26', '2025-01-30 16:19:26'),
	(492, 'storage/documentos/memorandum/fHobAKukNM_UFD memo-096-2025 se solicita someter a junta ejecutiva retabulaciones y comisiones Cuarto.pdf', 'fHobAKukNM_UFD memo-096-2025 se solicita someter a junta ejecutiva retabulaciones y comisiones Cuarto.pdf', 2, '2025-01-30 16:21:58', '2025-01-30 16:21:58'),
	(493, 'storage/documentos/memorandum/OW5iG3nNMk_COMUNICACIÓN memo-043-2025 boletín 06 Archivo.pdf', 'OW5iG3nNMk_COMUNICACIÓN memo-043-2025 boletín 06 Archivo.pdf', 2, '2025-01-30 21:19:03', '2025-01-30 21:19:03'),
	(494, 'storage/documentos/memorandum/TdAXZOf4VB_COMUNICACIÓN memo-017-2025 ENLACE Archivo.pdf', 'TdAXZOf4VB_COMUNICACIÓN memo-017-2025 ENLACE Archivo.pdf', 2, '2025-01-30 21:30:52', '2025-01-30 21:30:52'),
	(495, 'storage/documentos/memorandum/DaT7eZO2xt_PRERROGATIVAS memo-0138-2025 se solicita realizar proceso de contratación Cuarto.pdf', 'DaT7eZO2xt_PRERROGATIVAS memo-0138-2025 se solicita realizar proceso de contratación Cuarto.pdf', 2, '2025-01-30 22:36:55', '2025-01-30 22:36:55'),
	(496, 'storage/documentos/memorandum/TOUn8xc3d8_ARCHIVOS memo-041-2025 solicitud de adecuaciones a bodega de archivo de conbcentración Daniel.pdf', 'TOUn8xc3d8_ARCHIVOS memo-041-2025 solicitud de adecuaciones a bodega de archivo de conbcentración Daniel.pdf', 2, '2025-01-30 23:00:21', '2025-01-30 23:00:21'),
	(497, 'storage/documentos/circular/knJYc1Orv8_ARCHIVOS circular-003-2025 Eder-Daniel.pdf', 'knJYc1Orv8_ARCHIVOS circular-003-2025 Eder-Daniel.pdf', 4, '2025-01-30 23:03:04', '2025-01-30 23:03:04'),
	(498, 'storage/documentos/escrito/lqiTc4mi1K_AYUNTAMIENTO DE TEPEACA correo-devolución de material electoral Eder-Saúl.pdf', 'lqiTc4mi1K_AYUNTAMIENTO DE TEPEACA correo-devolución de material electoral Eder-Saúl.pdf', 5, '2025-01-30 23:07:12', '2025-01-30 23:07:12'),
	(499, 'storage/documentos/correo/IJvxuqsfwE_FISCALIZACIÓN montos a descontar del financiamiento público mes de enero de 2025 Saúl.pdf', 'IJvxuqsfwE_FISCALIZACIÓN montos a descontar del financiamiento público mes de enero de 2025 Saúl.pdf', 7, '2025-01-30 23:17:48', '2025-01-30 23:17:48'),
	(500, 'storage/documentos/memorandum/inTeDE85SC_UFD memo-138-2025 desincorporación de personal Cuarto.pdf', 'inTeDE85SC_UFD memo-138-2025 desincorporación de personal Cuarto.pdf', 2, '2025-01-30 23:54:33', '2025-01-30 23:54:33'),
	(501, 'storage/documentos/circular/0bTSwu67Aq_SECRETARÍA circular-019-2025  Eder-Cuarto-Huoston.pdf', '0bTSwu67Aq_SECRETARÍA circular-019-2025  Eder-Cuarto-Huoston.pdf', 4, '2025-01-31 00:03:59', '2025-01-31 00:03:59'),
	(502, 'storage/documentos/escrito/dtii09a1lz_SECRETARÍA correo-temática de capacitación que debe de ser impartida al personal de los órganos transitorios Eder-Caro.pdf', 'dtii09a1lz_SECRETARÍA correo-temática de capacitación que debe de ser impartida al personal de los órganos transitorios Eder-Caro.pdf', 5, '2025-01-31 00:21:30', '2025-01-31 00:21:30'),
	(503, 'storage/documentos/requisicion/zJrIx4WszA_REQUISICIÓN No 100.pdf', 'zJrIx4WszA_REQUISICIÓN No 100.pdf', 1, '2025-01-31 14:45:29', '2025-01-31 14:45:29'),
	(504, 'storage/documentos/requisicion/6JVCbZO7f4_REQUISICIÓN No 154.pdf', '6JVCbZO7f4_REQUISICIÓN No 154.pdf', 1, '2025-01-31 14:50:41', '2025-01-31 14:50:41'),
	(505, 'storage/documentos/requisicion/QHaFCKLQ12_REQUISICIÓN No.pdf', 'QHaFCKLQ12_REQUISICIÓN No.pdf', 1, '2025-01-31 14:53:20', '2025-01-31 14:53:20'),
	(506, 'storage/documentos/requisicion/JD3E5R3d6n_REQUISICIÓN No.pdf', 'JD3E5R3d6n_REQUISICIÓN No.pdf', 1, '2025-01-31 14:57:24', '2025-01-31 14:57:24'),
	(507, 'storage/documentos/requisicion/JGiKhAV4jc_REQUISICIÓN No.pdf', 'JGiKhAV4jc_REQUISICIÓN No.pdf', 1, '2025-01-31 15:02:18', '2025-01-31 15:02:18'),
	(508, 'storage/documentos/requisicion/KGKlcTgMJ6_REQUISICIÓN No.pdf', 'KGKlcTgMJ6_REQUISICIÓN No.pdf', 1, '2025-01-31 15:06:49', '2025-01-31 15:06:49'),
	(509, 'storage/documentos/requisicion/ovgnwEZ4AC_REQUISICIÓN No.pdf', 'ovgnwEZ4AC_REQUISICIÓN No.pdf', 1, '2025-01-31 15:08:37', '2025-01-31 15:08:37'),
	(510, 'storage/documentos/requisicion/wk7PcbdFd9_REQUISICIÓN No.pdf', 'wk7PcbdFd9_REQUISICIÓN No.pdf', 1, '2025-01-31 15:10:09', '2025-01-31 15:10:09'),
	(511, 'storage/documentos/requisicion/idMxJVJMYo_REQUISICIÓN No.pdf', 'idMxJVJMYo_REQUISICIÓN No.pdf', 1, '2025-01-31 15:12:16', '2025-01-31 15:12:16'),
	(512, 'storage/documentos/requisicion/WXyn1xDChf_REQUISICIÓN No.pdf', 'WXyn1xDChf_REQUISICIÓN No.pdf', 1, '2025-01-31 15:13:46', '2025-01-31 15:13:46'),
	(513, 'storage/documentos/requisicion/vebZMtnQ8q_REQUISICIÓN No.pdf', 'vebZMtnQ8q_REQUISICIÓN No.pdf', 1, '2025-01-31 15:20:19', '2025-01-31 15:20:19'),
	(514, 'storage/documentos/requisicion/bOGCjs86IN_REQUISICIÓN No.pdf', 'bOGCjs86IN_REQUISICIÓN No.pdf', 1, '2025-01-31 15:22:00', '2025-01-31 15:22:00'),
	(515, 'storage/documentos/requisicion/d7qK7Deimm_REQUISICIÓN No.pdf', 'd7qK7Deimm_REQUISICIÓN No.pdf', 1, '2025-01-31 15:24:24', '2025-01-31 15:24:24'),
	(516, 'storage/documentos/requisicion/WL7PhBG6lh_REQUISICIÓN No.pdf', 'WL7PhBG6lh_REQUISICIÓN No.pdf', 1, '2025-01-31 15:25:44', '2025-01-31 15:25:44'),
	(517, 'storage/documentos/requisicion/v4NWo4HegH_REQUISICIÓN No.pdf', 'v4NWo4HegH_REQUISICIÓN No.pdf', 1, '2025-01-31 15:28:25', '2025-01-31 15:28:25'),
	(518, 'storage/documentos/requisicion/ogRHMMwp0S_REQUISICIÓN No.pdf', 'ogRHMMwp0S_REQUISICIÓN No.pdf', 1, '2025-01-31 15:29:50', '2025-01-31 15:29:50'),
	(519, 'storage/documentos/requisicion/C5DVsqozFj_REQUISICIÓN No.pdf', 'C5DVsqozFj_REQUISICIÓN No.pdf', 1, '2025-01-31 15:31:07', '2025-01-31 15:31:07'),
	(520, 'storage/documentos/requisicion/TrWGzw3iWa_REQUISICIÓN No.pdf', 'TrWGzw3iWa_REQUISICIÓN No.pdf', 1, '2025-01-31 15:32:45', '2025-01-31 15:32:45'),
	(521, 'storage/documentos/requisicion/fU80drG8Us_REQUISICIÓN No.pdf', 'fU80drG8Us_REQUISICIÓN No.pdf', 1, '2025-01-31 15:34:57', '2025-01-31 15:34:57'),
	(522, 'storage/documentos/memorandum/O4lCMOSC1G_SECRETARÍA memo-ca-p-2025 comité de adquisiciones Eder-Huoston.pdf', 'O4lCMOSC1G_SECRETARÍA memo-ca-p-2025 comité de adquisiciones Eder-Huoston.pdf', 2, '2025-01-31 15:36:44', '2025-01-31 15:36:44'),
	(523, 'storage/documentos/requisicion/sGKCkdQ4lY_REQUISICIÓN No.pdf', 'sGKCkdQ4lY_REQUISICIÓN No.pdf', 1, '2025-01-31 15:37:07', '2025-01-31 15:37:07'),
	(524, 'storage/documentos/requisicion/gYUVk7fsgM_REQUISICIÓN No.pdf', 'gYUVk7fsgM_REQUISICIÓN No.pdf', 1, '2025-01-31 15:38:59', '2025-01-31 15:38:59'),
	(525, 'storage/documentos/requisicion/kzHFPIlzRw_REQUISICIÓN No.pdf', 'kzHFPIlzRw_REQUISICIÓN No.pdf', 1, '2025-01-31 15:40:04', '2025-01-31 15:40:04'),
	(526, 'storage/documentos/requisicion/zaC5BwRAP4_REQUISICIÓN No.pdf', 'zaC5BwRAP4_REQUISICIÓN No.pdf', 1, '2025-01-31 15:42:17', '2025-01-31 15:42:17'),
	(527, 'storage/documentos/requisicion/l6qM8fK4TN_REQUISICIÓN No.pdf', 'l6qM8fK4TN_REQUISICIÓN No.pdf', 1, '2025-01-31 15:45:12', '2025-01-31 15:45:12'),
	(528, 'storage/documentos/requisicion/WcMzZnzICf_REQUISICIÓN No.pdf', 'WcMzZnzICf_REQUISICIÓN No.pdf', 1, '2025-01-31 15:46:21', '2025-01-31 15:46:21'),
	(529, 'storage/documentos/requisicion/8uzhqIXIYp_REQUISICIÓN No.pdf', '8uzhqIXIYp_REQUISICIÓN No.pdf', 1, '2025-01-31 15:47:47', '2025-01-31 15:47:47'),
	(530, 'storage/documentos/requisicion/oDkAHwBYO7_REQUISICIÓN No.pdf', 'oDkAHwBYO7_REQUISICIÓN No.pdf', 1, '2025-01-31 15:49:25', '2025-01-31 15:49:25'),
	(531, 'storage/documentos/requisicion/NWwwJL5jAh_REQUISICIÓN No.pdf', 'NWwwJL5jAh_REQUISICIÓN No.pdf', 1, '2025-01-31 15:50:49', '2025-01-31 15:50:49'),
	(532, 'storage/documentos/requisicion/hOCpUA4n9o_REQUISICIÓN No.pdf', 'hOCpUA4n9o_REQUISICIÓN No.pdf', 1, '2025-01-31 15:52:42', '2025-01-31 15:52:42'),
	(533, 'storage/documentos/requisicion/DD2vLSx4jc_REQUISICIÓN No.pdf', 'DD2vLSx4jc_REQUISICIÓN No.pdf', 1, '2025-01-31 15:56:58', '2025-01-31 15:56:58'),
	(534, 'storage/documentos/requisicion/wtpq8O7pGY_REQUISICIÓN No.pdf', 'wtpq8O7pGY_REQUISICIÓN No.pdf', 1, '2025-01-31 15:58:54', '2025-01-31 15:58:54'),
	(535, 'storage/documentos/requisicion/HoMV4eC6E2_REQUISICIÓN No.pdf', 'HoMV4eC6E2_REQUISICIÓN No.pdf', 1, '2025-01-31 16:00:09', '2025-01-31 16:00:09'),
	(536, 'storage/documentos/requisicion/26tFn3O0iC_REQUISICIÓN No.pdf', '26tFn3O0iC_REQUISICIÓN No.pdf', 1, '2025-01-31 16:03:05', '2025-01-31 16:03:05'),
	(537, 'storage/documentos/requisicion/JjZM06SXSK_REQUISICIÓN No.pdf', 'JjZM06SXSK_REQUISICIÓN No.pdf', 1, '2025-01-31 16:05:10', '2025-01-31 16:05:10'),
	(538, 'storage/documentos/requisicion/ZjXsgVMRLc_REQUISICIÓN No.pdf', 'ZjXsgVMRLc_REQUISICIÓN No.pdf', 1, '2025-01-31 16:06:21', '2025-01-31 16:06:21'),
	(539, 'storage/documentos/requisicion/224iF1AoKA_REQUISICIÓN No.pdf', '224iF1AoKA_REQUISICIÓN No.pdf', 1, '2025-01-31 16:11:23', '2025-01-31 16:11:23'),
	(540, 'storage/documentos/requisicion/WsnFSuc2HG_REQUISICIÓN No.pdf', 'WsnFSuc2HG_REQUISICIÓN No.pdf', 1, '2025-01-31 16:12:56', '2025-01-31 16:12:56'),
	(541, 'storage/documentos/requisicion/xuecRDSNY9_REQUISICIÓN No.pdf', 'xuecRDSNY9_REQUISICIÓN No.pdf', 1, '2025-01-31 16:14:21', '2025-01-31 16:14:21'),
	(542, 'storage/documentos/requisicion/gAEH2H7Ly4_REQUISICIÓN No.pdf', 'gAEH2H7Ly4_REQUISICIÓN No.pdf', 1, '2025-01-31 16:15:41', '2025-01-31 16:15:41'),
	(543, 'storage/documentos/requisicion/bugnWKSiFI_REQUISICIÓN No.pdf', 'bugnWKSiFI_REQUISICIÓN No.pdf', 1, '2025-01-31 16:18:35', '2025-01-31 16:18:35'),
	(544, 'storage/documentos/requisicion/XcOzOn0cEV_REQUISICIÓN No.pdf', 'XcOzOn0cEV_REQUISICIÓN No.pdf', 1, '2025-01-31 16:21:11', '2025-01-31 16:21:11'),
	(545, 'storage/documentos/requisicion/GNMX5S86PR_REQUISICIÓN No.pdf', 'GNMX5S86PR_REQUISICIÓN No.pdf', 1, '2025-01-31 16:22:58', '2025-01-31 16:22:58'),
	(546, 'storage/documentos/requisicion/NJdzb6Qgwn_REQUISICIÓN No.pdf', 'NJdzb6Qgwn_REQUISICIÓN No.pdf', 1, '2025-01-31 16:24:10', '2025-01-31 16:24:10'),
	(547, 'storage/documentos/memorandum/rqojOhzAWm_DTS memo-0199-2025 se informa expediente no localizado Cuarto.pdf', 'rqojOhzAWm_DTS memo-0199-2025 se informa expediente no localizado Cuarto.pdf', 2, '2025-01-31 16:24:45', '2025-01-31 16:24:45'),
	(548, 'storage/documentos/requisicion/M4UwLQTikS_REQUISICIÓN No.pdf', 'M4UwLQTikS_REQUISICIÓN No.pdf', 1, '2025-01-31 16:25:38', '2025-01-31 16:25:38'),
	(549, 'storage/documentos/requisicion/4HxaKRPiC6_REQUISICIÓN No.pdf', '4HxaKRPiC6_REQUISICIÓN No.pdf', 1, '2025-01-31 16:27:09', '2025-01-31 16:27:09'),
	(550, 'storage/documentos/requisicion/zh0RMHTCCf_REQUISICIÓN No.pdf', 'zh0RMHTCCf_REQUISICIÓN No.pdf', 1, '2025-01-31 16:29:15', '2025-01-31 16:29:15'),
	(551, 'storage/documentos/requisicion/JJ6wN1CTto_REQUISICIÓN No.pdf', 'JJ6wN1CTto_REQUISICIÓN No.pdf', 1, '2025-01-31 16:30:44', '2025-01-31 16:30:44'),
	(552, 'storage/documentos/requisicion/89p0EiomDJ_REQUISICIÓN No.pdf', '89p0EiomDJ_REQUISICIÓN No.pdf', 1, '2025-01-31 16:32:06', '2025-01-31 16:32:06'),
	(553, 'storage/documentos/requisicion/wQwfrTQYpi_REQUISICIÓN No.pdf', 'wQwfrTQYpi_REQUISICIÓN No.pdf', 1, '2025-01-31 16:33:25', '2025-01-31 16:33:25'),
	(554, 'storage/documentos/requisicion/gCKd2ocBU3_REQUISICIÓN No.pdf', 'gCKd2ocBU3_REQUISICIÓN No.pdf', 1, '2025-01-31 16:34:37', '2025-01-31 16:34:37'),
	(555, 'storage/documentos/requisicion/ifR6AZSx23_REQUISICIÓN No.pdf', 'ifR6AZSx23_REQUISICIÓN No.pdf', 1, '2025-01-31 16:35:45', '2025-01-31 16:35:45'),
	(556, 'storage/documentos/requisicion/saKcXAkYWp_REQUISICIÓN No.pdf', 'saKcXAkYWp_REQUISICIÓN No.pdf', 1, '2025-01-31 16:36:52', '2025-01-31 16:36:52'),
	(557, 'storage/documentos/requisicion/jvzki6605B_REQUISICIÓN No.pdf', 'jvzki6605B_REQUISICIÓN No.pdf', 1, '2025-01-31 16:38:58', '2025-01-31 16:38:58'),
	(558, 'storage/documentos/requisicion/JW5HKiqZKm_REQUISICIÓN No.pdf', 'JW5HKiqZKm_REQUISICIÓN No.pdf', 1, '2025-01-31 16:40:28', '2025-01-31 16:40:28'),
	(559, 'storage/documentos/requisicion/Rkfp663C8r_REQUISICIÓN No.pdf', 'Rkfp663C8r_REQUISICIÓN No.pdf', 1, '2025-01-31 16:41:23', '2025-01-31 16:41:23'),
	(560, 'storage/documentos/requisicion/b6k94gTHZd_REQUISICIÓN No.pdf', 'b6k94gTHZd_REQUISICIÓN No.pdf', 1, '2025-01-31 16:42:37', '2025-01-31 16:42:37'),
	(561, 'storage/documentos/requisicion/9rUSTfPAfs_REQUISICIÓN No.pdf', '9rUSTfPAfs_REQUISICIÓN No.pdf', 1, '2025-01-31 16:43:43', '2025-01-31 16:43:43'),
	(562, 'storage/documentos/requisicion/KJUlndH9Lh_REQUISICIÓN No.pdf', 'KJUlndH9Lh_REQUISICIÓN No.pdf', 1, '2025-01-31 16:45:04', '2025-01-31 16:45:04'),
	(563, 'storage/documentos/requisicion/TOyCirIllN_REQUISICIÓN No.pdf', 'TOyCirIllN_REQUISICIÓN No.pdf', 1, '2025-01-31 16:46:27', '2025-01-31 16:46:27'),
	(564, 'storage/documentos/requisicion/dkxGkK44hr_REQUISICIÓN No.pdf', 'dkxGkK44hr_REQUISICIÓN No.pdf', 1, '2025-01-31 16:47:21', '2025-01-31 16:47:21'),
	(565, 'storage/documentos/requisicion/DFa9tjT3PA_REQUISICIÓN No.pdf', 'DFa9tjT3PA_REQUISICIÓN No.pdf', 1, '2025-01-31 16:49:13', '2025-01-31 16:49:13'),
	(566, 'storage/documentos/requisicion/XaNvMoKcBB_REQUISICIÓN No.pdf', 'XaNvMoKcBB_REQUISICIÓN No.pdf', 1, '2025-01-31 16:50:39', '2025-01-31 16:50:39'),
	(567, 'storage/documentos/requisicion/MBX5BGKXQW_REQUISICIÓN No.pdf', 'MBX5BGKXQW_REQUISICIÓN No.pdf', 1, '2025-01-31 16:51:56', '2025-01-31 16:51:56'),
	(568, 'storage/documentos/requisicion/7L19xeZkBP_REQUISICIÓN No.pdf', '7L19xeZkBP_REQUISICIÓN No.pdf', 1, '2025-01-31 16:53:09', '2025-01-31 16:53:09'),
	(569, 'storage/documentos/requisicion/bh82HsB9uk_REQUISICIÓN No.pdf', 'bh82HsB9uk_REQUISICIÓN No.pdf', 1, '2025-01-31 16:54:07', '2025-01-31 16:54:07'),
	(570, 'storage/documentos/requisicion/6rbssGACTs_REQUISICIÓN No.pdf', '6rbssGACTs_REQUISICIÓN No.pdf', 1, '2025-01-31 16:55:28', '2025-01-31 16:55:28'),
	(571, 'storage/documentos/requisicion/iQ5qjnck0g_REQUISICIÓN No.pdf', 'iQ5qjnck0g_REQUISICIÓN No.pdf', 1, '2025-01-31 16:56:23', '2025-01-31 16:56:23'),
	(572, 'storage/documentos/memorandum/AAuNXCY1yf_INFORMÁTICA memo-ii-prep-027-2025 notificación INE Eder-Huoston-Emir.pdf', 'AAuNXCY1yf_INFORMÁTICA memo-ii-prep-027-2025 notificación INE Eder-Huoston-Emir.pdf', 2, '2025-01-31 18:16:39', '2025-01-31 18:16:39'),
	(573, 'storage/documentos/memorandum/1L3JjFwBwT_INFORMÁTICA memo-ii-prep-028-2025 notificación INE Eder-Huoston-Franco.pdf', '1L3JjFwBwT_INFORMÁTICA memo-ii-prep-028-2025 notificación INE Eder-Huoston-Franco.pdf', 2, '2025-01-31 18:18:23', '2025-01-31 18:18:23'),
	(574, 'storage/documentos/memorandum/C8EMdxJaga_INFORMÁTICA memo-ii-prep-029-2025 notificación INE Eder-Huoston-Franco.pdf', 'C8EMdxJaga_INFORMÁTICA memo-ii-prep-029-2025 notificación INE Eder-Huoston-Franco.pdf', 2, '2025-01-31 18:20:35', '2025-01-31 18:20:35'),
	(575, 'storage/documentos/memorandum/tDp4YBivZt_SECRETARÍA memo-0507-2025 remite acuerdo cg-ac-0013-2025 Eder-Huoston-Franco.pdf', 'tDp4YBivZt_SECRETARÍA memo-0507-2025 remite acuerdo cg-ac-0013-2025 Eder-Huoston-Franco.pdf', 2, '2025-01-31 18:22:58', '2025-01-31 18:22:58'),
	(576, 'storage/documentos/memorandum/altQoBRyAU_SECRETARÍA memo-0509-2025 remite acuerdo cg-ac-0014-2025 Eder-Huoston-Franco.pdf', 'altQoBRyAU_SECRETARÍA memo-0509-2025 remite acuerdo cg-ac-0014-2025 Eder-Huoston-Franco.pdf', 2, '2025-01-31 18:25:51', '2025-01-31 18:25:51'),
	(577, 'storage/documentos/memorandum/4dyH7E3ItO_SECRETARÍA memo-0513-2025 remite acuerdo cg-ac-0015-2025 Eder-Huoston-Franco.pdf', '4dyH7E3ItO_SECRETARÍA memo-0513-2025 remite acuerdo cg-ac-0015-2025 Eder-Huoston-Franco.pdf', 2, '2025-01-31 18:28:45', '2025-01-31 18:28:45'),
	(578, 'storage/documentos/memorandum/G8RwQS9heS_SECRETARÍA memo-0515-2025 remite acuerdo cg-ac-0016-2025 Eder-Huoston-Franco.pdf', 'G8RwQS9heS_SECRETARÍA memo-0515-2025 remite acuerdo cg-ac-0016-2025 Eder-Huoston-Franco.pdf', 2, '2025-01-31 18:31:38', '2025-01-31 18:31:38'),
	(579, 'storage/documentos/memorandum/UBoGKFYHbO_SECRETARÍA memo-0518-2025 remite acuerdo cg-ac-0017-2025 Eder-Huoston-Franco.pdf', 'UBoGKFYHbO_SECRETARÍA memo-0518-2025 remite acuerdo cg-ac-0017-2025 Eder-Huoston-Franco.pdf', 2, '2025-01-31 18:33:07', '2025-01-31 18:33:07'),
	(580, 'storage/documentos/memorandum/xkY2dx4BXk_SECRETARÍA memo-0521-2025 remite acuerdo cg-ac-0018-2025 Eder-Huoston-Franco.pdf', 'xkY2dx4BXk_SECRETARÍA memo-0521-2025 remite acuerdo cg-ac-0018-2025 Eder-Huoston-Franco.pdf', 2, '2025-01-31 18:34:58', '2025-01-31 18:34:58'),
	(581, 'storage/documentos/memorandum/qQMAr1qwzx_SECRETARÍA memo-0525-2025 remite acuerdo cg-ac-0019-2025 Eder-Huoston-Franco.pdf', 'qQMAr1qwzx_SECRETARÍA memo-0525-2025 remite acuerdo cg-ac-0019-2025 Eder-Huoston-Franco.pdf', 2, '2025-01-31 18:37:15', '2025-01-31 18:37:15'),
	(582, 'storage/documentos/memorandum/2nXUNdA38K_SECRETARÍA memo-0530-2025 remite acuerdo cg-ac-0020-2025 Eder-Huoston-Franco.pdf', '2nXUNdA38K_SECRETARÍA memo-0530-2025 remite acuerdo cg-ac-0020-2025 Eder-Huoston-Franco.pdf', 2, '2025-01-31 18:38:47', '2025-01-31 18:38:47'),
	(583, 'storage/documentos/memorandum/7AB8ihzM2P_SECRETARÍA memo-0534-2025 se remite acuerdo cg-ac-0022-2025 Eder-Cuarto-Franco.pdf', '7AB8ihzM2P_SECRETARÍA memo-0534-2025 se remite acuerdo cg-ac-0022-2025 Eder-Cuarto-Franco.pdf', 2, '2025-01-31 21:00:33', '2025-01-31 21:00:33'),
	(584, 'storage/documentos/tarjeta/8OSg1SqoBJ_CAPACITACIÓN escrito damaso Eder-Cuarto.pdf', '8OSg1SqoBJ_CAPACITACIÓN escrito damaso Eder-Cuarto.pdf', 6, '2025-01-31 21:25:16', '2025-01-31 21:25:16'),
	(585, 'storage/documentos/oficio/tO9RVVRfb1_PRERROGATIVAS oficio-0011-2025 Eder-Saúl.pdf', 'tO9RVVRfb1_PRERROGATIVAS oficio-0011-2025 Eder-Saúl.pdf', 3, '2025-01-31 21:29:14', '2025-01-31 21:29:14'),
	(586, 'storage/documentos/memorandum/jVtYANdtpU_INFORMÁTICA memo-018-2025 sistema de captura de los resultados elec prelimin las actas de escrutinio Archivo.pdf', 'jVtYANdtpU_INFORMÁTICA memo-018-2025 sistema de captura de los resultados elec prelimin las actas de escrutinio Archivo.pdf', 2, '2025-01-31 23:14:26', '2025-01-31 23:14:26'),
	(587, 'storage/documentos/requisicion/pOwgf5z9DJ_REQUISICIÓN No.pdf', 'pOwgf5z9DJ_REQUISICIÓN No.pdf', 1, '2025-02-01 18:07:17', '2025-02-01 18:07:17'),
	(588, 'storage/documentos/requisicion/OnABJB96OH_REQUISICIÓN No.pdf', 'OnABJB96OH_REQUISICIÓN No.pdf', 1, '2025-02-01 18:08:54', '2025-02-01 18:08:54'),
	(589, 'storage/documentos/requisicion/KLh5Wy7Fcs_REQUISICIÓN No.pdf', 'KLh5Wy7Fcs_REQUISICIÓN No.pdf', 1, '2025-02-01 18:10:20', '2025-02-01 18:10:20'),
	(590, 'storage/documentos/requisicion/HcX9AWMQKK_REQUISICIÓN No.pdf', 'HcX9AWMQKK_REQUISICIÓN No.pdf', 1, '2025-02-01 18:11:37', '2025-02-01 18:11:37'),
	(591, 'storage/documentos/requisicion/YMCIzbDM9S_REQUISICIÓN No.pdf', 'YMCIzbDM9S_REQUISICIÓN No.pdf', 1, '2025-02-01 18:12:54', '2025-02-01 18:12:54'),
	(592, 'storage/documentos/requisicion/V5dzYs6QC6_REQUISICIÓN No.pdf', 'V5dzYs6QC6_REQUISICIÓN No.pdf', 1, '2025-02-04 14:10:17', '2025-02-04 14:10:17'),
	(593, 'storage/documentos/escrito/t9sD9BnHkd_UFD reporte general de aystec enero 16-31 2025 Eder-Caro-Jorge-Sol.pdf', 't9sD9BnHkd_UFD reporte general de aystec enero 16-31 2025 Eder-Caro-Jorge-Sol.pdf', 5, '2025-02-04 14:13:30', '2025-02-04 14:13:30'),
	(594, 'storage/documentos/memorandum/04CqDO9EmR_COMUNICACIÓN memo-044-2025 subir galeria fotográfica a la página web.pdf', '04CqDO9EmR_COMUNICACIÓN memo-044-2025 subir galeria fotográfica a la página web.pdf', 2, '2025-02-04 14:33:03', '2025-02-04 14:33:03'),
	(595, 'storage/documentos/requisicion/dRZPuLTNzM_REQUISICIÓN No.pdf', 'dRZPuLTNzM_REQUISICIÓN No.pdf', 1, '2025-02-04 14:35:42', '2025-02-04 14:35:42'),
	(596, 'storage/documentos/requisicion/udkApEZqXD_REQUISICIÓN No.pdf', 'udkApEZqXD_REQUISICIÓN No.pdf', 1, '2025-02-04 14:36:55', '2025-02-04 14:36:55'),
	(597, 'storage/documentos/circular/WbpW7ZteJE_COMUNICACIÓN circular- 02-2025 cobertura de eventos Eder-Huoston.pdf', 'WbpW7ZteJE_COMUNICACIÓN circular- 02-2025 cobertura de eventos Eder-Huoston.pdf', 4, '2025-02-04 19:53:55', '2025-02-04 19:53:55'),
	(598, 'storage/documentos/circular/xgmQ02MI8e_DTS circular-003-2025 temas a someter a junta ejecutiva Eder-Huoston, Daniel.pdf', 'xgmQ02MI8e_DTS circular-003-2025 temas a someter a junta ejecutiva Eder-Huoston, Daniel.pdf', 4, '2025-02-04 20:00:57', '2025-02-04 20:00:57'),
	(599, 'storage/documentos/circular/teBvxBO287_DTS memo-004-2025 temas a someter a consejo general Eder-Huoston.pdf', 'teBvxBO287_DTS memo-004-2025 temas a someter a consejo general Eder-Huoston.pdf', 4, '2025-02-04 20:11:04', '2025-02-04 20:11:04'),
	(600, 'storage/documentos/memorandum/X8FUC9e5AB_JURÍDICO memo-0328-2025 remite relación de asuntos laborales Eder-Huoston.pdf', 'X8FUC9e5AB_JURÍDICO memo-0328-2025 remite relación de asuntos laborales Eder-Huoston.pdf', 2, '2025-02-04 20:13:36', '2025-02-04 20:13:36'),
	(601, 'storage/documentos/circular/l6Vn6nZw17_TRANSPARENCIA circular-007-2025 se solicita agenda de actividades Eder-Luis.pdf', 'l6Vn6nZw17_TRANSPARENCIA circular-007-2025 se solicita agenda de actividades Eder-Luis.pdf', 4, '2025-02-04 20:18:25', '2025-02-04 20:18:25'),
	(602, 'storage/documentos/memorandum/uDUe94verj_DOE memo-112-2025 equipamiento y acondicionamiento bodegas Daniel-Eder.pdf', 'uDUe94verj_DOE memo-112-2025 equipamiento y acondicionamiento bodegas Daniel-Eder.pdf', 2, '2025-02-04 22:54:23', '2025-02-04 22:54:23'),
	(603, 'storage/documentos/memorandum/kzB6iYhFxJ_UFD memo-151-2025 se solicita desincorporación de personal Cuarto.pdf', 'kzB6iYhFxJ_UFD memo-151-2025 se solicita desincorporación de personal Cuarto.pdf', 2, '2025-02-04 22:55:58', '2025-02-04 22:55:58'),
	(604, 'storage/documentos/memorandum/qvKZ0rKnN2_UFD memo-150-2025 solicita disponibilidad presupuestal entrega de incentivos personal del servicio 2024 Eder-Emir-Cuarto.pdf', 'qvKZ0rKnN2_UFD memo-150-2025 solicita disponibilidad presupuestal entrega de incentivos personal del servicio 2024 Eder-Emir-Cuarto.pdf', 2, '2025-02-04 23:01:50', '2025-02-04 23:01:50'),
	(605, 'storage/documentos/memorandum/he3fWqVr3J_UFD memo-146-2025 se solicita desincorporación de personal Cuarto.pdf', 'he3fWqVr3J_UFD memo-146-2025 se solicita desincorporación de personal Cuarto.pdf', 2, '2025-02-04 23:22:24', '2025-02-04 23:22:24'),
	(606, 'storage/documentos/correo/DFHKTy0L0K_INFORMÁTICA ti-02-2025 se realizaron los respaldos de la base de datos enero  Alexis.pdf', 'DFHKTy0L0K_INFORMÁTICA ti-02-2025 se realizaron los respaldos de la base de datos enero  Alexis.pdf', 7, '2025-02-05 00:21:50', '2025-02-05 00:21:50'),
	(607, 'storage/documentos/correo/KuNG0GSNlN_INFORMÁTICA ti-03-2025 se atenfdieron 69 solicitudes de la unidad de tansparencia y 9 de comunicación mes de enero Alexis.pdf', 'KuNG0GSNlN_INFORMÁTICA ti-03-2025 se atenfdieron 69 solicitudes de la unidad de tansparencia y 9 de comunicación mes de enero Alexis.pdf', 7, '2025-02-05 00:25:43', '2025-02-05 00:25:43'),
	(608, 'storage/documentos/correo/lhazJGfqjy_INFORMÁTICA ti-04-2025 se realizaron os respaldos de las bases de datos mes de enero Alexis.pdf', 'lhazJGfqjy_INFORMÁTICA ti-04-2025 se realizaron os respaldos de las bases de datos mes de enero Alexis.pdf', 7, '2025-02-05 00:27:38', '2025-02-05 00:27:38'),
	(609, 'storage/documentos/correo/G43miV3Xw7_INFORMÁTICA ti-05-2025 se instalaron 6 equipos de cómputo  mes de enero Alexis.pdf', 'G43miV3Xw7_INFORMÁTICA ti-05-2025 se instalaron 6 equipos de cómputo  mes de enero Alexis.pdf', 7, '2025-02-05 14:37:03', '2025-02-05 14:37:03'),
	(610, 'storage/documentos/correo/4r8DWG9he9_INFORMÁTICA ti-06-2025 se instalacon 3 servicios de telefonía Alexis.pdf', '4r8DWG9he9_INFORMÁTICA ti-06-2025 se instalacon 3 servicios de telefonía Alexis.pdf', 7, '2025-02-05 14:38:58', '2025-02-05 14:38:58'),
	(611, 'storage/documentos/correo/LikZ5WtPug_INFORMÁTICA ti-07-2025 no se presentaron incidencias de red de voz y datos en órganos transitorios extraordinario Alexis.pdf', 'LikZ5WtPug_INFORMÁTICA ti-07-2025 no se presentaron incidencias de red de voz y datos en órganos transitorios extraordinario Alexis.pdf', 7, '2025-02-05 14:41:51', '2025-02-05 14:41:51'),
	(612, 'storage/documentos/requisicion/IaoHM5uVXY_REQUI No 310.pdf', 'IaoHM5uVXY_REQUI No 310.pdf', 1, '2025-02-05 14:48:59', '2025-02-05 14:48:59'),
	(613, 'storage/documentos/requisicion/sHfoItWOQ9_REQUI No 313.pdf', 'sHfoItWOQ9_REQUI No 313.pdf', 1, '2025-02-05 14:53:10', '2025-02-05 14:53:10'),
	(614, 'storage/documentos/requisicion/TwAjfB79fC_REQUI No 312.pdf', 'TwAjfB79fC_REQUI No 312.pdf', 1, '2025-02-05 14:54:43', '2025-02-05 14:54:43'),
	(615, 'storage/documentos/memorandum/snXMeeWkUR_COMUNICACIÓN memo-048-2025 boletín 07 Archivo.pdf', 'snXMeeWkUR_COMUNICACIÓN memo-048-2025 boletín 07 Archivo.pdf', 2, '2025-02-05 19:47:21', '2025-02-05 19:47:21'),
	(616, 'storage/documentos/memorandum/1Dk9CmDncz_CONTRALORÍA memo-100-2025 verificación en consejos municipales Electorales Eder-Cuarto-Daniel-Poblano.pdf', '1Dk9CmDncz_CONTRALORÍA memo-100-2025 verificación en consejos municipales Electorales Eder-Cuarto-Daniel-Poblano.pdf', 2, '2025-02-05 19:54:11', '2025-02-05 19:54:11'),
	(617, 'storage/documentos/memorandum/lsM3bD420L_DOE memo-114-2025 se remite información Eder-Daniel-Saúl.pdf', 'lsM3bD420L_DOE memo-114-2025 se remite información Eder-Daniel-Saúl.pdf', 2, '2025-02-05 19:59:28', '2025-02-05 19:59:28'),
	(618, 'storage/documentos/memorandum/aWZ7x3W8GC_INFORMÁTICA memo-ii-prep-030-2025 ubicción de casillas Archivo.pdf', 'aWZ7x3W8GC_INFORMÁTICA memo-ii-prep-030-2025 ubicción de casillas Archivo.pdf', 2, '2025-02-05 20:27:05', '2025-02-05 20:27:05'),
	(619, 'storage/documentos/escrito/XYQPtyYMLu_UFD correo-chignahuapan remite oficio iee-ufd-006-2025 Eder-Cuarto.pdf', 'XYQPtyYMLu_UFD correo-chignahuapan remite oficio iee-ufd-006-2025 Eder-Cuarto.pdf', 5, '2025-02-05 20:29:27', '2025-02-05 20:29:27'),
	(620, 'storage/documentos/memorandum/uUtoAhx63I_UFD memo-153-2025 se solicita desincorporación de personal Cuarto.pdf', 'uUtoAhx63I_UFD memo-153-2025 se solicita desincorporación de personal Cuarto.pdf', 2, '2025-02-05 20:40:05', '2025-02-05 20:40:05'),
	(621, 'storage/documentos/memorandum/O594YiIqu1_INFORMÁTICA memo-019-2025.pdf', 'O594YiIqu1_INFORMÁTICA memo-019-2025.pdf', 2, '2025-02-05 20:53:57', '2025-02-05 20:53:57'),
	(622, 'storage/documentos/requisicion/zoUAOYnjzr_REQUI No 311.pdf', 'zoUAOYnjzr_REQUI No 311.pdf', 1, '2025-02-05 21:13:16', '2025-02-05 21:13:16'),
	(623, 'storage/documentos/requisicion/OcnwXKSLqo_REQUI No 293.pdf', 'OcnwXKSLqo_REQUI No 293.pdf', 1, '2025-02-05 21:14:43', '2025-02-05 21:14:43'),
	(624, 'storage/documentos/requisicion/mrbUXh3CaT_REQUI No 292.pdf', 'mrbUXh3CaT_REQUI No 292.pdf', 1, '2025-02-05 21:15:56', '2025-02-05 21:15:56'),
	(625, 'storage/documentos/requisicion/5tsTEXjBWM_REQUI No 291.pdf', '5tsTEXjBWM_REQUI No 291.pdf', 1, '2025-02-05 21:17:19', '2025-02-05 21:17:19'),
	(626, 'storage/documentos/requisicion/RkQPU7Ltd3_REQUI No 290.pdf', 'RkQPU7Ltd3_REQUI No 290.pdf', 1, '2025-02-05 21:18:37', '2025-02-05 21:18:37'),
	(627, 'storage/documentos/requisicion/H8rIeS9PcM_REQUI No 288.pdf', 'H8rIeS9PcM_REQUI No 288.pdf', 1, '2025-02-05 21:20:16', '2025-02-05 21:20:16'),
	(628, 'storage/documentos/requisicion/CBmoRpqEeR_REQUI No 287.pdf', 'CBmoRpqEeR_REQUI No 287.pdf', 1, '2025-02-05 21:21:34', '2025-02-05 21:21:34'),
	(629, 'storage/documentos/requisicion/EMZtGNJpYy_REQUI No 286.pdf', 'EMZtGNJpYy_REQUI No 286.pdf', 1, '2025-02-05 21:22:39', '2025-02-05 21:22:39'),
	(630, 'storage/documentos/requisicion/EKwcxU81Un_REQUI No 284.pdf', 'EKwcxU81Un_REQUI No 284.pdf', 1, '2025-02-05 21:23:44', '2025-02-05 21:23:44'),
	(631, 'storage/documentos/requisicion/pa5SanNDkd_REQUI No 294.pdf', 'pa5SanNDkd_REQUI No 294.pdf', 1, '2025-02-05 21:25:06', '2025-02-05 21:25:06'),
	(632, 'storage/documentos/requisicion/HgEVKrDuEg_REQUI No 370.pdf', 'HgEVKrDuEg_REQUI No 370.pdf', 1, '2025-02-05 22:03:47', '2025-02-05 22:03:47'),
	(633, 'storage/documentos/requisicion/xWlI2TLmdh_REQUI No 334.pdf', 'xWlI2TLmdh_REQUI No 334.pdf', 1, '2025-02-05 22:05:17', '2025-02-05 22:05:17'),
	(634, 'storage/documentos/requisicion/vyLM7cAIJE_REQUI No 333.pdf', 'vyLM7cAIJE_REQUI No 333.pdf', 1, '2025-02-05 22:06:22', '2025-02-05 22:06:22'),
	(635, 'storage/documentos/requisicion/9o0sT2sW2C_REQUI No 332.pdf', '9o0sT2sW2C_REQUI No 332.pdf', 1, '2025-02-05 22:07:36', '2025-02-05 22:07:36'),
	(636, 'storage/documentos/requisicion/BaIEFMLUmk_REQUI No 331.pdf', 'BaIEFMLUmk_REQUI No 331.pdf', 1, '2025-02-05 22:16:54', '2025-02-05 22:16:54'),
	(637, 'storage/documentos/requisicion/s96xjd4ZlD_REQUI No 329.pdf', 's96xjd4ZlD_REQUI No 329.pdf', 1, '2025-02-05 22:21:14', '2025-02-05 22:21:14'),
	(638, 'storage/documentos/requisicion/PuixAb3P3A_REQUI No 328.pdf', 'PuixAb3P3A_REQUI No 328.pdf', 1, '2025-02-05 22:24:54', '2025-02-05 22:24:54'),
	(639, 'storage/documentos/requisicion/GzxPl8LC4F_REQUI No 327.pdf', 'GzxPl8LC4F_REQUI No 327.pdf', 1, '2025-02-05 22:26:05', '2025-02-05 22:26:05'),
	(640, 'storage/documentos/requisicion/4olt5R647P_REQUI No 326.pdf', '4olt5R647P_REQUI No 326.pdf', 1, '2025-02-05 22:27:55', '2025-02-05 22:27:55'),
	(641, 'storage/documentos/requisicion/hm43RPu404_REQUI No 325.pdf', 'hm43RPu404_REQUI No 325.pdf', 1, '2025-02-05 22:29:51', '2025-02-05 22:29:51'),
	(642, 'storage/documentos/requisicion/BZriG9iSiA_REQUI No 324.pdf', 'BZriG9iSiA_REQUI No 324.pdf', 1, '2025-02-05 22:31:29', '2025-02-05 22:31:29'),
	(643, 'storage/documentos/requisicion/Ag6bLuTfvq_REQUI No 323.pdf', 'Ag6bLuTfvq_REQUI No 323.pdf', 1, '2025-02-05 22:33:14', '2025-02-05 22:33:14'),
	(644, 'storage/documentos/requisicion/SVJdv0x8JR_REQUI No 322.pdf', 'SVJdv0x8JR_REQUI No 322.pdf', 1, '2025-02-05 22:36:03', '2025-02-05 22:36:03'),
	(645, 'storage/documentos/requisicion/xQL0SzGo4Z_REQUI No 321.pdf', 'xQL0SzGo4Z_REQUI No 321.pdf', 1, '2025-02-05 22:37:46', '2025-02-05 22:37:46'),
	(646, 'storage/documentos/requisicion/S8chJDMSd0_REQUI No 320.pdf', 'S8chJDMSd0_REQUI No 320.pdf', 1, '2025-02-05 22:39:02', '2025-02-05 22:39:02'),
	(647, 'storage/documentos/requisicion/58Q0TjhP9x_REQUI No 319.pdf', '58Q0TjhP9x_REQUI No 319.pdf', 1, '2025-02-05 22:40:04', '2025-02-05 22:40:04'),
	(648, 'storage/documentos/requisicion/gLkQZ2D1B9_REQUI No 318.pdf', 'gLkQZ2D1B9_REQUI No 318.pdf', 1, '2025-02-05 22:41:50', '2025-02-05 22:41:50'),
	(649, 'storage/documentos/requisicion/RRz4EQTZOK_REQUI No 317.pdf', 'RRz4EQTZOK_REQUI No 317.pdf', 1, '2025-02-05 22:43:05', '2025-02-05 22:43:05'),
	(650, 'storage/documentos/requisicion/WMTLqUxTZS_REQUI No 316.pdf', 'WMTLqUxTZS_REQUI No 316.pdf', 1, '2025-02-05 22:44:21', '2025-02-05 22:44:21'),
	(651, 'storage/documentos/requisicion/XRgCjMlSld_REQUI No 315.pdf', 'XRgCjMlSld_REQUI No 315.pdf', 1, '2025-02-05 22:45:44', '2025-02-05 22:45:44'),
	(652, 'storage/documentos/requisicion/QFR2eX3ZXi_REQUI No 314.pdf', 'QFR2eX3ZXi_REQUI No 314.pdf', 1, '2025-02-05 22:47:11', '2025-02-05 22:47:11'),
	(653, 'storage/documentos/requisicion/bme70Y64mo_REQUI No 313.pdf', 'bme70Y64mo_REQUI No 313.pdf', 1, '2025-02-05 22:48:27', '2025-02-05 22:48:27'),
	(654, 'storage/documentos/requisicion/hDn12wHtge_REQUI No 312.pdf', 'hDn12wHtge_REQUI No 312.pdf', 1, '2025-02-05 22:49:47', '2025-02-05 22:49:47'),
	(655, 'storage/documentos/requisicion/SmDzT9FFi6_REQUI No 311.pdf', 'SmDzT9FFi6_REQUI No 311.pdf', 1, '2025-02-05 22:51:02', '2025-02-05 22:51:02'),
	(656, 'storage/documentos/requisicion/DL96iAXtFK_REQUI No 310.pdf', 'DL96iAXtFK_REQUI No 310.pdf', 1, '2025-02-05 22:52:20', '2025-02-05 22:52:20'),
	(657, 'storage/documentos/requisicion/58EMAT00gR_REQUI No 299.pdf', '58EMAT00gR_REQUI No 299.pdf', 1, '2025-02-05 22:54:08', '2025-02-05 22:54:08'),
	(658, 'storage/documentos/requisicion/6Lnvzhqyiq_REQUI No 293.pdf', '6Lnvzhqyiq_REQUI No 293.pdf', 1, '2025-02-05 22:55:15', '2025-02-05 22:55:15'),
	(659, 'storage/documentos/requisicion/NtJDhpG2m2_REQUI No 343.pdf', 'NtJDhpG2m2_REQUI No 343.pdf', 1, '2025-02-06 14:47:15', '2025-02-06 14:47:15'),
	(660, 'storage/documentos/requisicion/Mxdwo3nNJR_REQUI No 342.pdf', 'Mxdwo3nNJR_REQUI No 342.pdf', 1, '2025-02-06 14:48:59', '2025-02-06 14:48:59'),
	(661, 'storage/documentos/requisicion/H5jAfnNRbP_REQUI No 341.pdf', 'H5jAfnNRbP_REQUI No 341.pdf', 1, '2025-02-06 14:50:26', '2025-02-06 14:50:26'),
	(662, 'storage/documentos/requisicion/v8PMiLpRhP_REQUI No 370.pdf', 'v8PMiLpRhP_REQUI No 370.pdf', 1, '2025-02-06 14:52:10', '2025-02-06 14:52:10'),
	(663, 'storage/documentos/requisicion/HsPoDesaM5_REQUI No 340.pdf', 'HsPoDesaM5_REQUI No 340.pdf', 1, '2025-02-06 14:53:47', '2025-02-06 14:53:47'),
	(664, 'storage/documentos/requisicion/UjCBykvW1H_REQUI No 339.pdf', 'UjCBykvW1H_REQUI No 339.pdf', 1, '2025-02-06 14:56:00', '2025-02-06 14:56:00'),
	(665, 'storage/documentos/requisicion/v4GAI3owjQ_REQUI No 338.pdf', 'v4GAI3owjQ_REQUI No 338.pdf', 1, '2025-02-06 14:58:32', '2025-02-06 14:58:32'),
	(666, 'storage/documentos/requisicion/CI4EoW5ZEX_REQUI No 336.pdf', 'CI4EoW5ZEX_REQUI No 336.pdf', 1, '2025-02-06 15:00:22', '2025-02-06 15:00:22'),
	(667, 'storage/documentos/requisicion/dUC65YUj6u_REQUI No 337.pdf', 'dUC65YUj6u_REQUI No 337.pdf', 1, '2025-02-06 15:01:55', '2025-02-06 15:01:55'),
	(668, 'storage/documentos/memorandum/OdrMmjldPx_INFORMATICO MEMORANDUM No IEE-CIN-019-2025 REUNION DE SISTEMA DE CAPTURA  DE LOS RESULTADOS ELECTORALES DE LAS ACTAS DE ESCRUTINIO Y CÓMPUTO.pdf', 'OdrMmjldPx_INFORMATICO MEMORANDUM No IEE-CIN-019-2025 REUNION DE SISTEMA DE CAPTURA  DE LOS RESULTADOS ELECTORALES DE LAS ACTAS DE ESCRUTINIO Y CÓMPUTO.pdf', 2, '2025-02-06 15:08:11', '2025-02-06 15:08:11'),
	(669, 'storage/documentos/circular/mhlfsLb1n7_SECRETARIA CIRCULAR No IEE-SE-022-2025 ACUERDO CG-AC-0023-2025.pdf', 'mhlfsLb1n7_SECRETARIA CIRCULAR No IEE-SE-022-2025 ACUERDO CG-AC-0023-2025.pdf', 4, '2025-02-06 15:11:26', '2025-02-06 15:11:26'),
	(670, 'storage/documentos/memorandum/Xt5EafWt0U_UFD MEMORANDUM No UFD-158-2025 SE SOLICITA DISPONIBILIDAD PRESUPUESTAL.pdf', 'Xt5EafWt0U_UFD MEMORANDUM No UFD-158-2025 SE SOLICITA DISPONIBILIDAD PRESUPUESTAL.pdf', 2, '2025-02-06 15:14:12', '2025-02-06 15:14:12'),
	(671, 'storage/documentos/oficio/NGGYwg5Bt3_PRESIDENCIA OFICIO No IEE-PRE-0173-2025 SE INFORMA DE NUEVA ASIGNACION DE ENLACE A LA ORDEN DE AUDITORIA.pdf', 'NGGYwg5Bt3_PRESIDENCIA OFICIO No IEE-PRE-0173-2025 SE INFORMA DE NUEVA ASIGNACION DE ENLACE A LA ORDEN DE AUDITORIA.pdf', 3, '2025-02-06 15:20:46', '2025-02-06 15:20:46'),
	(672, 'storage/documentos/memorandum/s0TlOI2UJy_COMUNICACION MEMORANDUM No IEE-CCS-049-2025 BOLETIN 08.pdf', 's0TlOI2UJy_COMUNICACION MEMORANDUM No IEE-CCS-049-2025 BOLETIN 08.pdf', 2, '2025-02-06 15:23:27', '2025-02-06 15:23:27'),
	(673, 'storage/documentos/oficio/ngGaeBE0Xp_SECRETARIA OFICIO No IEE-SE-294-2025 DESIGNACION DE ENCARGADO DE DESPACHO.pdf', 'ngGaeBE0Xp_SECRETARIA OFICIO No IEE-SE-294-2025 DESIGNACION DE ENCARGADO DE DESPACHO.pdf', 3, '2025-02-06 15:28:57', '2025-02-06 15:28:57'),
	(674, 'storage/documentos/oficio/nToNO5Jwgs_SECRETARIA OFICIO No IEE-SE-295-2025 DESIGNACION DE ENCARGO DE DESPACHO.pdf', 'nToNO5Jwgs_SECRETARIA OFICIO No IEE-SE-295-2025 DESIGNACION DE ENCARGO DE DESPACHO.pdf', 3, '2025-02-06 15:32:00', '2025-02-06 15:32:00'),
	(675, 'storage/documentos/memorandum/L4BrZ2G53y_CONTRALORÍA memo-101-2025 bienes obsoletos dañados Daniel-Eder.pdf', 'L4BrZ2G53y_CONTRALORÍA memo-101-2025 bienes obsoletos dañados Daniel-Eder.pdf', 2, '2025-02-06 15:33:57', '2025-02-06 15:33:57'),
	(676, 'storage/documentos/circular/Fm3vxEWBEg_SECRETARÍA circular-0023-2025 se informa día inhabil lunes 10 de febrero de 2025 Daniel Eder.pdf', 'Fm3vxEWBEg_SECRETARÍA circular-0023-2025 se informa día inhabil lunes 10 de febrero de 2025 Daniel Eder.pdf', 4, '2025-02-06 15:34:59', '2025-02-06 15:34:59'),
	(677, 'storage/documentos/escrito/3Z3wvL43ln_SECRETARIA correo remiten adendas de anexo técnico y anexo financiero Eder-Emir.pdf', '3Z3wvL43ln_SECRETARIA correo remiten adendas de anexo técnico y anexo financiero Eder-Emir.pdf', 5, '2025-02-06 23:56:38', '2025-02-06 23:56:38'),
	(678, 'storage/documentos/memorandum/UlsA3x6ctV_JURÍDICO memo-ca-se-0004-2025 se remiten Bases para observación con-inv-iee-002-2025, adj-inv-001-2025 Huoston.pdf', 'UlsA3x6ctV_JURÍDICO memo-ca-se-0004-2025 se remiten Bases para observación con-inv-iee-002-2025, adj-inv-001-2025 Huoston.pdf', 2, '2025-02-07 16:47:07', '2025-02-07 16:47:07'),
	(679, 'storage/documentos/memorandum/5V4MkEejU6_CAPACITACIÓN memo-047-2025 se solicita se realicen trámites administrativos Cuarto.pdf', '5V4MkEejU6_CAPACITACIÓN memo-047-2025 se solicita se realicen trámites administrativos Cuarto.pdf', 2, '2025-02-07 23:50:37', '2025-02-07 23:50:37'),
	(680, 'storage/documentos/memorandum/bMaqEojhx4_CONTRALORÍA memo-108-2025 psgo de fotomultas Daniel Eder.pdf', 'bMaqEojhx4_CONTRALORÍA memo-108-2025 psgo de fotomultas Daniel Eder.pdf', 2, '2025-02-07 23:53:21', '2025-02-07 23:53:21'),
	(681, 'storage/documentos/memorandum/4W6sBl7hI4_INFORMÁTICA memo-ii-prep-032-2025 notificación ine Archivo.pdf', '4W6sBl7hI4_INFORMÁTICA memo-ii-prep-032-2025 notificación ine Archivo.pdf', 2, '2025-02-07 23:58:33', '2025-02-07 23:58:33'),
	(682, 'storage/documentos/memorandum/iYbVqBPi5n_INFORMÁTICA memo-ii-prep-033-2025 notificación ine Archivo.pdf', 'iYbVqBPi5n_INFORMÁTICA memo-ii-prep-033-2025 notificación ine Archivo.pdf', 2, '2025-02-08 14:42:40', '2025-02-08 14:42:40'),
	(683, 'storage/documentos/memorandum/neCfUqN4A6_INFORMÁTICA memo-ii-prep-034-2025 notificación ine Archivo.pdf', 'neCfUqN4A6_INFORMÁTICA memo-ii-prep-034-2025 notificación ine Archivo.pdf', 2, '2025-02-08 14:44:27', '2025-02-08 14:44:27'),
	(684, 'storage/documentos/memorandum/WS6RexI67i_INFORMÁTICA memo-ii-prep-035-2025 notificación ine Archivo.pdf', 'WS6RexI67i_INFORMÁTICA memo-ii-prep-035-2025 notificación ine Archivo.pdf', 2, '2025-02-08 14:47:40', '2025-02-08 14:47:40'),
	(685, 'storage/documentos/memorandum/fDoJQHCFeE_INFORMÁTICA memo-ii-prep-036-2025 notificación ine Archivo.pdf', 'fDoJQHCFeE_INFORMÁTICA memo-ii-prep-036-2025 notificación ine Archivo.pdf', 2, '2025-02-08 15:02:04', '2025-02-08 15:02:04'),
	(686, 'storage/documentos/memorandum/MfQruQSGDz_INFORMÁTICA memo-ii-prep-037-2025 notificación ine Archivo.pdf', 'MfQruQSGDz_INFORMÁTICA memo-ii-prep-037-2025 notificación ine Archivo.pdf', 2, '2025-02-08 15:03:53', '2025-02-08 15:03:53'),
	(687, 'storage/documentos/memorandum/4GILGpETub_JURÍDICO memo-ca-se-0007-2025.pdf', '4GILGpETub_JURÍDICO memo-ca-se-0007-2025.pdf', 2, '2025-02-08 15:06:45', '2025-02-08 15:06:45'),
	(688, 'storage/documentos/memorandum/UFPAFpEL8p_PRERROGATIVAS memo-0161-2025 se remiten recibos originales Eder-Saúl.pdf', 'UFPAFpEL8p_PRERROGATIVAS memo-0161-2025 se remiten recibos originales Eder-Saúl.pdf', 2, '2025-02-08 15:08:50', '2025-02-08 15:08:50'),
	(689, 'storage/documentos/oficio/KdBAntlLIC_PRESIDENCIA oficio-0170-2025 ministración del proceso electoral extraordinario 2025 Emir.pdf', 'KdBAntlLIC_PRESIDENCIA oficio-0170-2025 ministración del proceso electoral extraordinario 2025 Emir.pdf', 3, '2025-02-08 15:16:44', '2025-02-08 15:16:44'),
	(690, 'storage/documentos/oficio/DBCyZcBIXt_PRESIDENCIA oficio-0171-2025 ministración del proceso electoral extraordianrio 2025 Emir.pdf', 'DBCyZcBIXt_PRESIDENCIA oficio-0171-2025 ministración del proceso electoral extraordianrio 2025 Emir.pdf', 3, '2025-02-08 15:25:27', '2025-02-08 15:25:27'),
	(691, 'storage/documentos/oficio/K3oxUqrFaz_PRESIDENCIA oficio-0172-2025 ministración mes de febrero Emir.pdf', 'K3oxUqrFaz_PRESIDENCIA oficio-0172-2025 ministración mes de febrero Emir.pdf', 3, '2025-02-08 15:27:35', '2025-02-08 15:27:35'),
	(692, 'storage/documentos/memorandum/0Vk4wYPAPY_SECRETARÍA memo-ca-p-0092-2025 reanudación de sesión o.pdf', '0Vk4wYPAPY_SECRETARÍA memo-ca-p-0092-2025 reanudación de sesión o.pdf', 2, '2025-02-08 15:30:32', '2025-02-08 15:30:32'),
	(693, 'storage/documentos/memorandum/5Fw7GfpY0H_SECRETARÍA memo-0628-2025 se autoriza certificación Ale.pdf', '5Fw7GfpY0H_SECRETARÍA memo-0628-2025 se autoriza certificación Ale.pdf', 2, '2025-02-08 15:33:27', '2025-02-08 15:33:27'),
	(694, 'storage/documentos/memorandum/jI43PVszRN_SECRETARÍA memo-0629-2025 autorización de certificación Eder-Miros.pdf', 'jI43PVszRN_SECRETARÍA memo-0629-2025 autorización de certificación Eder-Miros.pdf', 2, '2025-02-08 15:36:32', '2025-02-08 15:36:32'),
	(695, 'storage/documentos/memorandum/A7uNwR6HzU_SECRETARÍA memo-ca-p-0080-2025 reanudación de sesión ordinaria del c.pdf', 'A7uNwR6HzU_SECRETARÍA memo-ca-p-0080-2025 reanudación de sesión ordinaria del c.pdf', 2, '2025-02-08 15:38:40', '2025-02-08 15:38:40'),
	(696, 'storage/documentos/memorandum/v0hxaEsNPk_SECRETARÍA memo-0604-2025 Eder-Huoston.pdf', 'v0hxaEsNPk_SECRETARÍA memo-0604-2025 Eder-Huoston.pdf', 2, '2025-02-08 15:40:58', '2025-02-08 15:40:58'),
	(697, 'storage/documentos/memorandum/rfm7LbSmIA_UFD memo-171-2025 se solicita desincorporación de personal Cuarto.pdf', 'rfm7LbSmIA_UFD memo-171-2025 se solicita desincorporación de personal Cuarto.pdf', 2, '2025-02-08 15:50:10', '2025-02-08 15:50:10'),
	(698, 'storage/documentos/requisicion/YlI2HcHDn1_REQUISICIÓN No.pdf', 'YlI2HcHDn1_REQUISICIÓN No.pdf', 1, '2025-02-08 15:52:17', '2025-02-08 15:52:17'),
	(699, 'storage/documentos/requisicion/JVReoLJAuq_REQUISICIÓN No.pdf', 'JVReoLJAuq_REQUISICIÓN No.pdf', 1, '2025-02-08 15:53:58', '2025-02-08 15:53:58'),
	(700, 'storage/documentos/requisicion/8SIoHAXu4I_REQUISICIÓN No.pdf', '8SIoHAXu4I_REQUISICIÓN No.pdf', 1, '2025-02-08 15:56:16', '2025-02-08 15:56:16'),
	(701, 'storage/documentos/requisicion/KM2sP5jRNo_REQUISICIÓN No.pdf', 'KM2sP5jRNo_REQUISICIÓN No.pdf', 1, '2025-02-08 15:57:40', '2025-02-08 15:57:40'),
	(702, 'storage/documentos/requisicion/Ow2SxjIG8B_REQUISICIÓN No.pdf', 'Ow2SxjIG8B_REQUISICIÓN No.pdf', 1, '2025-02-08 15:59:20', '2025-02-08 15:59:20'),
	(703, 'storage/documentos/requisicion/BvL29SK8Ht_REQUISICIÓN No.pdf', 'BvL29SK8Ht_REQUISICIÓN No.pdf', 1, '2025-02-08 16:00:32', '2025-02-08 16:00:32'),
	(704, 'storage/documentos/requisicion/ROIh1c6399_REQUISICIÓN No.pdf', 'ROIh1c6399_REQUISICIÓN No.pdf', 1, '2025-02-08 16:03:32', '2025-02-08 16:03:32'),
	(705, 'storage/documentos/requisicion/fPvKRqQ3Iq_REQUISICIÓN No.pdf', 'fPvKRqQ3Iq_REQUISICIÓN No.pdf', 1, '2025-02-08 16:05:28', '2025-02-08 16:05:28'),
	(706, 'storage/documentos/requisicion/3YzRsPnwvp_REQUISICIÓN No.pdf', '3YzRsPnwvp_REQUISICIÓN No.pdf', 1, '2025-02-08 16:07:02', '2025-02-08 16:07:02'),
	(707, 'storage/documentos/requisicion/dogaEm1E9X_REQUISICIONES No.pdf', 'dogaEm1E9X_REQUISICIONES No.pdf', 1, '2025-02-08 16:08:35', '2025-02-08 16:08:35'),
	(708, 'storage/documentos/requisicion/KMolyZH9W3_REQUISICIONES No.pdf', 'KMolyZH9W3_REQUISICIONES No.pdf', 1, '2025-02-08 16:11:26', '2025-02-08 16:11:26'),
	(709, 'storage/documentos/requisicion/2825ShIA92_REQUISICIÓN No.pdf', '2825ShIA92_REQUISICIÓN No.pdf', 1, '2025-02-08 16:17:46', '2025-02-08 16:17:46'),
	(710, 'storage/documentos/requisicion/6z1s72We6s_REQUISICIONES No.pdf', '6z1s72We6s_REQUISICIONES No.pdf', 1, '2025-02-08 16:35:21', '2025-02-08 16:35:21'),
	(711, 'storage/documentos/memorandum/TUTfTb9tVK_SECRETARÍA memo-ca-p-0056-2025 sesióm adqisiciones Huoston-Eder.pdf', 'TUTfTb9tVK_SECRETARÍA memo-ca-p-0056-2025 sesióm adqisiciones Huoston-Eder.pdf', 2, '2025-02-11 13:42:41', '2025-02-11 13:42:41'),
	(712, 'storage/documentos/memorandum/eKl3X7E6h2_SECRETARÍA memo-ca-p-0068-2025 sesión adquisiciones Huoston.pdf', 'eKl3X7E6h2_SECRETARÍA memo-ca-p-0068-2025 sesión adquisiciones Huoston.pdf', 2, '2025-02-11 13:45:32', '2025-02-11 13:45:32'),
	(713, 'storage/documentos/oficio/R5C9lmofFI_SECRETARÍA oficio-0296-2025 se remiten acuerdos del consejo general Ede-Huoston.pdf', 'R5C9lmofFI_SECRETARÍA oficio-0296-2025 se remiten acuerdos del consejo general Ede-Huoston.pdf', 3, '2025-02-11 13:52:51', '2025-02-11 13:52:51'),
	(714, 'storage/documentos/memorandum/Rz5jJXCyLI_SECRETARÍA memo-0605-2025 se remite folio 738 oficio ase-0293-25-of-oas  perioridicidad y fechas para entrega de inf y doctos.pdf', 'Rz5jJXCyLI_SECRETARÍA memo-0605-2025 se remite folio 738 oficio ase-0293-25-of-oas  perioridicidad y fechas para entrega de inf y doctos.pdf', 2, '2025-02-11 13:56:49', '2025-02-11 13:56:49'),
	(715, 'storage/documentos/memorandum/rEzN8FEJ3k_SECRETARÍA memo-560-2025 solicita elaboración de cheque C.pdf', 'rEzN8FEJ3k_SECRETARÍA memo-560-2025 solicita elaboración de cheque C.pdf', 2, '2025-02-11 14:00:51', '2025-02-11 14:00:51'),
	(716, 'storage/documentos/memorandum/F3TKrhimZe_SECRETARÍA memo-505-2025 solicita elaboración de cheque Fernando Delgadillo Cuarto.pdf', 'F3TKrhimZe_SECRETARÍA memo-505-2025 solicita elaboración de cheque Fernando Delgadillo Cuarto.pdf', 2, '2025-02-11 14:04:37', '2025-02-11 14:04:37'),
	(717, 'storage/documentos/memorandum/vJyHpX8Aoq_SECRETARÍA memo-0482-2025 solicita elaboración de cheque C.pdf', 'vJyHpX8Aoq_SECRETARÍA memo-0482-2025 solicita elaboración de cheque C.pdf', 2, '2025-02-11 14:08:09', '2025-02-11 14:08:09'),
	(718, 'storage/documentos/memorandum/eJbhlkr1ub_SECRETARÍA memo-428-2025 solicita elaboración de cheque C.pdf', 'eJbhlkr1ub_SECRETARÍA memo-428-2025 solicita elaboración de cheque C.pdf', 2, '2025-02-11 14:10:37', '2025-02-11 14:10:37'),
	(719, 'storage/documentos/oficio/cLhYth5YCm_SECRETARÍA OFICIO-0308-2025 se remite acuerdo cg-ac-0023-2025 Huoston.pdf', 'cLhYth5YCm_SECRETARÍA OFICIO-0308-2025 se remite acuerdo cg-ac-0023-2025 Huoston.pdf', 3, '2025-02-11 14:15:25', '2025-02-11 14:15:25'),
	(720, 'storage/documentos/circular/0mFAsmPBQ0_SECRETARÍA circular-026-2025 servicio social y prácticas profesionales Eder-Daniel-Alexis.pdf', '0mFAsmPBQ0_SECRETARÍA circular-026-2025 servicio social y prácticas profesionales Eder-Daniel-Alexis.pdf', 4, '2025-02-11 14:17:19', '2025-02-11 14:17:19'),
	(721, 'storage/documentos/requisicion/q9LDlh4lKl_REQUISICIÓN No.pdf', 'q9LDlh4lKl_REQUISICIÓN No.pdf', 1, '2025-02-11 14:19:55', '2025-02-11 14:19:55'),
	(722, 'storage/documentos/requisicion/khBROCwehL_REQUISICIÓN No.pdf', 'khBROCwehL_REQUISICIÓN No.pdf', 1, '2025-02-11 14:21:43', '2025-02-11 14:21:43'),
	(723, 'storage/documentos/requisicion/lgKuyWevw6_REQUISICIÓN No.pdf', 'lgKuyWevw6_REQUISICIÓN No.pdf', 1, '2025-02-11 14:23:32', '2025-02-11 14:23:32'),
	(724, 'storage/documentos/requisicion/iPcgOfU1ET_REQUISICIÓN No.pdf', 'iPcgOfU1ET_REQUISICIÓN No.pdf', 1, '2025-02-11 14:25:20', '2025-02-11 14:25:20'),
	(725, 'storage/documentos/requisicion/Vif4bAP88M_REQUISICIÓN No.pdf', 'Vif4bAP88M_REQUISICIÓN No.pdf', 1, '2025-02-11 14:28:42', '2025-02-11 14:28:42'),
	(726, 'storage/documentos/requisicion/Ojlvzi47nO_REQUISICIÓN No.pdf', 'Ojlvzi47nO_REQUISICIÓN No.pdf', 1, '2025-02-11 14:31:02', '2025-02-11 14:31:02'),
	(727, 'storage/documentos/requisicion/P9ymPMZVHy_REQUISICIÓN No.pdf', 'P9ymPMZVHy_REQUISICIÓN No.pdf', 1, '2025-02-11 14:33:32', '2025-02-11 14:33:32'),
	(728, 'storage/documentos/requisicion/dvHFYqGQD9_REQUISICIÓN No.pdf', 'dvHFYqGQD9_REQUISICIÓN No.pdf', 1, '2025-02-11 15:03:41', '2025-02-11 15:03:41'),
	(729, 'storage/documentos/memorandum/7YLz7JdqHs_INFORMÁTICA memo023-2025 sistema Archivo.pdf', '7YLz7JdqHs_INFORMÁTICA memo023-2025 sistema Archivo.pdf', 2, '2025-02-11 15:05:42', '2025-02-11 15:05:42'),
	(730, 'storage/documentos/requisicion/5Bi7NasPN8_REQUISICIÓN No.pdf', '5Bi7NasPN8_REQUISICIÓN No.pdf', 1, '2025-02-11 15:06:23', '2025-02-11 15:06:23'),
	(731, 'storage/documentos/requisicion/CIyoTJBnVm_REQUISICIÓN No.pdf', 'CIyoTJBnVm_REQUISICIÓN No.pdf', 1, '2025-02-11 15:08:03', '2025-02-11 15:08:03'),
	(732, 'storage/documentos/requisicion/1BAv27OzBA_REQUISICIÓN No.pdf', '1BAv27OzBA_REQUISICIÓN No.pdf', 1, '2025-02-11 15:10:00', '2025-02-11 15:10:00'),
	(733, 'storage/documentos/correo/O3oVAuDeoZ_INFORMÁTICA tarjeta 09-2025 se informa que se atendió a 44 solicitudes de videoconferencia Archivo.pdf', 'O3oVAuDeoZ_INFORMÁTICA tarjeta 09-2025 se informa que se atendió a 44 solicitudes de videoconferencia Archivo.pdf', 7, '2025-02-11 15:10:02', '2025-02-11 15:10:02'),
	(734, 'storage/documentos/requisicion/rUQabZQhJF_REQUISICIÓN No.pdf', 'rUQabZQhJF_REQUISICIÓN No.pdf', 1, '2025-02-11 15:11:21', '2025-02-11 15:11:21'),
	(735, 'storage/documentos/memorandum/KjP6KkvSxP_SECRETARÍA memo-ca-p-0104-2025 renudación S.pdf', 'KjP6KkvSxP_SECRETARÍA memo-ca-p-0104-2025 renudación S.pdf', 2, '2025-02-11 15:13:17', '2025-02-11 15:13:17'),
	(736, 'storage/documentos/oficio/fxUkM05Xdu_Oficio No.pdf', 'fxUkM05Xdu_Oficio No.pdf', 3, '2025-02-11 15:15:44', '2025-02-11 15:15:44'),
	(737, 'storage/documentos/memorandum/a4GjDhTKoG_JURÍDICO memo-ca-se-0004-2025 se remiten bases para observacón con-inv-iee-002-2025, con-inv-iee-003-2025 Eder-Huoston.pdf', 'a4GjDhTKoG_JURÍDICO memo-ca-se-0004-2025 se remiten bases para observacón con-inv-iee-002-2025, con-inv-iee-003-2025 Eder-Huoston.pdf', 2, '2025-02-11 15:18:49', '2025-02-11 15:18:49'),
	(738, 'storage/documentos/memorandum/x659eHicTz_JURÍDICO memo-0348-2025 se remite convenio de indemnización Cuarto.pdf', 'x659eHicTz_JURÍDICO memo-0348-2025 se remite convenio de indemnización Cuarto.pdf', 2, '2025-02-11 15:21:05', '2025-02-11 15:21:05'),
	(739, 'storage/documentos/memorandum/8d0nVwI896_INFORMÁTICA memo-ii-prep-031-2025 ubicación de casillas.pdf', '8d0nVwI896_INFORMÁTICA memo-ii-prep-031-2025 ubicación de casillas.pdf', 2, '2025-02-11 15:22:59', '2025-02-11 15:22:59'),
	(740, 'storage/documentos/memorandum/g8wSjoLRwe_DTS memo-0246-2025 se retifica renunica c.pdf', 'g8wSjoLRwe_DTS memo-0246-2025 se retifica renunica c.pdf', 2, '2025-02-11 15:24:57', '2025-02-11 15:24:57'),
	(741, 'storage/documentos/memorandum/6cNmDYCzBF_DTS memo-0238-2025 se remite renuncia Paola atoyotoxco Cuarto.pdf', '6cNmDYCzBF_DTS memo-0238-2025 se remite renuncia Paola atoyotoxco Cuarto.pdf', 2, '2025-02-11 15:27:07', '2025-02-11 15:27:07'),
	(742, 'storage/documentos/memorandum/MtLw1tYvuu_DOE memo-120-2025 se remite información Eder-Saúl-Daniel.pdf', 'MtLw1tYvuu_DOE memo-120-2025 se remite información Eder-Saúl-Daniel.pdf', 2, '2025-02-11 15:29:04', '2025-02-11 15:29:04'),
	(743, 'storage/documentos/memorandum/7DqOBvjZ9t_DOE memo-116-2025 se remite información Eder-Saúl-Daniel.pdf', '7DqOBvjZ9t_DOE memo-116-2025 se remite información Eder-Saúl-Daniel.pdf', 2, '2025-02-11 15:30:54', '2025-02-11 15:30:54'),
	(744, 'storage/documentos/memorandum/bXKrV247ei_CAPACITACIÓN MEMORANDUM No IEE-DCEEC-044-2025.pdf', 'bXKrV247ei_CAPACITACIÓN MEMORANDUM No IEE-DCEEC-044-2025.pdf', 2, '2025-02-11 15:40:44', '2025-02-11 15:40:44'),
	(745, 'storage/documentos/memorandum/sfmiQk0SDy_UFD MEMORANDUM No IEE-131-2025 SE SOLICITA ALTA DE PERSONAL.pdf', 'sfmiQk0SDy_UFD MEMORANDUM No IEE-131-2025 SE SOLICITA ALTA DE PERSONAL.pdf', 2, '2025-02-11 15:42:39', '2025-02-11 15:42:39'),
	(746, 'storage/documentos/memorandum/5D6j97FCy9_INFORMTICA MEMORANDUM No IEE-CIN-021-2025 PETICIONES PAGINAS WEB.pdf', '5D6j97FCy9_INFORMTICA MEMORANDUM No IEE-CIN-021-2025 PETICIONES PAGINAS WEB.pdf', 2, '2025-02-11 15:44:31', '2025-02-11 15:44:31'),
	(747, 'storage/documentos/memorandum/RYg94f34VR_INFORMÁTICA memo-024-2025 correo institucional Archivo.pdf', 'RYg94f34VR_INFORMÁTICA memo-024-2025 correo institucional Archivo.pdf', 2, '2025-02-11 19:30:18', '2025-02-11 19:30:18'),
	(748, 'storage/documentos/tarjeta/yfAFjQpKJZ_AUDITOR EXTERNO consultoría fiscal contadores públicos y auditores s.pdf', 'yfAFjQpKJZ_AUDITOR EXTERNO consultoría fiscal contadores públicos y auditores s.pdf', 6, '2025-02-11 19:32:31', '2025-02-11 19:32:31'),
	(749, 'storage/documentos/oficio/lomb0xwbq6_OFICIALÍA DE PARTES folio 843 auditor externo le hago entrega de  3 confirmaciones de saldo con sus proveedores,Eder.pdf', 'lomb0xwbq6_OFICIALÍA DE PARTES folio 843 auditor externo le hago entrega de  3 confirmaciones de saldo con sus proveedores,Eder.pdf', 3, '2025-02-11 19:35:25', '2025-02-11 19:35:25'),
	(750, 'storage/documentos/tarjeta/qn3vY2gHUq_OFICIALIA DE PARTES folio 844 auditor externo le hago entrega de 3 confirmaciones bancarias Eder.pdf', 'qn3vY2gHUq_OFICIALIA DE PARTES folio 844 auditor externo le hago entrega de 3 confirmaciones bancarias Eder.pdf', 6, '2025-02-11 19:37:31', '2025-02-11 19:37:31'),
	(751, 'storage/documentos/memorandum/wi8nnHkkUT_SECRETARÍA memo-ca-p-0056-2025 sesión ordina del c de adquisici Eder-Huoston.pdf', 'wi8nnHkkUT_SECRETARÍA memo-ca-p-0056-2025 sesión ordina del c de adquisici Eder-Huoston.pdf', 2, '2025-02-11 19:43:38', '2025-02-11 19:43:38'),
	(752, 'storage/documentos/memorandum/m08wwJw4dA_INFORMATICA MEMORANDUM No IEE-CIN-044-2025 PETICIONES PAGINA WEB.pdf', 'm08wwJw4dA_INFORMATICA MEMORANDUM No IEE-CIN-044-2025 PETICIONES PAGINA WEB.pdf', 2, '2025-02-11 22:21:58', '2025-02-11 22:21:58'),
	(753, 'storage/documentos/circular/QcTtitJRDt_CONTRALORÍA circular-ci-c-004-2025 entrega de calendarios Eder-Daniel-Alexis.pdf', 'QcTtitJRDt_CONTRALORÍA circular-ci-c-004-2025 entrega de calendarios Eder-Daniel-Alexis.pdf', 4, '2025-02-12 14:03:57', '2025-02-12 14:03:57'),
	(754, 'storage/documentos/memorandum/AzAFRFShFt_CONTRALORÍA memo-110-2025 hojas de trabajo del mes de septiembre de 2024 Eder.pdf', 'AzAFRFShFt_CONTRALORÍA memo-110-2025 hojas de trabajo del mes de septiembre de 2024 Eder.pdf', 2, '2025-02-12 14:05:57', '2025-02-12 14:05:57'),
	(755, 'storage/documentos/memorandum/IBF6BjYiJz_DOE memo-139-2025 se remite información Eder-Daniel-Saúl.pdf', 'IBF6BjYiJz_DOE memo-139-2025 se remite información Eder-Daniel-Saúl.pdf', 2, '2025-02-12 14:08:54', '2025-02-12 14:08:54'),
	(756, 'storage/documentos/memorandum/W79iNNvGdh_JURÍDICO memo-0394-2025 se remiten convenios de indemnización Cuarto.pdf', 'W79iNNvGdh_JURÍDICO memo-0394-2025 se remiten convenios de indemnización Cuarto.pdf', 2, '2025-02-12 14:35:33', '2025-02-12 14:35:33'),
	(757, 'storage/documentos/memorandum/ojUtb4qRHL_PRERROGATIVAS memo-0170-2025 se solicita activación sistema de registro de candidaturas Alexis.pdf', 'ojUtb4qRHL_PRERROGATIVAS memo-0170-2025 se solicita activación sistema de registro de candidaturas Alexis.pdf', 2, '2025-02-12 14:43:30', '2025-02-12 14:43:30'),
	(758, 'storage/documentos/requisicion/RsTX1c5ss5_REQUISICIÓN No.pdf', 'RsTX1c5ss5_REQUISICIÓN No.pdf', 1, '2025-02-12 15:23:19', '2025-02-12 15:23:19'),
	(759, 'storage/documentos/requisicion/6DalgMaXlQ_REQUISICIÓN No.pdf', '6DalgMaXlQ_REQUISICIÓN No.pdf', 1, '2025-02-12 15:25:04', '2025-02-12 15:25:04'),
	(760, 'storage/documentos/requisicion/bo7E5ClpfG_REQUISICIÓN No.pdf', 'bo7E5ClpfG_REQUISICIÓN No.pdf', 1, '2025-02-12 15:27:59', '2025-02-12 15:27:59'),
	(761, 'storage/documentos/requisicion/2lM2BiCkYV_REQUISICIÓN No.pdf', '2lM2BiCkYV_REQUISICIÓN No.pdf', 1, '2025-02-12 15:29:43', '2025-02-12 15:29:43'),
	(762, 'storage/documentos/requisicion/Ek23IfUBCd_REQUISICIÓN No.pdf', 'Ek23IfUBCd_REQUISICIÓN No.pdf', 1, '2025-02-12 15:31:11', '2025-02-12 15:31:11'),
	(763, 'storage/documentos/requisicion/062W45fQj1_REQUISICIÓN No.pdf', '062W45fQj1_REQUISICIÓN No.pdf', 1, '2025-02-12 15:34:24', '2025-02-12 15:34:24'),
	(764, 'storage/documentos/requisicion/xXwYLimUaT_REQUISICIÓN No.pdf', 'xXwYLimUaT_REQUISICIÓN No.pdf', 1, '2025-02-12 15:35:57', '2025-02-12 15:35:57'),
	(765, 'storage/documentos/requisicion/WBIL52G9fo_REQUISICIÓN No.pdf', 'WBIL52G9fo_REQUISICIÓN No.pdf', 1, '2025-02-12 15:39:16', '2025-02-12 15:39:16'),
	(766, 'storage/documentos/requisicion/M6rzxDqdJw_REQUISICIÓN No.pdf', 'M6rzxDqdJw_REQUISICIÓN No.pdf', 1, '2025-02-12 20:55:02', '2025-02-12 20:55:02'),
	(767, 'storage/documentos/requisicion/rs8lfaderS_REQUISICIÓN No.pdf', 'rs8lfaderS_REQUISICIÓN No.pdf', 1, '2025-02-12 21:12:16', '2025-02-12 21:12:16'),
	(768, 'storage/documentos/requisicion/vkc5dFhLrG_REQUISICIÓN No.pdf', 'vkc5dFhLrG_REQUISICIÓN No.pdf', 1, '2025-02-12 21:15:59', '2025-02-12 21:15:59'),
	(769, 'storage/documentos/requisicion/ZX0etcKVnF_REQUISICIÓN No.pdf', 'ZX0etcKVnF_REQUISICIÓN No.pdf', 1, '2025-02-12 21:18:40', '2025-02-12 21:18:40'),
	(770, 'storage/documentos/memorandum/xglsu7EwUy_PRERROGATIVAS memo-0175-2025 remite recibo original de movimi ciudad.pdf', 'xglsu7EwUy_PRERROGATIVAS memo-0175-2025 remite recibo original de movimi ciudad.pdf', 2, '2025-02-12 21:24:07', '2025-02-12 21:24:07'),
	(771, 'storage/documentos/memorandum/rPHn0HakjZ_INFORMÁTICA memo-025-2025 correo institucional Archivo.pdf', 'rPHn0HakjZ_INFORMÁTICA memo-025-2025 correo institucional Archivo.pdf', 2, '2025-02-12 21:30:30', '2025-02-12 21:30:30'),
	(772, 'storage/documentos/requisicion/DQSG07rkYM_REQUISICIÓN No.pdf', 'DQSG07rkYM_REQUISICIÓN No.pdf', 1, '2025-02-12 22:54:00', '2025-02-12 22:54:00'),
	(773, 'storage/documentos/requisicion/16NNSGv8EC_REQUISICIÓN No.pdf', '16NNSGv8EC_REQUISICIÓN No.pdf', 1, '2025-02-12 22:56:18', '2025-02-12 22:56:18'),
	(774, 'storage/documentos/requisicion/DU3iwanIZV_REQUISICIÓN No.pdf', 'DU3iwanIZV_REQUISICIÓN No.pdf', 1, '2025-02-12 23:09:30', '2025-02-12 23:09:30'),
	(775, 'storage/documentos/memorandum/qR9ciJ7fWC_PRERROGATIVAS memo-0176-2025 acreditación de partidos políticos Eder-Saúl.pdf', 'qR9ciJ7fWC_PRERROGATIVAS memo-0176-2025 acreditación de partidos políticos Eder-Saúl.pdf', 2, '2025-02-13 18:31:06', '2025-02-13 18:31:06'),
	(776, 'storage/documentos/oficio/5DyRDVNNtq_PRERROGATIVAS oficio-0024-2025 inconsistencias PRI Eder-Saúl.pdf', '5DyRDVNNtq_PRERROGATIVAS oficio-0024-2025 inconsistencias PRI Eder-Saúl.pdf', 3, '2025-02-13 18:34:12', '2025-02-13 18:34:12'),
	(777, 'storage/documentos/oficio/6jIrsbGoGI_PRERROGATIVAS oficio-0025-2025 inconsistencias MORENA Eder-Saúl.pdf', '6jIrsbGoGI_PRERROGATIVAS oficio-0025-2025 inconsistencias MORENA Eder-Saúl.pdf', 3, '2025-02-13 18:38:19', '2025-02-13 18:38:19'),
	(778, 'storage/documentos/oficio/un7ysMysWG_PRERROGATIVAS oficio-0026-2025 inconsistencias fuerza por méxico Eder-Saúl.pdf', 'un7ysMysWG_PRERROGATIVAS oficio-0026-2025 inconsistencias fuerza por méxico Eder-Saúl.pdf', 3, '2025-02-13 18:40:59', '2025-02-13 18:40:59'),
	(779, 'storage/documentos/requisicion/cpohm4o5eg_REQUISICIÓN No.pdf', 'cpohm4o5eg_REQUISICIÓN No.pdf', 1, '2025-02-13 18:42:41', '2025-02-13 18:42:41'),
	(780, 'storage/documentos/requisicion/3JDMZo9A4Y_REQUISICIÓN No.pdf', '3JDMZo9A4Y_REQUISICIÓN No.pdf', 1, '2025-02-13 18:44:14', '2025-02-13 18:44:14'),
	(781, 'storage/documentos/requisicion/bBisEIaGgN_REQUISICIÓN No.pdf', 'bBisEIaGgN_REQUISICIÓN No.pdf', 1, '2025-02-13 18:46:54', '2025-02-13 18:46:54'),
	(782, 'storage/documentos/requisicion/LpN03eIfsT_REQUISICIÓN No.pdf', 'LpN03eIfsT_REQUISICIÓN No.pdf', 1, '2025-02-13 18:50:43', '2025-02-13 18:50:43'),
	(783, 'storage/documentos/requisicion/XTWvHZGTUs_REQUISICIÓN No.pdf', 'XTWvHZGTUs_REQUISICIÓN No.pdf', 1, '2025-02-13 18:55:33', '2025-02-13 18:55:33'),
	(784, 'storage/documentos/requisicion/gOEfKrvViC_REQUISICIÓN No.pdf', 'gOEfKrvViC_REQUISICIÓN No.pdf', 1, '2025-02-13 18:57:18', '2025-02-13 18:57:18'),
	(785, 'storage/documentos/requisicion/dvb1nxbCnF_REQUISICIÓN No.pdf', 'dvb1nxbCnF_REQUISICIÓN No.pdf', 1, '2025-02-13 18:59:08', '2025-02-13 18:59:08'),
	(786, 'storage/documentos/requisicion/iLMTzZEcYa_REQUISICIÓN No.pdf', 'iLMTzZEcYa_REQUISICIÓN No.pdf', 1, '2025-02-13 19:00:34', '2025-02-13 19:00:34'),
	(787, 'storage/documentos/requisicion/HyNhtX0KHU_REQUISICIÓN No.pdf', 'HyNhtX0KHU_REQUISICIÓN No.pdf', 1, '2025-02-13 19:02:01', '2025-02-13 19:02:01'),
	(788, 'storage/documentos/requisicion/9zGdoklbcE_REQUISICIÓN No.pdf', '9zGdoklbcE_REQUISICIÓN No.pdf', 1, '2025-02-13 19:17:26', '2025-02-13 19:17:26'),
	(789, 'storage/documentos/requisicion/4hMxsiiDNf_REQUISICIÓN No.pdf', '4hMxsiiDNf_REQUISICIÓN No.pdf', 1, '2025-02-13 19:19:59', '2025-02-13 19:19:59'),
	(790, 'storage/documentos/memorandum/fzjG5nzhBb_INFORMÁTICA memo-027-2025 correo institucional Archivo.pdf', 'fzjG5nzhBb_INFORMÁTICA memo-027-2025 correo institucional Archivo.pdf', 2, '2025-02-13 20:57:28', '2025-02-13 20:57:28'),
	(791, 'storage/documentos/memorandum/cubgdecoxa_DOE memo-146-2025 se remite dictámen justificativo Eder-Huoston.pdf', 'cubgdecoxa_DOE memo-146-2025 se remite dictámen justificativo Eder-Huoston.pdf', 2, '2025-02-14 14:44:50', '2025-02-14 14:44:50'),
	(792, 'storage/documentos/memorandum/NJ3J8FOjG8_DTS memo-0300-2025 se informa expediente concluído Cuarto.pdf', 'NJ3J8FOjG8_DTS memo-0300-2025 se informa expediente concluído Cuarto.pdf', 2, '2025-02-14 14:47:10', '2025-02-14 14:47:10'),
	(793, 'storage/documentos/memorandum/MkwwyqgREb_SECRETARÍA memo-0748-2025 se autoriza para certificar Eder.pdf', 'MkwwyqgREb_SECRETARÍA memo-0748-2025 se autoriza para certificar Eder.pdf', 2, '2025-02-14 14:50:50', '2025-02-14 14:50:50'),
	(794, 'storage/documentos/memorandum/b54XhGU4Sp_SECRETARÍA memo-ca-p-0119-2025 sesión o.pdf', 'b54XhGU4Sp_SECRETARÍA memo-ca-p-0119-2025 sesión o.pdf', 2, '2025-02-14 14:58:48', '2025-02-14 14:58:48'),
	(795, 'storage/documentos/requisicion/nukhldJaKJ_REQUISICIÓN No.pdf', 'nukhldJaKJ_REQUISICIÓN No.pdf', 1, '2025-02-14 15:04:19', '2025-02-14 15:04:19'),
	(796, 'storage/documentos/requisicion/TTqSLemhpU_REQUISICIÓN No.pdf', 'TTqSLemhpU_REQUISICIÓN No.pdf', 1, '2025-02-14 15:13:44', '2025-02-14 15:13:44'),
	(797, 'storage/documentos/memorandum/3s5cbTx1ZK_UFD memo-186-2025 se solicita alta de personal Cuarto.pdf', '3s5cbTx1ZK_UFD memo-186-2025 se solicita alta de personal Cuarto.pdf', 2, '2025-02-14 15:16:54', '2025-02-14 15:16:54'),
	(798, 'storage/documentos/requisicion/VNMz4trsBQ_REQUISICIÓN No.pdf', 'VNMz4trsBQ_REQUISICIÓN No.pdf', 1, '2025-02-14 15:18:42', '2025-02-14 15:18:42'),
	(799, 'storage/documentos/memorandum/eqxZWhcJUA_UFD memo-187-2025 se solicita desincorporación de personal Cuarto.pdf', 'eqxZWhcJUA_UFD memo-187-2025 se solicita desincorporación de personal Cuarto.pdf', 2, '2025-02-14 15:30:59', '2025-02-14 15:30:59'),
	(800, 'storage/documentos/memorandum/ln8vbVUmJ7_JURÍDICO memo-0425-2025 se solicita habilitación de correo electrónico Archivo.pdf', 'ln8vbVUmJ7_JURÍDICO memo-0425-2025 se solicita habilitación de correo electrónico Archivo.pdf', 2, '2025-02-14 16:27:13', '2025-02-14 16:27:13'),
	(801, 'storage/documentos/memorandum/Q8eBlkpCCz_UFD memo-191-2025 se solicita desoncorporación de personal Cuarto.pdf', 'Q8eBlkpCCz_UFD memo-191-2025 se solicita desoncorporación de personal Cuarto.pdf', 2, '2025-02-14 17:42:41', '2025-02-14 17:42:41'),
	(802, 'storage/documentos/memorandum/9BOosvpsrB_DOE memo-149-2025 se remite información Eder-Saúl-Daniel.pdf', '9BOosvpsrB_DOE memo-149-2025 se remite información Eder-Saúl-Daniel.pdf', 2, '2025-02-14 17:45:39', '2025-02-14 17:45:39'),
	(803, 'storage/documentos/memorandum/IXTEajF3vs_UFD memo-071-2025 se solicita alta de personal Cuarto.pdf', 'IXTEajF3vs_UFD memo-071-2025 se solicita alta de personal Cuarto.pdf', 2, '2025-02-14 17:46:53', '2025-02-14 17:46:53'),
	(804, 'storage/documentos/memorandum/a966bcXwpp_UFD memo-190-2025 se solicita desincorporación de personal Cuarto.pdf', 'a966bcXwpp_UFD memo-190-2025 se solicita desincorporación de personal Cuarto.pdf', 2, '2025-02-14 17:48:20', '2025-02-14 17:48:20'),
	(805, 'storage/documentos/memorandum/W9RKGQ1jcn_INFORMÁTICA memo-044-2025 se remite documentación Archivo.pdf', 'W9RKGQ1jcn_INFORMÁTICA memo-044-2025 se remite documentación Archivo.pdf', 2, '2025-02-14 19:06:47', '2025-02-14 19:06:47'),
	(806, 'storage/documentos/memorandum/BeR9xNGwdo_INFORMÁTICA memo-ii-prep-046-2025 notificación ine Archivo.pdf', 'BeR9xNGwdo_INFORMÁTICA memo-ii-prep-046-2025 notificación ine Archivo.pdf', 2, '2025-02-14 20:11:42', '2025-02-14 20:11:42'),
	(807, 'storage/documentos/memorandum/6LpWrgLltw_INFORMÁTICA memo-ii-prep-047-2025 notificación ine Archivo.pdf', '6LpWrgLltw_INFORMÁTICA memo-ii-prep-047-2025 notificación ine Archivo.pdf', 2, '2025-02-14 20:14:28', '2025-02-14 20:14:28'),
	(808, 'storage/documentos/memorandum/rkH6MwrZqS_SECRETARÍA memo-623-2025 se remite renuncia de yareli álvarez Cuarto.pdf', 'rkH6MwrZqS_SECRETARÍA memo-623-2025 se remite renuncia de yareli álvarez Cuarto.pdf', 2, '2025-02-14 20:15:44', '2025-02-14 20:15:44'),
	(809, 'storage/documentos/memorandum/7pYyST1lU1_SECRETARÍA memo-0762-2025 se solicita elaboración de cheque Cuarto-Eder-Saúl.pdf', '7pYyST1lU1_SECRETARÍA memo-0762-2025 se solicita elaboración de cheque Cuarto-Eder-Saúl.pdf', 2, '2025-02-14 20:17:38', '2025-02-14 20:17:38'),
	(810, 'storage/documentos/memorandum/RzoTmYkOnZ_INFORMÁTICA memo-042-2025 re remite documentación Archivo.pdf', 'RzoTmYkOnZ_INFORMÁTICA memo-042-2025 re remite documentación Archivo.pdf', 2, '2025-02-14 20:48:16', '2025-02-14 20:48:16'),
	(811, 'storage/documentos/requisicion/PdVaNFRCED_REQUISICIÓN No.pdf', 'PdVaNFRCED_REQUISICIÓN No.pdf', 1, '2025-02-14 22:18:00', '2025-02-14 22:18:00'),
	(812, 'storage/documentos/memorandum/dX1zEmBIxg_SECRETARÍA memo-242-2025 se solicita alta de personal Cuarto.pdf', 'dX1zEmBIxg_SECRETARÍA memo-242-2025 se solicita alta de personal Cuarto.pdf', 2, '2025-02-14 22:20:15', '2025-02-14 22:20:15'),
	(813, 'storage/documentos/memorandum/Jc4hdautFP_SECRETARÍA memo-564-2025 se solicita alta de personal Cuarto.pdf', 'Jc4hdautFP_SECRETARÍA memo-564-2025 se solicita alta de personal Cuarto.pdf', 2, '2025-02-14 22:23:02', '2025-02-14 22:23:02'),
	(814, 'storage/documentos/memorandum/mVH5dadKOB_SECRETARÍA memo-765-2025 se solicita alta de personal Cuarto.pdf', 'mVH5dadKOB_SECRETARÍA memo-765-2025 se solicita alta de personal Cuarto.pdf', 2, '2025-02-14 22:34:07', '2025-02-14 22:34:07'),
	(815, 'storage/documentos/memorandum/zarSjcpxKw_FISCALIZACIÓN memo-0042-25 sistema de apoyo para fiscalización de las organizaciones Eder-Saúl.pdf', 'zarSjcpxKw_FISCALIZACIÓN memo-0042-25 sistema de apoyo para fiscalización de las organizaciones Eder-Saúl.pdf', 2, '2025-02-17 15:06:17', '2025-02-17 15:06:17'),
	(816, 'storage/documentos/memorandum/csyNL8Yv3W_SECRETARÍA memo-0755-2025 se autoriza certificar discos compactos Eder.pdf', 'csyNL8Yv3W_SECRETARÍA memo-0755-2025 se autoriza certificar discos compactos Eder.pdf', 2, '2025-02-17 15:08:13', '2025-02-17 15:08:13'),
	(817, 'storage/documentos/escrito/c1ifKxLd6p_JURÍDICO correo contrato PREP- Eder.pdf', 'c1ifKxLd6p_JURÍDICO correo contrato PREP- Eder.pdf', 5, '2025-02-17 15:11:05', '2025-02-17 15:11:05'),
	(818, 'storage/documentos/circular/GH6XzBz6pO_ARCHIVOS circular-004-2025 procedimiento a seguir para transferencia primaria Eder-Ale.pdf', 'GH6XzBz6pO_ARCHIVOS circular-004-2025 procedimiento a seguir para transferencia primaria Eder-Ale.pdf', 4, '2025-02-17 20:48:25', '2025-02-17 20:48:25'),
	(819, 'storage/documentos/memorandum/n9In3MdsVq_CONSEJERO ARTURO memo-004-2025 resp memo da-0171-2025 pago foto multas Daniel.pdf', 'n9In3MdsVq_CONSEJERO ARTURO memo-004-2025 resp memo da-0171-2025 pago foto multas Daniel.pdf', 2, '2025-02-17 20:50:45', '2025-02-17 20:50:45'),
	(820, 'storage/documentos/memorandum/rulq917DuH_DTS memo-0327-2025 resp.pdf', 'rulq917DuH_DTS memo-0327-2025 resp.pdf', 2, '2025-02-17 20:53:18', '2025-02-17 20:53:18'),
	(821, 'storage/documentos/tarjeta/r60UUeTzQH_EL SOL DE PUEBLA factura axaa000036584 Saúl.pdf', 'r60UUeTzQH_EL SOL DE PUEBLA factura axaa000036584 Saúl.pdf', 6, '2025-02-17 20:57:10', '2025-02-17 20:57:10'),
	(822, 'storage/documentos/memorandum/en10uBeMeU_FISCALIZACIÓN memo-0043-25 sistema de apoyo para la fiscalización de las organizaciones Eder-Saúl.pdf', 'en10uBeMeU_FISCALIZACIÓN memo-0043-25 sistema de apoyo para la fiscalización de las organizaciones Eder-Saúl.pdf', 2, '2025-02-17 21:00:02', '2025-02-17 21:00:02'),
	(823, 'storage/documentos/memorandum/GKbnXnlLof_FISCALIZACÓN memo-0044-2025 sistema de apoyo para la fiscalización de las organizaciones Eder-Saúl.pdf', 'GKbnXnlLof_FISCALIZACÓN memo-0044-2025 sistema de apoyo para la fiscalización de las organizaciones Eder-Saúl.pdf', 2, '2025-02-17 21:07:51', '2025-02-17 21:07:51'),
	(824, 'storage/documentos/memorandum/aHWxsCLpUm_INFORMÁTICA memo-029-2025 sistema Archivo.pdf', 'aHWxsCLpUm_INFORMÁTICA memo-029-2025 sistema Archivo.pdf', 2, '2025-02-17 21:09:25', '2025-02-17 21:09:25'),
	(825, 'storage/documentos/memorandum/YmzZT9dmN5_INFORMÁTICA memo-030-2025 correo institucional Archivo.pdf', 'YmzZT9dmN5_INFORMÁTICA memo-030-2025 correo institucional Archivo.pdf', 2, '2025-02-17 21:11:09', '2025-02-17 21:11:09'),
	(826, 'storage/documentos/memorandum/6hU4nqmuI4_INFORMÁTICA memo-031-2025 cuentas para sistema Archivo.pdf', '6hU4nqmuI4_INFORMÁTICA memo-031-2025 cuentas para sistema Archivo.pdf', 2, '2025-02-17 21:15:25', '2025-02-17 21:15:25'),
	(827, 'storage/documentos/memorandum/UUPe0CKNyV_INFORMÁTICA memo-ii-prep-049-2025 sre y zore Archivo.pdf', 'UUPe0CKNyV_INFORMÁTICA memo-ii-prep-049-2025 sre y zore Archivo.pdf', 2, '2025-02-17 21:17:25', '2025-02-17 21:17:25'),
	(828, 'storage/documentos/memorandum/6YYTcxVkmf_COMUNICACIÓN memo-052-2025 subir galería fotográfica a l apágina web Archivo.pdf', '6YYTcxVkmf_COMUNICACIÓN memo-052-2025 subir galería fotográfica a l apágina web Archivo.pdf', 2, '2025-02-17 21:22:25', '2025-02-17 21:22:25'),
	(829, 'storage/documentos/memorandum/y9bU1RKzmW_PRERROGATIVAS memo-0188-2025 remite recibos originales nap fxmp Eder-Saúl.pdf', 'y9bU1RKzmW_PRERROGATIVAS memo-0188-2025 remite recibos originales nap fxmp Eder-Saúl.pdf', 2, '2025-02-17 21:33:50', '2025-02-17 21:33:50'),
	(830, 'storage/documentos/requisicion/EtovDh77l1_REQUISICIÓN No.pdf', 'EtovDh77l1_REQUISICIÓN No.pdf', 1, '2025-02-17 21:36:27', '2025-02-17 21:36:27'),
	(831, 'storage/documentos/requisicion/fPmNyjlqBz_REQUISICIÓN No.pdf', 'fPmNyjlqBz_REQUISICIÓN No.pdf', 1, '2025-02-17 21:41:33', '2025-02-17 21:41:33'),
	(832, 'storage/documentos/requisicion/IbpiLToEce_REQUISICIÓN No.pdf', 'IbpiLToEce_REQUISICIÓN No.pdf', 1, '2025-02-17 21:46:05', '2025-02-17 21:46:05'),
	(833, 'storage/documentos/requisicion/5lSoOzVntv_REQUISICIÓN No.pdf', '5lSoOzVntv_REQUISICIÓN No.pdf', 1, '2025-02-17 21:47:29', '2025-02-17 21:47:29'),
	(834, 'storage/documentos/requisicion/zozA64yUmF_REQUISICIÓN No.pdf', 'zozA64yUmF_REQUISICIÓN No.pdf', 1, '2025-02-17 21:49:22', '2025-02-17 21:49:22'),
	(835, 'storage/documentos/requisicion/wuxfih0zCY_REQUISICIÓN No.pdf', 'wuxfih0zCY_REQUISICIÓN No.pdf', 1, '2025-02-17 21:50:56', '2025-02-17 21:50:56'),
	(836, 'storage/documentos/requisicion/HTjxfgVrwy_REQUUSICIÓN No.pdf', 'HTjxfgVrwy_REQUUSICIÓN No.pdf', 1, '2025-02-17 21:52:51', '2025-02-17 21:52:51'),
	(837, 'storage/documentos/memorandum/6aVTrIDwtb_COMUNICACIÓN memo-052-2025 subir galería a la página web Archivo.pdf', '6aVTrIDwtb_COMUNICACIÓN memo-052-2025 subir galería a la página web Archivo.pdf', 2, '2025-02-17 23:41:10', '2025-02-17 23:41:10'),
	(838, 'storage/documentos/memorandum/JO1kkqpzHr_CONTRALORÍA memo-121-2025 se remite información resp memo da-0177-2025 ASE Eder.pdf', 'JO1kkqpzHr_CONTRALORÍA memo-121-2025 se remite información resp memo da-0177-2025 ASE Eder.pdf', 2, '2025-02-17 23:44:03', '2025-02-17 23:44:03'),
	(839, 'storage/documentos/memorandum/2lTbUIYYj1_DTS memo-0328-2025 se remite copia simple de acuse de nombramiento Cuarto.pdf', '2lTbUIYYj1_DTS memo-0328-2025 se remite copia simple de acuse de nombramiento Cuarto.pdf', 2, '2025-02-17 23:47:18', '2025-02-17 23:47:18'),
	(840, 'storage/documentos/requisicion/umWjTwpvEa_REQUISICIÓN No.pdf', 'umWjTwpvEa_REQUISICIÓN No.pdf', 1, '2025-02-17 23:50:09', '2025-02-17 23:50:09'),
	(841, 'storage/documentos/requisicion/sLtpg1J8iz_REQUISICIÓN No.pdf', 'sLtpg1J8iz_REQUISICIÓN No.pdf', 1, '2025-02-17 23:51:56', '2025-02-17 23:51:56'),
	(842, 'storage/documentos/requisicion/enjcFbFicW_REQUISICIÓN No.pdf', 'enjcFbFicW_REQUISICIÓN No.pdf', 1, '2025-02-17 23:53:40', '2025-02-17 23:53:40'),
	(843, 'storage/documentos/requisicion/Ju6NzhuZdo_REQUISICIÓN No.pdf', 'Ju6NzhuZdo_REQUISICIÓN No.pdf', 1, '2025-02-17 23:55:10', '2025-02-17 23:55:10'),
	(844, 'storage/documentos/oficio/2D6x5oppyX_PRESIDENCIA oficio-0197-2025 se remiten estados financieros a la ase nov-dic-2024 Luis.pdf', '2D6x5oppyX_PRESIDENCIA oficio-0197-2025 se remiten estados financieros a la ase nov-dic-2024 Luis.pdf', 3, '2025-02-18 16:18:37', '2025-02-18 16:18:37'),
	(845, 'storage/documentos/oficio/txP8Ow1Ku3_PRESIDENCIA oficio-0198-2025 se remiten estados de cuenta bancarios a la ase nov-dic-2024 Luis.pdf', 'txP8Ow1Ku3_PRESIDENCIA oficio-0198-2025 se remiten estados de cuenta bancarios a la ase nov-dic-2024 Luis.pdf', 3, '2025-02-18 16:20:44', '2025-02-18 16:20:44'),
	(846, 'storage/documentos/oficio/5icopkLfns_PRESIDENCIA oficio-0199-2025 se remite nómina pagada a la ase nov-dic 2024 Luis.pdf', '5icopkLfns_PRESIDENCIA oficio-0199-2025 se remite nómina pagada a la ase nov-dic 2024 Luis.pdf', 3, '2025-02-18 16:23:03', '2025-02-18 16:23:03'),
	(847, 'storage/documentos/oficio/cAJV0thnR6_PRESIDENCIA oficio-0200-2025 se remiten comprobantes fiscales digitales nov-dic Luis.pdf', 'cAJV0thnR6_PRESIDENCIA oficio-0200-2025 se remiten comprobantes fiscales digitales nov-dic Luis.pdf', 3, '2025-02-18 16:28:08', '2025-02-18 16:28:08'),
	(848, 'storage/documentos/oficio/cWClNNOoRg_PRESIDENCIA oficio-0201-2025 se remiten formatos trimestrales de ley de disciplina nov-dic-2024 Luis.pdf', 'cWClNNOoRg_PRESIDENCIA oficio-0201-2025 se remiten formatos trimestrales de ley de disciplina nov-dic-2024 Luis.pdf', 3, '2025-02-18 16:31:20', '2025-02-18 16:31:20'),
	(849, 'storage/documentos/memorandum/Q4gmttLwwY_DTS memo-0332-2025 se informa no aceptación del cargo Cuarto.pdf', 'Q4gmttLwwY_DTS memo-0332-2025 se informa no aceptación del cargo Cuarto.pdf', 2, '2025-02-18 19:22:23', '2025-02-18 19:22:23'),
	(850, 'storage/documentos/memorandum/sQF64OSUGP_FISCALIZACIÓN memo-0046-25 Eder-Saúl.pdf', 'sQF64OSUGP_FISCALIZACIÓN memo-0046-25 Eder-Saúl.pdf', 2, '2025-02-18 19:25:10', '2025-02-18 19:25:10'),
	(851, 'storage/documentos/memorandum/NzCi6VCCD0_PRERROGATIVAS memo-0191-2025 se informa apertura de cuenta bancaria PRI Eder.pdf', 'NzCi6VCCD0_PRERROGATIVAS memo-0191-2025 se informa apertura de cuenta bancaria PRI Eder.pdf', 2, '2025-02-18 19:30:23', '2025-02-18 19:30:23'),
	(852, 'storage/documentos/requisicion/aHFyar9k8U_REQUISICIÓN No.pdf', 'aHFyar9k8U_REQUISICIÓN No.pdf', 1, '2025-02-18 19:32:20', '2025-02-18 19:32:20'),
	(853, 'storage/documentos/requisicion/aiSvOCvj12_REQUISICIÓN No.pdf', 'aiSvOCvj12_REQUISICIÓN No.pdf', 1, '2025-02-18 19:33:43', '2025-02-18 19:33:43'),
	(854, 'storage/documentos/requisicion/IIAFT8KKGF_REQUISICIÓN No.pdf', 'IIAFT8KKGF_REQUISICIÓN No.pdf', 1, '2025-02-18 19:35:20', '2025-02-18 19:35:20'),
	(855, 'storage/documentos/memorandum/R4HL1VeyTj_INFORMÁTICA memo-032-2025 Centas para sistema Archivo.pdf', 'R4HL1VeyTj_INFORMÁTICA memo-032-2025 Centas para sistema Archivo.pdf', 2, '2025-02-18 23:09:37', '2025-02-18 23:09:37'),
	(856, 'storage/documentos/memorandum/4sBM9f3XVq_INFORMÁTICA memo-033-2025 transferencia primaria Archivo.pdf', '4sBM9f3XVq_INFORMÁTICA memo-033-2025 transferencia primaria Archivo.pdf', 2, '2025-02-18 23:11:04', '2025-02-18 23:11:04'),
	(857, 'storage/documentos/memorandum/h8SIP2lc4b_PLANEACIÓN memo-013-2025 resp memo da-0178-2025 resp ASE Eder.pdf', 'h8SIP2lc4b_PLANEACIÓN memo-013-2025 resp memo da-0178-2025 resp ASE Eder.pdf', 2, '2025-02-18 23:13:50', '2025-02-18 23:13:50'),
	(858, 'storage/documentos/requisicion/PvNku7c5Ec_REQUISICIÓN No.pdf', 'PvNku7c5Ec_REQUISICIÓN No.pdf', 1, '2025-02-18 23:15:27', '2025-02-18 23:15:27'),
	(859, 'storage/documentos/requisicion/ae1YjsQm3G_REQUISICIÓN No.pdf', 'ae1YjsQm3G_REQUISICIÓN No.pdf', 1, '2025-02-18 23:17:29', '2025-02-18 23:17:29'),
	(860, 'storage/documentos/requisicion/YBplv7ic4B_REQUISICIÓN No.pdf', 'YBplv7ic4B_REQUISICIÓN No.pdf', 1, '2025-02-18 23:18:46', '2025-02-18 23:18:46'),
	(861, 'storage/documentos/requisicion/CAN5CcOEow_REQUISICIÓN No.pdf', 'CAN5CcOEow_REQUISICIÓN No.pdf', 1, '2025-02-18 23:20:09', '2025-02-18 23:20:09'),
	(862, 'storage/documentos/requisicion/Zs8dHaHaZ8_REQUISICIÓN No.pdf', 'Zs8dHaHaZ8_REQUISICIÓN No.pdf', 1, '2025-02-18 23:23:00', '2025-02-18 23:23:00'),
	(863, 'storage/documentos/memorandum/CnnUpFEAmb_SECRETARÍA memo-0828-2025 se remite folio 1046 remite oficio iee-2024-054 auditor externo Eder.pdf', 'CnnUpFEAmb_SECRETARÍA memo-0828-2025 se remite folio 1046 remite oficio iee-2024-054 auditor externo Eder.pdf', 2, '2025-02-18 23:24:54', '2025-02-18 23:24:54'),
	(864, 'storage/documentos/memorandum/OfHBcirxs0_SECRETARÍA memo-0829-2025 se remite folio 1047 remite información confirmación saldo deudores Eder.pdf', 'OfHBcirxs0_SECRETARÍA memo-0829-2025 se remite folio 1047 remite información confirmación saldo deudores Eder.pdf', 2, '2025-02-18 23:26:50', '2025-02-18 23:26:50'),
	(865, 'storage/documentos/memorandum/7oE802hNhK_SECRETARÍA memo-0830-2025 se remite folio 1048 remite constancia de observación solventada Eder.pdf', '7oE802hNhK_SECRETARÍA memo-0830-2025 se remite folio 1048 remite constancia de observación solventada Eder.pdf', 2, '2025-02-18 23:29:07', '2025-02-18 23:29:07'),
	(866, 'storage/documentos/memorandum/ZeGetmqFdT_SECRETARÍA memo-0831-2025 se remite folio 1049 remite constancias de observaciones solventadas Eder.pdf', 'ZeGetmqFdT_SECRETARÍA memo-0831-2025 se remite folio 1049 remite constancias de observaciones solventadas Eder.pdf', 2, '2025-02-18 23:30:59', '2025-02-18 23:30:59'),
	(867, 'storage/documentos/oficio/CQBCnGUcgF_SUBDIRECCIÓN DE PRESTACIONES ECONÓMICAS Y SOCIALES ISSSTEP Eder-Cuarto.pdf', 'CQBCnGUcgF_SUBDIRECCIÓN DE PRESTACIONES ECONÓMICAS Y SOCIALES ISSSTEP Eder-Cuarto.pdf', 3, '2025-02-18 23:34:10', '2025-02-18 23:34:10'),
	(868, 'storage/documentos/memorandum/yRtNpiIOUt_CAPACITACIÓN memo-055-2025 respuesta a requerimiento Eder.pdf', 'yRtNpiIOUt_CAPACITACIÓN memo-055-2025 respuesta a requerimiento Eder.pdf', 2, '2025-02-19 19:26:51', '2025-02-19 19:26:51'),
	(869, 'storage/documentos/memorandum/c0mY4lcamV_CONSEJERA EVA memo-002-2025 sesión ordinaria de copead Eder-Huoston.pdf', 'c0mY4lcamV_CONSEJERA EVA memo-002-2025 sesión ordinaria de copead Eder-Huoston.pdf', 2, '2025-02-19 19:30:21', '2025-02-19 19:30:21'),
	(870, 'storage/documentos/memorandum/ySEgZW64GB_DOE memo-161-2025 proyección de montos Eder-Emir-Saúl.pdf', 'ySEgZW64GB_DOE memo-161-2025 proyección de montos Eder-Emir-Saúl.pdf', 2, '2025-02-19 19:32:40', '2025-02-19 19:32:40'),
	(871, 'storage/documentos/memorandum/J7J9kr26fJ_DTS memo-0341-2025 se informa no aceptación al cargo Cuarto.pdf', 'J7J9kr26fJ_DTS memo-0341-2025 se informa no aceptación al cargo Cuarto.pdf', 2, '2025-02-19 19:36:21', '2025-02-19 19:36:21'),
	(872, 'storage/documentos/memorandum/oXDPmTPmrI_INFORMÁTICA memo-034-2025 sistema de registro de candidaturas Archivo.pdf', 'oXDPmTPmrI_INFORMÁTICA memo-034-2025 sistema de registro de candidaturas Archivo.pdf', 2, '2025-02-19 19:38:36', '2025-02-19 19:38:36'),
	(873, 'storage/documentos/memorandum/VxeyFPFSH2_JURÍDICO memo-ca-se-0012-2025 se remite convenio para su elaboración PREP Huoston-Eder.pdf', 'VxeyFPFSH2_JURÍDICO memo-ca-se-0012-2025 se remite convenio para su elaboración PREP Huoston-Eder.pdf', 2, '2025-02-19 19:41:05', '2025-02-19 19:41:05'),
	(874, 'storage/documentos/memorandum/Q5Ad3HQpes_PRESIDENCIA memo-0624-2025 ministración febrero se solicita sea depositado el 27-02-2025 Eder-Saúl.pdf', 'Q5Ad3HQpes_PRESIDENCIA memo-0624-2025 ministración febrero se solicita sea depositado el 27-02-2025 Eder-Saúl.pdf', 2, '2025-02-19 19:43:45', '2025-02-19 19:43:45'),
	(875, 'storage/documentos/oficio/nBVQqMCeYy_PRESIDENCIA oficio-0206-2025 solicitud de chequera especial Saúl.pdf', 'nBVQqMCeYy_PRESIDENCIA oficio-0206-2025 solicitud de chequera especial Saúl.pdf', 3, '2025-02-19 19:46:41', '2025-02-19 19:46:41'),
	(876, 'storage/documentos/oficio/c67HB2hXYV_PRESIDENCIA oficio-0207-2025 solicitud de chequera especial Saúl.pdf', 'c67HB2hXYV_PRESIDENCIA oficio-0207-2025 solicitud de chequera especial Saúl.pdf', 3, '2025-02-19 21:38:57', '2025-02-19 21:38:57'),
	(877, 'storage/documentos/requisicion/CjrtNjSA5m_REQUISICIÓN No.pdf', 'CjrtNjSA5m_REQUISICIÓN No.pdf', 1, '2025-02-19 21:41:42', '2025-02-19 21:41:42'),
	(878, 'storage/documentos/requisicion/96p9oIw2oX_REQUISICIÓN No.pdf', '96p9oIw2oX_REQUISICIÓN No.pdf', 1, '2025-02-19 21:46:15', '2025-02-19 21:46:15'),
	(879, 'storage/documentos/requisicion/wtqcjjhO8E_REQUISICIÓN No.pdf', 'wtqcjjhO8E_REQUISICIÓN No.pdf', 1, '2025-02-19 21:48:07', '2025-02-19 21:48:07'),
	(880, 'storage/documentos/requisicion/vGbbxrMMY9_REQUISICIÓN No.pdf', 'vGbbxrMMY9_REQUISICIÓN No.pdf', 1, '2025-02-19 21:50:01', '2025-02-19 21:50:01'),
	(881, 'storage/documentos/memorandum/KzBfdhD5S9_COMUNICACIÓN memo-053-2025 boletín 09 Archivo.pdf', 'KzBfdhD5S9_COMUNICACIÓN memo-053-2025 boletín 09 Archivo.pdf', 2, '2025-02-19 23:20:09', '2025-02-19 23:20:09'),
	(882, 'storage/documentos/circular/AJeypMm1x5_SECRETARÍA circular-030-2025 se informa conformación de comité de integridad del instituto a todo el personal.pdf', 'AJeypMm1x5_SECRETARÍA circular-030-2025 se informa conformación de comité de integridad del instituto a todo el personal.pdf', 4, '2025-02-19 23:25:01', '2025-02-19 23:25:01'),
	(883, 'storage/documentos/memorandum/6fvyAjfXyV_UFD memo-212-2025 se solicita alta de personal Cuarto.pdf', '6fvyAjfXyV_UFD memo-212-2025 se solicita alta de personal Cuarto.pdf', 2, '2025-02-19 23:29:19', '2025-02-19 23:29:19'),
	(884, 'storage/documentos/memorandum/2JbB0cE2xI_TRANSPARENCIA memo-ut-sol-019-2025 se solicita información Eder-Emir (2).pdf', '2JbB0cE2xI_TRANSPARENCIA memo-ut-sol-019-2025 se solicita información Eder-Emir (2).pdf', 2, '2025-02-19 23:32:03', '2025-02-19 23:32:03'),
	(885, 'storage/documentos/requisicion/0ZJVOijkX9_REQUISICIÓN No.pdf', '0ZJVOijkX9_REQUISICIÓN No.pdf', 1, '2025-02-19 23:33:49', '2025-02-19 23:33:49'),
	(886, 'storage/documentos/requisicion/5Nk8vT7PtF_REQUISICIÓN No.pdf', '5Nk8vT7PtF_REQUISICIÓN No.pdf', 1, '2025-02-19 23:36:42', '2025-02-19 23:36:42'),
	(887, 'storage/documentos/requisicion/Lqc75OoCeP_REQUISICIÓN No.pdf', 'Lqc75OoCeP_REQUISICIÓN No.pdf', 1, '2025-02-19 23:39:22', '2025-02-19 23:39:22'),
	(888, 'storage/documentos/requisicion/XnUnkg24rx_REQUISICIÓN No.pdf', 'XnUnkg24rx_REQUISICIÓN No.pdf', 1, '2025-02-19 23:40:54', '2025-02-19 23:40:54'),
	(889, 'storage/documentos/memorandum/sC91pIFCME_DOE memo-166-2025 se remite información Eder-Saúl-Daniel.pdf', 'sC91pIFCME_DOE memo-166-2025 se remite información Eder-Saúl-Daniel.pdf', 2, '2025-02-20 20:41:02', '2025-02-20 20:41:02'),
	(890, 'storage/documentos/memorandum/VIaVpdXjDi_JURÍDICO memo-ca-se-0015-2025 se remite contrato para firma grupo proisi Eder-Huoston.pdf', 'VIaVpdXjDi_JURÍDICO memo-ca-se-0015-2025 se remite contrato para firma grupo proisi Eder-Huoston.pdf', 2, '2025-02-20 21:04:16', '2025-02-20 21:04:16'),
	(891, 'storage/documentos/escrito/z5PdSDr1rE_OFICIALÍA DE PARTES correo  FOLIO 1090 OFICIO HAT-PM-035-2025 C.pdf', 'z5PdSDr1rE_OFICIALÍA DE PARTES correo  FOLIO 1090 OFICIO HAT-PM-035-2025 C.pdf', 5, '2025-02-20 21:08:52', '2025-02-20 21:08:52'),
	(892, 'storage/documentos/memorandum/G2VjToNEYr_INFORMÁTICA memo-035-2025 sistema de captura de los resultados electorales de las actas de escrutinio y cómputo Archivo.pdf', 'G2VjToNEYr_INFORMÁTICA memo-035-2025 sistema de captura de los resultados electorales de las actas de escrutinio y cómputo Archivo.pdf', 2, '2025-02-20 21:28:22', '2025-02-20 21:28:22'),
	(893, 'storage/documentos/escrito/tu1tfKxC3H_OFICIALIA DE PARTES correo No.pdf', 'tu1tfKxC3H_OFICIALIA DE PARTES correo No.pdf', 5, '2025-02-20 21:31:18', '2025-02-20 21:31:18'),
	(894, 'storage/documentos/circular/MTHFhMVwkV_SECRETARÍA circular-009-2025  se remite acuerdo cg-ac-0028-2025 Eder-Huoston.pdf', 'MTHFhMVwkV_SECRETARÍA circular-009-2025  se remite acuerdo cg-ac-0028-2025 Eder-Huoston.pdf', 4, '2025-02-20 21:34:13', '2025-02-20 21:34:13'),
	(895, 'storage/documentos/memorandum/HVtyyWFZ17_SECRETARÍA memo-0843-2025 se remite acuerdo CG-AC-0024-2025 Eder-Huoston.pdf', 'HVtyyWFZ17_SECRETARÍA memo-0843-2025 se remite acuerdo CG-AC-0024-2025 Eder-Huoston.pdf', 2, '2025-02-20 21:36:28', '2025-02-20 21:36:28'),
	(896, 'storage/documentos/memorandum/UVkxfXPfn4_SECRETARÍA memo-0848-2025 se remite acuerdo CG-AC-0028-2025 Eder-Huoston.pdf', 'UVkxfXPfn4_SECRETARÍA memo-0848-2025 se remite acuerdo CG-AC-0028-2025 Eder-Huoston.pdf', 2, '2025-02-20 21:39:14', '2025-02-20 21:39:14'),
	(897, 'storage/documentos/memorandum/o2WFEeHpGE_SECRETARÍA memo-0857-2025 se remite acuerdo CG-AC-0029-2025 Eder-Huoston.pdf', 'o2WFEeHpGE_SECRETARÍA memo-0857-2025 se remite acuerdo CG-AC-0029-2025 Eder-Huoston.pdf', 2, '2025-02-20 21:41:34', '2025-02-20 21:41:34'),
	(898, 'storage/documentos/escrito/DV8jM2YHbd_SIVOPLE se solicita realizar llenado corresp a su área Emir-Eder.pdf', 'DV8jM2YHbd_SIVOPLE se solicita realizar llenado corresp a su área Emir-Eder.pdf', 5, '2025-02-20 21:43:08', '2025-02-20 21:43:08'),
	(899, 'storage/documentos/memorandum/5XB3eilOco_UFD memo-219-2025 se remite información da-1550-2024 Eder.pdf', '5XB3eilOco_UFD memo-219-2025 se remite información da-1550-2024 Eder.pdf', 2, '2025-02-20 21:45:38', '2025-02-20 21:45:38'),
	(900, 'storage/documentos/requisicion/UiOwBSyYtl_REQUISICIÓN No.pdf', 'UiOwBSyYtl_REQUISICIÓN No.pdf', 1, '2025-02-20 21:48:11', '2025-02-20 21:48:11'),
	(901, 'storage/documentos/requisicion/tX1LGGuFPs_REQUISICIÓN No.pdf', 'tX1LGGuFPs_REQUISICIÓN No.pdf', 1, '2025-02-20 21:50:31', '2025-02-20 21:50:31'),
	(902, 'storage/documentos/requisicion/Bs0XJcYb4x_REQUISICIÓN No.pdf', 'Bs0XJcYb4x_REQUISICIÓN No.pdf', 1, '2025-02-20 21:52:44', '2025-02-20 21:52:44'),
	(903, 'storage/documentos/requisicion/v0h7Avd51S_REQUISICIÓN No.pdf', 'v0h7Avd51S_REQUISICIÓN No.pdf', 1, '2025-02-20 21:54:28', '2025-02-20 21:54:28'),
	(904, 'storage/documentos/requisicion/XIaRTILzjX_REQUISICIÓN No.pdf', 'XIaRTILzjX_REQUISICIÓN No.pdf', 1, '2025-02-20 22:02:14', '2025-02-20 22:02:14'),
	(905, 'storage/documentos/memorandum/f26dPHM2H9_INFORMÁTICA memo-036-2025 Archivo.pdf', 'f26dPHM2H9_INFORMÁTICA memo-036-2025 Archivo.pdf', 2, '2025-02-20 22:05:16', '2025-02-20 22:05:16'),
	(906, 'storage/documentos/memorandum/7kPMEwA8BJ_INFORMÁTICA memo-037-2025 correo institucional Archivo.pdf', '7kPMEwA8BJ_INFORMÁTICA memo-037-2025 correo institucional Archivo.pdf', 2, '2025-02-20 22:19:26', '2025-02-20 22:19:26'),
	(907, 'storage/documentos/memorandum/GY9fDIWUNz_INFORMÁTICA memo-038-2025 actas con qr Archivo.pdf', 'GY9fDIWUNz_INFORMÁTICA memo-038-2025 actas con qr Archivo.pdf', 2, '2025-02-20 23:42:44', '2025-02-20 23:42:44'),
	(908, 'storage/documentos/memorandum/HzroaOMP8J_CONTRALORÍA memo-128-2025 alcance al memo-coi-837-2024 resp.pdf', 'HzroaOMP8J_CONTRALORÍA memo-128-2025 alcance al memo-coi-837-2024 resp.pdf', 2, '2025-02-21 17:42:45', '2025-02-21 17:42:45'),
	(909, 'storage/documentos/memorandum/WikIoACzn5_COMUNICACIÓN memo-054-2025 Boletín 10 Archivo.pdf', 'WikIoACzn5_COMUNICACIÓN memo-054-2025 Boletín 10 Archivo.pdf', 2, '2025-02-22 16:59:01', '2025-02-22 16:59:01'),
	(910, 'storage/documentos/memorandum/FjpmTTbnpJ_COMUNICACIÓN memo-055-2025 boletín 11 Archivo.pdf', 'FjpmTTbnpJ_COMUNICACIÓN memo-055-2025 boletín 11 Archivo.pdf', 2, '2025-02-22 17:03:07', '2025-02-22 17:03:07'),
	(911, 'storage/documentos/memorandum/JTQpnpLnnD_INFORMÁTICA memo-039-2025 base de datos del sistema curso para peronas aspirantes a un cargo de elección popular Archivo.pdf', 'JTQpnpLnnD_INFORMÁTICA memo-039-2025 base de datos del sistema curso para peronas aspirantes a un cargo de elección popular Archivo.pdf', 2, '2025-02-22 17:06:03', '2025-02-22 17:06:03'),
	(912, 'storage/documentos/memorandum/8fYjFsLGCu_JURÍDICO memo-ca-se-0017-2025 se remite contrato para resguardo grupo proisi prep Huoston-Eder.pdf', '8fYjFsLGCu_JURÍDICO memo-ca-se-0017-2025 se remite contrato para resguardo grupo proisi prep Huoston-Eder.pdf', 2, '2025-02-22 17:10:41', '2025-02-22 17:10:41'),
	(913, 'storage/documentos/memorandum/VaoQYTp8eg_PRESIDENCIA memo-029-2025 se convoca a sesión o.pdf', 'VaoQYTp8eg_PRESIDENCIA memo-029-2025 se convoca a sesión o.pdf', 2, '2025-02-22 17:13:50', '2025-02-22 17:13:50'),
	(914, 'storage/documentos/memorandum/YhTnDg0njd_PRESIDENCIA memo-041-2025 sesión o.pdf', 'YhTnDg0njd_PRESIDENCIA memo-041-2025 sesión o.pdf', 2, '2025-02-22 17:16:32', '2025-02-22 17:16:32'),
	(915, 'storage/documentos/oficio/CFFz0gJE8w_PRESIDENCIA oficio-0208-2025 ministración mes de febrero Archivo.pdf', 'CFFz0gJE8w_PRESIDENCIA oficio-0208-2025 ministración mes de febrero Archivo.pdf', 3, '2025-02-22 17:18:31', '2025-02-22 17:18:31'),
	(916, 'storage/documentos/requisicion/40cYiEWzcM_REQUISICIÓN No.pdf', '40cYiEWzcM_REQUISICIÓN No.pdf', 1, '2025-02-22 17:28:42', '2025-02-22 17:28:42'),
	(917, 'storage/documentos/requisicion/ViQP3bs8xT_REQUISICIÓN No.pdf', 'ViQP3bs8xT_REQUISICIÓN No.pdf', 1, '2025-02-22 17:30:32', '2025-02-22 17:30:32'),
	(918, 'storage/documentos/requisicion/w7pgiCmS9k_REQUISICIÓN No.pdf', 'w7pgiCmS9k_REQUISICIÓN No.pdf', 1, '2025-02-22 17:36:11', '2025-02-22 17:36:11'),
	(919, 'storage/documentos/escrito/sCnW8ii9zY_CORREO SAN MARTÍN TEXMELUCAN ACTA SESIÓN.pdf', 'sCnW8ii9zY_CORREO SAN MARTÍN TEXMELUCAN ACTA SESIÓN.pdf', 5, '2025-02-22 17:40:46', '2025-02-22 17:40:46'),
	(920, 'storage/documentos/memorandum/vRz6YfgTzg_PRERROGATIVAS memo-0203-2025 se solicita financiamiento para el 2 de marzo Eder-Saúl.pdf', 'vRz6YfgTzg_PRERROGATIVAS memo-0203-2025 se solicita financiamiento para el 2 de marzo Eder-Saúl.pdf', 2, '2025-02-24 17:31:31', '2025-02-24 17:31:31'),
	(921, 'storage/documentos/requisicion/kbsSrC5zPx_REQUISICIÓN No.pdf', 'kbsSrC5zPx_REQUISICIÓN No.pdf', 1, '2025-02-24 17:38:11', '2025-02-24 17:38:11'),
	(922, 'storage/documentos/requisicion/9lp3KsDnKI_REQUISICIÓN No.pdf', '9lp3KsDnKI_REQUISICIÓN No.pdf', 1, '2025-02-24 17:39:58', '2025-02-24 17:39:58'),
	(923, 'storage/documentos/requisicion/LYR7zNuJvs_REQUISICIÓN No.pdf', 'LYR7zNuJvs_REQUISICIÓN No.pdf', 1, '2025-02-24 17:43:00', '2025-02-24 17:43:00'),
	(924, 'storage/documentos/requisicion/U7ebEcWGcH_REQUISICIÓN No.pdf', 'U7ebEcWGcH_REQUISICIÓN No.pdf', 1, '2025-02-24 17:45:40', '2025-02-24 17:45:40'),
	(925, 'storage/documentos/requisicion/Ixmf9bJRnF_REQUISIICÓN No.pdf', 'Ixmf9bJRnF_REQUISIICÓN No.pdf', 1, '2025-02-24 17:48:03', '2025-02-24 17:48:03'),
	(926, 'storage/documentos/memorandum/CxfBgsrvit_SECRETARÍA memo-ca-p-0133-2025 sesión de adquisiciones Eder-Huoston.pdf', 'CxfBgsrvit_SECRETARÍA memo-ca-p-0133-2025 sesión de adquisiciones Eder-Huoston.pdf', 2, '2025-02-24 18:22:28', '2025-02-24 18:22:28'),
	(927, 'storage/documentos/memorandum/BrgNVhJLWO_SECRETARÍA memo-ca-p-0145-2025 sesión de adquisiciones Eder-Huoston.pdf', 'BrgNVhJLWO_SECRETARÍA memo-ca-p-0145-2025 sesión de adquisiciones Eder-Huoston.pdf', 2, '2025-02-24 18:24:13', '2025-02-24 18:24:13'),
	(928, 'storage/documentos/memorandum/DiP5OJrtXF_JURÍDICO memo-0001bis-2025 se remite ontrato para su observación Bucalos Eder-Huoston.pdf', 'DiP5OJrtXF_JURÍDICO memo-0001bis-2025 se remite ontrato para su observación Bucalos Eder-Huoston.pdf', 2, '2025-02-24 20:57:59', '2025-02-24 20:57:59'),
	(929, 'storage/documentos/memorandum/Yzr5ggoCoe_DOE memo-178-2025 se remite información Eder-Saúl- Daniel.pdf', 'Yzr5ggoCoe_DOE memo-178-2025 se remite información Eder-Saúl- Daniel.pdf', 2, '2025-02-25 13:57:53', '2025-02-25 13:57:53'),
	(930, 'storage/documentos/memorandum/MjVNrBu6WC_DTS memo-0293-2025 se informa renuncia Cuarto.pdf', 'MjVNrBu6WC_DTS memo-0293-2025 se informa renuncia Cuarto.pdf', 2, '2025-02-25 14:16:42', '2025-02-25 14:16:42'),
	(931, 'storage/documentos/memorandum/S5z4YUfTrf_PRERROGATIVAS memo-0204-2025 se remiten números de cuenta de partidos Eder-Saúl.pdf', 'S5z4YUfTrf_PRERROGATIVAS memo-0204-2025 se remiten números de cuenta de partidos Eder-Saúl.pdf', 2, '2025-02-25 14:20:59', '2025-02-25 14:20:59'),
	(932, 'storage/documentos/oficio/kQIhEIs5of_PRESIDENCIA oficio-0221-2025 se remiten estados financieros Emir.pdf', 'kQIhEIs5of_PRESIDENCIA oficio-0221-2025 se remiten estados financieros Emir.pdf', 3, '2025-02-25 14:23:29', '2025-02-25 14:23:29'),
	(933, 'storage/documentos/requisicion/7YzIzdD8XO_REQUISICIÓN No.pdf', '7YzIzdD8XO_REQUISICIÓN No.pdf', 1, '2025-02-25 14:45:45', '2025-02-25 14:45:45'),
	(934, 'storage/documentos/requisicion/kYTxtcFwoh_REQUISICIÓN No.pdf', 'kYTxtcFwoh_REQUISICIÓN No.pdf', 1, '2025-02-25 14:53:25', '2025-02-25 14:53:25'),
	(935, 'storage/documentos/requisicion/8ogPo1pP9m_REQUISICIÓN No.pdf', '8ogPo1pP9m_REQUISICIÓN No.pdf', 1, '2025-02-25 14:54:47', '2025-02-25 14:54:47'),
	(936, 'storage/documentos/requisicion/qKE4N4dOVM_REQUISICIÓN No.pdf', 'qKE4N4dOVM_REQUISICIÓN No.pdf', 1, '2025-02-25 14:57:15', '2025-02-25 14:57:15'),
	(937, 'storage/documentos/requisicion/kxk0lchAHS_REQUISICIÓN No.pdf', 'kxk0lchAHS_REQUISICIÓN No.pdf', 1, '2025-02-25 14:58:55', '2025-02-25 14:58:55'),
	(938, 'storage/documentos/requisicion/GrSuw8wb30_REQUISICIÓN No.pdf', 'GrSuw8wb30_REQUISICIÓN No.pdf', 1, '2025-02-25 15:00:08', '2025-02-25 15:00:08'),
	(939, 'storage/documentos/requisicion/vKQyWABRR4_REQUISICIÓN No.pdf', 'vKQyWABRR4_REQUISICIÓN No.pdf', 1, '2025-02-25 15:01:25', '2025-02-25 15:01:25'),
	(940, 'storage/documentos/requisicion/tHqNDrDETt_REQUISICIÓN No.pdf', 'tHqNDrDETt_REQUISICIÓN No.pdf', 1, '2025-02-25 15:02:38', '2025-02-25 15:02:38'),
	(941, 'storage/documentos/memorandum/wscXYkY8Ed_SECRETARÍA memo-0918-2025 se sutoriza certificación Eder-Luis.pdf', 'wscXYkY8Ed_SECRETARÍA memo-0918-2025 se sutoriza certificación Eder-Luis.pdf', 2, '2025-02-25 15:04:59', '2025-02-25 15:04:59'),
	(942, 'storage/documentos/oficio/f8CjEYDSf8_SECRETARÍA oficio-0435-2025 se remite listado de acuerdos para su conocimiento Eder-Huoston.pdf', 'f8CjEYDSf8_SECRETARÍA oficio-0435-2025 se remite listado de acuerdos para su conocimiento Eder-Huoston.pdf', 3, '2025-02-25 15:32:33', '2025-02-25 15:32:33'),
	(943, 'storage/documentos/circular/Ca35ucpBoP_PLANEACIÓN circular-005-2025 calendario anual de actividades en Planeación y Evaluación Eder-Emir.pdf', 'Ca35ucpBoP_PLANEACIÓN circular-005-2025 calendario anual de actividades en Planeación y Evaluación Eder-Emir.pdf', 4, '2025-02-25 23:17:43', '2025-02-25 23:17:43'),
	(944, 'storage/documentos/memorandum/3xZi9MMOYl_INFORMÁTICA memo-041-2025 sistema registro de candidaturas Archivo.pdf', '3xZi9MMOYl_INFORMÁTICA memo-041-2025 sistema registro de candidaturas Archivo.pdf', 2, '2025-02-25 23:25:59', '2025-02-25 23:25:59'),
	(945, 'storage/documentos/memorandum/mzcdR6yiUJ_INFORMÁTICA memo-042-2025 eliminar registro Archivo.pdf', 'mzcdR6yiUJ_INFORMÁTICA memo-042-2025 eliminar registro Archivo.pdf', 2, '2025-02-25 23:27:30', '2025-02-25 23:27:30'),
	(946, 'storage/documentos/memorandum/FKxJB1aaeo_PRERROGATIVAS memo-0203-2025 se informa sea depositado financiamiento público Eder-Saúl.pdf', 'FKxJB1aaeo_PRERROGATIVAS memo-0203-2025 se informa sea depositado financiamiento público Eder-Saúl.pdf', 2, '2025-02-25 23:31:06', '2025-02-25 23:31:06'),
	(947, 'storage/documentos/memorandum/1n7O5dXw3X_SECRETARÍA memo-ca-p-0157-2025 reanudación de sesión de adquisiciones Huoston-Eder.pdf', '1n7O5dXw3X_SECRETARÍA memo-ca-p-0157-2025 reanudación de sesión de adquisiciones Huoston-Eder.pdf', 2, '2025-02-25 23:46:36', '2025-02-25 23:46:36'),
	(948, 'storage/documentos/memorandum/vVtFbEbYbR_SECRETARÍA memo-c-p-0169-2025 reanudación de sesión de adquisiciones Huoston-Eder.pdf', 'vVtFbEbYbR_SECRETARÍA memo-c-p-0169-2025 reanudación de sesión de adquisiciones Huoston-Eder.pdf', 2, '2025-02-25 23:51:11', '2025-02-25 23:51:11'),
	(949, 'storage/documentos/memorandum/y6sxilyWvK_UFD memo-237-2025 incentivo para personal del servicio profesional ine Eder-Cuarto.pdf', 'y6sxilyWvK_UFD memo-237-2025 incentivo para personal del servicio profesional ine Eder-Cuarto.pdf', 2, '2025-02-26 00:00:04', '2025-02-26 00:00:04'),
	(950, 'storage/documentos/correo/xDQU85iFCi_FISCALIZACIÓN tarjeta de montos a descontar a partidos políticos mes de febrero Saúl.pdf', 'xDQU85iFCi_FISCALIZACIÓN tarjeta de montos a descontar a partidos políticos mes de febrero Saúl.pdf', 7, '2025-02-26 16:08:24', '2025-02-26 16:08:24'),
	(951, 'storage/documentos/escrito/ocZQJihRTO_CONTRALORÍA correo remitir observaciones comité de integridad Eder.pdf', 'ocZQJihRTO_CONTRALORÍA correo remitir observaciones comité de integridad Eder.pdf', 5, '2025-02-26 17:34:51', '2025-02-26 17:34:51'),
	(952, 'storage/documentos/escrito/tJyUO6H9pE_DOE correo solicitud depósito en garantía material electoral palmar de bravo Eder-Saúl.pdf', 'tJyUO6H9pE_DOE correo solicitud depósito en garantía material electoral palmar de bravo Eder-Saúl.pdf', 5, '2025-02-26 17:37:53', '2025-02-26 17:37:53'),
	(953, 'storage/documentos/memorandum/8udF44NMV0_JURÍDICO memo-0022-2025 se remiten bases para su observación Huoston-Eder.pdf', '8udF44NMV0_JURÍDICO memo-0022-2025 se remiten bases para su observación Huoston-Eder.pdf', 2, '2025-02-26 17:51:03', '2025-02-26 17:51:03'),
	(954, 'storage/documentos/memorandum/YudE9rAM8B_JURÍDICO memo-ca-se-0024-2025 se remiten instructivos Eder-Huoston.pdf', 'YudE9rAM8B_JURÍDICO memo-ca-se-0024-2025 se remiten instructivos Eder-Huoston.pdf', 2, '2025-02-26 17:56:27', '2025-02-26 17:56:27'),
	(955, 'storage/documentos/memorandum/CSdE0K51lo_PRERROGATIVAS memo-0211-2025 se remiten recibos oricinales de partido morena Saúl-Eder.pdf', 'CSdE0K51lo_PRERROGATIVAS memo-0211-2025 se remiten recibos oricinales de partido morena Saúl-Eder.pdf', 2, '2025-02-26 18:10:47', '2025-02-26 18:10:47'),
	(956, 'storage/documentos/escrito/MpCMjt9amR_PRESIDENCIA correo Mesa de Trabajo Virtual Lic.pdf', 'MpCMjt9amR_PRESIDENCIA correo Mesa de Trabajo Virtual Lic.pdf', 5, '2025-02-26 18:19:09', '2025-02-26 18:19:09'),
	(957, 'storage/documentos/memorandum/42zRMX2HBe_UFD memo-238-2025 retribución económica para persona del servicio candidata Cuarto-Eder.pdf', '42zRMX2HBe_UFD memo-238-2025 retribución económica para persona del servicio candidata Cuarto-Eder.pdf', 2, '2025-02-26 18:29:49', '2025-02-26 18:29:49'),
	(958, 'storage/documentos/memorandum/jpiDfjiR9V_UFD memo-239-2025 se remite calificación de examen Cuarto-Eder.pdf', 'jpiDfjiR9V_UFD memo-239-2025 se remite calificación de examen Cuarto-Eder.pdf', 2, '2025-02-26 18:31:48', '2025-02-26 18:31:48'),
	(959, 'storage/documentos/memorandum/JkbJ7zPpLG_UFD memo-242-2025 se solicita alta de personal Cuarto.pdf', 'JkbJ7zPpLG_UFD memo-242-2025 se solicita alta de personal Cuarto.pdf', 2, '2025-02-26 18:33:16', '2025-02-26 18:33:16'),
	(960, 'storage/documentos/memorandum/uMGng3HG0g_COMUNICACIÓN memo-059-2025 boletín 12.pdf', 'uMGng3HG0g_COMUNICACIÓN memo-059-2025 boletín 12.pdf', 2, '2025-02-27 13:42:23', '2025-02-27 13:42:23'),
	(961, 'storage/documentos/escrito/g6Dl8zUKjS_CORREO CUENTA PÚBLICA plática virtual 28-02-2025 eder-emir-ale-Lic-.pdf', 'g6Dl8zUKjS_CORREO CUENTA PÚBLICA plática virtual 28-02-2025 eder-emir-ale-Lic-.pdf', 5, '2025-02-27 13:50:00', '2025-02-27 13:50:00'),
	(962, 'storage/documentos/memorandum/gtl9E2VHrB_PRERROGATIVAS memo-0202-2025  mantener activos modulos sitema de registro hasta 31 de marzo Archivo.pdf', 'gtl9E2VHrB_PRERROGATIVAS memo-0202-2025  mantener activos modulos sitema de registro hasta 31 de marzo Archivo.pdf', 2, '2025-02-27 13:56:15', '2025-02-27 13:56:15'),
	(963, 'storage/documentos/memorandum/YCV8VFSbzq_PRERROGATIVAS memo-0213-2025 se solicita pago a prerrogativas Eder-Saúl.pdf', 'YCV8VFSbzq_PRERROGATIVAS memo-0213-2025 se solicita pago a prerrogativas Eder-Saúl.pdf', 2, '2025-02-27 14:01:22', '2025-02-27 14:01:22'),
	(964, 'storage/documentos/memorandum/B1n3SI2YdO_PRERROGATIVAS memo-0215-2025 se remiten recibos originales y una copia digital Eder-Saúl.pdf', 'B1n3SI2YdO_PRERROGATIVAS memo-0215-2025 se remiten recibos originales y una copia digital Eder-Saúl.pdf', 2, '2025-02-27 14:13:52', '2025-02-27 14:13:52'),
	(965, 'storage/documentos/requisicion/xa4yHMyyV7_REQUISICIÓN No.pdf', 'xa4yHMyyV7_REQUISICIÓN No.pdf', 1, '2025-02-27 14:29:27', '2025-02-27 14:29:27'),
	(966, 'storage/documentos/requisicion/fv8IVZq8mC_REQUISICIÓN No.pdf', 'fv8IVZq8mC_REQUISICIÓN No.pdf', 1, '2025-02-27 14:32:39', '2025-02-27 14:32:39'),
	(967, 'storage/documentos/requisicion/JwnDDMC2YP_REQUISICIÓN No.pdf', 'JwnDDMC2YP_REQUISICIÓN No.pdf', 1, '2025-02-27 14:34:24', '2025-02-27 14:34:24'),
	(968, 'storage/documentos/requisicion/0F1L2WsZw6_REQUISICIÓN No.pdf', '0F1L2WsZw6_REQUISICIÓN No.pdf', 1, '2025-02-27 14:36:03', '2025-02-27 14:36:03'),
	(969, 'storage/documentos/requisicion/daB6OIf9wy_REQUISICIÓN No.pdf', 'daB6OIf9wy_REQUISICIÓN No.pdf', 1, '2025-02-27 14:38:00', '2025-02-27 14:38:00'),
	(970, 'storage/documentos/requisicion/9uiCNo7ezr_REQUISICIÓN No.pdf', '9uiCNo7ezr_REQUISICIÓN No.pdf', 1, '2025-02-27 14:39:44', '2025-02-27 14:39:44'),
	(971, 'storage/documentos/requisicion/xPS5o7vwoV_REQUISICIÓN No.pdf', 'xPS5o7vwoV_REQUISICIÓN No.pdf', 1, '2025-02-27 14:41:29', '2025-02-27 14:41:29'),
	(972, 'storage/documentos/requisicion/Fl1HV8ydax_REQUISICIÓN No.pdf', 'Fl1HV8ydax_REQUISICIÓN No.pdf', 1, '2025-02-27 15:27:49', '2025-02-27 15:27:49'),
	(973, 'storage/documentos/requisicion/jELLOtcE5u_REQUISICIÓN No.pdf', 'jELLOtcE5u_REQUISICIÓN No.pdf', 1, '2025-02-27 15:47:20', '2025-02-27 15:47:20'),
	(974, 'storage/documentos/requisicion/uwow8k2Cm2_REQUISICIÓN No.pdf', 'uwow8k2Cm2_REQUISICIÓN No.pdf', 1, '2025-02-27 15:58:51', '2025-02-27 15:58:51'),
	(975, 'storage/documentos/requisicion/JXJGM141G0_REQUISICIÓN No.pdf', 'JXJGM141G0_REQUISICIÓN No.pdf', 1, '2025-02-27 16:03:19', '2025-02-27 16:03:19'),
	(976, 'storage/documentos/requisicion/S4ZXRDQhip_REQUISICIÓN No.pdf', 'S4ZXRDQhip_REQUISICIÓN No.pdf', 1, '2025-02-27 16:08:29', '2025-02-27 16:08:29'),
	(977, 'storage/documentos/memorandum/MZqygDcNjU_PRERROGATIVAS memo-0219-2025 remite datos e cuenta bancarios Saúl-Eder.pdf', 'MZqygDcNjU_PRERROGATIVAS memo-0219-2025 remite datos e cuenta bancarios Saúl-Eder.pdf', 2, '2025-02-27 18:21:27', '2025-02-27 18:21:27'),
	(978, 'storage/documentos/requisicion/nqMwda4WUK_REQUISICIÓN No.pdf', 'nqMwda4WUK_REQUISICIÓN No.pdf', 1, '2025-02-27 18:23:30', '2025-02-27 18:23:30'),
	(979, 'storage/documentos/requisicion/enKSH1R3BL_REQUISICIÓN No.pdf', 'enKSH1R3BL_REQUISICIÓN No.pdf', 1, '2025-02-27 18:24:57', '2025-02-27 18:24:57'),
	(980, 'storage/documentos/requisicion/GP8kMGOBdT_REQUISICIÓN No.pdf', 'GP8kMGOBdT_REQUISICIÓN No.pdf', 1, '2025-02-27 18:26:32', '2025-02-27 18:26:32'),
	(981, 'storage/documentos/requisicion/P4vhSAQCFS_REQUISICIÓN No.pdf', 'P4vhSAQCFS_REQUISICIÓN No.pdf', 1, '2025-02-27 18:29:08', '2025-02-27 18:29:08'),
	(982, 'storage/documentos/requisicion/vnmK12xlG5_REQUISICIÓN No.pdf', 'vnmK12xlG5_REQUISICIÓN No.pdf', 1, '2025-02-27 18:32:08', '2025-02-27 18:32:08'),
	(983, 'storage/documentos/requisicion/Zwi8r43QuK_REQUISICIÓN No.pdf', 'Zwi8r43QuK_REQUISICIÓN No.pdf', 1, '2025-02-27 18:38:17', '2025-02-27 18:38:17'),
	(984, 'storage/documentos/requisicion/mTu9hshVlJ_REQUISICIÓN No.pdf', 'mTu9hshVlJ_REQUISICIÓN No.pdf', 1, '2025-02-27 18:42:14', '2025-02-27 18:42:14'),
	(985, 'storage/documentos/memorandum/RU53RarWvL_INFORMÁTICA memo-086-2025 notificación ine Archivo.pdf', 'RU53RarWvL_INFORMÁTICA memo-086-2025 notificación ine Archivo.pdf', 2, '2025-02-27 18:46:31', '2025-02-27 18:46:31'),
	(986, 'storage/documentos/requisicion/nKlznoYbzN_REQUISICIÓN No.pdf', 'nKlznoYbzN_REQUISICIÓN No.pdf', 1, '2025-02-27 18:49:04', '2025-02-27 18:49:04'),
	(987, 'storage/documentos/requisicion/eeoU2Jl5yE_REQUISICIÓN No.pdf', 'eeoU2Jl5yE_REQUISICIÓN No.pdf', 1, '2025-02-27 18:50:35', '2025-02-27 18:50:35'),
	(988, 'storage/documentos/requisicion/QKEteWLxv4_REQUISICIÓN No.pdf', 'QKEteWLxv4_REQUISICIÓN No.pdf', 1, '2025-02-27 18:52:22', '2025-02-27 18:52:22'),
	(989, 'storage/documentos/requisicion/UmMJZ0hPn6_REQUISICIÓN No.pdf', 'UmMJZ0hPn6_REQUISICIÓN No.pdf', 1, '2025-02-27 18:54:35', '2025-02-27 18:54:35'),
	(990, 'storage/documentos/requisicion/pb9fPBgVhs_REQUISICIÓN No.pdf', 'pb9fPBgVhs_REQUISICIÓN No.pdf', 1, '2025-02-27 19:06:12', '2025-02-27 19:06:12'),
	(991, 'storage/documentos/memorandum/qULR6pZskA_SECRETARÍA memo-ca-p-0181-2025 reanudación sesión de adquisiciones Eder-Huoston.pdf', 'qULR6pZskA_SECRETARÍA memo-ca-p-0181-2025 reanudación sesión de adquisiciones Eder-Huoston.pdf', 2, '2025-02-27 19:09:04', '2025-02-27 19:09:04'),
	(992, 'storage/documentos/escrito/SqqaVJycAm_SEVAC correo cambio de enlace Eder-Ale.pdf', 'SqqaVJycAm_SEVAC correo cambio de enlace Eder-Ale.pdf', 5, '2025-02-27 19:59:28', '2025-02-27 19:59:28'),
	(993, 'storage/documentos/escrito/kxtmjWW42N_SIVOPLE correo remite recibo simple Eder-Emir.pdf', 'kxtmjWW42N_SIVOPLE correo remite recibo simple Eder-Emir.pdf', 5, '2025-02-27 20:02:46', '2025-02-27 20:02:46'),
	(994, 'storage/documentos/escrito/8SU8XBcTL0_DOE correo solicitud anexo san martín texmelucan convenio de colaboración Eder-Saúl.pdf', '8SU8XBcTL0_DOE correo solicitud anexo san martín texmelucan convenio de colaboración Eder-Saúl.pdf', 5, '2025-02-28 16:32:57', '2025-02-28 16:32:57'),
	(995, 'storage/documentos/escrito/YEMatAnhY9_DOE correo solicitud anexo tlahuapan convenio de colaboración Eder-Saúl.pdf', 'YEMatAnhY9_DOE correo solicitud anexo tlahuapan convenio de colaboración Eder-Saúl.pdf', 5, '2025-02-28 16:34:23', '2025-02-28 16:34:23'),
	(996, 'storage/documentos/memorandum/UQeYtvA6M7_INFORMÁTICA memo-ii-prep-086-2025 notificación ine Archivo.pdf', 'UQeYtvA6M7_INFORMÁTICA memo-ii-prep-086-2025 notificación ine Archivo.pdf', 2, '2025-02-28 16:36:09', '2025-02-28 16:36:09'),
	(997, 'storage/documentos/oficio/xIFHbuVuQT_PRESIDEINCIA oficio-0306-2025 se remite información de solventación de resultados finales y obserevaciones preliminares 2023 Archivo.pdf', 'xIFHbuVuQT_PRESIDEINCIA oficio-0306-2025 se remite información de solventación de resultados finales y obserevaciones preliminares 2023 Archivo.pdf', 3, '2025-02-28 16:39:21', '2025-02-28 16:39:21'),
	(998, 'storage/documentos/requisicion/5PCjmzPvRW_REQUISICIÓN No.pdf', '5PCjmzPvRW_REQUISICIÓN No.pdf', 1, '2025-02-28 16:46:45', '2025-02-28 16:46:45'),
	(999, 'storage/documentos/requisicion/znof9GBHQP_REQUISICIÓN No.pdf', 'znof9GBHQP_REQUISICIÓN No.pdf', 1, '2025-02-28 18:32:08', '2025-02-28 18:32:08'),
	(1000, 'storage/documentos/requisicion/G8li3GtN0S_REQUISICIÓN No.pdf', 'G8li3GtN0S_REQUISICIÓN No.pdf', 1, '2025-02-28 18:33:48', '2025-02-28 18:33:48'),
	(1001, 'storage/documentos/requisicion/pcwG4Duhxr_REQUISICIÓN No.pdf', 'pcwG4Duhxr_REQUISICIÓN No.pdf', 1, '2025-02-28 18:35:45', '2025-02-28 18:35:45'),
	(1002, 'storage/documentos/requisicion/XSSrFsY01e_REQUISICIÓN No.pdf', 'XSSrFsY01e_REQUISICIÓN No.pdf', 1, '2025-02-28 20:38:56', '2025-02-28 20:38:56'),
	(1003, 'storage/documentos/memorandum/7PoUXJZTJh_COMUNICACIÓN memo-060-2025 boletín 13 Archivo.pdf', '7PoUXJZTJh_COMUNICACIÓN memo-060-2025 boletín 13 Archivo.pdf', 2, '2025-02-28 20:42:31', '2025-02-28 20:42:31'),
	(1004, 'storage/documentos/memorandum/2JS5DFKCrP_INFORMÁTICA memo-044-2025 base de datos del sistema curso para personas aspirantes Archivo.pdf', '2JS5DFKCrP_INFORMÁTICA memo-044-2025 base de datos del sistema curso para personas aspirantes Archivo.pdf', 2, '2025-02-28 20:48:06', '2025-02-28 20:48:06'),
	(1005, 'storage/documentos/requisicion/brqPE4zYwg_REQUISICIÓN No.pdf', 'brqPE4zYwg_REQUISICIÓN No.pdf', 1, '2025-02-28 20:50:21', '2025-02-28 20:50:21'),
	(1006, 'storage/documentos/requisicion/7bfCT51AO8_REQUISICIÓN No.pdf', '7bfCT51AO8_REQUISICIÓN No.pdf', 1, '2025-02-28 21:10:56', '2025-02-28 21:10:56'),
	(1007, 'storage/documentos/requisicion/66Rr2tq6gc_REQUISICIÓN No.pdf', '66Rr2tq6gc_REQUISICIÓN No.pdf', 1, '2025-02-28 21:13:07', '2025-02-28 21:13:07'),
	(1008, 'storage/documentos/requisicion/yHr1S0Ai2T_REQUISICIÓN No.pdf', 'yHr1S0Ai2T_REQUISICIÓN No.pdf', 1, '2025-02-28 21:16:14', '2025-02-28 21:16:14'),
	(1009, 'storage/documentos/requisicion/b2czBGGzCm_REQUISICIÓN No.pdf', 'b2czBGGzCm_REQUISICIÓN No.pdf', 1, '2025-02-28 21:20:23', '2025-02-28 21:20:23'),
	(1010, 'storage/documentos/requisicion/JN1cYDT6Vq_REQUISICIÓN No.pdf', 'JN1cYDT6Vq_REQUISICIÓN No.pdf', 1, '2025-02-28 21:23:34', '2025-02-28 21:23:34'),
	(1011, 'storage/documentos/requisicion/Cx8ZjQxc75_REQUISICIÓN No.pdf', 'Cx8ZjQxc75_REQUISICIÓN No.pdf', 1, '2025-02-28 21:25:42', '2025-02-28 21:25:42'),
	(1012, 'storage/documentos/requisicion/c8XlYZk38P_REQUISICIÓN No.pdf', 'c8XlYZk38P_REQUISICIÓN No.pdf', 1, '2025-02-28 21:58:17', '2025-02-28 21:58:17'),
	(1013, 'storage/documentos/memorandum/CynGZ4kTau_PRERROGATIVAS memo-0224-2025 renuncia Cuarto.pdf', 'CynGZ4kTau_PRERROGATIVAS memo-0224-2025 renuncia Cuarto.pdf', 2, '2025-02-28 22:01:03', '2025-02-28 22:01:03'),
	(1014, 'storage/documentos/requisicion/aPW0WFBBUs_REQUISICIÓN No.pdf', 'aPW0WFBBUs_REQUISICIÓN No.pdf', 1, '2025-02-28 22:02:31', '2025-02-28 22:02:31'),
	(1015, 'storage/documentos/memorandum/2flWIIuN7I_INFORMÁTICA memo-II-PREP-0116-2025 notificación ine Archivo.pdf', '2flWIIuN7I_INFORMÁTICA memo-II-PREP-0116-2025 notificación ine Archivo.pdf', 2, '2025-02-28 23:03:46', '2025-02-28 23:03:46'),
	(1016, 'storage/documentos/memorandum/pFiPp0fK7I_JURÍDICO memo-0567-2025 se remite convenio de indemnización Cuarto-Eder.pdf', 'pFiPp0fK7I_JURÍDICO memo-0567-2025 se remite convenio de indemnización Cuarto-Eder.pdf', 2, '2025-02-28 23:05:39', '2025-02-28 23:05:39'),
	(1017, 'storage/documentos/requisicion/ysldihIbfN_REQUISICION No.pdf', 'ysldihIbfN_REQUISICION No.pdf', 1, '2025-02-28 23:18:08', '2025-02-28 23:18:08'),
	(1018, 'storage/documentos/memorandum/RWa1WThxEd_SECRETARÍA memo-1004-2025 remite acuerdo cg-ac-0031-2025 Eder-Huoston.pdf', 'RWa1WThxEd_SECRETARÍA memo-1004-2025 remite acuerdo cg-ac-0031-2025 Eder-Huoston.pdf', 2, '2025-02-28 23:46:12', '2025-02-28 23:46:12'),
	(1019, 'storage/documentos/memorandum/zDGFWbkPHJ_SECRETARÍA memo-1010-2025 remite acuerdo cg-ac-0033-2025 Eder-Huoston.pdf', 'zDGFWbkPHJ_SECRETARÍA memo-1010-2025 remite acuerdo cg-ac-0033-2025 Eder-Huoston.pdf', 2, '2025-02-28 23:51:00', '2025-02-28 23:51:00'),
	(1020, 'storage/documentos/memorandum/FoEa56u2Ep_SECRETARÍA memo-1013-2025 remite acuerdo cg-ac-0035-2025 Eder-Huoston.pdf', 'FoEa56u2Ep_SECRETARÍA memo-1013-2025 remite acuerdo cg-ac-0035-2025 Eder-Huoston.pdf', 2, '2025-02-28 23:53:45', '2025-02-28 23:53:45'),
	(1021, 'storage/documentos/memorandum/XBzfkxGFyb_SECRETARÍA mmo-1006-2025  remite acuerdo cg-ac-0032-2025 Eder-Huoston.pdf', 'XBzfkxGFyb_SECRETARÍA mmo-1006-2025  remite acuerdo cg-ac-0032-2025 Eder-Huoston.pdf', 2, '2025-02-28 23:59:03', '2025-02-28 23:59:03'),
	(1022, 'storage/documentos/circular/4fue5shVgz_COMUNICACIÓN circular-03-2025 cobertura de eventos Huoston Eder.pdf', '4fue5shVgz_COMUNICACIÓN circular-03-2025 cobertura de eventos Huoston Eder.pdf', 4, '2025-03-04 15:46:27', '2025-03-04 15:46:27'),
	(1023, 'storage/documentos/circular/JdhW4QCpli_DTS circular-005-2025 temas a considerar a junta ejecutiva Eder-Huoston.pdf', 'JdhW4QCpli_DTS circular-005-2025 temas a considerar a junta ejecutiva Eder-Huoston.pdf', 4, '2025-03-04 15:53:29', '2025-03-04 15:53:29'),
	(1024, 'storage/documentos/circular/Q3GBqAdvqb_DTS circular-006-2025 temas a considerar a consejo general Huoston-Eder.pdf', 'Q3GBqAdvqb_DTS circular-006-2025 temas a considerar a consejo general Huoston-Eder.pdf', 4, '2025-03-04 16:40:09', '2025-03-04 16:40:09'),
	(1025, 'storage/documentos/oficio/2lT5JhqxRv_SECRETARÍA oficio-0528-2025 se remiten acuerdos para conocimiento Huoston-Eder.pdf', '2lT5JhqxRv_SECRETARÍA oficio-0528-2025 se remiten acuerdos para conocimiento Huoston-Eder.pdf', 3, '2025-03-04 16:58:57', '2025-03-04 16:58:57'),
	(1026, 'storage/documentos/memorandum/IINS5Jvvjs_CONTRALORÍA memo-148-2025 pago fotomultas Daniel.pdf', 'IINS5Jvvjs_CONTRALORÍA memo-148-2025 pago fotomultas Daniel.pdf', 2, '2025-03-04 20:32:03', '2025-03-04 20:32:03'),
	(1027, 'storage/documentos/memorandum/CYMGPlAJiH_INFORMÁTICA memo-048-2025 peticiones página web Archivo.pdf', 'CYMGPlAJiH_INFORMÁTICA memo-048-2025 peticiones página web Archivo.pdf', 2, '2025-03-04 20:38:41', '2025-03-04 20:38:41'),
	(1028, 'storage/documentos/correo/NJIH84NwPK_INFORMÁTICA tarjeta informativa 12-2025 se instalaron 2 equipos de cómputo Archivo.pdf', 'NJIH84NwPK_INFORMÁTICA tarjeta informativa 12-2025 se instalaron 2 equipos de cómputo Archivo.pdf', 7, '2025-03-04 21:04:04', '2025-03-04 21:04:04'),
	(1029, 'storage/documentos/memorandum/iCUrZxuiuQ_INFORMÁTICA memo-047-2025 peticiones página web Archivo.pdf', 'iCUrZxuiuQ_INFORMÁTICA memo-047-2025 peticiones página web Archivo.pdf', 2, '2025-03-04 21:08:15', '2025-03-04 21:08:15'),
	(1030, 'storage/documentos/correo/0mBRVN7UqG_INFORMÁTICA tarjeta informativa 10-2025 se atendieron solicitudes Archivo.pdf', '0mBRVN7UqG_INFORMÁTICA tarjeta informativa 10-2025 se atendieron solicitudes Archivo.pdf', 7, '2025-03-04 21:10:22', '2025-03-04 21:10:22'),
	(1031, 'storage/documentos/correo/EYNROBGLk4_INFORMÁTICA tarjeta informativa 13-2025 se realizaron respaldos en base de datos Archivo.pdf', 'EYNROBGLk4_INFORMÁTICA tarjeta informativa 13-2025 se realizaron respaldos en base de datos Archivo.pdf', 7, '2025-03-04 21:12:05', '2025-03-04 21:12:05'),
	(1032, 'storage/documentos/correo/GtZImh56cs_INFORMÁTICA tarjeta 11-2025 se realizaron respaldos de las bases de datos bitácora Archivo.pdf', 'GtZImh56cs_INFORMÁTICA tarjeta 11-2025 se realizaron respaldos de las bases de datos bitácora Archivo.pdf', 7, '2025-03-04 21:22:52', '2025-03-04 21:22:52'),
	(1033, 'storage/documentos/correo/IHRUVs9esu_INFORMÁTICA tarjeta 15-2025 no se presentaron incidencias de red Archivo.pdf', 'IHRUVs9esu_INFORMÁTICA tarjeta 15-2025 no se presentaron incidencias de red Archivo.pdf', 7, '2025-03-04 21:37:59', '2025-03-04 21:37:59'),
	(1034, 'storage/documentos/correo/oVH342eCx4_INFORMÁTICA tarjeta Informtiva 14-2025 no se presentaron incidentes en servicios de internet Archivo.pdf', 'oVH342eCx4_INFORMÁTICA tarjeta Informtiva 14-2025 no se presentaron incidentes en servicios de internet Archivo.pdf', 7, '2025-03-04 21:39:35', '2025-03-04 21:39:35'),
	(1035, 'storage/documentos/memorandum/JqLaoanXn2_JURÍDICO memo-0020BIS-2025 SE REMITE CONTRATO PARA OBSERVACIÓN GRÁFICAS CORONA Eder-Huoston.pdf', 'JqLaoanXn2_JURÍDICO memo-0020BIS-2025 SE REMITE CONTRATO PARA OBSERVACIÓN GRÁFICAS CORONA Eder-Huoston.pdf', 2, '2025-03-04 21:51:41', '2025-03-04 21:51:41'),
	(1036, 'storage/documentos/memorandum/nK9OYGkHo4_JURÍDICO memo-0083-2025 se remiten contratos para su resguardo Huoston-Eder.pdf', 'nK9OYGkHo4_JURÍDICO memo-0083-2025 se remiten contratos para su resguardo Huoston-Eder.pdf', 2, '2025-03-04 21:59:16', '2025-03-04 21:59:16'),
	(1037, 'storage/documentos/memorandum/usL1XB4xpE_JURÍDICO memo-0589-2025 se remite relación de asuntos laborales Huoston-Eder.pdf', 'usL1XB4xpE_JURÍDICO memo-0589-2025 se remite relación de asuntos laborales Huoston-Eder.pdf', 2, '2025-03-04 22:09:44', '2025-03-04 22:09:44'),
	(1038, 'storage/documentos/memorandum/O789CqPdRv_JURÍDICO memo-0609-2025 se solicitan recibos de nómina Cuarto Eder.pdf', 'O789CqPdRv_JURÍDICO memo-0609-2025 se solicitan recibos de nómina Cuarto Eder.pdf', 2, '2025-03-04 22:12:02', '2025-03-04 22:12:02'),
	(1039, 'storage/documentos/memorandum/mrwXWpKiMj_INFORMÁTICA memo-049-2025 correo institucional Archivo.pdf', 'mrwXWpKiMj_INFORMÁTICA memo-049-2025 correo institucional Archivo.pdf', 2, '2025-03-04 22:16:04', '2025-03-04 22:16:04'),
	(1040, 'storage/documentos/escrito/7LynEQ05Ae_OFICIALIA DE PARTES folio 1358 remite oficio spfya-drmsg-0075-2025 atención a oficio da-0034-2025 Daniel.pdf', '7LynEQ05Ae_OFICIALIA DE PARTES folio 1358 remite oficio spfya-drmsg-0075-2025 atención a oficio da-0034-2025 Daniel.pdf', 5, '2025-03-04 22:24:32', '2025-03-04 22:24:32'),
	(1041, 'storage/documentos/memorandum/zvbe9QT34m_DTS memo-0457-2025 se comunica expediente en trámite renuncia laura cabrera chignahuapan Cuarto.pdf', 'zvbe9QT34m_DTS memo-0457-2025 se comunica expediente en trámite renuncia laura cabrera chignahuapan Cuarto.pdf', 2, '2025-03-05 16:27:39', '2025-03-05 16:27:39'),
	(1042, 'storage/documentos/memorandum/WjSCBwMi3Q_JURÍDICO memo-0614-2025 se solicita información 07-03-2025 Huoston-Franco-Eder.pdf', 'WjSCBwMi3Q_JURÍDICO memo-0614-2025 se solicita información 07-03-2025 Huoston-Franco-Eder.pdf', 2, '2025-03-05 16:31:29', '2025-03-05 16:31:29'),
	(1043, 'storage/documentos/memorandum/tVM87XPHeG_PRERROGATIVAS memo-00230-2025  se remiten recibos originales Saúl-Eder.pdf', 'tVM87XPHeG_PRERROGATIVAS memo-00230-2025  se remiten recibos originales Saúl-Eder.pdf', 2, '2025-03-05 16:36:01', '2025-03-05 16:36:01'),
	(1044, 'storage/documentos/oficio/6mUmkFMwfM_PRESIDENCIA 0325-2025 criterios para la asignación y compr.pdf', '6mUmkFMwfM_PRESIDENCIA 0325-2025 criterios para la asignación y compr.pdf', 3, '2025-03-05 16:39:34', '2025-03-05 16:39:34'),
	(1045, 'storage/documentos/memorandum/iHqS4aVrng_PRESIDENCIA memo-0759-2025 financiamiento público para obtención del voto Saúl-Eder.pdf', 'iHqS4aVrng_PRESIDENCIA memo-0759-2025 financiamiento público para obtención del voto Saúl-Eder.pdf', 2, '2025-03-05 16:44:57', '2025-03-05 16:44:57'),
	(1046, 'storage/documentos/memorandum/XFidgnIkGk_SECRETARÍA memo-1088-2025 se remite acuerdo cg-ac-0037-2025.pdf', 'XFidgnIkGk_SECRETARÍA memo-1088-2025 se remite acuerdo cg-ac-0037-2025.pdf', 2, '2025-03-05 16:50:33', '2025-03-05 16:50:33'),
	(1047, 'storage/documentos/escrito/FCmVcuVjDa_SIVOPLE pue-2025-508-00110 voto anticipado Eder-Emir.pdf', 'FCmVcuVjDa_SIVOPLE pue-2025-508-00110 voto anticipado Eder-Emir.pdf', 5, '2025-03-05 17:03:49', '2025-03-05 17:03:49'),
	(1048, 'storage/documentos/memorandum/sKTTL5AAX2_JURÍDICO memo-0015-2025 se remite contrato para firma bucalos seguriad privada Huoston-Eder.pdf', 'sKTTL5AAX2_JURÍDICO memo-0015-2025 se remite contrato para firma bucalos seguriad privada Huoston-Eder.pdf', 2, '2025-03-05 21:02:07', '2025-03-05 21:02:07'),
	(1049, 'storage/documentos/memorandum/yhTLtewtUw_JURÍDICO memo-ca-se-0028-2025 se remite contrato para observación CARABAC Huoston-Shanty-Franco.pdf', 'yhTLtewtUw_JURÍDICO memo-ca-se-0028-2025 se remite contrato para observación CARABAC Huoston-Shanty-Franco.pdf', 2, '2025-03-05 21:27:16', '2025-03-05 21:27:16'),
	(1050, 'storage/documentos/escrito/3Dke9LydBS_UFD correo  reporte general de asystec febrero 16-28 2025 Caro-Sol-Eder-Jorge.pdf', '3Dke9LydBS_UFD correo  reporte general de asystec febrero 16-28 2025 Caro-Sol-Eder-Jorge.pdf', 5, '2025-03-05 22:42:56', '2025-03-05 22:42:56'),
	(1051, 'storage/documentos/memorandum/4u0CsGKZSy_COMUNICACIÓN memo-066-2025 noletín 15.pdf', '4u0CsGKZSy_COMUNICACIÓN memo-066-2025 noletín 15.pdf', 2, '2025-03-07 14:18:30', '2025-03-07 14:18:30'),
	(1052, 'storage/documentos/memorandum/cL9ucAnk1L_COMUNICACIÓN memo-067-2025 boletín 16 Archivo.pdf', 'cL9ucAnk1L_COMUNICACIÓN memo-067-2025 boletín 16 Archivo.pdf', 2, '2025-03-07 14:56:25', '2025-03-07 14:56:25'),
	(1053, 'storage/documentos/memorandum/BkIsc7eyPb_DOE memo-210-2025 resp memo da-0259-2025 Huoston-Franco-Eder.pdf', 'BkIsc7eyPb_DOE memo-210-2025 resp memo da-0259-2025 Huoston-Franco-Eder.pdf', 2, '2025-03-07 15:23:55', '2025-03-07 15:23:55'),
	(1054, 'storage/documentos/memorandum/TJGlCEmUom_DTS memo-0479-2025 se informa renuncia y exp concluido Cuarto.pdf', 'TJGlCEmUom_DTS memo-0479-2025 se informa renuncia y exp concluido Cuarto.pdf', 2, '2025-03-07 15:30:33', '2025-03-07 15:30:33'),
	(1055, 'storage/documentos/memorandum/j5ZaCuoTss_PRERROGATIVAS memo-0256-2025 se remiten recibos originales pan-mc-psi Saúl-Eder.pdf', 'j5ZaCuoTss_PRERROGATIVAS memo-0256-2025 se remiten recibos originales pan-mc-psi Saúl-Eder.pdf', 2, '2025-03-07 17:13:13', '2025-03-07 17:13:13'),
	(1056, 'storage/documentos/requisicion/z8h6mX74un_REQUISICISIÓN No.pdf', 'z8h6mX74un_REQUISICISIÓN No.pdf', 1, '2025-03-07 17:15:50', '2025-03-07 17:15:50'),
	(1057, 'storage/documentos/requisicion/PBsx680XyJ_REQUISICISIÓN No.pdf', 'PBsx680XyJ_REQUISICISIÓN No.pdf', 1, '2025-03-07 17:17:33', '2025-03-07 17:17:33'),
	(1058, 'storage/documentos/requisicion/QxyU6mdmOB_REQUISICIÓN No.pdf', 'QxyU6mdmOB_REQUISICIÓN No.pdf', 1, '2025-03-07 17:23:00', '2025-03-07 17:23:00'),
	(1059, 'storage/documentos/requisicion/gTEtoJEt5H_REQUISICIÓN No.pdf', 'gTEtoJEt5H_REQUISICIÓN No.pdf', 1, '2025-03-07 17:25:14', '2025-03-07 17:25:14'),
	(1060, 'storage/documentos/requisicion/IJGJWtVcoo_REQUISICIÓN No.pdf', 'IJGJWtVcoo_REQUISICIÓN No.pdf', 1, '2025-03-07 17:35:39', '2025-03-07 17:35:39'),
	(1061, 'storage/documentos/requisicion/21osien44K_REQUISICIÓN No.pdf', '21osien44K_REQUISICIÓN No.pdf', 1, '2025-03-07 17:40:42', '2025-03-07 17:40:42'),
	(1062, 'storage/documentos/requisicion/JWDTJVdA8v_REQUISICIÓN No.pdf', 'JWDTJVdA8v_REQUISICIÓN No.pdf', 1, '2025-03-07 17:45:11', '2025-03-07 17:45:11'),
	(1063, 'storage/documentos/requisicion/RwmgQzvKts_REQUISICIÓN No.pdf', 'RwmgQzvKts_REQUISICIÓN No.pdf', 1, '2025-03-07 17:50:20', '2025-03-07 17:50:20'),
	(1064, 'storage/documentos/memorandum/hpn6MqcCQM_UFD memo-279-2025 se remite incapacidad médica Cuarto.pdf', 'hpn6MqcCQM_UFD memo-279-2025 se remite incapacidad médica Cuarto.pdf', 2, '2025-03-07 17:53:05', '2025-03-07 17:53:05'),
	(1065, 'storage/documentos/memorandum/1wuedfF9gd_INFORMÁTICA memo-051-2025 transferencia de archivo Archivo.pdf', '1wuedfF9gd_INFORMÁTICA memo-051-2025 transferencia de archivo Archivo.pdf', 2, '2025-03-07 17:55:38', '2025-03-07 17:55:38'),
	(1066, 'storage/documentos/memorandum/fRpWgEuDUv_INFORMÁTICA memo-050-2025 sistema de captura de los resultados electorales y actas de escrut.pdf', 'fRpWgEuDUv_INFORMÁTICA memo-050-2025 sistema de captura de los resultados electorales y actas de escrut.pdf', 2, '2025-03-07 17:59:10', '2025-03-07 17:59:10'),
	(1067, 'storage/documentos/memorandum/IwUvgVSbKi_INFORMÁTICA memo-052-2025 transferencia de archivo Archivo.pdf', 'IwUvgVSbKi_INFORMÁTICA memo-052-2025 transferencia de archivo Archivo.pdf', 2, '2025-03-07 18:03:33', '2025-03-07 18:03:33'),
	(1068, 'storage/documentos/memorandum/5HlWhsxAy7_INFORMÁTICA memo-053-2025 transferencia de archivos Archivo.pdf', '5HlWhsxAy7_INFORMÁTICA memo-053-2025 transferencia de archivos Archivo.pdf', 2, '2025-03-07 18:07:10', '2025-03-07 18:07:10'),
	(1069, 'storage/documentos/requisicion/1ofw1gOz3e_REQUISICIÓN No.pdf', '1ofw1gOz3e_REQUISICIÓN No.pdf', 1, '2025-03-07 18:09:08', '2025-03-07 18:09:08'),
	(1070, 'storage/documentos/requisicion/8a8iNaVfFt_REQUISICIÓN No.pdf', '8a8iNaVfFt_REQUISICIÓN No.pdf', 1, '2025-03-07 18:10:48', '2025-03-07 18:10:48'),
	(1071, 'storage/documentos/requisicion/fVWoC7TUNW_REQUISICIÓN No.pdf', 'fVWoC7TUNW_REQUISICIÓN No.pdf', 1, '2025-03-07 18:26:28', '2025-03-07 18:26:28'),
	(1072, 'storage/documentos/requisicion/J69BWHRx2I_REQUISIICÓN No.pdf', 'J69BWHRx2I_REQUISIICÓN No.pdf', 1, '2025-03-07 18:28:05', '2025-03-07 18:28:05'),
	(1073, 'storage/documentos/requisicion/NsgdkAQlrT_REQUISICIÓN No.pdf', 'NsgdkAQlrT_REQUISICIÓN No.pdf', 1, '2025-03-07 18:32:35', '2025-03-07 18:32:35'),
	(1074, 'storage/documentos/requisicion/w1DxiTH7Zi_REQUISICIÓN No.pdf', 'w1DxiTH7Zi_REQUISICIÓN No.pdf', 1, '2025-03-07 18:34:28', '2025-03-07 18:34:28'),
	(1075, 'storage/documentos/requisicion/hvHkUEuhH1_REQUISICIÓN No.pdf', 'hvHkUEuhH1_REQUISICIÓN No.pdf', 1, '2025-03-07 18:36:05', '2025-03-07 18:36:05'),
	(1076, 'storage/documentos/requisicion/7FEFNONvxz_REQUISICIÓN No.pdf', '7FEFNONvxz_REQUISICIÓN No.pdf', 1, '2025-03-07 18:44:31', '2025-03-07 18:44:31'),
	(1077, 'storage/documentos/requisicion/1knknNmR8L_REQUISICIÓN No.pdf', '1knknNmR8L_REQUISICIÓN No.pdf', 1, '2025-03-07 18:49:33', '2025-03-07 18:49:33'),
	(1078, 'storage/documentos/requisicion/w8ao9VHSVn_REQUISICIÓN No.pdf', 'w8ao9VHSVn_REQUISICIÓN No.pdf', 1, '2025-03-07 18:51:11', '2025-03-07 18:51:11'),
	(1079, 'storage/documentos/memorandum/KbuUVXTHeC_COMUNICACIÓN memo-071-2025 boletín 17 Archivo.pdf', 'KbuUVXTHeC_COMUNICACIÓN memo-071-2025 boletín 17 Archivo.pdf', 2, '2025-03-10 20:34:09', '2025-03-10 20:34:09'),
	(1080, 'storage/documentos/memorandum/D5dsUrM01n_INFORMÁTICA memo-054-2025 sistema para muestras de casillas.pdf', 'D5dsUrM01n_INFORMÁTICA memo-054-2025 sistema para muestras de casillas.pdf', 2, '2025-03-10 20:36:12', '2025-03-10 20:36:12'),
	(1081, 'storage/documentos/correo/T2dV6MiYBV_INFORMÁTICA t.pdf', 'T2dV6MiYBV_INFORMÁTICA t.pdf', 7, '2025-03-10 20:43:21', '2025-03-10 20:43:21'),
	(1082, 'storage/documentos/memorandum/1OCzD5RXyQ_JURÍDICO memo-0020BIS-2025 SE REMITE CONTRATO PARA OBSERVACIÓN GRÁFICAS CORONA Eder-Huoston.pdf', '1OCzD5RXyQ_JURÍDICO memo-0020BIS-2025 SE REMITE CONTRATO PARA OBSERVACIÓN GRÁFICAS CORONA Eder-Huoston.pdf', 2, '2025-03-10 20:47:15', '2025-03-10 20:47:15'),
	(1083, 'storage/documentos/memorandum/FKuD86YsJ5_PRERROGATIVAS memo-00230-2025  se remiten recibos originales Saúl-Eder.pdf', 'FKuD86YsJ5_PRERROGATIVAS memo-00230-2025  se remiten recibos originales Saúl-Eder.pdf', 2, '2025-03-10 20:49:20', '2025-03-10 20:49:20'),
	(1084, 'storage/documentos/oficio/gA19tzo43l_PRERROGATIVAS oficio-0043-2025  inconsitencias en recibos pt Saúl- Eder.pdf', 'gA19tzo43l_PRERROGATIVAS oficio-0043-2025  inconsitencias en recibos pt Saúl- Eder.pdf', 3, '2025-03-10 20:53:47', '2025-03-10 20:53:47'),
	(1085, 'storage/documentos/escrito/6EHtV7M1Vz_SECRETARÍA remite oficio-pre-0325-2025 criterios para asignación y comprobació recursos sel-cael Emir-Eder.pdf', '6EHtV7M1Vz_SECRETARÍA remite oficio-pre-0325-2025 criterios para asignación y comprobació recursos sel-cael Emir-Eder.pdf', 5, '2025-03-10 21:12:30', '2025-03-10 21:12:30'),
	(1086, 'storage/documentos/requisicion/p5GugolAGM_REQUISICIÓN No 575.pdf', 'p5GugolAGM_REQUISICIÓN No 575.pdf', 1, '2025-03-10 21:15:22', '2025-03-10 21:15:22'),
	(1087, 'storage/documentos/requisicion/tzzkKaVgaa_REQUISICIÓN No 614.pdf', 'tzzkKaVgaa_REQUISICIÓN No 614.pdf', 1, '2025-03-10 21:17:34', '2025-03-10 21:17:34'),
	(1088, 'storage/documentos/requisicion/LNJkkaiR2G_REQUISICIÓN No.pdf', 'LNJkkaiR2G_REQUISICIÓN No.pdf', 1, '2025-03-10 21:24:18', '2025-03-10 21:24:18'),
	(1089, 'storage/documentos/requisicion/h4yzGesnt1_REQUISICIÓN No.pdf', 'h4yzGesnt1_REQUISICIÓN No.pdf', 1, '2025-03-10 22:01:08', '2025-03-10 22:01:08'),
	(1090, 'storage/documentos/requisicion/XRJbcmz8ea_REQUISICIÓN No.pdf', 'XRJbcmz8ea_REQUISICIÓN No.pdf', 1, '2025-03-10 22:02:46', '2025-03-10 22:02:46'),
	(1091, 'storage/documentos/requisicion/NEajHCigFx_REQUISICIÓN No.pdf', 'NEajHCigFx_REQUISICIÓN No.pdf', 1, '2025-03-10 22:04:38', '2025-03-10 22:04:38'),
	(1092, 'storage/documentos/requisicion/SmWMG5qHkO_REQUISICIÓN No.pdf', 'SmWMG5qHkO_REQUISICIÓN No.pdf', 1, '2025-03-10 22:08:56', '2025-03-10 22:08:56'),
	(1093, 'storage/documentos/requisicion/en85RzGp1t_REQUISICIÓN No.pdf', 'en85RzGp1t_REQUISICIÓN No.pdf', 1, '2025-03-11 13:44:33', '2025-03-11 13:44:33'),
	(1094, 'storage/documentos/requisicion/mpBVwyTOJn_REQUISICIÓN No.pdf', 'mpBVwyTOJn_REQUISICIÓN No.pdf', 1, '2025-03-11 13:47:32', '2025-03-11 13:47:32'),
	(1095, 'storage/documentos/memorandum/m9irrbwPx1_COMUNICACIÓN No.pdf', 'm9irrbwPx1_COMUNICACIÓN No.pdf', 2, '2025-03-11 13:53:51', '2025-03-11 13:53:51'),
	(1096, 'storage/documentos/memorandum/hIa5RuGGRM_JURÍDICO memo-0283BIS-2025 se remite contrato para su observación cotaprep Huoston-Eder-Normatividad.pdf', 'hIa5RuGGRM_JURÍDICO memo-0283BIS-2025 se remite contrato para su observación cotaprep Huoston-Eder-Normatividad.pdf', 2, '2025-03-11 13:58:50', '2025-03-11 13:58:50'),
	(1097, 'storage/documentos/memorandum/SDZG9TKtax_JURÍDICO memo-ca-se-0019bis-2025  remite cont.pdf', 'SDZG9TKtax_JURÍDICO memo-ca-se-0019bis-2025  remite cont.pdf', 2, '2025-03-11 14:02:38', '2025-03-11 14:02:38'),
	(1098, 'storage/documentos/memorandum/hA9R1SY3R2_JURÍDICO memo-ca-se-0030-2025 se remite contrato para firma SEGURIDAD PRIVADA CARABAC.pdf', 'hA9R1SY3R2_JURÍDICO memo-ca-se-0030-2025 se remite contrato para firma SEGURIDAD PRIVADA CARABAC.pdf', 2, '2025-03-11 14:15:23', '2025-03-11 14:15:23'),
	(1099, 'storage/documentos/memorandum/FvD91VR5Hv_PRERROGATIVAS memo-0231-2025 realizar contratación Cuarto.pdf', 'FvD91VR5Hv_PRERROGATIVAS memo-0231-2025 realizar contratación Cuarto.pdf', 2, '2025-03-11 16:10:54', '2025-03-11 16:10:54'),
	(1100, 'storage/documentos/memorandum/8dJ9WPUmV4_PRERROGATIVAS memo-0233-2025 se remite datos de cuentas bancarias Saúl-Eder.pdf', '8dJ9WPUmV4_PRERROGATIVAS memo-0233-2025 se remite datos de cuentas bancarias Saúl-Eder.pdf', 2, '2025-03-11 16:16:36', '2025-03-11 16:16:36'),
	(1101, 'storage/documentos/memorandum/FoR5Ctvc3j_PRERROGATIVAS memo-0235-2025 atención a memo da-0241-2025 Saúl-Eder.pdf', 'FoR5Ctvc3j_PRERROGATIVAS memo-0235-2025 atención a memo da-0241-2025 Saúl-Eder.pdf', 2, '2025-03-11 16:18:52', '2025-03-11 16:18:52'),
	(1102, 'storage/documentos/memorandum/L44UcDim9a_PRERROGATIVAS memo-0246-2025 se establece fecha para el pago de financiamiento obtención al voto Saúl-Eder.pdf', 'L44UcDim9a_PRERROGATIVAS memo-0246-2025 se establece fecha para el pago de financiamiento obtención al voto Saúl-Eder.pdf', 2, '2025-03-11 16:22:19', '2025-03-11 16:22:19'),
	(1103, 'storage/documentos/oficio/T0OLHq73F7_PRESIDENCIA oficio-0319-2025 ministración  mes de marzo Emir.pdf', 'T0OLHq73F7_PRESIDENCIA oficio-0319-2025 ministración  mes de marzo Emir.pdf', 3, '2025-03-11 16:25:23', '2025-03-11 16:25:23'),
	(1104, 'storage/documentos/oficio/jlrZyUQSc0_PRESIDENCIA oficio-0320-2025 ministración del proceso electoral extraordinario 2025 Emir.pdf', 'jlrZyUQSc0_PRESIDENCIA oficio-0320-2025 ministración del proceso electoral extraordinario 2025 Emir.pdf', 3, '2025-03-11 16:35:50', '2025-03-11 16:35:50'),
	(1105, 'storage/documentos/oficio/v594j17Oc6_PRESIDENCIA oficio-0321-2025 nuevo enlace sevac Emir.pdf', 'v594j17Oc6_PRESIDENCIA oficio-0321-2025 nuevo enlace sevac Emir.pdf', 3, '2025-03-11 16:38:33', '2025-03-11 16:38:33'),
	(1106, 'storage/documentos/memorandum/XJBqV0Zxa0_COMUNICACIÓN memo-073-2025 Boletín 19 Archivo.pdf', 'XJBqV0Zxa0_COMUNICACIÓN memo-073-2025 Boletín 19 Archivo.pdf', 2, '2025-03-11 20:36:22', '2025-03-11 20:36:22'),
	(1107, 'storage/documentos/escrito/GPVuR5iZaK_DTS correo-remitecircular iee-se-039-2025 remite cuerdo cg-ac-0040-2025 Huoston-Eder.pdf', 'GPVuR5iZaK_DTS correo-remitecircular iee-se-039-2025 remite cuerdo cg-ac-0040-2025 Huoston-Eder.pdf', 5, '2025-03-11 21:30:56', '2025-03-11 21:30:56'),
	(1108, 'storage/documentos/memorandum/orxCbiPmYA_DTS memo-0524-2025 se solicita dar de baja engargoladora Daniel.pdf', 'orxCbiPmYA_DTS memo-0524-2025 se solicita dar de baja engargoladora Daniel.pdf', 2, '2025-03-11 21:33:08', '2025-03-11 21:33:08'),
	(1109, 'storage/documentos/memorandum/aln8Av9Q1m_DTS memo-0528-2025 no aceptación al cargo grabriela león  chignahuapan Cuarto.pdf', 'aln8Av9Q1m_DTS memo-0528-2025 no aceptación al cargo grabriela león  chignahuapan Cuarto.pdf', 2, '2025-03-12 14:09:55', '2025-03-12 14:09:55'),
	(1110, 'storage/documentos/memorandum/l0uZ6FTMjv_JURÍDICO memo-ca-se-0032-2025 se remite contrtato p-resguardo seguridad carabac Shanty-Eder.pdf', 'l0uZ6FTMjv_JURÍDICO memo-ca-se-0032-2025 se remite contrtato p-resguardo seguridad carabac Shanty-Eder.pdf', 2, '2025-03-12 14:12:34', '2025-03-12 14:12:34'),
	(1111, 'storage/documentos/escrito/cgWpZlsLuL_ASE oficio ase-1086-25-of-oas, notificación de obligaciones 2024 y 2025 por actualización del valor de la uma Eder.pdf', 'cgWpZlsLuL_ASE oficio ase-1086-25-of-oas, notificación de obligaciones 2024 y 2025 por actualización del valor de la uma Eder.pdf', 5, '2025-03-12 14:46:09', '2025-03-12 14:46:09'),
	(1112, 'storage/documentos/requisicion/jbvJdojdgF_REQUISICIÓN No.pdf', 'jbvJdojdgF_REQUISICIÓN No.pdf', 1, '2025-03-12 15:37:44', '2025-03-12 15:37:44'),
	(1113, 'storage/documentos/requisicion/xrX6V08bQ7_REQUISICIÓN No.pdf', 'xrX6V08bQ7_REQUISICIÓN No.pdf', 1, '2025-03-12 15:40:38', '2025-03-12 15:40:38'),
	(1114, 'storage/documentos/requisicion/5NXC2FO6Yp_REQUISICIÓN No.pdf', '5NXC2FO6Yp_REQUISICIÓN No.pdf', 1, '2025-03-12 15:42:35', '2025-03-12 15:42:35'),
	(1115, 'storage/documentos/requisicion/O1MlFVWiZN_REQUISICIÓN No.pdf', 'O1MlFVWiZN_REQUISICIÓN No.pdf', 1, '2025-03-12 15:43:59', '2025-03-12 15:43:59'),
	(1116, 'storage/documentos/requisicion/TofeutPrDq_REQUISICIÓN No.pdf', 'TofeutPrDq_REQUISICIÓN No.pdf', 1, '2025-03-12 16:05:51', '2025-03-12 16:05:51'),
	(1117, 'storage/documentos/requisicion/wu8NQLsjOX_REQUISICIÓN No.pdf', 'wu8NQLsjOX_REQUISICIÓN No.pdf', 1, '2025-03-12 16:11:29', '2025-03-12 16:11:29'),
	(1118, 'storage/documentos/requisicion/eNLOgd81eH_REQUISICIÓN No.pdf', 'eNLOgd81eH_REQUISICIÓN No.pdf', 1, '2025-03-12 16:14:27', '2025-03-12 16:14:27'),
	(1119, 'storage/documentos/requisicion/1iuPhwNyla_REQUISICIÓN No.pdf', '1iuPhwNyla_REQUISICIÓN No.pdf', 1, '2025-03-12 16:16:54', '2025-03-12 16:16:54'),
	(1120, 'storage/documentos/requisicion/2AWF9ECNfV_REQUISICIÓN No.pdf', '2AWF9ECNfV_REQUISICIÓN No.pdf', 1, '2025-03-12 16:25:05', '2025-03-12 16:25:05'),
	(1121, 'storage/documentos/requisicion/AdoXEa96MC_REQUISICIÓN No.pdf', 'AdoXEa96MC_REQUISICIÓN No.pdf', 1, '2025-03-12 16:32:34', '2025-03-12 16:32:34'),
	(1122, 'storage/documentos/requisicion/wkiwDw2LdZ_REQUISICIÓN No.pdf', 'wkiwDw2LdZ_REQUISICIÓN No.pdf', 1, '2025-03-12 16:34:04', '2025-03-12 16:34:04'),
	(1123, 'storage/documentos/memorandum/JksKxvbJ38_PRERROGATIVAS memo-0271-2025 se remiten recibos originales Saúl-Eder.pdf', 'JksKxvbJ38_PRERROGATIVAS memo-0271-2025 se remiten recibos originales Saúl-Eder.pdf', 2, '2025-03-12 16:36:28', '2025-03-12 16:36:28'),
	(1124, 'storage/documentos/requisicion/S99dtevYog_REQUISICIÓN No.pdf', 'S99dtevYog_REQUISICIÓN No.pdf', 1, '2025-03-12 16:42:05', '2025-03-12 16:42:05'),
	(1125, 'storage/documentos/requisicion/CRsW8v59jH_REQUISICIÓN No.pdf', 'CRsW8v59jH_REQUISICIÓN No.pdf', 1, '2025-03-12 16:44:03', '2025-03-12 16:44:03'),
	(1126, 'storage/documentos/requisicion/1jJECF2eHU_REQUISICIÓN No.pdf', '1jJECF2eHU_REQUISICIÓN No.pdf', 1, '2025-03-12 16:47:43', '2025-03-12 16:47:43'),
	(1127, 'storage/documentos/requisicion/2BmAobXAbv_REQUISICIÓN No.pdf', '2BmAobXAbv_REQUISICIÓN No.pdf', 1, '2025-03-12 16:52:49', '2025-03-12 16:52:49'),
	(1128, 'storage/documentos/requisicion/45RuhrEER9_REQUISICIÓN No.pdf', '45RuhrEER9_REQUISICIÓN No.pdf', 1, '2025-03-12 16:55:30', '2025-03-12 16:55:30'),
	(1129, 'storage/documentos/requisicion/wZY9ohWtze_REQUISICIÓN No.pdf', 'wZY9ohWtze_REQUISICIÓN No.pdf', 1, '2025-03-12 16:57:05', '2025-03-12 16:57:05'),
	(1130, 'storage/documentos/requisicion/6sdXzISmdi_REQUISICIÓN No.pdf', '6sdXzISmdi_REQUISICIÓN No.pdf', 1, '2025-03-12 16:59:29', '2025-03-12 16:59:29'),
	(1131, 'storage/documentos/requisicion/C7YggM16rk_REQUISICIÓN No.pdf', 'C7YggM16rk_REQUISICIÓN No.pdf', 1, '2025-03-12 17:02:23', '2025-03-12 17:02:23'),
	(1132, 'storage/documentos/requisicion/rN4jVNxShJ_REQUISICIÓN No.pdf', 'rN4jVNxShJ_REQUISICIÓN No.pdf', 1, '2025-03-12 17:11:22', '2025-03-12 17:11:22'),
	(1133, 'storage/documentos/requisicion/g0ZlpKpX0w_REQUISICIÓN No.pdf', 'g0ZlpKpX0w_REQUISICIÓN No.pdf', 1, '2025-03-12 17:42:46', '2025-03-12 17:42:46'),
	(1134, 'storage/documentos/requisicion/P7xdsRn9zM_REQUISICIÓN No.pdf', 'P7xdsRn9zM_REQUISICIÓN No.pdf', 1, '2025-03-12 17:44:33', '2025-03-12 17:44:33'),
	(1135, 'storage/documentos/requisicion/l3v0slWluN_REQUISICIÓN No.pdf', 'l3v0slWluN_REQUISICIÓN No.pdf', 1, '2025-03-12 17:46:05', '2025-03-12 17:46:05'),
	(1136, 'storage/documentos/requisicion/A1gJFkVupA_REQUISICIÓN No.pdf', 'A1gJFkVupA_REQUISICIÓN No.pdf', 1, '2025-03-12 17:47:38', '2025-03-12 17:47:38'),
	(1137, 'storage/documentos/requisicion/bLhsp37nmr_REQUISICIÓN No.pdf', 'bLhsp37nmr_REQUISICIÓN No.pdf', 1, '2025-03-12 17:49:26', '2025-03-12 17:49:26'),
	(1138, 'storage/documentos/requisicion/HXPLQPWgqy_REQUISICIÓN No.pdf', 'HXPLQPWgqy_REQUISICIÓN No.pdf', 1, '2025-03-12 17:50:41', '2025-03-12 17:50:41'),
	(1139, 'storage/documentos/requisicion/9pbKNMpeuQ_REQUISICIÓN No.pdf', '9pbKNMpeuQ_REQUISICIÓN No.pdf', 1, '2025-03-12 17:53:08', '2025-03-12 17:53:08'),
	(1140, 'storage/documentos/requisicion/CSiPGjWJ9O_REQUISICIÓN No.pdf', 'CSiPGjWJ9O_REQUISICIÓN No.pdf', 1, '2025-03-12 17:54:50', '2025-03-12 17:54:50'),
	(1141, 'storage/documentos/requisicion/TjE3lAUE8G_REQUISICIÓN No.pdf', 'TjE3lAUE8G_REQUISICIÓN No.pdf', 1, '2025-03-12 17:56:02', '2025-03-12 17:56:02'),
	(1142, 'storage/documentos/requisicion/MbHcrBN4tx_REQUISICIÓN No.pdf', 'MbHcrBN4tx_REQUISICIÓN No.pdf', 1, '2025-03-12 17:59:30', '2025-03-12 17:59:30'),
	(1143, 'storage/documentos/requisicion/mzmGkXrE7I_REQUISICIÓN No.pdf', 'mzmGkXrE7I_REQUISICIÓN No.pdf', 1, '2025-03-12 18:01:13', '2025-03-12 18:01:13'),
	(1144, 'storage/documentos/requisicion/ONm4HYz5OH_REQUISICIÓN No.pdf', 'ONm4HYz5OH_REQUISICIÓN No.pdf', 1, '2025-03-12 18:17:05', '2025-03-12 18:17:05'),
	(1145, 'storage/documentos/requisicion/7oVXv0R29g_REQUISICIÓN No.pdf', '7oVXv0R29g_REQUISICIÓN No.pdf', 1, '2025-03-12 18:18:32', '2025-03-12 18:18:32'),
	(1146, 'storage/documentos/requisicion/DT50srpb4p_REQUISICIÓN No.pdf', 'DT50srpb4p_REQUISICIÓN No.pdf', 1, '2025-03-12 18:19:59', '2025-03-12 18:19:59'),
	(1147, 'storage/documentos/requisicion/Q3Gp9QZX8m_REQUISICIÓN No.pdf', 'Q3Gp9QZX8m_REQUISICIÓN No.pdf', 1, '2025-03-12 18:23:50', '2025-03-12 18:23:50'),
	(1148, 'storage/documentos/requisicion/Tq4Dj2Prnl_REQUISICIÓN No.pdf', 'Tq4Dj2Prnl_REQUISICIÓN No.pdf', 1, '2025-03-12 18:25:34', '2025-03-12 18:25:34'),
	(1149, 'storage/documentos/requisicion/zZKj4v2mYm_REQUISICIÓN No.pdf', 'zZKj4v2mYm_REQUISICIÓN No.pdf', 1, '2025-03-12 18:26:45', '2025-03-12 18:26:45'),
	(1150, 'storage/documentos/requisicion/xUFsaHQdcM_REQUISICIÓN No.pdf', 'xUFsaHQdcM_REQUISICIÓN No.pdf', 1, '2025-03-12 18:28:11', '2025-03-12 18:28:11'),
	(1151, 'storage/documentos/requisicion/NxSGtzyDWA_REQUISICIÓN No.pdf', 'NxSGtzyDWA_REQUISICIÓN No.pdf', 1, '2025-03-12 18:29:47', '2025-03-12 18:29:47'),
	(1152, 'storage/documentos/requisicion/RsENMOnj1e_REQUISICIÓN No.pdf', 'RsENMOnj1e_REQUISICIÓN No.pdf', 1, '2025-03-12 18:31:17', '2025-03-12 18:31:17'),
	(1153, 'storage/documentos/requisicion/bxkG5K5Oyz_REQUISICIÓN No.pdf', 'bxkG5K5Oyz_REQUISICIÓN No.pdf', 1, '2025-03-12 18:32:36', '2025-03-12 18:32:36'),
	(1154, 'storage/documentos/requisicion/mIBtUhTrwO_REQUISICIÓN No.pdf', 'mIBtUhTrwO_REQUISICIÓN No.pdf', 1, '2025-03-12 18:34:03', '2025-03-12 18:34:03'),
	(1155, 'storage/documentos/requisicion/Kwf8xQYLAZ_REQUISICIÓN No.pdf', 'Kwf8xQYLAZ_REQUISICIÓN No.pdf', 1, '2025-03-12 18:35:45', '2025-03-12 18:35:45'),
	(1156, 'storage/documentos/requisicion/YUA7ga3iBb_REQUISICIÓN No.pdf', 'YUA7ga3iBb_REQUISICIÓN No.pdf', 1, '2025-03-12 18:37:40', '2025-03-12 18:37:40'),
	(1157, 'storage/documentos/requisicion/OgSCEtXiOc_REQUISICIÓN No.pdf', 'OgSCEtXiOc_REQUISICIÓN No.pdf', 1, '2025-03-12 18:44:55', '2025-03-12 18:44:55'),
	(1158, 'storage/documentos/requisicion/OtTDBrTyXI_REQUISICIÓN No.pdf', 'OtTDBrTyXI_REQUISICIÓN No.pdf', 1, '2025-03-12 18:47:56', '2025-03-12 18:47:56'),
	(1159, 'storage/documentos/requisicion/aGNhAwDWJX_REQUISICIÓN No.pdf', 'aGNhAwDWJX_REQUISICIÓN No.pdf', 1, '2025-03-12 18:50:09', '2025-03-12 18:50:09'),
	(1160, 'storage/documentos/requisicion/FUj1g1hzww_REQUISICIÓN No.pdf', 'FUj1g1hzww_REQUISICIÓN No.pdf', 1, '2025-03-12 18:51:37', '2025-03-12 18:51:37'),
	(1161, 'storage/documentos/requisicion/GyRCHOd689_REQUISICIÓN No.pdf', 'GyRCHOd689_REQUISICIÓN No.pdf', 1, '2025-03-12 18:53:00', '2025-03-12 18:53:00'),
	(1162, 'storage/documentos/requisicion/fTuYx8niDU_REQUISICIÓN No.pdf', 'fTuYx8niDU_REQUISICIÓN No.pdf', 1, '2025-03-12 18:54:32', '2025-03-12 18:54:32'),
	(1163, 'storage/documentos/requisicion/WwK68reapb_REQUISICIÓN No.pdf', 'WwK68reapb_REQUISICIÓN No.pdf', 1, '2025-03-12 22:45:16', '2025-03-12 22:45:16'),
	(1164, 'storage/documentos/requisicion/k1QUfoBUWF_REQUISICIÓN No.pdf', 'k1QUfoBUWF_REQUISICIÓN No.pdf', 1, '2025-03-12 22:55:59', '2025-03-12 22:55:59'),
	(1165, 'storage/documentos/requisicion/GPs4XDfC8b_REQUISICIÓN No.pdf', 'GPs4XDfC8b_REQUISICIÓN No.pdf', 1, '2025-03-13 00:08:54', '2025-03-13 00:08:54'),
	(1166, 'storage/documentos/requisicion/l7po3XhT7m_REQUISICIÓN No.pdf', 'l7po3XhT7m_REQUISICIÓN No.pdf', 1, '2025-03-13 13:49:56', '2025-03-13 13:49:56'),
	(1167, 'storage/documentos/requisicion/L57YlEe9QM_REQUISICIÓN No.pdf', 'L57YlEe9QM_REQUISICIÓN No.pdf', 1, '2025-03-13 16:52:23', '2025-03-13 16:52:23'),
	(1168, 'storage/documentos/requisicion/w8eDaCShJo_REQUISICIÓN No.pdf', 'w8eDaCShJo_REQUISICIÓN No.pdf', 1, '2025-03-13 16:53:59', '2025-03-13 16:53:59'),
	(1169, 'storage/documentos/requisicion/iWZE2k7HUi_REQUISICIÓN No.pdf', 'iWZE2k7HUi_REQUISICIÓN No.pdf', 1, '2025-03-13 16:55:58', '2025-03-13 16:55:58'),
	(1170, 'storage/documentos/requisicion/27WfX4WEf7_REQUISICIÓN No.pdf', '27WfX4WEf7_REQUISICIÓN No.pdf', 1, '2025-03-13 16:57:37', '2025-03-13 16:57:37'),
	(1171, 'storage/documentos/requisicion/KAu9WJoZEJ_REQUISICIÓN No.pdf', 'KAu9WJoZEJ_REQUISICIÓN No.pdf', 1, '2025-03-13 16:59:22', '2025-03-13 16:59:22'),
	(1172, 'storage/documentos/requisicion/GxkwAZa772_REQUISICIÓN No.pdf', 'GxkwAZa772_REQUISICIÓN No.pdf', 1, '2025-03-13 17:01:13', '2025-03-13 17:01:13'),
	(1173, 'storage/documentos/requisicion/bI3Rl8AMtS_REQUISICIÓN No.pdf', 'bI3Rl8AMtS_REQUISICIÓN No.pdf', 1, '2025-03-13 17:32:10', '2025-03-13 17:32:10'),
	(1174, 'storage/documentos/requisicion/Ysp47HgIQ5_REQUISICIÓN No.pdf', 'Ysp47HgIQ5_REQUISICIÓN No.pdf', 1, '2025-03-13 17:34:45', '2025-03-13 17:34:45'),
	(1175, 'storage/documentos/requisicion/P4d7KC9uuO_REQUISICIÓN No.pdf', 'P4d7KC9uuO_REQUISICIÓN No.pdf', 1, '2025-03-13 17:36:22', '2025-03-13 17:36:22'),
	(1176, 'storage/documentos/requisicion/XveMHKukBu_REQUISICIÓN No.pdf', 'XveMHKukBu_REQUISICIÓN No.pdf', 1, '2025-03-13 17:38:01', '2025-03-13 17:38:01'),
	(1177, 'storage/documentos/requisicion/oGM4tKdcs7_REQUISICIÓN No.pdf', 'oGM4tKdcs7_REQUISICIÓN No.pdf', 1, '2025-03-13 17:39:38', '2025-03-13 17:39:38'),
	(1178, 'storage/documentos/requisicion/DrXf5cNxwr_REQUISICIÓN No.pdf', 'DrXf5cNxwr_REQUISICIÓN No.pdf', 1, '2025-03-13 17:40:54', '2025-03-13 17:40:54'),
	(1179, 'storage/documentos/requisicion/xCPNmfr22z_REQUISICIÓN No.pdf', 'xCPNmfr22z_REQUISICIÓN No.pdf', 1, '2025-03-13 17:53:14', '2025-03-13 17:53:14'),
	(1180, 'storage/documentos/requisicion/lncH6rctld_REQUISICIÓN No.pdf', 'lncH6rctld_REQUISICIÓN No.pdf', 1, '2025-03-13 17:56:48', '2025-03-13 17:56:48'),
	(1181, 'storage/documentos/requisicion/UF78KvkX6K_REQUISICIÓN No.pdf', 'UF78KvkX6K_REQUISICIÓN No.pdf', 1, '2025-03-13 18:17:30', '2025-03-13 18:17:30'),
	(1182, 'storage/documentos/requisicion/bPwTadKLih_REQUISICIÓN No.pdf', 'bPwTadKLih_REQUISICIÓN No.pdf', 1, '2025-03-13 18:18:57', '2025-03-13 18:18:57'),
	(1183, 'storage/documentos/requisicion/7soKnSajip_REQUISICIÓN No.pdf', '7soKnSajip_REQUISICIÓN No.pdf', 1, '2025-03-13 18:39:27', '2025-03-13 18:39:27'),
	(1184, 'storage/documentos/requisicion/RVTGe8rKG1_REQUISICIÓN No.pdf', 'RVTGe8rKG1_REQUISICIÓN No.pdf', 1, '2025-03-13 18:45:14', '2025-03-13 18:45:14'),
	(1185, 'storage/documentos/requisicion/BjI2fxXNzd_REQUISICIÓN No.pdf', 'BjI2fxXNzd_REQUISICIÓN No.pdf', 1, '2025-03-13 18:46:33', '2025-03-13 18:46:33'),
	(1186, 'storage/documentos/requisicion/f5PQ4VN1bz_REQUISICIÓN No.pdf', 'f5PQ4VN1bz_REQUISICIÓN No.pdf', 1, '2025-03-13 19:10:47', '2025-03-13 19:10:47'),
	(1187, 'storage/documentos/requisicion/RYND6jQRgG_REQUISICIÓN No.pdf', 'RYND6jQRgG_REQUISICIÓN No.pdf', 1, '2025-03-13 19:13:57', '2025-03-13 19:13:57'),
	(1188, 'storage/documentos/requisicion/rI1sYytDdR_REQUISICIÓN No.pdf', 'rI1sYytDdR_REQUISICIÓN No.pdf', 1, '2025-03-13 19:20:07', '2025-03-13 19:20:07'),
	(1189, 'storage/documentos/requisicion/fQUcM7bpto_REQUISICIÓN No.pdf', 'fQUcM7bpto_REQUISICIÓN No.pdf', 1, '2025-03-13 19:23:42', '2025-03-13 19:23:42'),
	(1190, 'storage/documentos/requisicion/qV07egJuGJ_REQUISICIÓN No.pdf', 'qV07egJuGJ_REQUISICIÓN No.pdf', 1, '2025-03-13 19:31:11', '2025-03-13 19:31:11'),
	(1191, 'storage/documentos/requisicion/P3BPAwK7HN_REQUISICIÓN No.pdf', 'P3BPAwK7HN_REQUISICIÓN No.pdf', 1, '2025-03-13 19:33:36', '2025-03-13 19:33:36'),
	(1192, 'storage/documentos/requisicion/riS16hhX8w_REQUISICIÓN No.pdf', 'riS16hhX8w_REQUISICIÓN No.pdf', 1, '2025-03-13 19:34:51', '2025-03-13 19:34:51'),
	(1193, 'storage/documentos/requisicion/hK5qlYMIwq_REQUISICIÓN No.pdf', 'hK5qlYMIwq_REQUISICIÓN No.pdf', 1, '2025-03-13 20:35:10', '2025-03-13 20:35:10'),
	(1194, 'storage/documentos/requisicion/NBLsBfA3j5_REQUISICIÓN No.pdf', 'NBLsBfA3j5_REQUISICIÓN No.pdf', 1, '2025-03-13 20:41:59', '2025-03-13 20:41:59'),
	(1195, 'storage/documentos/requisicion/DurKs7nxXN_REQUISICIÓN No.pdf', 'DurKs7nxXN_REQUISICIÓN No.pdf', 1, '2025-03-13 20:43:55', '2025-03-13 20:43:55'),
	(1196, 'storage/documentos/requisicion/YcdfJZMXSR_REQUISICIÓN No.pdf', 'YcdfJZMXSR_REQUISICIÓN No.pdf', 1, '2025-03-13 20:45:27', '2025-03-13 20:45:27'),
	(1197, 'storage/documentos/requisicion/jx3qEg5WmW_REQUISICIÓN No.pdf', 'jx3qEg5WmW_REQUISICIÓN No.pdf', 1, '2025-03-13 20:47:27', '2025-03-13 20:47:27'),
	(1198, 'storage/documentos/requisicion/20zp4JgEUp_REQUISICIÓN No.pdf', '20zp4JgEUp_REQUISICIÓN No.pdf', 1, '2025-03-13 20:50:27', '2025-03-13 20:50:27'),
	(1199, 'storage/documentos/requisicion/1nk19sgwk6_REQUISICIÓN No.pdf', '1nk19sgwk6_REQUISICIÓN No.pdf', 1, '2025-03-13 20:51:49', '2025-03-13 20:51:49'),
	(1200, 'storage/documentos/requisicion/X1wHwEPbwz_REQUISICIÓN No.pdf', 'X1wHwEPbwz_REQUISICIÓN No.pdf', 1, '2025-03-13 21:08:33', '2025-03-13 21:08:33'),
	(1201, 'storage/documentos/requisicion/J1MjlZZobV_REQUISICIÓN No.pdf', 'J1MjlZZobV_REQUISICIÓN No.pdf', 1, '2025-03-13 21:09:54', '2025-03-13 21:09:54'),
	(1202, 'storage/documentos/requisicion/HFB7E9txHY_REQUISICIÓN No.pdf', 'HFB7E9txHY_REQUISICIÓN No.pdf', 1, '2025-03-13 21:14:10', '2025-03-13 21:14:10'),
	(1203, 'storage/documentos/requisicion/kggFFh4C4G_REQUISICIÓN No.pdf', 'kggFFh4C4G_REQUISICIÓN No.pdf', 1, '2025-03-13 21:45:47', '2025-03-13 21:45:47'),
	(1204, 'storage/documentos/requisicion/kODVvAltGh_REQUISICIÓN No.pdf', 'kODVvAltGh_REQUISICIÓN No.pdf', 1, '2025-03-13 22:32:08', '2025-03-13 22:32:08'),
	(1205, 'storage/documentos/requisicion/AYdYmr5MfE_REQUISICIÓN No.pdf', 'AYdYmr5MfE_REQUISICIÓN No.pdf', 1, '2025-03-13 23:49:43', '2025-03-13 23:49:43'),
	(1206, 'storage/documentos/circular/uYntu5KaPw_CONSEJERA EVA circular-002-2025 solicitud de información Eder.pdf', 'uYntu5KaPw_CONSEJERA EVA circular-002-2025 solicitud de información Eder.pdf', 4, '2025-03-14 14:15:42', '2025-03-14 14:15:42'),
	(1207, 'storage/documentos/memorandum/qIul1DcbIx_CONTRALORÍA memo-168-2025 hojas de trabajo del mes de noviembre de 2024 Eder.pdf', 'qIul1DcbIx_CONTRALORÍA memo-168-2025 hojas de trabajo del mes de noviembre de 2024 Eder.pdf', 2, '2025-03-14 14:20:11', '2025-03-14 14:20:11'),
	(1208, 'storage/documentos/memorandum/tTSxtJZZQz_DOE memo-230-2025 se solicita emisión de cheques cae-se Emir-Eder-Saúl.pdf', 'tTSxtJZZQz_DOE memo-230-2025 se solicita emisión de cheques cae-se Emir-Eder-Saúl.pdf', 2, '2025-03-14 14:22:33', '2025-03-14 14:22:33'),
	(1209, 'storage/documentos/memorandum/fmGTvHGpcJ_DOE memo-237-2025 se remite información Saúl-Eder.pdf', 'fmGTvHGpcJ_DOE memo-237-2025 se remite información Saúl-Eder.pdf', 2, '2025-03-14 14:28:03', '2025-03-14 14:28:03'),
	(1210, 'storage/documentos/memorandum/zcZSKXC2FP_DTS memo-0540-2025 no aceptación al cargo Cuarto.pdf', 'zcZSKXC2FP_DTS memo-0540-2025 no aceptación al cargo Cuarto.pdf', 2, '2025-03-14 14:35:02', '2025-03-14 14:35:02'),
	(1211, 'storage/documentos/memorandum/AXkSpjwbnh_INFORMÁTICA memo-0160-2025 solicitud de información Archivo.pdf', 'AXkSpjwbnh_INFORMÁTICA memo-0160-2025 solicitud de información Archivo.pdf', 2, '2025-03-14 14:47:25', '2025-03-14 14:47:25'),
	(1212, 'storage/documentos/escrito/WMyB3x26j2_OFICIALIA DE PARTES correo folio 1554 remite oficio dpsag-102-2025 usuarios-enlaces siaf Emir-Eder.pdf', 'WMyB3x26j2_OFICIALIA DE PARTES correo folio 1554 remite oficio dpsag-102-2025 usuarios-enlaces siaf Emir-Eder.pdf', 5, '2025-03-14 14:54:36', '2025-03-14 14:54:36'),
	(1213, 'storage/documentos/requisicion/HjNIEvsGBv_REQUISICIÓN No.pdf', 'HjNIEvsGBv_REQUISICIÓN No.pdf', 1, '2025-03-14 14:58:01', '2025-03-14 14:58:01'),
	(1214, 'storage/documentos/requisicion/oQOVXyeVQg_REQUISICIÓN No.pdf', 'oQOVXyeVQg_REQUISICIÓN No.pdf', 1, '2025-03-14 15:00:05', '2025-03-14 15:00:05'),
	(1215, 'storage/documentos/requisicion/R4wCPuXpwC_REQUISICIÓN No.pdf', 'R4wCPuXpwC_REQUISICIÓN No.pdf', 1, '2025-03-14 15:02:34', '2025-03-14 15:02:34'),
	(1216, 'storage/documentos/requisicion/iVbupbSvme_REQUISICIÓN No.pdf', 'iVbupbSvme_REQUISICIÓN No.pdf', 1, '2025-03-14 15:04:33', '2025-03-14 15:04:33'),
	(1217, 'storage/documentos/requisicion/J9ElapToGT_REQUISICIÓN No.pdf', 'J9ElapToGT_REQUISICIÓN No.pdf', 1, '2025-03-14 15:06:17', '2025-03-14 15:06:17'),
	(1218, 'storage/documentos/requisicion/rkctjLSwMg_REQUISICIÓN No.pdf', 'rkctjLSwMg_REQUISICIÓN No.pdf', 1, '2025-03-14 15:09:14', '2025-03-14 15:09:14'),
	(1219, 'storage/documentos/requisicion/LBLkuCQjCL_REQUISICIÓN No.pdf', 'LBLkuCQjCL_REQUISICIÓN No.pdf', 1, '2025-03-14 15:10:37', '2025-03-14 15:10:37'),
	(1220, 'storage/documentos/requisicion/bvs3hbv1nV_REQUISICIÓN No.pdf', 'bvs3hbv1nV_REQUISICIÓN No.pdf', 1, '2025-03-14 15:11:50', '2025-03-14 15:11:50'),
	(1221, 'storage/documentos/requisicion/fe5ihNfK1C_REQUISICIÓN No.pdf', 'fe5ihNfK1C_REQUISICIÓN No.pdf', 1, '2025-03-14 15:13:03', '2025-03-14 15:13:03'),
	(1222, 'storage/documentos/requisicion/6UiiGNs9EJ_REQUISICIÓN No.pdf', '6UiiGNs9EJ_REQUISICIÓN No.pdf', 1, '2025-03-14 15:14:25', '2025-03-14 15:14:25'),
	(1223, 'storage/documentos/requisicion/HU5UWLDvPG_REQUISIICÓN No.pdf', 'HU5UWLDvPG_REQUISIICÓN No.pdf', 1, '2025-03-14 15:15:39', '2025-03-14 15:15:39'),
	(1224, 'storage/documentos/requisicion/PUOWoOUwzh_REQUSICIÓN No.pdf', 'PUOWoOUwzh_REQUSICIÓN No.pdf', 1, '2025-03-14 15:19:14', '2025-03-14 15:19:14'),
	(1225, 'storage/documentos/circular/FAUvgmSbDL_SECRETARÍA circular-038-2025 actividad círculo de masculinidades.pdf', 'FAUvgmSbDL_SECRETARÍA circular-038-2025 actividad círculo de masculinidades.pdf', 4, '2025-03-14 15:22:12', '2025-03-14 15:22:12'),
	(1226, 'storage/documentos/escrito/9dXLFlYQfA_SECRETARÍA correo remite oficio-pre-0325-2025 criterios para asignación y comprobació recursos sel-cael Emir-Eder.pdf', '9dXLFlYQfA_SECRETARÍA correo remite oficio-pre-0325-2025 criterios para asignación y comprobació recursos sel-cael Emir-Eder.pdf', 5, '2025-03-14 15:28:09', '2025-03-14 15:28:09'),
	(1227, 'storage/documentos/memorandum/IvJ4L3UyOZ_SECRETARÍA memo-0995-2025 se remite renuncia Cuarto.pdf', 'IvJ4L3UyOZ_SECRETARÍA memo-0995-2025 se remite renuncia Cuarto.pdf', 2, '2025-03-14 15:31:03', '2025-03-14 15:31:03'),
	(1228, 'storage/documentos/memorandum/RmkyQeTeXh_SECRETARÍA memo-1015-2025 se remite folio 1272.pdf', 'RmkyQeTeXh_SECRETARÍA memo-1015-2025 se remite folio 1272.pdf', 2, '2025-03-14 15:34:43', '2025-03-14 15:34:43'),
	(1229, 'storage/documentos/memorandum/RbUwu1EMxj_SECRETARÍA memo-1023-2025 se solicita alta de personal Cuarto-Eder.pdf', 'RbUwu1EMxj_SECRETARÍA memo-1023-2025 se solicita alta de personal Cuarto-Eder.pdf', 2, '2025-03-14 15:51:27', '2025-03-14 15:51:27'),
	(1230, 'storage/documentos/memorandum/oZLKHb7bGs_SECRETARÍA memo-1024-2025 se solicita alta de personal Cuarto.pdf', 'oZLKHb7bGs_SECRETARÍA memo-1024-2025 se solicita alta de personal Cuarto.pdf', 2, '2025-03-14 15:53:24', '2025-03-14 15:53:24'),
	(1231, 'storage/documentos/memorandum/sLECbalVKB_SECRETARÍA memo-1032-2025 se autoriza certificar documentación resp a memo da-0242-2025 Eder-Miros.pdf', 'sLECbalVKB_SECRETARÍA memo-1032-2025 se autoriza certificar documentación resp a memo da-0242-2025 Eder-Miros.pdf', 2, '2025-03-14 16:04:06', '2025-03-14 16:04:06'),
	(1232, 'storage/documentos/memorandum/NysdXGztX2_SECRETARÍA memo-1124-2025 se remite folio 1392 Eder-Luis.pdf', 'NysdXGztX2_SECRETARÍA memo-1124-2025 se remite folio 1392 Eder-Luis.pdf', 2, '2025-03-14 16:06:02', '2025-03-14 16:06:02'),
	(1233, 'storage/documentos/memorandum/a7jrDEvvJg_SECRETARÍA memo-1129 se autoriza documentación resp memo da-0270-2025 Luis.pdf', 'a7jrDEvvJg_SECRETARÍA memo-1129 se autoriza documentación resp memo da-0270-2025 Luis.pdf', 2, '2025-03-14 16:11:59', '2025-03-14 16:11:59'),
	(1234, 'storage/documentos/memorandum/yJKyMd7DKc_SECRETARÍA memo-1130-2025 se remite folio 1435.pdf', 'yJKyMd7DKc_SECRETARÍA memo-1130-2025 se remite folio 1435.pdf', 2, '2025-03-14 16:13:56', '2025-03-14 16:13:56'),
	(1235, 'storage/documentos/memorandum/2b6wiqsAf5_SECRETARÍA memo-1133-2025 se autoriza certificar documentación Luis.pdf', '2b6wiqsAf5_SECRETARÍA memo-1133-2025 se autoriza certificar documentación Luis.pdf', 2, '2025-03-14 16:16:17', '2025-03-14 16:16:17'),
	(1236, 'storage/documentos/memorandum/ldLCDcJugo_SECRETARÍA memo-1195-2025 remite acuerdo cg-ac-0038-2025 Huoston-Eder.pdf', 'ldLCDcJugo_SECRETARÍA memo-1195-2025 remite acuerdo cg-ac-0038-2025 Huoston-Eder.pdf', 2, '2025-03-14 16:18:59', '2025-03-14 16:18:59'),
	(1237, 'storage/documentos/memorandum/tjJ1xwNz7p_SECRETARÍA memo-1202-2025 se remite acuerdo cg-ac-0040-2025 Eder-Huoston.pdf', 'tjJ1xwNz7p_SECRETARÍA memo-1202-2025 se remite acuerdo cg-ac-0040-2025 Eder-Huoston.pdf', 2, '2025-03-14 16:23:59', '2025-03-14 16:23:59'),
	(1238, 'storage/documentos/memorandum/BXgnFsSz7c_SECRETARÍA oficio-0611-2025 se remiten acuerdos Huoston-Eder-Saúl.pdf', 'BXgnFsSz7c_SECRETARÍA oficio-0611-2025 se remiten acuerdos Huoston-Eder-Saúl.pdf', 2, '2025-03-14 16:25:52', '2025-03-14 16:25:52'),
	(1239, 'storage/documentos/escrito/s22sVrCLsI_SEVAC correo usuario y contraseña Ale-Emir-Eder.pdf', 's22sVrCLsI_SEVAC correo usuario y contraseña Ale-Emir-Eder.pdf', 5, '2025-03-14 16:30:02', '2025-03-14 16:30:02'),
	(1240, 'storage/documentos/escrito/QWAn8zIwYO_SEVAC correo usuario y contraseña, se recibió satisfactoriamente documentación completa Ale-Eder-Emir.pdf', 'QWAn8zIwYO_SEVAC correo usuario y contraseña, se recibió satisfactoriamente documentación completa Ale-Eder-Emir.pdf', 5, '2025-03-14 16:31:49', '2025-03-14 16:31:49'),
	(1241, 'storage/documentos/circular/1n6wndzKRK_SIVOPLE CIRCULAR INE-UTVOPL-CG196 Eder-Emir.pdf', '1n6wndzKRK_SIVOPLE CIRCULAR INE-UTVOPL-CG196 Eder-Emir.pdf', 4, '2025-03-14 16:34:41', '2025-03-14 16:34:41'),
	(1242, 'storage/documentos/escrito/BwueT0ttpr_SIVOPLE folio 0192-2025 ext puebla Emir-Eder.pdf', 'BwueT0ttpr_SIVOPLE folio 0192-2025 ext puebla Emir-Eder.pdf', 5, '2025-03-14 16:37:31', '2025-03-14 16:37:31'),
	(1243, 'storage/documentos/circular/njBIYPIpjo_TRANSPARENCIA circular-012-2025 se solicita agenda de actividades Luis-Eder.pdf', 'njBIYPIpjo_TRANSPARENCIA circular-012-2025 se solicita agenda de actividades Luis-Eder.pdf', 4, '2025-03-14 16:47:12', '2025-03-14 16:47:12'),
	(1244, 'storage/documentos/circular/Tr9rNadh9E_TRANSPARENCIA circular-015-2025 metodología verificación pltaforma transparencia Eder-Luis.pdf', 'Tr9rNadh9E_TRANSPARENCIA circular-015-2025 metodología verificación pltaforma transparencia Eder-Luis.pdf', 4, '2025-03-14 16:48:51', '2025-03-14 16:48:51'),
	(1245, 'storage/documentos/memorandum/d7M3HXBiXr_TRASPARENCIA memo-178-2025 se solicitan actas de copead Huoston-Shanty-Eder.pdf', 'd7M3HXBiXr_TRASPARENCIA memo-178-2025 se solicitan actas de copead Huoston-Shanty-Eder.pdf', 2, '2025-03-14 16:52:40', '2025-03-14 16:52:40'),
	(1246, 'storage/documentos/memorandum/DScwLRrKMo_UFD memo-251-2025 se solicita desincorporación de personal Cuarto.pdf', 'DScwLRrKMo_UFD memo-251-2025 se solicita desincorporación de personal Cuarto.pdf', 2, '2025-03-14 16:59:16', '2025-03-14 16:59:16'),
	(1247, 'storage/documentos/memorandum/Ni4HLGrFCa_UFD memo-282-2025 descuentos de personal Cuarto.pdf', 'Ni4HLGrFCa_UFD memo-282-2025 descuentos de personal Cuarto.pdf', 2, '2025-03-14 17:02:20', '2025-03-14 17:02:20'),
	(1248, 'storage/documentos/memorandum/VwpcTlHiAc_UFD memo-283-2025 se solicita alta de personal Cuarto.pdf', 'VwpcTlHiAc_UFD memo-283-2025 se solicita alta de personal Cuarto.pdf', 2, '2025-03-14 17:08:15', '2025-03-14 17:08:15'),
	(1249, 'storage/documentos/memorandum/yfsCSPvlUh_UFD memo-284-2025 se solicita información número de plazas autorizdadas de cáracter eventual Cuarto.pdf', 'yfsCSPvlUh_UFD memo-284-2025 se solicita información número de plazas autorizdadas de cáracter eventual Cuarto.pdf', 2, '2025-03-14 17:14:17', '2025-03-14 17:14:17'),
	(1250, 'storage/documentos/memorandum/aV1JkDQ06d_UFD memo-285-2025 se remite incapacidad médica andrea díaz Cuarto.pdf', 'aV1JkDQ06d_UFD memo-285-2025 se remite incapacidad médica andrea díaz Cuarto.pdf', 2, '2025-03-14 17:15:57', '2025-03-14 17:15:57'),
	(1251, 'storage/documentos/memorandum/LJrF9sJZis_UFD memo-294-2025 se remite incapacidad mpedica Cuarto.pdf', 'LJrF9sJZis_UFD memo-294-2025 se remite incapacidad mpedica Cuarto.pdf', 2, '2025-03-14 17:18:06', '2025-03-14 17:18:06'),
	(1252, 'storage/documentos/memorandum/pzWXRqqqQu_UFD memo-302-2025 se remite información resp memo da-0284-2025 Eder-Cuarto.pdf', 'pzWXRqqqQu_UFD memo-302-2025 se remite información resp memo da-0284-2025 Eder-Cuarto.pdf', 2, '2025-03-14 17:20:15', '2025-03-14 17:20:15'),
	(1253, 'storage/documentos/escrito/CfeLAgjAsg_UFD REPORTE GENERAL DE ASYTEC FEBRERO 16-28 2025 Eder, Caro-Sol-Cuarto.pdf', 'CfeLAgjAsg_UFD REPORTE GENERAL DE ASYTEC FEBRERO 16-28 2025 Eder, Caro-Sol-Cuarto.pdf', 5, '2025-03-14 17:50:54', '2025-03-14 17:50:54'),
	(1254, 'storage/documentos/correo/kPQHQNsgUK_V.pdf', 'kPQHQNsgUK_V.pdf', 7, '2025-03-14 17:55:00', '2025-03-14 17:55:00'),
	(1255, 'storage/documentos/memorandum/i9pkNvy0OK_CONTRALORÍA memo-171-2025 devolución mob.pdf', 'i9pkNvy0OK_CONTRALORÍA memo-171-2025 devolución mob.pdf', 2, '2025-03-15 17:10:20', '2025-03-15 17:10:20'),
	(1256, 'storage/documentos/memorandum/5Qf8IzisLm_COMUNICACIÓN memo-074-2025 subir galería a la página web.pdf', '5Qf8IzisLm_COMUNICACIÓN memo-074-2025 subir galería a la página web.pdf', 2, '2025-03-15 17:11:45', '2025-03-15 17:11:45'),
	(1257, 'storage/documentos/memorandum/89Ruq1KuHC_DOE memo-242-2025 juste monto de renta Eder-Huoston.pdf', '89Ruq1KuHC_DOE memo-242-2025 juste monto de renta Eder-Huoston.pdf', 2, '2025-03-15 17:14:29', '2025-03-15 17:14:29'),
	(1258, 'storage/documentos/memorandum/HAdCJcGLFv_JURÍDICO memo-0034-2025 se remite contrato para firma monitoreo de información y publicidad Hu-Eder.pdf', 'HAdCJcGLFv_JURÍDICO memo-0034-2025 se remite contrato para firma monitoreo de información y publicidad Hu-Eder.pdf', 2, '2025-03-15 17:19:57', '2025-03-15 17:19:57'),
	(1259, 'storage/documentos/memorandum/PhCEmNOKGh_JURÍDICO memo-0350-2025 se remite contrato para firma cotaprep Huoston Eder.pdf', 'PhCEmNOKGh_JURÍDICO memo-0350-2025 se remite contrato para firma cotaprep Huoston Eder.pdf', 2, '2025-03-15 17:22:10', '2025-03-15 17:22:10'),
	(1260, 'storage/documentos/memorandum/IpdpNx2pe3_PRERROGATIVAS memo-0283-2025 se remiten recibos originales Saúl-Eder.pdf', 'IpdpNx2pe3_PRERROGATIVAS memo-0283-2025 se remiten recibos originales Saúl-Eder.pdf', 2, '2025-03-15 17:23:42', '2025-03-15 17:23:42'),
	(1261, 'storage/documentos/escrito/iATBsYPdiL_HAYDEE MEDEL correo solicitud de carta de satisfacción Eder-Huoston.pdf', 'iATBsYPdiL_HAYDEE MEDEL correo solicitud de carta de satisfacción Eder-Huoston.pdf', 5, '2025-03-15 17:25:15', '2025-03-15 17:25:15'),
	(1262, 'storage/documentos/escrito/sl5XFJGekL_SIVOPLE RECIBO SIMPLE PUE-2025-0646-00127.pdf', 'sl5XFJGekL_SIVOPLE RECIBO SIMPLE PUE-2025-0646-00127.pdf', 5, '2025-03-15 17:28:45', '2025-03-15 17:28:45'),
	(1263, 'storage/documentos/oficio/VLiOcukTVF_SECRETARÍA oficio-0629-2025 se notifica renovación de encargo de despacho Cuarto.pdf', 'VLiOcukTVF_SECRETARÍA oficio-0629-2025 se notifica renovación de encargo de despacho Cuarto.pdf', 3, '2025-03-15 17:31:41', '2025-03-15 17:31:41'),
	(1264, 'storage/documentos/requisicion/Wy15GJpr2R_REQUISICIÓN No.pdf', 'Wy15GJpr2R_REQUISICIÓN No.pdf', 1, '2025-03-15 17:34:19', '2025-03-15 17:34:19'),
	(1265, 'storage/documentos/requisicion/LUbXpIjCIB_REQUISICIÓN No.pdf', 'LUbXpIjCIB_REQUISICIÓN No.pdf', 1, '2025-03-15 17:36:03', '2025-03-15 17:36:03'),
	(1266, 'storage/documentos/requisicion/LVcGLWVdVd_REQUISICIÓN No.pdf', 'LVcGLWVdVd_REQUISICIÓN No.pdf', 1, '2025-03-15 17:37:25', '2025-03-15 17:37:25'),
	(1267, 'storage/documentos/requisicion/TwacbO65iA_REQUISICIÓN No.pdf', 'TwacbO65iA_REQUISICIÓN No.pdf', 1, '2025-03-15 17:38:46', '2025-03-15 17:38:46'),
	(1268, 'storage/documentos/requisicion/vzwLNcX5fc_REQUISICIÓN No.pdf', 'vzwLNcX5fc_REQUISICIÓN No.pdf', 1, '2025-03-15 17:39:59', '2025-03-15 17:39:59'),
	(1269, 'storage/documentos/requisicion/aLxZkbMMy7_REQUISICIÓN No.pdf', 'aLxZkbMMy7_REQUISICIÓN No.pdf', 1, '2025-03-15 17:41:50', '2025-03-15 17:41:50'),
	(1270, 'storage/documentos/requisicion/340CrBMTy9_REQUISICIÓN No.pdf', '340CrBMTy9_REQUISICIÓN No.pdf', 1, '2025-03-15 17:43:09', '2025-03-15 17:43:09'),
	(1271, 'storage/documentos/requisicion/nZQ6KCHfNz_REQUISICIÓN No 711.pdf', 'nZQ6KCHfNz_REQUISICIÓN No 711.pdf', 1, '2025-03-15 17:45:05', '2025-03-15 17:45:05'),
	(1272, 'storage/documentos/requisicion/iEGPbYW4Wz_REQUISICIÓN No.pdf', 'iEGPbYW4Wz_REQUISICIÓN No.pdf', 1, '2025-03-15 17:49:26', '2025-03-15 17:49:26'),
	(1273, 'storage/documentos/requisicion/6jab7WsEPr_REQUISICIÓN No.pdf', '6jab7WsEPr_REQUISICIÓN No.pdf', 1, '2025-03-15 17:53:09', '2025-03-15 17:53:09'),
	(1274, 'storage/documentos/requisicion/zzEC2yL7cZ_REQUISICIÓN No.pdf', 'zzEC2yL7cZ_REQUISICIÓN No.pdf', 1, '2025-03-15 17:54:30', '2025-03-15 17:54:30'),
	(1275, 'storage/documentos/requisicion/q68G2KP3Gg_REQUISICIÓN No.pdf', 'q68G2KP3Gg_REQUISICIÓN No.pdf', 1, '2025-03-15 17:56:01', '2025-03-15 17:56:01'),
	(1276, 'storage/documentos/memorandum/jn4JhHuHzZ_SECRETARÍA memo-ca-p-0195-2025  convocatoria sesión adquicisiones Eder-Huoston.pdf', 'jn4JhHuHzZ_SECRETARÍA memo-ca-p-0195-2025  convocatoria sesión adquicisiones Eder-Huoston.pdf', 2, '2025-03-17 13:41:53', '2025-03-17 13:41:53'),
	(1277, 'storage/documentos/requisicion/QZJaZU3Wq9_REQUISICIÓN No.pdf', 'QZJaZU3Wq9_REQUISICIÓN No.pdf', 1, '2025-03-17 15:46:35', '2025-03-17 15:46:35'),
	(1278, 'storage/documentos/escrito/j1Tl7h92zs_DTS correo remite circular se-034-2025 remite acuerdo cg-ac-0034-2025 Huoston-Eder.pdf', 'j1Tl7h92zs_DTS correo remite circular se-034-2025 remite acuerdo cg-ac-0034-2025 Huoston-Eder.pdf', 5, '2025-03-17 15:49:02', '2025-03-17 15:49:02'),
	(1279, 'storage/documentos/memorandum/Ix8DaTcO3O_COMUNICACIÓN memo-076-2025 boletín 20 Archivo.pdf', 'Ix8DaTcO3O_COMUNICACIÓN memo-076-2025 boletín 20 Archivo.pdf', 2, '2025-03-17 19:06:29', '2025-03-17 19:06:29'),
	(1280, 'storage/documentos/memorandum/FPjcI5BRna_JURÍDICO memo-0369-2025 se remite contrato para resguardo COTAPREP Huoston-Eder.pdf', 'FPjcI5BRna_JURÍDICO memo-0369-2025 se remite contrato para resguardo COTAPREP Huoston-Eder.pdf', 2, '2025-03-17 19:23:16', '2025-03-17 19:23:16'),
	(1281, 'storage/documentos/requisicion/QdNdUnJrf6_REQUISICIÓN No.pdf', 'QdNdUnJrf6_REQUISICIÓN No.pdf', 1, '2025-03-17 20:35:27', '2025-03-17 20:35:27'),
	(1282, 'storage/documentos/requisicion/ZPcFpUiNbr_REQUISICIÓN No.pdf', 'ZPcFpUiNbr_REQUISICIÓN No.pdf', 1, '2025-03-17 20:36:58', '2025-03-17 20:36:58'),
	(1283, 'storage/documentos/requisicion/Va4lR23bAH_REQUISICIÓN No.pdf', 'Va4lR23bAH_REQUISICIÓN No.pdf', 1, '2025-03-17 20:38:42', '2025-03-17 20:38:42'),
	(1284, 'storage/documentos/requisicion/BrDsKNNgN4_REQUISICIÓN No.pdf', 'BrDsKNNgN4_REQUISICIÓN No.pdf', 1, '2025-03-17 20:40:32', '2025-03-17 20:40:32'),
	(1285, 'storage/documentos/requisicion/Rht4LRreB9_REQUISICIÓN No.pdf', 'Rht4LRreB9_REQUISICIÓN No.pdf', 1, '2025-03-17 20:44:20', '2025-03-17 20:44:20'),
	(1286, 'storage/documentos/memorandum/DtFENzUA5p_JURÍDICO memo-0712-2025 se remite renuncia josé andrés Cuarto.pdf', 'DtFENzUA5p_JURÍDICO memo-0712-2025 se remite renuncia josé andrés Cuarto.pdf', 2, '2025-03-17 20:51:32', '2025-03-17 20:51:32'),
	(1287, 'storage/documentos/memorandum/BPNE8AMZOM_JURÍDICO memo-0716-2025 se solicita información h.pdf', 'BPNE8AMZOM_JURÍDICO memo-0716-2025 se solicita información h.pdf', 2, '2025-03-17 20:53:48', '2025-03-17 20:53:48'),
	(1288, 'storage/documentos/memorandum/Trhge6hMxD_JURÍDICO memo-0717-2025 se solicita información nopalucan Saúl-Eder.pdf', 'Trhge6hMxD_JURÍDICO memo-0717-2025 se solicita información nopalucan Saúl-Eder.pdf', 2, '2025-03-17 20:56:43', '2025-03-17 20:56:43'),
	(1289, 'storage/documentos/memorandum/eXBOjXJKZC_PRERROGATIVAS memo-0284-2025 remite recibo original de pri mes enero 2025 Eder-Saúl.pdf', 'eXBOjXJKZC_PRERROGATIVAS memo-0284-2025 remite recibo original de pri mes enero 2025 Eder-Saúl.pdf', 2, '2025-03-17 21:04:43', '2025-03-17 21:04:43'),
	(1290, 'storage/documentos/memorandum/avrAWKDN13_SECRETARÍA memo-1273-2025 se autoriza certificación resp memo da-0295-2025 Luis.pdf', 'avrAWKDN13_SECRETARÍA memo-1273-2025 se autoriza certificación resp memo da-0295-2025 Luis.pdf', 2, '2025-03-17 21:07:33', '2025-03-17 21:07:33'),
	(1291, 'storage/documentos/circular/sg2pp9EhvW_TRANSPARENCIA circular-018-2025 obligaciones transp primer trimestre y7o anual 2025 Luis Eder.pdf', 'sg2pp9EhvW_TRANSPARENCIA circular-018-2025 obligaciones transp primer trimestre y7o anual 2025 Luis Eder.pdf', 4, '2025-03-17 21:15:08', '2025-03-17 21:15:08'),
	(1292, 'storage/documentos/oficio/o1Y07r4jdf_XIUTETELCO oficio-se-0002-2025 requerir materiales para jornada electoral Daniel-Chucho-Eder.pdf', 'o1Y07r4jdf_XIUTETELCO oficio-se-0002-2025 requerir materiales para jornada electoral Daniel-Chucho-Eder.pdf', 3, '2025-03-17 21:17:59', '2025-03-17 21:17:59'),
	(1293, 'storage/documentos/requisicion/ggTWapEcs4_REQUISICIÓN No.pdf', 'ggTWapEcs4_REQUISICIÓN No.pdf', 1, '2025-03-17 21:19:55', '2025-03-17 21:19:55'),
	(1294, 'storage/documentos/memorandum/D4nGYL6MeU_DOE memo-244-2025 requerimientos modelos operativos Daniel-Eder.pdf', 'D4nGYL6MeU_DOE memo-244-2025 requerimientos modelos operativos Daniel-Eder.pdf', 2, '2025-03-18 21:36:05', '2025-03-18 21:36:05'),
	(1295, 'storage/documentos/memorandum/KMx6vCfl4Y_DTS memo-0272-2025 se informa nombramiento Cuarto.pdf', 'KMx6vCfl4Y_DTS memo-0272-2025 se informa nombramiento Cuarto.pdf', 2, '2025-03-18 21:40:15', '2025-03-18 21:40:15'),
	(1296, 'storage/documentos/memorandum/GtHIXR04zF_JURÍDICO memo-0369-2025 se remite contrato para su resguardo cotaprep Huoston-Eder.pdf', 'GtHIXR04zF_JURÍDICO memo-0369-2025 se remite contrato para su resguardo cotaprep Huoston-Eder.pdf', 2, '2025-03-18 21:56:36', '2025-03-18 21:56:36'),
	(1297, 'storage/documentos/memorandum/T7nGacUvnq_JURÍDICO memo-0706-2025 se remte adenda para su observación xiutetelco Eder-Huoston-Emir-Saúl.pdf', 'T7nGacUvnq_JURÍDICO memo-0706-2025 se remte adenda para su observación xiutetelco Eder-Huoston-Emir-Saúl.pdf', 2, '2025-03-18 21:59:23', '2025-03-18 21:59:23'),
	(1298, 'storage/documentos/memorandum/DYCdw8FnO0_JURÍDICO memo-0712-2025 se remite renuncia José andrés Cuarto.pdf', 'DYCdw8FnO0_JURÍDICO memo-0712-2025 se remite renuncia José andrés Cuarto.pdf', 2, '2025-03-18 22:01:01', '2025-03-18 22:01:01'),
	(1299, 'storage/documentos/memorandum/BylaAkoRW4_JURÍDICO memo-0716-2025 se solicita Información Eder-Saúl.pdf', 'BylaAkoRW4_JURÍDICO memo-0716-2025 se solicita Información Eder-Saúl.pdf', 2, '2025-03-18 22:09:53', '2025-03-18 22:09:53'),
	(1300, 'storage/documentos/memorandum/lOxaLUf4S2_JURÍDICO memo-0717-2025 se solicita información Eder-Saúl.pdf', 'lOxaLUf4S2_JURÍDICO memo-0717-2025 se solicita información Eder-Saúl.pdf', 2, '2025-03-18 22:11:57', '2025-03-18 22:11:57'),
	(1301, 'storage/documentos/oficio/gRvq2wyv2p_PRERROGATIVAS oficio-0048-2025 se detactaron inconsistencias pan Archivo.pdf', 'gRvq2wyv2p_PRERROGATIVAS oficio-0048-2025 se detactaron inconsistencias pan Archivo.pdf', 3, '2025-03-18 22:14:52', '2025-03-18 22:14:52'),
	(1302, 'storage/documentos/oficio/ZiZO1LagEg_PRERROGATIVAS oficio-0049-2025 se solicita remita recibo pri Archivo.pdf', 'ZiZO1LagEg_PRERROGATIVAS oficio-0049-2025 se solicita remita recibo pri Archivo.pdf', 3, '2025-03-18 22:18:46', '2025-03-18 22:18:46'),
	(1303, 'storage/documentos/oficio/IBqfNgGmpu_PRERROGATIVAS oficio-0050-2025 se solicita remita recibo pt Archivo.pdf', 'IBqfNgGmpu_PRERROGATIVAS oficio-0050-2025 se solicita remita recibo pt Archivo.pdf', 3, '2025-03-18 22:33:33', '2025-03-18 22:33:33'),
	(1304, 'storage/documentos/memorandum/pcVeoSSdao_INFORMÁTICA memo-ii-prep-0186-2025 notificación ine Archivo.pdf', 'pcVeoSSdao_INFORMÁTICA memo-ii-prep-0186-2025 notificación ine Archivo.pdf', 2, '2025-03-18 22:35:35', '2025-03-18 22:35:35'),
	(1305, 'storage/documentos/oficio/Rmg2BMNK17_PRERROGATIVAS oficio-0051-2025 se solicita remita recibo pvem Archivo.pdf', 'Rmg2BMNK17_PRERROGATIVAS oficio-0051-2025 se solicita remita recibo pvem Archivo.pdf', 3, '2025-03-18 22:41:34', '2025-03-18 22:41:34'),
	(1306, 'storage/documentos/oficio/oGNaex1faD_PRERROGATIVAS oficio-0052-2025 se solicita remita recibo mc Archivo.pdf', 'oGNaex1faD_PRERROGATIVAS oficio-0052-2025 se solicita remita recibo mc Archivo.pdf', 3, '2025-03-18 22:43:24', '2025-03-18 22:43:24'),
	(1307, 'storage/documentos/oficio/rn1zONCBet_PRERROGATIVAS oficio-0053-2025 se detectaron inconsistencias psi Archivo.pdf', 'rn1zONCBet_PRERROGATIVAS oficio-0053-2025 se detectaron inconsistencias psi Archivo.pdf', 3, '2025-03-18 22:56:27', '2025-03-18 22:56:27'),
	(1308, 'storage/documentos/oficio/Yg28omWIQE_PRERROGATIVAS oficio-0054-2025 se solictia remita recibos morena Archivo.pdf', 'Yg28omWIQE_PRERROGATIVAS oficio-0054-2025 se solictia remita recibos morena Archivo.pdf', 3, '2025-03-18 22:58:40', '2025-03-18 22:58:40'),
	(1309, 'storage/documentos/oficio/Rbqh3b3kkC_PRERROGATIVAS oficio-0056-2025 solicito se remita recibo fxmp Archivo.pdf', 'Rbqh3b3kkC_PRERROGATIVAS oficio-0056-2025 solicito se remita recibo fxmp Archivo.pdf', 3, '2025-03-18 23:01:19', '2025-03-18 23:01:19'),
	(1310, 'storage/documentos/oficio/BTANVJ4RkP_PRERROGATIVAS oficio-0057-2025 se informa transferencia financiamiento público calpan Saúl.pdf', 'BTANVJ4RkP_PRERROGATIVAS oficio-0057-2025 se informa transferencia financiamiento público calpan Saúl.pdf', 3, '2025-03-18 23:03:57', '2025-03-18 23:03:57'),
	(1311, 'storage/documentos/oficio/uei42LCU7F_PRERROGATIVAS oficio-0059-2025 fuerza independiente de chalchicomula Archivo.pdf', 'uei42LCU7F_PRERROGATIVAS oficio-0059-2025 fuerza independiente de chalchicomula Archivo.pdf', 3, '2025-03-18 23:07:46', '2025-03-18 23:07:46'),
	(1312, 'storage/documentos/requisicion/0lYWLgzZ2t_REQUISICIÓN No.pdf', '0lYWLgzZ2t_REQUISICIÓN No.pdf', 1, '2025-03-18 23:09:30', '2025-03-18 23:09:30'),
	(1313, 'storage/documentos/requisicion/Vy5slUch74_REQUISICIÓN No.pdf', 'Vy5slUch74_REQUISICIÓN No.pdf', 1, '2025-03-18 23:10:45', '2025-03-18 23:10:45'),
	(1314, 'storage/documentos/requisicion/gYZdIhcnsf_REQUISICIÓN No.pdf', 'gYZdIhcnsf_REQUISICIÓN No.pdf', 1, '2025-03-18 23:11:58', '2025-03-18 23:11:58'),
	(1315, 'storage/documentos/requisicion/JJ8hbohnkQ_REQUISICIÓN No.pdf', 'JJ8hbohnkQ_REQUISICIÓN No.pdf', 1, '2025-03-18 23:13:47', '2025-03-18 23:13:47'),
	(1316, 'storage/documentos/requisicion/F4EWxzgBPA_REQUISICIÓN No.pdf', 'F4EWxzgBPA_REQUISICIÓN No.pdf', 1, '2025-03-18 23:16:30', '2025-03-18 23:16:30'),
	(1317, 'storage/documentos/requisicion/qRizi2u9w8_REQUISICIÓN No.pdf', 'qRizi2u9w8_REQUISICIÓN No.pdf', 1, '2025-03-18 23:18:13', '2025-03-18 23:18:13'),
	(1318, 'storage/documentos/requisicion/hna1uEFo19_REQUISICIÓN No.pdf', 'hna1uEFo19_REQUISICIÓN No.pdf', 1, '2025-03-18 23:20:05', '2025-03-18 23:20:05'),
	(1319, 'storage/documentos/requisicion/affc3MM1Px_REQUISICIÓN No.pdf', 'affc3MM1Px_REQUISICIÓN No.pdf', 1, '2025-03-18 23:26:25', '2025-03-18 23:26:25'),
	(1320, 'storage/documentos/requisicion/BypQQnUwAc_REQUISICIÓN No.pdf', 'BypQQnUwAc_REQUISICIÓN No.pdf', 1, '2025-03-18 23:28:41', '2025-03-18 23:28:41'),
	(1321, 'storage/documentos/requisicion/716BrKhmp1_REQUISICIÓN No.pdf', '716BrKhmp1_REQUISICIÓN No.pdf', 1, '2025-03-18 23:30:24', '2025-03-18 23:30:24'),
	(1322, 'storage/documentos/requisicion/061Dc6IOMZ_REQUISICIÓN No.pdf', '061Dc6IOMZ_REQUISICIÓN No.pdf', 1, '2025-03-18 23:31:48', '2025-03-18 23:31:48'),
	(1323, 'storage/documentos/requisicion/dqhGsS55VP_REQUISICIÓN No.pdf', 'dqhGsS55VP_REQUISICIÓN No.pdf', 1, '2025-03-18 23:47:24', '2025-03-18 23:47:24'),
	(1324, 'storage/documentos/requisicion/g6sRLDoHV3_REQUISICIÓN No.pdf', 'g6sRLDoHV3_REQUISICIÓN No.pdf', 1, '2025-03-18 23:49:06', '2025-03-18 23:49:06'),
	(1325, 'storage/documentos/requisicion/36UnMkZCo8_REQUISICIÓN No.pdf', '36UnMkZCo8_REQUISICIÓN No.pdf', 1, '2025-03-18 23:50:30', '2025-03-18 23:50:30'),
	(1326, 'storage/documentos/circular/DdISxS8P2H_SECRETARÍA circular-044-2025 se remiten indicaciones a todo el personal.pdf', 'DdISxS8P2H_SECRETARÍA circular-044-2025 se remiten indicaciones a todo el personal.pdf', 4, '2025-03-18 23:53:13', '2025-03-18 23:53:13'),
	(1327, 'storage/documentos/memorandum/f0yeTzkr9f_SECRETARÍA memo-1273-2025  se autoriza certificación Eder-Luis.pdf', 'f0yeTzkr9f_SECRETARÍA memo-1273-2025  se autoriza certificación Eder-Luis.pdf', 2, '2025-03-18 23:54:51', '2025-03-18 23:54:51'),
	(1328, 'storage/documentos/circular/LOsx93g8kG_TRANSPARENCIA circular-018-2025 obligaciones de transparencia primer trimestre anual 2025 Luis-Eder.pdf', 'LOsx93g8kG_TRANSPARENCIA circular-018-2025 obligaciones de transparencia primer trimestre anual 2025 Luis-Eder.pdf', 4, '2025-03-18 23:56:34', '2025-03-18 23:56:34'),
	(1329, 'storage/documentos/escrito/OCmgdUbE4c_UFD correo reporte de entradas y salidas Caro-Sol-Eder-Cuarto.pdf', 'OCmgdUbE4c_UFD correo reporte de entradas y salidas Caro-Sol-Eder-Cuarto.pdf', 5, '2025-03-18 23:58:17', '2025-03-18 23:58:17'),
	(1330, 'storage/documentos/memorandum/1wirPeFT9d_UFD memo-307-2025 se solicita desincorporación de personal Cuarto.pdf', '1wirPeFT9d_UFD memo-307-2025 se solicita desincorporación de personal Cuarto.pdf', 2, '2025-03-18 23:59:44', '2025-03-18 23:59:44'),
	(1331, 'storage/documentos/requisicion/bx9x7iyVJK_REQUISICIÓN No.pdf', 'bx9x7iyVJK_REQUISICIÓN No.pdf', 1, '2025-03-19 14:58:13', '2025-03-19 14:58:13'),
	(1332, 'storage/documentos/requisicion/wXFupvzGBf_REQUISICIÓN No.pdf', 'wXFupvzGBf_REQUISICIÓN No.pdf', 1, '2025-03-19 15:01:45', '2025-03-19 15:01:45'),
	(1333, 'storage/documentos/requisicion/Y29CD0Amrb_REQUISICIÓN No.pdf', 'Y29CD0Amrb_REQUISICIÓN No.pdf', 1, '2025-03-19 15:15:54', '2025-03-19 15:15:54'),
	(1334, 'storage/documentos/requisicion/FywViPSNeH_REQUISICIÓN No.pdf', 'FywViPSNeH_REQUISICIÓN No.pdf', 1, '2025-03-19 15:26:18', '2025-03-19 15:26:18'),
	(1335, 'storage/documentos/requisicion/stvTdXrRLW_REQUISICIÓN No.pdf', 'stvTdXrRLW_REQUISICIÓN No.pdf', 1, '2025-03-19 15:27:53', '2025-03-19 15:27:53'),
	(1336, 'storage/documentos/requisicion/akvySYTzgy_REQUISICIÓN No.pdf', 'akvySYTzgy_REQUISICIÓN No.pdf', 1, '2025-03-19 15:29:31', '2025-03-19 15:29:31'),
	(1337, 'storage/documentos/requisicion/lco9NtsDqA_REQUISICIÓN No.pdf', 'lco9NtsDqA_REQUISICIÓN No.pdf', 1, '2025-03-19 15:36:23', '2025-03-19 15:36:23'),
	(1338, 'storage/documentos/requisicion/AkSZ2oY1uQ_REQUISICIÓN No.pdf', 'AkSZ2oY1uQ_REQUISICIÓN No.pdf', 1, '2025-03-19 15:37:55', '2025-03-19 15:37:55'),
	(1339, 'storage/documentos/escrito/FTiuKqGBG6_OFICIALIA DE PARTES correo folio 1591 oficio sfppue-os-uvsea-drevp-1836-2025 solicita información Eder.pdf', 'FTiuKqGBG6_OFICIALIA DE PARTES correo folio 1591 oficio sfppue-os-uvsea-drevp-1836-2025 solicita información Eder.pdf', 5, '2025-03-19 15:39:14', '2025-03-19 15:39:14'),
	(1340, 'storage/documentos/escrito/EDmPnddsU4_OFICIALIA DE PARTES correo folio 1592 oficio sfppue-os-uvsea-drevp-1835-2025 solicita información Eder.pdf', 'EDmPnddsU4_OFICIALIA DE PARTES correo folio 1592 oficio sfppue-os-uvsea-drevp-1835-2025 solicita información Eder.pdf', 5, '2025-03-19 15:41:56', '2025-03-19 15:41:56'),
	(1341, 'storage/documentos/escrito/39aNjoTd3t_OFICIALIA DE PARTES correo folio 1593 oficio sfppue-os-uvsea-drevp-1850-2025 solicita información Eder.pdf', '39aNjoTd3t_OFICIALIA DE PARTES correo folio 1593 oficio sfppue-os-uvsea-drevp-1850-2025 solicita información Eder.pdf', 5, '2025-03-19 15:43:31', '2025-03-19 15:43:31'),
	(1342, 'storage/documentos/escrito/BGhw8sGjm8_OFICIALIA DE PARTES correo folio 1594 oficio sfppue-os-uvsea-drevp-1854-2025 solicita información Eder.pdf', 'BGhw8sGjm8_OFICIALIA DE PARTES correo folio 1594 oficio sfppue-os-uvsea-drevp-1854-2025 solicita información Eder.pdf', 5, '2025-03-19 15:44:53', '2025-03-19 15:44:53'),
	(1343, 'storage/documentos/escrito/kfbjAKcRiv_OFICIALIA DE PARTES correo folio 1595 oficio sfppue-os-uvsea-drevp-1883-2025 solicita información Eder.pdf', 'kfbjAKcRiv_OFICIALIA DE PARTES correo folio 1595 oficio sfppue-os-uvsea-drevp-1883-2025 solicita información Eder.pdf', 5, '2025-03-19 15:47:20', '2025-03-19 15:47:20'),
	(1344, 'storage/documentos/memorandum/nqwJsJHTFP_PLANEACIÓN memo-018-2025 información 1 usb ASE Eder.pdf', 'nqwJsJHTFP_PLANEACIÓN memo-018-2025 información 1 usb ASE Eder.pdf', 2, '2025-03-19 15:49:54', '2025-03-19 15:49:54'),
	(1345, 'storage/documentos/oficio/5sVZFjUp5C_PRERROGATIVAS oficio-0058-2025 se solicita remita original de los recibos correspondientes Saúl.pdf', '5sVZFjUp5C_PRERROGATIVAS oficio-0058-2025 se solicita remita original de los recibos correspondientes Saúl.pdf', 3, '2025-03-19 15:53:57', '2025-03-19 15:53:57'),
	(1346, 'storage/documentos/circular/7KrdTLYzGB_SECRETARÍA circular-045-2025 carta compromiso confidencialidad y no divulg.pdf', '7KrdTLYzGB_SECRETARÍA circular-045-2025 carta compromiso confidencialidad y no divulg.pdf', 4, '2025-03-19 15:55:12', '2025-03-19 15:55:12'),
	(1347, 'storage/documentos/memorandum/tuslBnblfN_SECRETARÍA memo-1275-2025 se autoriza certificación Eder.pdf', 'tuslBnblfN_SECRETARÍA memo-1275-2025 se autoriza certificación Eder.pdf', 2, '2025-03-19 15:56:50', '2025-03-19 15:56:50'),
	(1348, 'storage/documentos/memorandum/DvL7rOGWGC_UFD memo-312-2025 reloj checador Alexis.pdf', 'DvL7rOGWGC_UFD memo-312-2025 reloj checador Alexis.pdf', 2, '2025-03-19 15:58:56', '2025-03-19 15:58:56'),
	(1349, 'storage/documentos/requisicion/d4orNPa3St_REQUISICIÓN No.pdf', 'd4orNPa3St_REQUISICIÓN No.pdf', 1, '2025-03-19 18:08:08', '2025-03-19 18:08:08'),
	(1350, 'storage/documentos/requisicion/dE6L9hhTqy_REQUISICIÓN No.pdf', 'dE6L9hhTqy_REQUISICIÓN No.pdf', 1, '2025-03-19 18:33:30', '2025-03-19 18:33:30'),
	(1351, 'storage/documentos/requisicion/rY2qyj0Wmw_REQUISICIÓN No.pdf', 'rY2qyj0Wmw_REQUISICIÓN No.pdf', 1, '2025-03-19 18:40:10', '2025-03-19 18:40:10'),
	(1352, 'storage/documentos/correo/iPnkhKpnNA_UFD REPORTE DE INCIDENCIAS QUINCENALES PRIMERA QUINCENA MARZO 2025 CF Eder.pdf', 'iPnkhKpnNA_UFD REPORTE DE INCIDENCIAS QUINCENALES PRIMERA QUINCENA MARZO 2025 CF Eder.pdf', 7, '2025-03-19 18:59:51', '2025-03-19 18:59:51'),
	(1353, 'storage/documentos/requisicion/XFUOFrMxfD_REQUISICIÓN No.pdf', 'XFUOFrMxfD_REQUISICIÓN No.pdf', 1, '2025-03-21 15:09:30', '2025-03-21 15:09:30'),
	(1354, 'storage/documentos/requisicion/oGHjfyM7fH_REQUISICIÓN No.pdf', 'oGHjfyM7fH_REQUISICIÓN No.pdf', 1, '2025-03-21 15:19:40', '2025-03-21 15:19:40'),
	(1355, 'storage/documentos/requisicion/BDzPjv3wPZ_REQUISICIÓN No.pdf', 'BDzPjv3wPZ_REQUISICIÓN No.pdf', 1, '2025-03-21 15:23:04', '2025-03-21 15:23:04'),
	(1356, 'storage/documentos/requisicion/H7N8KqR5Oc_REQUISICIÓN No.pdf', 'H7N8KqR5Oc_REQUISICIÓN No.pdf', 1, '2025-03-21 15:31:56', '2025-03-21 15:31:56'),
	(1357, 'storage/documentos/requisicion/ViVlZqLFnk_REQUISICIÓN No.pdf', 'ViVlZqLFnk_REQUISICIÓN No.pdf', 1, '2025-03-21 15:33:39', '2025-03-21 15:33:39'),
	(1358, 'storage/documentos/requisicion/0Ndr9hTtSV_REQUISICIÓN No.pdf', '0Ndr9hTtSV_REQUISICIÓN No.pdf', 1, '2025-03-21 15:36:28', '2025-03-21 15:36:28'),
	(1359, 'storage/documentos/requisicion/VHFFuNXfHh_REQUISICIÓN No.pdf', 'VHFFuNXfHh_REQUISICIÓN No.pdf', 1, '2025-03-21 15:38:42', '2025-03-21 15:38:42'),
	(1360, 'storage/documentos/requisicion/t2CiwSFpJa_REQUISICIÓN No.pdf', 't2CiwSFpJa_REQUISICIÓN No.pdf', 1, '2025-03-21 15:40:08', '2025-03-21 15:40:08'),
	(1361, 'storage/documentos/requisicion/zrpPfCS4gJ_REQUISICIÓN No.pdf', 'zrpPfCS4gJ_REQUISICIÓN No.pdf', 1, '2025-03-21 15:43:02', '2025-03-21 15:43:02'),
	(1362, 'storage/documentos/requisicion/SBnnS5HiIG_REQUISICIÓN No.pdf', 'SBnnS5HiIG_REQUISICIÓN No.pdf', 1, '2025-03-21 15:44:45', '2025-03-21 15:44:45'),
	(1363, 'storage/documentos/requisicion/fYfCENzbFJ_REQUISICIÓN No.pdf', 'fYfCENzbFJ_REQUISICIÓN No.pdf', 1, '2025-03-21 15:49:31', '2025-03-21 15:49:31'),
	(1364, 'storage/documentos/requisicion/A8VuzrDsfN_REQUISICIÓN No.pdf', 'A8VuzrDsfN_REQUISICIÓN No.pdf', 1, '2025-03-21 21:18:15', '2025-03-21 21:18:15'),
	(1365, 'storage/documentos/requisicion/CYOBjhMXAk_REQUISICIÓN No.pdf', 'CYOBjhMXAk_REQUISICIÓN No.pdf', 1, '2025-03-21 21:19:35', '2025-03-21 21:19:35'),
	(1366, 'storage/documentos/requisicion/5SWB9Wycho_REQUISICIÓN No.pdf', '5SWB9Wycho_REQUISICIÓN No.pdf', 1, '2025-03-21 21:21:57', '2025-03-21 21:21:57'),
	(1367, 'storage/documentos/requisicion/Gohqs2oBP1_REQUISICIÓN No.pdf', 'Gohqs2oBP1_REQUISICIÓN No.pdf', 1, '2025-03-21 21:51:11', '2025-03-21 21:51:11'),
	(1368, 'storage/documentos/memorandum/sItm15pjt3_JURÍDICO memo-0084-2025 se remite contrato para su resguardo monitoreo de información Huoston Eder.pdf', 'sItm15pjt3_JURÍDICO memo-0084-2025 se remite contrato para su resguardo monitoreo de información Huoston Eder.pdf', 2, '2025-03-21 22:06:31', '2025-03-21 22:06:31'),
	(1369, 'storage/documentos/escrito/ZlLVbrFL0V_DTS correo remite circular-0046-2025 remitiendo acuerdo cg-ac-0042-2025  Eder-Normatividad, Saúl.pdf', 'ZlLVbrFL0V_DTS correo remite circular-0046-2025 remitiendo acuerdo cg-ac-0042-2025  Eder-Normatividad, Saúl.pdf', 5, '2025-03-21 22:29:22', '2025-03-21 22:29:22'),
	(1370, 'storage/documentos/memorandum/3ulPRy6Xdg_JURÍDICO memo-0084-2025 se remite contrato para su resguardo MONITOREO Huoston-Eder.pdf', '3ulPRy6Xdg_JURÍDICO memo-0084-2025 se remite contrato para su resguardo MONITOREO Huoston-Eder.pdf', 2, '2025-03-21 22:32:36', '2025-03-21 22:32:36'),
	(1371, 'storage/documentos/escrito/X8fqptKnAZ_DTS correo difusión de listado de ubicación e integración de mesas directivas de casillas  Archivo.pdf', 'X8fqptKnAZ_DTS correo difusión de listado de ubicación e integración de mesas directivas de casillas  Archivo.pdf', 5, '2025-03-22 15:42:28', '2025-03-22 15:42:28'),
	(1372, 'storage/documentos/memorandum/hynCEVy5ss_JURÍDICO memo-0728-2025 se remiten documentos Cuarto.pdf', 'hynCEVy5ss_JURÍDICO memo-0728-2025 se remiten documentos Cuarto.pdf', 2, '2025-03-22 16:09:43', '2025-03-22 16:09:43'),
	(1373, 'storage/documentos/memorandum/xzoD2VywzO_JURÍDICO memo-0736-2025 se remiten 62 convenios para su resguardo Huoston-Eder.pdf', 'xzoD2VywzO_JURÍDICO memo-0736-2025 se remiten 62 convenios para su resguardo Huoston-Eder.pdf', 2, '2025-03-22 16:13:53', '2025-03-22 16:13:53'),
	(1374, 'storage/documentos/memorandum/B8sY73Siw6_JURÍDICO memo-ca-se-0033-2025 se remite Contrato para su observación Huoston Eder.pdf', 'B8sY73Siw6_JURÍDICO memo-ca-se-0033-2025 se remite Contrato para su observación Huoston Eder.pdf', 2, '2025-03-22 16:17:09', '2025-03-22 16:17:09'),
	(1375, 'storage/documentos/memorandum/2Kps89XXzJ_PRERROGATIVAS memo-0298-2025 se remiten recibos originales de financiamiento Público Eder-Saúl.pdf', '2Kps89XXzJ_PRERROGATIVAS memo-0298-2025 se remiten recibos originales de financiamiento Público Eder-Saúl.pdf', 2, '2025-03-22 17:19:02', '2025-03-22 17:19:02'),
	(1376, 'storage/documentos/memorandum/y9N2SbzL8X_PRESIDENCIA memo-copead-003-2025 Eder- Normatividad.pdf', 'y9N2SbzL8X_PRESIDENCIA memo-copead-003-2025 Eder- Normatividad.pdf', 2, '2025-03-22 17:28:53', '2025-03-22 17:28:53'),
	(1377, 'storage/documentos/requisicion/TY29u6foNX_REQUISICIÓN No.pdf', 'TY29u6foNX_REQUISICIÓN No.pdf', 1, '2025-03-22 17:30:59', '2025-03-22 17:30:59'),
	(1378, 'storage/documentos/requisicion/d0oRpek7qx_REQUISICIÓN No.pdf', 'd0oRpek7qx_REQUISICIÓN No.pdf', 1, '2025-03-22 17:34:28', '2025-03-22 17:34:28'),
	(1379, 'storage/documentos/memorandum/g5tCDvxO1p_PRESIDENCIA memo-je-053-2025 se convoca a sesión especial de junta ejecutiva Huoston-Eder.pdf', 'g5tCDvxO1p_PRESIDENCIA memo-je-053-2025 se convoca a sesión especial de junta ejecutiva Huoston-Eder.pdf', 2, '2025-03-23 14:30:58', '2025-03-23 14:30:58'),
	(1380, 'storage/documentos/oficio/lnpX2Qcg9T_PRESIDENCIA oficio-0341-2025 se remiten estados financieros mes de febrero Eder.pdf', 'lnpX2Qcg9T_PRESIDENCIA oficio-0341-2025 se remiten estados financieros mes de febrero Eder.pdf', 3, '2025-03-23 14:34:10', '2025-03-23 14:34:10'),
	(1381, 'storage/documentos/oficio/eJtQ0NUaLu_PRESIDENCIA oficio-0345-2025 Ministración del mes de marzo Archivo.pdf', 'eJtQ0NUaLu_PRESIDENCIA oficio-0345-2025 Ministración del mes de marzo Archivo.pdf', 3, '2025-03-23 14:37:48', '2025-03-23 14:37:48'),
	(1382, 'storage/documentos/oficio/2nHcnJXsJ8_PRESIDENCIA oficio-0346-2025 se remite información y documentación Archivo.pdf', '2nHcnJXsJ8_PRESIDENCIA oficio-0346-2025 se remite información y documentación Archivo.pdf', 3, '2025-03-23 14:39:36', '2025-03-23 14:39:36'),
	(1383, 'storage/documentos/oficio/pPdKg2jAqu_PRESIDENCIA oficio-0347-2025 se remite información y documentación Archivo.pdf', 'pPdKg2jAqu_PRESIDENCIA oficio-0347-2025 se remite información y documentación Archivo.pdf', 3, '2025-03-23 14:41:23', '2025-03-23 14:41:23'),
	(1384, 'storage/documentos/oficio/PujO6yfi8z_PRESIDENCIA oficio-0348-2025 se remite información y documentación Archivo.pdf', 'PujO6yfi8z_PRESIDENCIA oficio-0348-2025 se remite información y documentación Archivo.pdf', 3, '2025-03-23 14:43:57', '2025-03-23 14:43:57'),
	(1385, 'storage/documentos/oficio/YPpvNkVZgy_PRESIDENCIA oficio-0349-2025 se remite información y documentación Archivo.pdf', 'YPpvNkVZgy_PRESIDENCIA oficio-0349-2025 se remite información y documentación Archivo.pdf', 3, '2025-03-23 14:45:40', '2025-03-23 14:45:40'),
	(1386, 'storage/documentos/oficio/TfYkcxwL8l_PRESIDENCIA oficio-0350-2025 se remite información y documentación Archivo.pdf', 'TfYkcxwL8l_PRESIDENCIA oficio-0350-2025 se remite información y documentación Archivo.pdf', 3, '2025-03-23 14:47:44', '2025-03-23 14:47:44'),
	(1387, 'storage/documentos/oficio/pWO59lmTot_PRESIDENCIA oficio-0351-2025 se remite información y documentación Archivo.pdf', 'pWO59lmTot_PRESIDENCIA oficio-0351-2025 se remite información y documentación Archivo.pdf', 3, '2025-03-23 14:49:35', '2025-03-23 14:49:35'),
	(1388, 'storage/documentos/oficio/ReQbIPpkUD_PRESIDENCIA oficio-0352-2025 se remite información y documentación Archivo.pdf', 'ReQbIPpkUD_PRESIDENCIA oficio-0352-2025 se remite información y documentación Archivo.pdf', 3, '2025-03-23 14:51:28', '2025-03-23 14:51:28'),
	(1389, 'storage/documentos/oficio/YxuO9ugbmM_PRESIDENCIA oficio-0353-2025 se remite información y documentación Archivo.pdf', 'YxuO9ugbmM_PRESIDENCIA oficio-0353-2025 se remite información y documentación Archivo.pdf', 3, '2025-03-23 15:47:12', '2025-03-23 15:47:12'),
	(1390, 'storage/documentos/oficio/BcgPkRFhlm_PRESIDENCIA oficio-0354-2025 se remite información y documentación Archivo.pdf', 'BcgPkRFhlm_PRESIDENCIA oficio-0354-2025 se remite información y documentación Archivo.pdf', 3, '2025-03-23 15:58:43', '2025-03-23 15:58:43'),
	(1391, 'storage/documentos/oficio/wmnNaUJ3x1_PRESIDENCIA oficio-0355-2025 se remite información y documentación Archivo.pdf', 'wmnNaUJ3x1_PRESIDENCIA oficio-0355-2025 se remite información y documentación Archivo.pdf', 3, '2025-03-23 16:03:09', '2025-03-23 16:03:09'),
	(1392, 'storage/documentos/oficio/W6nKQqO6Z3_PRESIDENCIA oficio-0356-2025 se remite información y documentación Archivo.pdf', 'W6nKQqO6Z3_PRESIDENCIA oficio-0356-2025 se remite información y documentación Archivo.pdf', 3, '2025-03-23 16:06:48', '2025-03-23 16:06:48'),
	(1393, 'storage/documentos/oficio/oibT5IkDOy_PRESIDENCIA oficio-0357-2025 se remite información y documentación Archivo.pdf', 'oibT5IkDOy_PRESIDENCIA oficio-0357-2025 se remite información y documentación Archivo.pdf', 3, '2025-03-23 16:09:20', '2025-03-23 16:09:20'),
	(1394, 'storage/documentos/memorandum/MLDmV9TaSG_SECRETARÍA memo-1293-2025 se remite  documentación ANEXO TÉCNICO Y CONVENIO.pdf', 'MLDmV9TaSG_SECRETARÍA memo-1293-2025 se remite  documentación ANEXO TÉCNICO Y CONVENIO.pdf', 2, '2025-03-23 17:58:54', '2025-03-23 17:58:54'),
	(1395, 'storage/documentos/oficio/f5Cpm8LQF3_PRESIDENCIA oficio-0363-2025 actualización de anexos de lso criterios para asignación y com de r.pdf', 'f5Cpm8LQF3_PRESIDENCIA oficio-0363-2025 actualización de anexos de lso criterios para asignación y com de r.pdf', 3, '2025-03-23 18:02:39', '2025-03-23 18:02:39'),
	(1396, 'storage/documentos/oficio/RghNpAKf2f_SECRETARÍA oficio-0710-2025 se remite acuerdo Archivo.pdf', 'RghNpAKf2f_SECRETARÍA oficio-0710-2025 se remite acuerdo Archivo.pdf', 3, '2025-03-23 18:21:13', '2025-03-23 18:21:13'),
	(1397, 'storage/documentos/memorandum/TF7L2JXzfb_SECRETARÍAmemo-1315-2025.pdf', 'TF7L2JXzfb_SECRETARÍAmemo-1315-2025.pdf', 2, '2025-03-23 18:30:34', '2025-03-23 18:30:34'),
	(1398, 'storage/documentos/memorandum/40QBaA4c9j_UFD memo-303-2025 remite calificación de exámen Cuarto.pdf', '40QBaA4c9j_UFD memo-303-2025 remite calificación de exámen Cuarto.pdf', 2, '2025-03-23 18:32:30', '2025-03-23 18:32:30'),
	(1399, 'storage/documentos/memorandum/b5YKyt4XDf_UFD memo-322-2025 se remite infor resp memo da-0321-2025 Eder.pdf', 'b5YKyt4XDf_UFD memo-322-2025 se remite infor resp memo da-0321-2025 Eder.pdf', 2, '2025-03-23 18:37:26', '2025-03-23 18:37:26'),
	(1400, 'storage/documentos/memorandum/QUPkdCR7o6_INFORMÁTICA memo-056-2025 sistema de captura de los resultados electorales de actas escrutinio y computo Archivo.pdf', 'QUPkdCR7o6_INFORMÁTICA memo-056-2025 sistema de captura de los resultados electorales de actas escrutinio y computo Archivo.pdf', 2, '2025-03-23 18:39:54', '2025-03-23 18:39:54'),
	(1401, 'storage/documentos/requisicion/bgr90K0X1s_REQUISICIÓN No.pdf', 'bgr90K0X1s_REQUISICIÓN No.pdf', 1, '2025-03-23 18:42:02', '2025-03-23 18:42:02'),
	(1402, 'storage/documentos/requisicion/otRrPwYvSU_REQUISICIÓN No.pdf', 'otRrPwYvSU_REQUISICIÓN No.pdf', 1, '2025-03-24 14:39:53', '2025-03-24 14:39:53'),
	(1403, 'storage/documentos/escrito/KJV8voFutY_DTS correo-se remite circular se-047-2025 y acuerdo cg-ac-0043-2025 Eder-Normatividad.pdf', 'KJV8voFutY_DTS correo-se remite circular se-047-2025 y acuerdo cg-ac-0043-2025 Eder-Normatividad.pdf', 5, '2025-03-24 20:01:02', '2025-03-24 20:01:02'),
	(1404, 'storage/documentos/requisicion/r9pSr3OueG_REQUISICIÓN No.pdf', 'r9pSr3OueG_REQUISICIÓN No.pdf', 1, '2025-03-24 20:19:23', '2025-03-24 20:19:23'),
	(1405, 'storage/documentos/memorandum/prmn5A02bL_SECRETARÍA memo-1348-2025 se remite acuerdo cg-ac-0043-2025 Eder-Huoston.pdf', 'prmn5A02bL_SECRETARÍA memo-1348-2025 se remite acuerdo cg-ac-0043-2025 Eder-Huoston.pdf', 2, '2025-03-24 20:28:51', '2025-03-24 20:28:51'),
	(1406, 'storage/documentos/memorandum/MDjI48XZg7_DTS memo-0616-2025 se informa expediente concluido chignahuapan   Cuarto.pdf', 'MDjI48XZg7_DTS memo-0616-2025 se informa expediente concluido chignahuapan   Cuarto.pdf', 2, '2025-03-25 21:20:23', '2025-03-25 21:20:23'),
	(1407, 'storage/documentos/memorandum/gYeihXYKOB_DTS memo-0618-2025 se informa expediente concluido chignahuapan Cuarto.pdf', 'gYeihXYKOB_DTS memo-0618-2025 se informa expediente concluido chignahuapan Cuarto.pdf', 2, '2025-03-25 21:22:00', '2025-03-25 21:22:00'),
	(1408, 'storage/documentos/memorandum/KUCcl2hhiq_PRESIDENCIA memo-0937-2025 ministración  marzo Saúl-Eder.pdf', 'KUCcl2hhiq_PRESIDENCIA memo-0937-2025 ministración  marzo Saúl-Eder.pdf', 2, '2025-03-25 21:32:49', '2025-03-25 21:32:49'),
	(1409, 'storage/documentos/escrito/p5JYBHaKn6_SECRETARÍA correo remite oficiocircular sabg-os-0016-2025, oasf-0569-2025 se notifican informes indivuduales de auditoría Eder.pdf', 'p5JYBHaKn6_SECRETARÍA correo remite oficiocircular sabg-os-0016-2025, oasf-0569-2025 se notifican informes indivuduales de auditoría Eder.pdf', 5, '2025-03-25 22:01:03', '2025-03-25 22:01:03'),
	(1410, 'storage/documentos/memorandum/IXyPzhezhU_SECRETARÍA memo-1357-2025 remite folio 1720 Eder.pdf', 'IXyPzhezhU_SECRETARÍA memo-1357-2025 remite folio 1720 Eder.pdf', 2, '2025-03-25 22:16:57', '2025-03-25 22:16:57'),
	(1411, 'storage/documentos/oficio/h5bo0aS4y4_SECRETARÍA oficio-0735-2025 se remite acuerdo cg-ac-0042-2025 Huoston-Eder.pdf', 'h5bo0aS4y4_SECRETARÍA oficio-0735-2025 se remite acuerdo cg-ac-0042-2025 Huoston-Eder.pdf', 3, '2025-03-25 22:20:40', '2025-03-25 22:20:40'),
	(1412, 'storage/documentos/escrito/Ys7fD9pvdt_LIC.pdf', 'Ys7fD9pvdt_LIC.pdf', 5, '2025-03-26 13:49:01', '2025-03-26 13:49:01'),
	(1413, 'storage/documentos/tarjeta/sho5wqPzy0_UFD escrito solicitud de pago por cheque C.pdf', 'sho5wqPzy0_UFD escrito solicitud de pago por cheque C.pdf', 6, '2025-03-26 13:51:36', '2025-03-26 13:51:36'),
	(1414, 'storage/documentos/requisicion/Gmefps1UG6_REQUISICIÓN No.pdf', 'Gmefps1UG6_REQUISICIÓN No.pdf', 1, '2025-03-26 14:24:19', '2025-03-26 14:24:19'),
	(1415, 'storage/documentos/requisicion/Ejt0K8PGtF_REQUISICIÓN No.pdf', 'Ejt0K8PGtF_REQUISICIÓN No.pdf', 1, '2025-03-26 14:26:44', '2025-03-26 14:26:44'),
	(1416, 'storage/documentos/requisicion/whjTjM7SWV_REQUISICIÓN No.pdf', 'whjTjM7SWV_REQUISICIÓN No.pdf', 1, '2025-03-26 14:29:14', '2025-03-26 14:29:14'),
	(1417, 'storage/documentos/requisicion/yNU5BTPQDS_REQUISICIÓN No.pdf', 'yNU5BTPQDS_REQUISICIÓN No.pdf', 1, '2025-03-26 14:30:39', '2025-03-26 14:30:39'),
	(1418, 'storage/documentos/requisicion/NYZ1CK7XGr_REQUISICIÓN No.pdf', 'NYZ1CK7XGr_REQUISICIÓN No.pdf', 1, '2025-03-26 14:32:18', '2025-03-26 14:32:18'),
	(1419, 'storage/documentos/requisicion/bpi1PAqshA_REQUISICIÓN No.pdf', 'bpi1PAqshA_REQUISICIÓN No.pdf', 1, '2025-03-26 14:34:04', '2025-03-26 14:34:04'),
	(1420, 'storage/documentos/requisicion/xXOC9rqotX_REQUISICIÓN No.pdf', 'xXOC9rqotX_REQUISICIÓN No.pdf', 1, '2025-03-26 14:35:29', '2025-03-26 14:35:29'),
	(1421, 'storage/documentos/memorandum/2StZ4y2cES_SECRETARÍA memo-1366-2025 se autoriza certificación resp memo da-0345-2025 Eder.pdf', '2StZ4y2cES_SECRETARÍA memo-1366-2025 se autoriza certificación resp memo da-0345-2025 Eder.pdf', 2, '2025-03-26 18:30:12', '2025-03-26 18:30:12'),
	(1422, 'storage/documentos/oficio/LDv8EQc01v_SECRETARÍA oficio-0750-2025 se remite acuerdo cg-ac-0043-2025 Eder-Huoston.pdf', 'LDv8EQc01v_SECRETARÍA oficio-0750-2025 se remite acuerdo cg-ac-0043-2025 Eder-Huoston.pdf', 3, '2025-03-26 18:32:13', '2025-03-26 18:32:13'),
	(1423, 'storage/documentos/escrito/U0q3TO84Rr_LIC.pdf', 'U0q3TO84Rr_LIC.pdf', 5, '2025-03-26 18:35:26', '2025-03-26 18:35:26'),
	(1424, 'storage/documentos/escrito/HiIPMBJFAb_LIC.pdf', 'HiIPMBJFAb_LIC.pdf', 5, '2025-03-26 18:43:58', '2025-03-26 18:43:58'),
	(1425, 'storage/documentos/memorandum/oiSLI0QMaM_UFD memo-308-2025 se solicita alta de personal Cuarto.pdf', 'oiSLI0QMaM_UFD memo-308-2025 se solicita alta de personal Cuarto.pdf', 2, '2025-03-26 19:01:11', '2025-03-26 19:01:11'),
	(1426, 'storage/documentos/memorandum/j1zCVP9Kyl_UFD memo-161-2025 se solicita alta de personal Cuarto.pdf', 'j1zCVP9Kyl_UFD memo-161-2025 se solicita alta de personal Cuarto.pdf', 2, '2025-03-26 19:24:05', '2025-03-26 19:24:05'),
	(1427, 'storage/documentos/memorandum/yJbh8XqsO5_UFD memo-158-2025 se solicita disponibilidad presupuestal para pers.pdf', 'yJbh8XqsO5_UFD memo-158-2025 se solicita disponibilidad presupuestal para pers.pdf', 2, '2025-03-26 19:26:52', '2025-03-26 19:26:52'),
	(1428, 'storage/documentos/correo/Q1SE1CVZoF_FISCALIZACIÓN tarjeta de montos a descontar financiamiento público Saúl.pdf', 'Q1SE1CVZoF_FISCALIZACIÓN tarjeta de montos a descontar financiamiento público Saúl.pdf', 7, '2025-03-27 14:48:55', '2025-03-27 14:48:55'),
	(1429, 'storage/documentos/memorandum/Kqe90KVm2K_DTS memo-0642-2025 se remite copia simple de nombramiento consejera electoral Elisa Cuarto.pdf', 'Kqe90KVm2K_DTS memo-0642-2025 se remite copia simple de nombramiento consejera electoral Elisa Cuarto.pdf', 2, '2025-03-27 17:02:32', '2025-03-27 17:02:32'),
	(1430, 'storage/documentos/escrito/KKBIcuFg6F_BANORTE se solicita trámite de acceso a instalaciones.pdf', 'KKBIcuFg6F_BANORTE se solicita trámite de acceso a instalaciones.pdf', 5, '2025-03-27 17:04:29', '2025-03-27 17:04:29'),
	(1431, 'storage/documentos/memorandum/BqoVEWTjDl_COMUNICACIÓN memo-083-2025 boletín 23 Archivo.pdf', 'BqoVEWTjDl_COMUNICACIÓN memo-083-2025 boletín 23 Archivo.pdf', 2, '2025-03-27 17:05:48', '2025-03-27 17:05:48'),
	(1432, 'storage/documentos/memorandum/h0skumVHIi_COMUNICACIÓN memo-084-2025 boletín 24 Archivo.pdf', 'h0skumVHIi_COMUNICACIÓN memo-084-2025 boletín 24 Archivo.pdf', 2, '2025-03-27 17:07:58', '2025-03-27 17:07:58'),
	(1433, 'storage/documentos/requisicion/LrtStyb0cm_REQUISICIÓN No.pdf', 'LrtStyb0cm_REQUISICIÓN No.pdf', 1, '2025-03-27 17:09:48', '2025-03-27 17:09:48'),
	(1434, 'storage/documentos/requisicion/B0bj7C1xNI_REQUISICIÓN No.pdf', 'B0bj7C1xNI_REQUISICIÓN No.pdf', 1, '2025-03-27 18:27:27', '2025-03-27 18:27:27'),
	(1435, 'storage/documentos/requisicion/FvbP3udLpV_REQUISICIÓN No.pdf', 'FvbP3udLpV_REQUISICIÓN No.pdf', 1, '2025-03-27 18:29:12', '2025-03-27 18:29:12'),
	(1436, 'storage/documentos/escrito/AZIZmWQxmS_LIC.pdf', 'AZIZmWQxmS_LIC.pdf', 5, '2025-03-27 18:33:00', '2025-03-27 18:33:00'),
	(1437, 'storage/documentos/memorandum/cs5wKwZCuI_SECRETARÍA memo-1381-2025 se autoriza certificación auditor externo Eder.pdf', 'cs5wKwZCuI_SECRETARÍA memo-1381-2025 se autoriza certificación auditor externo Eder.pdf', 2, '2025-03-27 21:01:33', '2025-03-27 21:01:33'),
	(1438, 'storage/documentos/memorandum/uSHuD4MlkA_SECRETARÍA memo-ca-p-0208-2025 Sesión O.pdf', 'uSHuD4MlkA_SECRETARÍA memo-ca-p-0208-2025 Sesión O.pdf', 2, '2025-03-27 21:03:55', '2025-03-27 21:03:55'),
	(1439, 'storage/documentos/memorandum/83STaJlyop_PRERROGATIVAS memo-0307-2025 se solicita pago financiamiento púiblico 28-03-2025 Eder-Saúl.pdf', '83STaJlyop_PRERROGATIVAS memo-0307-2025 se solicita pago financiamiento púiblico 28-03-2025 Eder-Saúl.pdf', 2, '2025-03-27 22:20:58', '2025-03-27 22:20:58'),
	(1440, 'storage/documentos/requisicion/UsNh0ijxTA_REQUISICIÓN No.pdf', 'UsNh0ijxTA_REQUISICIÓN No.pdf', 1, '2025-03-27 22:22:51', '2025-03-27 22:22:51'),
	(1441, 'storage/documentos/requisicion/XuLJREDwWa_REQUISICIÓN No.pdf', 'XuLJREDwWa_REQUISICIÓN No.pdf', 1, '2025-03-27 22:24:54', '2025-03-27 22:24:54'),
	(1442, 'storage/documentos/escrito/BNhtfIWQx7_PLANEACIÓN correo remite memorándum 022-2025 reporte mensual de los hallazgos obtenidos de la evaluación Emir.pdf', 'BNhtfIWQx7_PLANEACIÓN correo remite memorándum 022-2025 reporte mensual de los hallazgos obtenidos de la evaluación Emir.pdf', 5, '2025-03-27 23:13:40', '2025-03-27 23:13:40'),
	(1443, 'storage/documentos/circular/IFQ31rr5Vh_CONTRALORÍA circular-03-2025 normatividad interna a todo el personal.pdf', 'IFQ31rr5Vh_CONTRALORÍA circular-03-2025 normatividad interna a todo el personal.pdf', 4, '2025-03-28 16:07:01', '2025-03-28 16:07:01'),
	(1444, 'storage/documentos/memorandum/Bf3AEwlN6T_CONTRALORÍA memo-183-2025 hojas de trabajo diciembre 2024 Eder-Miros.pdf', 'Bf3AEwlN6T_CONTRALORÍA memo-183-2025 hojas de trabajo diciembre 2024 Eder-Miros.pdf', 2, '2025-03-28 16:10:01', '2025-03-28 16:10:01'),
	(1445, 'storage/documentos/circular/SAcxXLVRmj_PLANEACIÓN circular-007-2025 invitación para participar en la capa Emir-Eder.pdf', 'SAcxXLVRmj_PLANEACIÓN circular-007-2025 invitación para participar en la capa Emir-Eder.pdf', 4, '2025-03-28 16:25:49', '2025-03-28 16:25:49'),
	(1446, 'storage/documentos/requisicion/rEFsrMeGwO_REQUISICIÓN No.pdf', 'rEFsrMeGwO_REQUISICIÓN No.pdf', 1, '2025-03-28 16:36:12', '2025-03-28 16:36:12'),
	(1447, 'storage/documentos/memorandum/zAmKmzFHtM_DOE memo-266-2025 se solicita dar de baja Daniel.pdf', 'zAmKmzFHtM_DOE memo-266-2025 se solicita dar de baja Daniel.pdf', 2, '2025-03-28 20:53:51', '2025-03-28 20:53:51'),
	(1448, 'storage/documentos/memorandum/SVbQrKcAjs_JURÍDICO memo-ca-se-0021-2025 se remite contrato para firma graficas corona Huoston.pdf', 'SVbQrKcAjs_JURÍDICO memo-ca-se-0021-2025 se remite contrato para firma graficas corona Huoston.pdf', 2, '2025-03-28 21:10:00', '2025-03-28 21:10:00'),
	(1449, 'storage/documentos/memorandum/JXtYyAukTU_COMUNICACIÓN memo-087-2025 Boletín 25.pdf', 'JXtYyAukTU_COMUNICACIÓN memo-087-2025 Boletín 25.pdf', 2, '2025-03-31 19:08:45', '2025-03-31 19:08:45'),
	(1450, 'storage/documentos/memorandum/4M5tTSQ6gv_INFORMÁTICA memo-057-2025 baja de personal Cuarto.pdf', '4M5tTSQ6gv_INFORMÁTICA memo-057-2025 baja de personal Cuarto.pdf', 2, '2025-03-31 19:19:22', '2025-03-31 19:19:22'),
	(1451, 'storage/documentos/memorandum/RgyWZU0eXn_INFORMÁTICA memo-058-2025 sistema registro de candidaturas Archivo.pdf', 'RgyWZU0eXn_INFORMÁTICA memo-058-2025 sistema registro de candidaturas Archivo.pdf', 2, '2025-03-31 19:23:05', '2025-03-31 19:23:05'),
	(1452, 'storage/documentos/memorandum/OXJyYpyDT3_INFORMÁTICA memo-060-2025 base de datos del sistema Cuarto.pdf', 'OXJyYpyDT3_INFORMÁTICA memo-060-2025 base de datos del sistema Cuarto.pdf', 2, '2025-03-31 19:25:29', '2025-03-31 19:25:29'),
	(1453, 'storage/documentos/memorandum/BZlVNFtTAv_JURÍDICO memo-0040-2025 se remite instructivo  adj-inv-iee-004-2025 Huoston-Eder.pdf', 'BZlVNFtTAv_JURÍDICO memo-0040-2025 se remite instructivo  adj-inv-iee-004-2025 Huoston-Eder.pdf', 2, '2025-03-31 19:28:41', '2025-03-31 19:28:41'),
	(1454, 'storage/documentos/escrito/Iadh5u5g2N_OFICIALIA DE PARTES correo remite folio 1792 siniestro de vehículo oficial Daniel  (1).pdf', 'Iadh5u5g2N_OFICIALIA DE PARTES correo remite folio 1792 siniestro de vehículo oficial Daniel  (1).pdf', 5, '2025-03-31 20:04:36', '2025-03-31 20:04:36'),
	(1455, 'storage/documentos/escrito/QP9RD1W4fA_OFICIALIA DE PARTES remite memo-spf-ssa-drmsg-0597-2025 folio 1789 fotomultas Michelle Daniel.pdf', 'QP9RD1W4fA_OFICIALIA DE PARTES remite memo-spf-ssa-drmsg-0597-2025 folio 1789 fotomultas Michelle Daniel.pdf', 5, '2025-03-31 20:09:30', '2025-03-31 20:09:30'),
	(1456, 'storage/documentos/oficio/FpvtFPtEQg_CONSEJO DISTRITAL 02 oficio-ine-pue-cd02-pc-136-2025 se remiten comprobaciones Eder.pdf', 'FpvtFPtEQg_CONSEJO DISTRITAL 02 oficio-ine-pue-cd02-pc-136-2025 se remiten comprobaciones Eder.pdf', 3, '2025-03-31 20:11:36', '2025-03-31 20:11:36'),
	(1457, 'storage/documentos/escrito/j7RUDNt9cP_PLANEACIÓN correo alcance a circular IEE-SPE-007-2025 Emir-Eder.pdf', 'j7RUDNt9cP_PLANEACIÓN correo alcance a circular IEE-SPE-007-2025 Emir-Eder.pdf', 5, '2025-03-31 20:26:06', '2025-03-31 20:26:06'),
	(1458, 'storage/documentos/requisicion/AiObArUNnZ_REQUISICIÓN No.pdf', 'AiObArUNnZ_REQUISICIÓN No.pdf', 1, '2025-03-31 20:37:32', '2025-03-31 20:37:32'),
	(1459, 'storage/documentos/memorandum/qLZq1TTkZ7_PRERROGATIVAS memo-0310-2025 crear estatus electa por mr-electa por rp Archivo.pdf', 'qLZq1TTkZ7_PRERROGATIVAS memo-0310-2025 crear estatus electa por mr-electa por rp Archivo.pdf', 2, '2025-03-31 20:40:58', '2025-03-31 20:40:58'),
	(1460, 'storage/documentos/escrito/Gmozvplcta_PLANEACIÓN correo alcance a circular IEE-SPE-007-2025 Emir-Eder.pdf', 'Gmozvplcta_PLANEACIÓN correo alcance a circular IEE-SPE-007-2025 Emir-Eder.pdf', 5, '2025-03-31 20:43:02', '2025-03-31 20:43:02'),
	(1461, 'storage/documentos/requisicion/9xmoFX9gEf_REQUISICIÓN No.pdf', '9xmoFX9gEf_REQUISICIÓN No.pdf', 1, '2025-03-31 20:50:08', '2025-03-31 20:50:08'),
	(1462, 'storage/documentos/requisicion/ckZj8fslf1_REQUISICIÓN NO.pdf', 'ckZj8fslf1_REQUISICIÓN NO.pdf', 1, '2025-03-31 20:51:45', '2025-03-31 20:51:45'),
	(1463, 'storage/documentos/requisicion/77WurmuMCF_REQUISICIÓN No.pdf', '77WurmuMCF_REQUISICIÓN No.pdf', 1, '2025-03-31 20:54:45', '2025-03-31 20:54:45'),
	(1464, 'storage/documentos/requisicion/LdtviY7NyJ_REQUISICIÓN No.pdf', 'LdtviY7NyJ_REQUISICIÓN No.pdf', 1, '2025-03-31 20:56:16', '2025-03-31 20:56:16'),
	(1465, 'storage/documentos/requisicion/7HDpjeVRCR_REQUISICIÓN No.pdf', '7HDpjeVRCR_REQUISICIÓN No.pdf', 1, '2025-03-31 20:58:26', '2025-03-31 20:58:26'),
	(1466, 'storage/documentos/requisicion/g2FRcVZWFk_REQUISICIÓN No.pdf', 'g2FRcVZWFk_REQUISICIÓN No.pdf', 1, '2025-03-31 21:00:16', '2025-03-31 21:00:16'),
	(1467, 'storage/documentos/requisicion/daCcV1r43e_REQUISICIÓN No.pdf', 'daCcV1r43e_REQUISICIÓN No.pdf', 1, '2025-03-31 21:02:36', '2025-03-31 21:02:36'),
	(1468, 'storage/documentos/requisicion/xXPUMmBqPB_REQUISICIÓN No.pdf', 'xXPUMmBqPB_REQUISICIÓN No.pdf', 1, '2025-03-31 21:05:41', '2025-03-31 21:05:41'),
	(1469, 'storage/documentos/requisicion/3B55Q1eUqe_REQUISICIÓN No.pdf', '3B55Q1eUqe_REQUISICIÓN No.pdf', 1, '2025-03-31 21:07:14', '2025-03-31 21:07:14'),
	(1470, 'storage/documentos/requisicion/vXZd0eO7og_REQUISICIÓN No.pdf', 'vXZd0eO7og_REQUISICIÓN No.pdf', 1, '2025-03-31 21:08:37', '2025-03-31 21:08:37'),
	(1471, 'storage/documentos/requisicion/XxRTaoZSQk_REQUISICIÓN No.pdf', 'XxRTaoZSQk_REQUISICIÓN No.pdf', 1, '2025-03-31 21:09:42', '2025-03-31 21:09:42'),
	(1472, 'storage/documentos/requisicion/bYmsaxBWEW_REQUISICIÓN No.pdf', 'bYmsaxBWEW_REQUISICIÓN No.pdf', 1, '2025-03-31 21:11:25', '2025-03-31 21:11:25'),
	(1473, 'storage/documentos/requisicion/qj3wu5e04u_REQUISICIÓN No.pdf', 'qj3wu5e04u_REQUISICIÓN No.pdf', 1, '2025-03-31 21:13:08', '2025-03-31 21:13:08'),
	(1474, 'storage/documentos/requisicion/U1S7EyywFc_REQUISICIÓN No.pdf', 'U1S7EyywFc_REQUISICIÓN No.pdf', 1, '2025-03-31 21:20:47', '2025-03-31 21:20:47'),
	(1475, 'storage/documentos/requisicion/tTHoWKgPe0_REQUISICIÓN No.pdf', 'tTHoWKgPe0_REQUISICIÓN No.pdf', 1, '2025-03-31 21:54:42', '2025-03-31 21:54:42'),
	(1476, 'storage/documentos/requisicion/z6tuvFbFPN_REQUISICIÓN No.pdf', 'z6tuvFbFPN_REQUISICIÓN No.pdf', 1, '2025-03-31 22:09:49', '2025-03-31 22:09:49'),
	(1477, 'storage/documentos/requisicion/8FqpZX8H4u_REQUSICIÓN No.pdf', '8FqpZX8H4u_REQUSICIÓN No.pdf', 1, '2025-03-31 22:12:40', '2025-03-31 22:12:40'),
	(1478, 'storage/documentos/memorandum/FtSHFGrJu1_PRESIDENCIA memo-je-065-2025 se convoca a junta ejecutiva Eder-Huoston.pdf', 'FtSHFGrJu1_PRESIDENCIA memo-je-065-2025 se convoca a junta ejecutiva Eder-Huoston.pdf', 2, '2025-03-31 22:14:52', '2025-03-31 22:14:52'),
	(1479, 'storage/documentos/memorandum/3EYYSR5due_SECRETARÍA memo-1387-2025 se autoriza certificación resp memo da-0351-2025 Eder.pdf', '3EYYSR5due_SECRETARÍA memo-1387-2025 se autoriza certificación resp memo da-0351-2025 Eder.pdf', 2, '2025-03-31 22:16:47', '2025-03-31 22:16:47'),
	(1480, 'storage/documentos/oficio/hp1714jvZA_SECRETARÍA oficio-0761-2025 remite acuerdo cg-ac-0044-2025 Huoston-Eder.pdf', 'hp1714jvZA_SECRETARÍA oficio-0761-2025 remite acuerdo cg-ac-0044-2025 Huoston-Eder.pdf', 3, '2025-03-31 22:18:44', '2025-03-31 22:18:44'),
	(1481, 'storage/documentos/oficio/TsOZtuPZZW_SECRETARÍA oficio-0762-2025 remite acuerdo cg-ac-0045-2025 Huoston-Eder.pdf', 'TsOZtuPZZW_SECRETARÍA oficio-0762-2025 remite acuerdo cg-ac-0045-2025 Huoston-Eder.pdf', 3, '2025-03-31 22:51:09', '2025-03-31 22:51:09'),
	(1482, 'storage/documentos/memorandum/LgUd4Wo57C_COMUNICACIÓN memo-088-2025 boletín 26 Archivo.pdf', 'LgUd4Wo57C_COMUNICACIÓN memo-088-2025 boletín 26 Archivo.pdf', 2, '2025-03-31 22:58:04', '2025-03-31 22:58:04'),
	(1483, 'storage/documentos/memorandum/MDGetTptDM_DTS memo-0662-2025 se solicita dar de baja mobiliario Daniel-Jaun Carlos.pdf', 'MDGetTptDM_DTS memo-0662-2025 se solicita dar de baja mobiliario Daniel-Jaun Carlos.pdf', 2, '2025-03-31 23:00:00', '2025-03-31 23:00:00'),
	(1484, 'storage/documentos/memorandum/1R6IouCxJw_INFORMÁTICA memo-057-2025 Baja de personal Cuarto.pdf', '1R6IouCxJw_INFORMÁTICA memo-057-2025 Baja de personal Cuarto.pdf', 2, '2025-03-31 23:02:11', '2025-03-31 23:02:11'),
	(1485, 'storage/documentos/memorandum/swDzooplYb_SECRETARÍA memo-1412-2025 validación de modificadores programáticas SIAF  Eder-Eir.pdf', 'swDzooplYb_SECRETARÍA memo-1412-2025 validación de modificadores programáticas SIAF  Eder-Eir.pdf', 2, '2025-03-31 23:23:26', '2025-03-31 23:23:26'),
	(1486, 'storage/documentos/memorandum/BZRsz0UN9m_UFD memo-351-2025 se remite calificación de exámen Cuarto.pdf', 'BZRsz0UN9m_UFD memo-351-2025 se remite calificación de exámen Cuarto.pdf', 2, '2025-04-03 20:45:53', '2025-04-03 20:45:53'),
	(1487, 'storage/documentos/correo/jyB4pTWRDJ_UFD reporte de incidencias 2da.pdf', 'jyB4pTWRDJ_UFD reporte de incidencias 2da.pdf', 7, '2025-04-03 20:48:31', '2025-04-03 20:48:31'),
	(1488, 'storage/documentos/oficio/Qdzu0J3FDQ_XIUTETELCO oficio-iee-cme-199-xiutetelco-se-003-2025 informe de multifuncional Daniel-Alexis.pdf', 'Qdzu0J3FDQ_XIUTETELCO oficio-iee-cme-199-xiutetelco-se-003-2025 informe de multifuncional Daniel-Alexis.pdf', 3, '2025-04-04 15:03:44', '2025-04-04 15:03:44'),
	(1489, 'storage/documentos/memorandum/i8K7AWKuQS_UFD memo-350-2025 se solicita desincorporació de personal Cuarto.pdf', 'i8K7AWKuQS_UFD memo-350-2025 se solicita desincorporació de personal Cuarto.pdf', 2, '2025-04-04 15:17:03', '2025-04-04 15:17:03'),
	(1490, 'storage/documentos/memorandum/e4bn57UlFK_UFD memo-349-2025 se solicita alta de personal Cuarto.pdf', 'e4bn57UlFK_UFD memo-349-2025 se solicita alta de personal Cuarto.pdf', 2, '2025-04-04 15:29:13', '2025-04-04 15:29:13'),
	(1491, 'storage/documentos/escrito/o9f0X53DeR_UFD correo se remite reporte general de asystec Eder-cuarto-caro.pdf', 'o9f0X53DeR_UFD correo se remite reporte general de asystec Eder-cuarto-caro.pdf', 5, '2025-04-04 15:32:12', '2025-04-04 15:32:12'),
	(1492, 'storage/documentos/circular/yAM93UqPzG_TRANSPARENCIA circular-024-2025 se solicita agenda de actividades Luis-Eder.pdf', 'yAM93UqPzG_TRANSPARENCIA circular-024-2025 se solicita agenda de actividades Luis-Eder.pdf', 4, '2025-04-04 15:35:53', '2025-04-04 15:35:53'),
	(1493, 'storage/documentos/escrito/OljH5CAZEu_SIVOPLE correo se remite acuse de información Eder-Emir.pdf', 'OljH5CAZEu_SIVOPLE correo se remite acuse de información Eder-Emir.pdf', 5, '2025-04-04 15:39:09', '2025-04-04 15:39:09'),
	(1494, 'storage/documentos/escrito/V31wbJxgWk_SIVOPLE correo actividad sivople pue-2025-089-00158 Eder-Emir.pdf', 'V31wbJxgWk_SIVOPLE correo actividad sivople pue-2025-089-00158 Eder-Emir.pdf', 5, '2025-04-04 15:43:00', '2025-04-04 15:43:00'),
	(1495, 'storage/documentos/oficio/JM82LadzVZ_SECRETARÍA oficio-0780-2025 se remiten formatos de acuerdos Huoston-Eder.pdf', 'JM82LadzVZ_SECRETARÍA oficio-0780-2025 se remiten formatos de acuerdos Huoston-Eder.pdf', 3, '2025-04-04 15:45:58', '2025-04-04 15:45:58'),
	(1496, 'storage/documentos/oficio/lylwHitTgF_SECRETARÍA oficio-0779-2025 se remite acuerdo Eder-Normatividad.pdf', 'lylwHitTgF_SECRETARÍA oficio-0779-2025 se remite acuerdo Eder-Normatividad.pdf', 3, '2025-04-04 15:49:27', '2025-04-04 15:49:27'),
	(1497, 'storage/documentos/memorandum/kaZpj2wBJE_SECRETARÍA memo-ca-p-0246-2025 reanudación sesión del 28 de marzo de 2025 al 4-04-2025 Huoston-Eder.pdf', 'kaZpj2wBJE_SECRETARÍA memo-ca-p-0246-2025 reanudación sesión del 28 de marzo de 2025 al 4-04-2025 Huoston-Eder.pdf', 2, '2025-04-04 15:55:03', '2025-04-04 15:55:03'),
	(1498, 'storage/documentos/memorandum/nZQ6QIDtDx_SECRETARÍA memo-ca-p-0221-2025 sesión ordinaria del comité de adquisiciones Eder-Huoston-Daniel.pdf', 'nZQ6QIDtDx_SECRETARÍA memo-ca-p-0221-2025 sesión ordinaria del comité de adquisiciones Eder-Huoston-Daniel.pdf', 2, '2025-04-04 15:57:48', '2025-04-04 15:57:48'),
	(1499, 'storage/documentos/memorandum/HhISeO1lrQ_SECRETARÍA memo-ca.pdf', 'HhISeO1lrQ_SECRETARÍA memo-ca.pdf', 2, '2025-04-04 16:02:38', '2025-04-04 16:02:38'),
	(1500, 'storage/documentos/memorandum/62dydlKZLa_SECRETARIA memo-1423-2025 se autoriza certificación Eder.pdf', '62dydlKZLa_SECRETARIA memo-1423-2025 se autoriza certificación Eder.pdf', 2, '2025-04-04 16:04:05', '2025-04-04 16:04:05'),
	(1501, 'storage/documentos/memorandum/djxv3fdWfi_SECRETARÍA memo-1418-2025 solicitud de atención oficio ine-pue-jl-ve-00406-2025 Eder-Normatividad.pdf', 'djxv3fdWfi_SECRETARÍA memo-1418-2025 solicitud de atención oficio ine-pue-jl-ve-00406-2025 Eder-Normatividad.pdf', 2, '2025-04-04 16:19:10', '2025-04-04 16:19:10'),
	(1502, 'storage/documentos/memorandum/UrvPPFNZ50_SECRETARÍA memo-1413-2025 se remite oficio sg-cgpcgrd-drae-1039-2025 ier simulacro Daniel.pdf', 'UrvPPFNZ50_SECRETARÍA memo-1413-2025 se remite oficio sg-cgpcgrd-drae-1039-2025 ier simulacro Daniel.pdf', 2, '2025-04-04 17:01:54', '2025-04-04 17:01:54'),
	(1503, 'storage/documentos/memorandum/qHAFWFSiYq_SECRETARÍA memo-1411-2025 se remite acuerdo cg-ac-0048-2025 Eder-Huoston.pdf', 'qHAFWFSiYq_SECRETARÍA memo-1411-2025 se remite acuerdo cg-ac-0048-2025 Eder-Huoston.pdf', 2, '2025-04-04 17:06:31', '2025-04-04 17:06:31'),
	(1504, 'storage/documentos/circular/oXpgGe5gog_SECRETARÍA circular-048-2025 conferencia inclusión sin límites a todo el personal correo Dina-Luis.pdf', 'oXpgGe5gog_SECRETARÍA circular-048-2025 conferencia inclusión sin límites a todo el personal correo Dina-Luis.pdf', 4, '2025-04-04 17:08:15', '2025-04-04 17:08:15'),
	(1505, 'storage/documentos/escrito/TuDBzJ8GxF_SAN PEDRO CHOLULA correo solicitud devolución de garantía Eder-Saúl.pdf', 'TuDBzJ8GxF_SAN PEDRO CHOLULA correo solicitud devolución de garantía Eder-Saúl.pdf', 5, '2025-04-04 17:11:56', '2025-04-04 17:11:56'),
	(1506, 'storage/documentos/escrito/YNTS8ICwBn_ADRIAN HUELITL LÓPEZ correo sobre sanciones impuestas Eder.pdf', 'YNTS8ICwBn_ADRIAN HUELITL LÓPEZ correo sobre sanciones impuestas Eder.pdf', 5, '2025-04-04 17:24:43', '2025-04-04 17:24:43'),
	(1507, 'storage/documentos/tarjeta/KR0oTPV3qQ_AUDITOR EXTERNO entrega en medio magnético usb en formato pdf Eder-Miros.pdf', 'KR0oTPV3qQ_AUDITOR EXTERNO entrega en medio magnético usb en formato pdf Eder-Miros.pdf', 6, '2025-04-04 17:43:53', '2025-04-04 17:43:53'),
	(1508, 'storage/documentos/circular/YgQ4xuEePU_COMUNICACIÓN circular-04-2025 cobertura de eventos Luis.pdf', 'YgQ4xuEePU_COMUNICACIÓN circular-04-2025 cobertura de eventos Luis.pdf', 4, '2025-04-04 17:50:43', '2025-04-04 17:50:43'),
	(1509, 'storage/documentos/memorandum/ZuDMXrLBob_COMUNICACIÓN memo-091-2025  subir galerá página webArchivo.pdf', 'ZuDMXrLBob_COMUNICACIÓN memo-091-2025  subir galerá página webArchivo.pdf', 2, '2025-04-04 19:02:58', '2025-04-04 19:02:58'),
	(1510, 'storage/documentos/memorandum/vYukY2QJGD_COMUNICCIÓN memo-082-2025 boletín 22 Archivo.pdf', 'vYukY2QJGD_COMUNICCIÓN memo-082-2025 boletín 22 Archivo.pdf', 2, '2025-04-04 19:05:01', '2025-04-04 19:05:01'),
	(1511, 'storage/documentos/memorandum/c2qd1gwnHl_CONSEJERA MARISOL memo-005-2025 se solicita dar de baja no break Daniel, Alexis-Daniel.pdf', 'c2qd1gwnHl_CONSEJERA MARISOL memo-005-2025 se solicita dar de baja no break Daniel, Alexis-Daniel.pdf', 2, '2025-04-04 19:08:24', '2025-04-04 19:08:24'),
	(1512, 'storage/documentos/memorandum/6fg4HBJVGY_CONTRALORÍA memo-194-2025 fotomultas Ángel-Daniel.pdf', '6fg4HBJVGY_CONTRALORÍA memo-194-2025 fotomultas Ángel-Daniel.pdf', 2, '2025-04-04 19:10:45', '2025-04-04 19:10:45'),
	(1513, 'storage/documentos/memorandum/I0PjVcJ910_UFD memo-363-2025 se solicita acta entrega a recepción Archivo.pdf', 'I0PjVcJ910_UFD memo-363-2025 se solicita acta entrega a recepción Archivo.pdf', 2, '2025-04-04 19:26:41', '2025-04-04 19:26:41'),
	(1514, 'storage/documentos/tarjeta/hV9HcmGms4_CARABAC serv.pdf', 'hV9HcmGms4_CARABAC serv.pdf', 6, '2025-04-04 19:52:19', '2025-04-04 19:52:19'),
	(1515, 'storage/documentos/requisicion/iy0QtYSFSR_REQUISICICIÓN No.pdf', 'iy0QtYSFSR_REQUISICICIÓN No.pdf', 1, '2025-04-04 19:54:12', '2025-04-04 19:54:12'),
	(1516, 'storage/documentos/requisicion/a3YMrUtfRt_REQUISICIÓN No.pdf', 'a3YMrUtfRt_REQUISICIÓN No.pdf', 1, '2025-04-04 19:56:54', '2025-04-04 19:56:54'),
	(1517, 'storage/documentos/requisicion/aUAcuVLEo7_REQUISICIÓN No.pdf', 'aUAcuVLEo7_REQUISICIÓN No.pdf', 1, '2025-04-04 20:03:51', '2025-04-04 20:03:51'),
	(1518, 'storage/documentos/requisicion/Qu9v2IYeJe_REQUISICIÓN No.pdf', 'Qu9v2IYeJe_REQUISICIÓN No.pdf', 1, '2025-04-04 20:05:24', '2025-04-04 20:05:24'),
	(1519, 'storage/documentos/requisicion/HJN5fgMlCa_REQUISICIÓN No.pdf', 'HJN5fgMlCa_REQUISICIÓN No.pdf', 1, '2025-04-04 20:24:20', '2025-04-04 20:24:20'),
	(1520, 'storage/documentos/requisicion/2fac3afe5a_REQUISICIÓN No.pdf', '2fac3afe5a_REQUISICIÓN No.pdf', 1, '2025-04-04 20:28:22', '2025-04-04 20:28:22'),
	(1521, 'storage/documentos/requisicion/1hkJJ1Y3Jp_REQUISICIÓN No.pdf', '1hkJJ1Y3Jp_REQUISICIÓN No.pdf', 1, '2025-04-04 20:31:32', '2025-04-04 20:31:32'),
	(1522, 'storage/documentos/requisicion/WbTDnHjob8_REQUISICIÓN No.pdf', 'WbTDnHjob8_REQUISICIÓN No.pdf', 1, '2025-04-04 20:33:40', '2025-04-04 20:33:40'),
	(1523, 'storage/documentos/requisicion/ajfWVwALZf_REQUISICIÓN No.pdf', 'ajfWVwALZf_REQUISICIÓN No.pdf', 1, '2025-04-04 20:38:20', '2025-04-04 20:38:20'),
	(1524, 'storage/documentos/requisicion/EuSbNlBHZ8_REQUISICIÓN No.pdf', 'EuSbNlBHZ8_REQUISICIÓN No.pdf', 1, '2025-04-04 20:41:02', '2025-04-04 20:41:02'),
	(1525, 'storage/documentos/requisicion/fSzLqkIt9Q_REQUISICIÓN No.pdf', 'fSzLqkIt9Q_REQUISICIÓN No.pdf', 1, '2025-04-04 20:42:26', '2025-04-04 20:42:26'),
	(1526, 'storage/documentos/requisicion/g9FuCcujg8_REQUISICIÓN No.pdf', 'g9FuCcujg8_REQUISICIÓN No.pdf', 1, '2025-04-04 20:46:58', '2025-04-04 20:46:58'),
	(1527, 'storage/documentos/requisicion/m0uEdo53mP_REQUISICIÓN No.pdf', 'm0uEdo53mP_REQUISICIÓN No.pdf', 1, '2025-04-04 20:48:37', '2025-04-04 20:48:37'),
	(1528, 'storage/documentos/memorandum/QIOI9LwyZx_DOE memo-284-2025 ampliación al contrato Normatividad-Eder.pdf', 'QIOI9LwyZx_DOE memo-284-2025 ampliación al contrato Normatividad-Eder.pdf', 2, '2025-04-05 16:06:19', '2025-04-05 16:06:19'),
	(1529, 'storage/documentos/escrito/SOocD4AzvX_HAIDEE MEDEL correo solicitud de carta de satisfacción Eder-Huoston.pdf', 'SOocD4AzvX_HAIDEE MEDEL correo solicitud de carta de satisfacción Eder-Huoston.pdf', 5, '2025-04-05 16:10:44', '2025-04-05 16:10:44'),
	(1530, 'storage/documentos/escrito/tN55avLctp_HAYDEE MEDEL correo factura puebla documentación extraordinaria Eder-Huoston.pdf', 'tN55avLctp_HAYDEE MEDEL correo factura puebla documentación extraordinaria Eder-Huoston.pdf', 5, '2025-04-05 16:13:17', '2025-04-05 16:13:17'),
	(1531, 'storage/documentos/memorandum/Pdisy2aMyd_INFORMÁTICA memo-061-2025 peticiones página web Archivo.pdf', 'Pdisy2aMyd_INFORMÁTICA memo-061-2025 peticiones página web Archivo.pdf', 2, '2025-04-05 16:15:49', '2025-04-05 16:15:49'),
	(1532, 'storage/documentos/memorandum/SdKmWRCrOa_INFORMÁTICA memo-062-2025 peticiones página web Archivo.pdf', 'SdKmWRCrOa_INFORMÁTICA memo-062-2025 peticiones página web Archivo.pdf', 2, '2025-04-05 16:24:59', '2025-04-05 16:24:59'),
	(1533, 'storage/documentos/memorandum/m8AwG3YLdO_INFORMÁTICA tarjeta informativa 018-2025 se generaon enlaces para sesiones vrituales Archivo.pdf', 'm8AwG3YLdO_INFORMÁTICA tarjeta informativa 018-2025 se generaon enlaces para sesiones vrituales Archivo.pdf', 2, '2025-04-05 16:40:19', '2025-04-05 16:40:19'),
	(1534, 'storage/documentos/correo/tANtJ728gN_INFORMÁTICA tarjeta informativa 019-2025 se dió mantenimiento y se respaldó información Archivo.pdf', 'tANtJ728gN_INFORMÁTICA tarjeta informativa 019-2025 se dió mantenimiento y se respaldó información Archivo.pdf', 7, '2025-04-05 16:42:47', '2025-04-05 16:42:47'),
	(1535, 'storage/documentos/correo/xiSbUI73lQ_INFORMÁTICA tarjeta informativa 020-2025 se atendieron 63 solicitudes de transparencia Archivo.pdf', 'xiSbUI73lQ_INFORMÁTICA tarjeta informativa 020-2025 se atendieron 63 solicitudes de transparencia Archivo.pdf', 7, '2025-04-05 16:44:50', '2025-04-05 16:44:50'),
	(1536, 'storage/documentos/correo/ABQdOh734v_INFORMÁTICA tarjeta informativa 020-2025 se resolvierón incidencias de red y voz  Archivo.pdf', 'ABQdOh734v_INFORMÁTICA tarjeta informativa 020-2025 se resolvierón incidencias de red y voz  Archivo.pdf', 7, '2025-04-05 16:46:15', '2025-04-05 16:46:15'),
	(1537, 'storage/documentos/correo/mX4U4vtDkh_INFORMÁTICA tarjeta informativa 021-2025 se realizaron los respaldos de bases de datos  Archivo.pdf', 'mX4U4vtDkh_INFORMÁTICA tarjeta informativa 021-2025 se realizaron los respaldos de bases de datos  Archivo.pdf', 7, '2025-04-05 16:47:20', '2025-04-05 16:47:20'),
	(1538, 'storage/documentos/correo/QEr4rzgjwK_INFORMÁTICA tarjeta informativa 022-2025 se instaló y configuró equipo de cómputo para el uso  unidades técnicas  Archivo.pdf', 'QEr4rzgjwK_INFORMÁTICA tarjeta informativa 022-2025 se instaló y configuró equipo de cómputo para el uso  unidades técnicas  Archivo.pdf', 7, '2025-04-05 16:48:24', '2025-04-05 16:48:24'),
	(1539, 'storage/documentos/memorandum/n9A3Yfhfqd_JURÍDICO memo-0825-2025 se solicita información Eder-Normatividad.pdf', 'n9A3Yfhfqd_JURÍDICO memo-0825-2025 se solicita información Eder-Normatividad.pdf', 2, '2025-04-05 16:50:19', '2025-04-05 16:50:19'),
	(1540, 'storage/documentos/memorandum/p8hMceHEZN_JURÍDICO mmeo-0841-2025 relación de asuntos laborales Eder-Normatividad.pdf', 'p8hMceHEZN_JURÍDICO mmeo-0841-2025 relación de asuntos laborales Eder-Normatividad.pdf', 2, '2025-04-05 16:53:45', '2025-04-05 16:53:45'),
	(1541, 'storage/documentos/escrito/GfTKT4R8tA_OFICIALIA DE PARTES correo folio 1827 remie oficio fge-cf-1419-2025 se nombra perito Daniel.pdf', 'GfTKT4R8tA_OFICIALIA DE PARTES correo folio 1827 remie oficio fge-cf-1419-2025 se nombra perito Daniel.pdf', 5, '2025-04-05 16:56:44', '2025-04-05 16:56:44'),
	(1542, 'storage/documentos/circular/GUVjwFdTkj_PLANEACIÓN circular-008-2025  designar enlace para el segumiento con la información Eder-Emir.pdf', 'GUVjwFdTkj_PLANEACIÓN circular-008-2025  designar enlace para el segumiento con la información Eder-Emir.pdf', 4, '2025-04-05 16:58:47', '2025-04-05 16:58:47'),
	(1543, 'storage/documentos/memorandum/HdBfsvnaiV_PLANEACIÓN memo-025-2025 reporte de avances, primer trimestre ptar 2025 d.pdf', 'HdBfsvnaiV_PLANEACIÓN memo-025-2025 reporte de avances, primer trimestre ptar 2025 d.pdf', 2, '2025-04-05 17:05:36', '2025-04-05 17:05:36'),
	(1544, 'storage/documentos/memorandum/fNwV213Iqx_PRERROGATIVAS memo-0328-2025 remiten recibos originales financiamiento público Saúl-Eder.pdf', 'fNwV213Iqx_PRERROGATIVAS memo-0328-2025 remiten recibos originales financiamiento público Saúl-Eder.pdf', 2, '2025-04-05 17:07:25', '2025-04-05 17:07:25'),
	(1545, 'storage/documentos/oficio/u9I72zQxEQ_PRESIDENCIA oficio-0379-2025 ministración del mes de abril Eder-Emir.pdf', 'u9I72zQxEQ_PRESIDENCIA oficio-0379-2025 ministración del mes de abril Eder-Emir.pdf', 3, '2025-04-05 17:10:03', '2025-04-05 17:10:03'),
	(1546, 'storage/documentos/oficio/bLAlJFskFL_PRESIDENCIA oficio-0380-2025 ministración del proceso electoral extraordinario 2025 Eder-Emir.pdf', 'bLAlJFskFL_PRESIDENCIA oficio-0380-2025 ministración del proceso electoral extraordinario 2025 Eder-Emir.pdf', 3, '2025-04-05 17:12:03', '2025-04-05 17:12:03'),
	(1547, 'storage/documentos/requisicion/qqE1JzO9Zb_REQUISICIÓN No.pdf', 'qqE1JzO9Zb_REQUISICIÓN No.pdf', 1, '2025-04-05 17:14:16', '2025-04-05 17:14:16'),
	(1548, 'storage/documentos/requisicion/Yq8RCm3DtH_REQUISICIÓN No.pdf', 'Yq8RCm3DtH_REQUISICIÓN No.pdf', 1, '2025-04-05 17:16:07', '2025-04-05 17:16:07'),
	(1549, 'storage/documentos/requisicion/9B6wMXe8rb_REQUISICIÓN No.pdf', '9B6wMXe8rb_REQUISICIÓN No.pdf', 1, '2025-04-05 17:19:20', '2025-04-05 17:19:20'),
	(1550, 'storage/documentos/requisicion/FkIqPHHLoS_REQUISICIÓN No.pdf', 'FkIqPHHLoS_REQUISICIÓN No.pdf', 1, '2025-04-05 17:20:46', '2025-04-05 17:20:46'),
	(1551, 'storage/documentos/requisicion/OebKganaOb_REQUISICIÓN No.pdf', 'OebKganaOb_REQUISICIÓN No.pdf', 1, '2025-04-05 17:21:47', '2025-04-05 17:21:47'),
	(1552, 'storage/documentos/requisicion/GiuVYrPNRT_REQUISICIÓN No.pdf', 'GiuVYrPNRT_REQUISICIÓN No.pdf', 1, '2025-04-05 17:25:29', '2025-04-05 17:25:29'),
	(1553, 'storage/documentos/requisicion/BdybUF2ddk_REQUISICIÓN No.pdf', 'BdybUF2ddk_REQUISICIÓN No.pdf', 1, '2025-04-05 17:28:20', '2025-04-05 17:28:20'),
	(1554, 'storage/documentos/requisicion/OBO1YIdWJe_REQUISICIÓN No.pdf', 'OBO1YIdWJe_REQUISICIÓN No.pdf', 1, '2025-04-05 17:38:23', '2025-04-05 17:38:23'),
	(1555, 'storage/documentos/requisicion/WM7aDbKbI9_REQUISICIÓN No.pdf', 'WM7aDbKbI9_REQUISICIÓN No.pdf', 1, '2025-04-05 17:40:33', '2025-04-05 17:40:33'),
	(1556, 'storage/documentos/requisicion/WRIuuMdqgR_REQUISICIÓN No.pdf', 'WRIuuMdqgR_REQUISICIÓN No.pdf', 1, '2025-04-05 17:41:52', '2025-04-05 17:41:52'),
	(1557, 'storage/documentos/requisicion/0RiuuWAGNm_REQUISICIÓN No.pdf', '0RiuuWAGNm_REQUISICIÓN No.pdf', 1, '2025-04-05 17:46:57', '2025-04-05 17:46:57'),
	(1558, 'storage/documentos/requisicion/bDYDKm7zvs_REQUISICIÓN No.pdf', 'bDYDKm7zvs_REQUISICIÓN No.pdf', 1, '2025-04-05 17:49:52', '2025-04-05 17:49:52'),
	(1559, 'storage/documentos/requisicion/9GGkzZCefx_REQUISICIÓN No.pdf', '9GGkzZCefx_REQUISICIÓN No.pdf', 1, '2025-04-05 17:51:36', '2025-04-05 17:51:36'),
	(1560, 'storage/documentos/requisicion/fPvjX3Gtqi_REQUISICIÓN No.pdf', 'fPvjX3Gtqi_REQUISICIÓN No.pdf', 1, '2025-04-05 17:53:03', '2025-04-05 17:53:03'),
	(1561, 'storage/documentos/requisicion/ZggRwAdDmf_REQUISICIÓN No.pdf', 'ZggRwAdDmf_REQUISICIÓN No.pdf', 1, '2025-04-05 17:54:00', '2025-04-05 17:54:00'),
	(1562, 'storage/documentos/requisicion/whvsk5cl93_REQUISICIÓN No.pdf', 'whvsk5cl93_REQUISICIÓN No.pdf', 1, '2025-04-05 17:55:21', '2025-04-05 17:55:21'),
	(1563, 'storage/documentos/requisicion/A3Pjs9WMLD_REQUISICIÓN No.pdf', 'A3Pjs9WMLD_REQUISICIÓN No.pdf', 1, '2025-04-05 17:56:22', '2025-04-05 17:56:22'),
	(1564, 'storage/documentos/requisicion/8M882ai6qS_REQUISICIÓN No.pdf', '8M882ai6qS_REQUISICIÓN No.pdf', 1, '2025-04-05 17:58:44', '2025-04-05 17:58:44'),
	(1565, 'storage/documentos/requisicion/kG9NmYAvSc_REQUISICIÓN No.pdf', 'kG9NmYAvSc_REQUISICIÓN No.pdf', 1, '2025-04-05 18:01:17', '2025-04-05 18:01:17'),
	(1566, 'storage/documentos/requisicion/Q7T8EcHJHx_REQUISICIÓN No.pdf', 'Q7T8EcHJHx_REQUISICIÓN No.pdf', 1, '2025-04-07 14:01:44', '2025-04-07 14:01:44'),
	(1567, 'storage/documentos/requisicion/sBg3vF5NYl_REQUISICIÓN No.pdf', 'sBg3vF5NYl_REQUISICIÓN No.pdf', 1, '2025-04-07 14:03:07', '2025-04-07 14:03:07'),
	(1568, 'storage/documentos/requisicion/RcHm6MGFob_REQUISICIÓN No.pdf', 'RcHm6MGFob_REQUISICIÓN No.pdf', 1, '2025-04-07 14:04:27', '2025-04-07 14:04:27'),
	(1569, 'storage/documentos/requisicion/jJILAapQ3a_REQUISICIÓN No.pdf', 'jJILAapQ3a_REQUISICIÓN No.pdf', 1, '2025-04-07 14:07:05', '2025-04-07 14:07:05'),
	(1570, 'storage/documentos/requisicion/PFP2kOFVHR_REQUISICIÓN No.pdf', 'PFP2kOFVHR_REQUISICIÓN No.pdf', 1, '2025-04-07 14:08:53', '2025-04-07 14:08:53'),
	(1571, 'storage/documentos/requisicion/rZ12SnyE6A_REQUISICIÓN No.pdf', 'rZ12SnyE6A_REQUISICIÓN No.pdf', 1, '2025-04-07 14:20:48', '2025-04-07 14:20:48'),
	(1572, 'storage/documentos/requisicion/G6kZMVHOJy_REQUISICIÓN No.pdf', 'G6kZMVHOJy_REQUISICIÓN No.pdf', 1, '2025-04-07 14:22:49', '2025-04-07 14:22:49'),
	(1573, 'storage/documentos/requisicion/QquyYEYrNo_REQUISICIÓN No.pdf', 'QquyYEYrNo_REQUISICIÓN No.pdf', 1, '2025-04-07 14:24:00', '2025-04-07 14:24:00'),
	(1574, 'storage/documentos/requisicion/24qGpwL7Qt_REQUISICIÓN No.pdf', '24qGpwL7Qt_REQUISICIÓN No.pdf', 1, '2025-04-07 14:48:03', '2025-04-07 14:48:03'),
	(1575, 'storage/documentos/requisicion/mPCNDqtyTh_REQUISICIÓN No.pdf', 'mPCNDqtyTh_REQUISICIÓN No.pdf', 1, '2025-04-07 14:49:25', '2025-04-07 14:49:25'),
	(1576, 'storage/documentos/requisicion/CGA7fNlk4A_REQUISICIÓN No.pdf', 'CGA7fNlk4A_REQUISICIÓN No.pdf', 1, '2025-04-07 14:50:54', '2025-04-07 14:50:54'),
	(1577, 'storage/documentos/requisicion/iG0m9XiUS8_REQUISICIÓN No.pdf', 'iG0m9XiUS8_REQUISICIÓN No.pdf', 1, '2025-04-07 14:52:02', '2025-04-07 14:52:02'),
	(1578, 'storage/documentos/requisicion/iCvOwe6pje_REQUISICIÓN No.pdf', 'iCvOwe6pje_REQUISICIÓN No.pdf', 1, '2025-04-07 14:57:03', '2025-04-07 14:57:03'),
	(1579, 'storage/documentos/requisicion/vggl8u2kjJ_REQUISICIÓN No.pdf', 'vggl8u2kjJ_REQUISICIÓN No.pdf', 1, '2025-04-07 15:13:07', '2025-04-07 15:13:07'),
	(1580, 'storage/documentos/requisicion/IBJhTVGoNB_REQUISICIÓN No.pdf', 'IBJhTVGoNB_REQUISICIÓN No.pdf', 1, '2025-04-07 15:14:13', '2025-04-07 15:14:13'),
	(1581, 'storage/documentos/requisicion/gNMUTvrm8J_REQUISICIÓN No.pdf', 'gNMUTvrm8J_REQUISICIÓN No.pdf', 1, '2025-04-07 15:15:32', '2025-04-07 15:15:32'),
	(1582, 'storage/documentos/requisicion/hcZQHMRK1w_REQUISICIÓN No.pdf', 'hcZQHMRK1w_REQUISICIÓN No.pdf', 1, '2025-04-07 15:18:23', '2025-04-07 15:18:23'),
	(1583, 'storage/documentos/requisicion/LMkJVGJBVU_REQUISICIÓN No.pdf', 'LMkJVGJBVU_REQUISICIÓN No.pdf', 1, '2025-04-07 15:19:47', '2025-04-07 15:19:47'),
	(1584, 'storage/documentos/requisicion/Foe7jK9NGI_REQUISICIÓN No.pdf', 'Foe7jK9NGI_REQUISICIÓN No.pdf', 1, '2025-04-07 15:21:04', '2025-04-07 15:21:04'),
	(1585, 'storage/documentos/requisicion/OWTNjkSVFa_REQUISICIÓN No.pdf', 'OWTNjkSVFa_REQUISICIÓN No.pdf', 1, '2025-04-07 15:24:45', '2025-04-07 15:24:45'),
	(1586, 'storage/documentos/requisicion/Yf5nfNDvSl_REQUISICIÓN No.pdf', 'Yf5nfNDvSl_REQUISICIÓN No.pdf', 1, '2025-04-07 15:25:44', '2025-04-07 15:25:44'),
	(1587, 'storage/documentos/requisicion/uwHtD2dMcx_REQUISICIÓN No.pdf', 'uwHtD2dMcx_REQUISICIÓN No.pdf', 1, '2025-04-07 15:26:52', '2025-04-07 15:26:52'),
	(1588, 'storage/documentos/requisicion/f4HkM5nVBE_REQUISICIÓN No.pdf', 'f4HkM5nVBE_REQUISICIÓN No.pdf', 1, '2025-04-07 15:28:02', '2025-04-07 15:28:02'),
	(1589, 'storage/documentos/requisicion/6eHUTjp0Ad_REQUISICIÓN No.pdf', '6eHUTjp0Ad_REQUISICIÓN No.pdf', 1, '2025-04-07 15:31:03', '2025-04-07 15:31:03'),
	(1590, 'storage/documentos/requisicion/BbuIhHIvSQ_REQUISICIÓN No.pdf', 'BbuIhHIvSQ_REQUISICIÓN No.pdf', 1, '2025-04-07 15:55:49', '2025-04-07 15:55:49'),
	(1591, 'storage/documentos/requisicion/cKaRwO39eI_REQUISICIÓN No.pdf', 'cKaRwO39eI_REQUISICIÓN No.pdf', 1, '2025-04-07 16:37:44', '2025-04-07 16:37:44'),
	(1592, 'storage/documentos/requisicion/UTUfXWcnt4_REQUISICIÓN No.pdf', 'UTUfXWcnt4_REQUISICIÓN No.pdf', 1, '2025-04-07 16:38:52', '2025-04-07 16:38:52'),
	(1593, 'storage/documentos/requisicion/SVVeMubIXb_REQUISICIÓN No.pdf', 'SVVeMubIXb_REQUISICIÓN No.pdf', 1, '2025-04-07 16:43:17', '2025-04-07 16:43:17'),
	(1594, 'storage/documentos/requisicion/EhZaMFSMPf_REQUISICIÓN No.pdf', 'EhZaMFSMPf_REQUISICIÓN No.pdf', 1, '2025-04-07 16:47:57', '2025-04-07 16:47:57'),
	(1595, 'storage/documentos/requisicion/BTyhyWBaRA_REQUISICIÓN No.pdf', 'BTyhyWBaRA_REQUISICIÓN No.pdf', 1, '2025-04-07 16:50:05', '2025-04-07 16:50:05'),
	(1596, 'storage/documentos/requisicion/7GJ1ObdnMY_REQUISICIÓN No.pdf', '7GJ1ObdnMY_REQUISICIÓN No.pdf', 1, '2025-04-07 16:51:14', '2025-04-07 16:51:14'),
	(1597, 'storage/documentos/requisicion/yuPf30jQaV_REQUISICIÓN No.pdf', 'yuPf30jQaV_REQUISICIÓN No.pdf', 1, '2025-04-07 16:52:38', '2025-04-07 16:52:38'),
	(1598, 'storage/documentos/requisicion/oRP3JEGR8V_REQUISICIÓN No.pdf', 'oRP3JEGR8V_REQUISICIÓN No.pdf', 1, '2025-04-07 16:55:11', '2025-04-07 16:55:11'),
	(1599, 'storage/documentos/requisicion/4L8bE0sGSR_REQUISICIÓN No.pdf', '4L8bE0sGSR_REQUISICIÓN No.pdf', 1, '2025-04-07 16:56:27', '2025-04-07 16:56:27'),
	(1600, 'storage/documentos/requisicion/0yRyWClzfJ_REQUISICIÓN No.pdf', '0yRyWClzfJ_REQUISICIÓN No.pdf', 1, '2025-04-07 16:58:46', '2025-04-07 16:58:46'),
	(1601, 'storage/documentos/requisicion/zTLFbfg9PS_REQUISICIÓN No.pdf', 'zTLFbfg9PS_REQUISICIÓN No.pdf', 1, '2025-04-07 17:00:10', '2025-04-07 17:00:10'),
	(1602, 'storage/documentos/requisicion/gqXdfFoIUS_REQUISICIÓN No.pdf', 'gqXdfFoIUS_REQUISICIÓN No.pdf', 1, '2025-04-07 17:06:12', '2025-04-07 17:06:12'),
	(1603, 'storage/documentos/requisicion/KqYGmbUS6k_REQUISICIÓN No.pdf', 'KqYGmbUS6k_REQUISICIÓN No.pdf', 1, '2025-04-07 17:09:35', '2025-04-07 17:09:35'),
	(1604, 'storage/documentos/requisicion/FfATdwyQt3_REQUISICIÓN No.pdf', 'FfATdwyQt3_REQUISICIÓN No.pdf', 1, '2025-04-07 17:11:46', '2025-04-07 17:11:46'),
	(1605, 'storage/documentos/requisicion/vy801eEMx0_REQUISICIÓN No.pdf', 'vy801eEMx0_REQUISICIÓN No.pdf', 1, '2025-04-07 17:13:04', '2025-04-07 17:13:04'),
	(1606, 'storage/documentos/requisicion/uTfH2ImUgI_REQUISICIÓN No.pdf', 'uTfH2ImUgI_REQUISICIÓN No.pdf', 1, '2025-04-07 17:14:52', '2025-04-07 17:14:52'),
	(1607, 'storage/documentos/requisicion/4DgQ7AYDg1_REQUISICIÓN No.pdf', '4DgQ7AYDg1_REQUISICIÓN No.pdf', 1, '2025-04-07 17:16:34', '2025-04-07 17:16:34'),
	(1608, 'storage/documentos/requisicion/8R9ZzCOKaT_REQUISICIÓN No.pdf', '8R9ZzCOKaT_REQUISICIÓN No.pdf', 1, '2025-04-07 17:17:47', '2025-04-07 17:17:47'),
	(1609, 'storage/documentos/requisicion/WyDvbtPRXM_REQUISICIÓN No.pdf', 'WyDvbtPRXM_REQUISICIÓN No.pdf', 1, '2025-04-07 17:19:05', '2025-04-07 17:19:05'),
	(1610, 'storage/documentos/requisicion/jXjYYkHlcs_REQUISICIÓN No.pdf', 'jXjYYkHlcs_REQUISICIÓN No.pdf', 1, '2025-04-07 17:20:10', '2025-04-07 17:20:10'),
	(1611, 'storage/documentos/requisicion/eu8tyTPEO5_REQUISICIÓN No.pdf', 'eu8tyTPEO5_REQUISICIÓN No.pdf', 1, '2025-04-07 17:21:12', '2025-04-07 17:21:12'),
	(1612, 'storage/documentos/requisicion/WicZRAjSCi_REQUISICIÓN No.pdf', 'WicZRAjSCi_REQUISICIÓN No.pdf', 1, '2025-04-07 17:22:33', '2025-04-07 17:22:33'),
	(1613, 'storage/documentos/requisicion/0j9WAyOLuw_REQUISICIÓN No.pdf', '0j9WAyOLuw_REQUISICIÓN No.pdf', 1, '2025-04-07 17:24:16', '2025-04-07 17:24:16'),
	(1614, 'storage/documentos/requisicion/wUFc1my66F_REQUISICIÓN No.pdf', 'wUFc1my66F_REQUISICIÓN No.pdf', 1, '2025-04-07 17:25:23', '2025-04-07 17:25:23'),
	(1615, 'storage/documentos/requisicion/n2sEj1p0ZN_REQUISICIÓN No.pdf', 'n2sEj1p0ZN_REQUISICIÓN No.pdf', 1, '2025-04-07 17:27:33', '2025-04-07 17:27:33'),
	(1616, 'storage/documentos/requisicion/TB3NpRkqnn_REQUISICIÓN No.pdf', 'TB3NpRkqnn_REQUISICIÓN No.pdf', 1, '2025-04-07 17:28:44', '2025-04-07 17:28:44'),
	(1617, 'storage/documentos/requisicion/WVuxQbe9le_REQUISICIÓN No.pdf', 'WVuxQbe9le_REQUISICIÓN No.pdf', 1, '2025-04-07 17:29:46', '2025-04-07 17:29:46'),
	(1618, 'storage/documentos/requisicion/YFPJGs4D9Q_REQUISICIÓN No.pdf', 'YFPJGs4D9Q_REQUISICIÓN No.pdf', 1, '2025-04-07 17:31:29', '2025-04-07 17:31:29'),
	(1619, 'storage/documentos/requisicion/COddUErX0u_REQUISICIÓN No.pdf', 'COddUErX0u_REQUISICIÓN No.pdf', 1, '2025-04-07 17:32:51', '2025-04-07 17:32:51'),
	(1620, 'storage/documentos/requisicion/Gs8wnLRYKJ_REQUISICIÓN No.pdf', 'Gs8wnLRYKJ_REQUISICIÓN No.pdf', 1, '2025-04-07 17:34:03', '2025-04-07 17:34:03'),
	(1621, 'storage/documentos/requisicion/8pz8DkqPv2_REQUISICIÓN No.pdf', '8pz8DkqPv2_REQUISICIÓN No.pdf', 1, '2025-04-07 17:36:50', '2025-04-07 17:36:50'),
	(1622, 'storage/documentos/requisicion/XgCJy2gO7o_REQUISICIÓN No.pdf', 'XgCJy2gO7o_REQUISICIÓN No.pdf', 1, '2025-04-07 17:38:09', '2025-04-07 17:38:09'),
	(1623, 'storage/documentos/requisicion/mfT0EvqSrI_REQUISICIÓN No.pdf', 'mfT0EvqSrI_REQUISICIÓN No.pdf', 1, '2025-04-07 17:40:00', '2025-04-07 17:40:00'),
	(1624, 'storage/documentos/requisicion/8xLQYdfMHY_REQUISICIÓN No.pdf', '8xLQYdfMHY_REQUISICIÓN No.pdf', 1, '2025-04-07 17:42:39', '2025-04-07 17:42:39'),
	(1625, 'storage/documentos/requisicion/ZkkLld2zhy_REQUISICIÓN No.pdf', 'ZkkLld2zhy_REQUISICIÓN No.pdf', 1, '2025-04-07 17:44:05', '2025-04-07 17:44:05'),
	(1626, 'storage/documentos/requisicion/s85N3r5Yf3_REQUISICIÓN No.pdf', 's85N3r5Yf3_REQUISICIÓN No.pdf', 1, '2025-04-07 17:45:13', '2025-04-07 17:45:13'),
	(1627, 'storage/documentos/requisicion/TxjlnCCvNN_REQUISICIÓN No.pdf', 'TxjlnCCvNN_REQUISICIÓN No.pdf', 1, '2025-04-07 17:46:24', '2025-04-07 17:46:24'),
	(1628, 'storage/documentos/requisicion/XpwDVgDA7t_REQUISICIÓN No.pdf', 'XpwDVgDA7t_REQUISICIÓN No.pdf', 1, '2025-04-07 17:47:31', '2025-04-07 17:47:31'),
	(1629, 'storage/documentos/requisicion/e9h7CBCd98_REQUISICIÓN No.pdf', 'e9h7CBCd98_REQUISICIÓN No.pdf', 1, '2025-04-07 17:48:29', '2025-04-07 17:48:29'),
	(1630, 'storage/documentos/requisicion/YbcMGIJBxJ_REQUISICIÓN No.pdf', 'YbcMGIJBxJ_REQUISICIÓN No.pdf', 1, '2025-04-07 18:58:28', '2025-04-07 18:58:28'),
	(1631, 'storage/documentos/requisicion/5qizryebf5_REQUISICIÓN No.pdf', '5qizryebf5_REQUISICIÓN No.pdf', 1, '2025-04-07 19:11:34', '2025-04-07 19:11:34'),
	(1632, 'storage/documentos/requisicion/ZnwXopdpZw_REQUISICIÓN No.pdf', 'ZnwXopdpZw_REQUISICIÓN No.pdf', 1, '2025-04-07 19:18:42', '2025-04-07 19:18:42'),
	(1633, 'storage/documentos/requisicion/P6uIZgFDKn_REQUISICIÓN No.pdf', 'P6uIZgFDKn_REQUISICIÓN No.pdf', 1, '2025-04-07 19:21:03', '2025-04-07 19:21:03'),
	(1634, 'storage/documentos/requisicion/DsqP3lpuhJ_REQUISICIÓN No.pdf', 'DsqP3lpuhJ_REQUISICIÓN No.pdf', 1, '2025-04-07 21:40:26', '2025-04-07 21:40:26'),
	(1635, 'storage/documentos/requisicion/cKMacdw6qa_REQUISICIÓN No.pdf', 'cKMacdw6qa_REQUISICIÓN No.pdf', 1, '2025-04-08 14:24:37', '2025-04-08 14:24:37'),
	(1636, 'storage/documentos/requisicion/WYdjiSpria_REQUISICIÓN No.pdf', 'WYdjiSpria_REQUISICIÓN No.pdf', 1, '2025-04-08 14:26:48', '2025-04-08 14:26:48'),
	(1637, 'storage/documentos/requisicion/WfLA2btVzb_REQUISICIÓN No.pdf', 'WfLA2btVzb_REQUISICIÓN No.pdf', 1, '2025-04-08 14:28:08', '2025-04-08 14:28:08'),
	(1638, 'storage/documentos/requisicion/sn4G6nrGm1_REQUISICIÓN No.pdf', 'sn4G6nrGm1_REQUISICIÓN No.pdf', 1, '2025-04-08 14:29:24', '2025-04-08 14:29:24'),
	(1639, 'storage/documentos/requisicion/DJbXn8NEQm_REQUISICIÓN No.pdf', 'DJbXn8NEQm_REQUISICIÓN No.pdf', 1, '2025-04-08 14:30:30', '2025-04-08 14:30:30'),
	(1640, 'storage/documentos/escrito/ZbmAmLBDL9_ALEJANDRO LIMA XIQUE correo remite oficio aegf-2553-2025 participaciones 2024 Eder-Emir-Ale.pdf', 'ZbmAmLBDL9_ALEJANDRO LIMA XIQUE correo remite oficio aegf-2553-2025 participaciones 2024 Eder-Emir-Ale.pdf', 5, '2025-04-08 21:27:16', '2025-04-08 21:27:16'),
	(1641, 'storage/documentos/circular/2DlqmiPP8R_CONTRALORÍA circular-002-2025 fondos fijos consejos municipales Eder.pdf', '2DlqmiPP8R_CONTRALORÍA circular-002-2025 fondos fijos consejos municipales Eder.pdf', 4, '2025-04-08 21:29:32', '2025-04-08 21:29:32'),
	(1642, 'storage/documentos/circular/cgEr9GgeFF_DTS circular-009-2025 temas de junta ejecutiva Eder-Materiales.pdf', 'cgEr9GgeFF_DTS circular-009-2025 temas de junta ejecutiva Eder-Materiales.pdf', 4, '2025-04-08 21:39:33', '2025-04-08 21:39:33'),
	(1643, 'storage/documentos/circular/PZnkDr1BJV_DTS circular-010-2025 temas a tratar a consejo general.pdf', 'PZnkDr1BJV_DTS circular-010-2025 temas a tratar a consejo general.pdf', 4, '2025-04-08 21:43:19', '2025-04-08 21:43:19'),
	(1644, 'storage/documentos/memorandum/oSS8a8bldL_JURÍDICO memo-0885-2025 Eder-Saúl.pdf', 'oSS8a8bldL_JURÍDICO memo-0885-2025 Eder-Saúl.pdf', 2, '2025-04-08 21:46:19', '2025-04-08 21:46:19'),
	(1645, 'storage/documentos/memorandum/tRGAWou7gF_JURÍDICO memo-ca-se-0025-2025 se remite contrato para su resguardo gráficas corona Eder-Normatividad.pdf', 'tRGAWou7gF_JURÍDICO memo-ca-se-0025-2025 se remite contrato para su resguardo gráficas corona Eder-Normatividad.pdf', 2, '2025-04-08 21:49:51', '2025-04-08 21:49:51'),
	(1646, 'storage/documentos/memorandum/zYVZXBr4oM_PRERROGATIVAS memo-0329-2025 se solicita dar de baja estantes Daniel-Juan Carlos.pdf', 'zYVZXBr4oM_PRERROGATIVAS memo-0329-2025 se solicita dar de baja estantes Daniel-Juan Carlos.pdf', 2, '2025-04-08 21:55:16', '2025-04-08 21:55:16'),
	(1647, 'storage/documentos/memorandum/1Brr1ocvkM_PRERROGATIVAS oficio-00667-2025 se informan inconsistencias en recibos Archivo.pdf', '1Brr1ocvkM_PRERROGATIVAS oficio-00667-2025 se informan inconsistencias en recibos Archivo.pdf', 2, '2025-04-08 21:59:15', '2025-04-08 21:59:15'),
	(1648, 'storage/documentos/memorandum/XCpmiNihg0_IGUALDAD memo-113-2025 se solicita dar de baja mobiliario Daniel-Alexis.pdf', 'XCpmiNihg0_IGUALDAD memo-113-2025 se solicita dar de baja mobiliario Daniel-Alexis.pdf', 2, '2025-04-09 15:52:23', '2025-04-09 15:52:23'),
	(1649, 'storage/documentos/oficio/XyWdrS4bR6_PRERROGATIVAS oficio-00667-2025 se informan inconsistencias en recibos Archivo.pdf', 'XyWdrS4bR6_PRERROGATIVAS oficio-00667-2025 se informan inconsistencias en recibos Archivo.pdf', 3, '2025-04-09 15:55:20', '2025-04-09 15:55:20'),
	(1650, 'storage/documentos/circular/OwNQ5gA0fz_SECRETARÍA circular-049-2025  cursos capacitación Eder-Cuarto.pdf', 'OwNQ5gA0fz_SECRETARÍA circular-049-2025  cursos capacitación Eder-Cuarto.pdf', 4, '2025-04-09 15:57:23', '2025-04-09 15:57:23'),
	(1651, 'storage/documentos/requisicion/e8fHNy7A1Q_REQUISICIÓN No 24.pdf', 'e8fHNy7A1Q_REQUISICIÓN No 24.pdf', 1, '2025-04-09 17:00:14', '2025-04-09 17:00:14'),
	(1652, 'storage/documentos/requisicion/cXSCLPYEZi_REQUISICIÓN No.pdf', 'cXSCLPYEZi_REQUISICIÓN No.pdf', 1, '2025-04-09 17:01:29', '2025-04-09 17:01:29'),
	(1653, 'storage/documentos/requisicion/hh8t0Bf7H7_REQUISICIÓN No.pdf', 'hh8t0Bf7H7_REQUISICIÓN No.pdf', 1, '2025-04-09 17:03:42', '2025-04-09 17:03:42'),
	(1654, 'storage/documentos/requisicion/sgf89OHQqR_REQUISICIÓN No.pdf', 'sgf89OHQqR_REQUISICIÓN No.pdf', 1, '2025-04-09 17:05:34', '2025-04-09 17:05:34'),
	(1655, 'storage/documentos/requisicion/nUm5ms9FBY_REQUISICIÓN No.pdf', 'nUm5ms9FBY_REQUISICIÓN No.pdf', 1, '2025-04-09 17:07:06', '2025-04-09 17:07:06'),
	(1656, 'storage/documentos/requisicion/TacvBTxkEI_REQUISICIÓN No.pdf', 'TacvBTxkEI_REQUISICIÓN No.pdf', 1, '2025-04-09 17:08:45', '2025-04-09 17:08:45'),
	(1657, 'storage/documentos/requisicion/e3DTDPpdZj_REQUISICIÓN No.pdf', 'e3DTDPpdZj_REQUISICIÓN No.pdf', 1, '2025-04-09 17:14:38', '2025-04-09 17:14:38'),
	(1658, 'storage/documentos/requisicion/8BF190hgrP_REQUISICIÓN No.pdf', '8BF190hgrP_REQUISICIÓN No.pdf', 1, '2025-04-09 17:15:58', '2025-04-09 17:15:58'),
	(1659, 'storage/documentos/requisicion/NmCSN57lwG_REQUISICIÓN No.pdf', 'NmCSN57lwG_REQUISICIÓN No.pdf', 1, '2025-04-09 17:21:37', '2025-04-09 17:21:37'),
	(1660, 'storage/documentos/requisicion/DjJ93CirR2_REQUISICIÓN No.pdf', 'DjJ93CirR2_REQUISICIÓN No.pdf', 1, '2025-04-09 17:27:33', '2025-04-09 17:27:33'),
	(1661, 'storage/documentos/requisicion/qxrukdKP6q_REQUISICIÓN No.pdf', 'qxrukdKP6q_REQUISICIÓN No.pdf', 1, '2025-04-09 17:37:47', '2025-04-09 17:37:47'),
	(1662, 'storage/documentos/requisicion/sQ1SIGzktA_REQUISICIÓN No.pdf', 'sQ1SIGzktA_REQUISICIÓN No.pdf', 1, '2025-04-09 17:41:26', '2025-04-09 17:41:26'),
	(1663, 'storage/documentos/requisicion/1XsPXk78pD_REQUISICIÓN No.pdf', '1XsPXk78pD_REQUISICIÓN No.pdf', 1, '2025-04-09 17:43:04', '2025-04-09 17:43:04'),
	(1664, 'storage/documentos/requisicion/OwrOSxNpiP_REQUISICIÓN No.pdf', 'OwrOSxNpiP_REQUISICIÓN No.pdf', 1, '2025-04-09 17:44:24', '2025-04-09 17:44:24'),
	(1665, 'storage/documentos/requisicion/evTw3kAjJQ_REQUISICIÓN No.pdf', 'evTw3kAjJQ_REQUISICIÓN No.pdf', 1, '2025-04-09 17:45:53', '2025-04-09 17:45:53'),
	(1666, 'storage/documentos/requisicion/fU8ekVjotU_REQUISICIÓN No.pdf', 'fU8ekVjotU_REQUISICIÓN No.pdf', 1, '2025-04-09 17:47:17', '2025-04-09 17:47:17'),
	(1667, 'storage/documentos/circular/nnOXqm5TCC_SECRETARÍA circular-050-2025 se informa desincorporación de personal de o.pdf', 'nnOXqm5TCC_SECRETARÍA circular-050-2025 se informa desincorporación de personal de o.pdf', 4, '2025-04-09 17:50:24', '2025-04-09 17:50:24'),
	(1668, 'storage/documentos/escrito/ehmRbnWEOp_UFD correo se solicita formato cv Cuarto.pdf', 'ehmRbnWEOp_UFD correo se solicita formato cv Cuarto.pdf', 5, '2025-04-09 17:51:37', '2025-04-09 17:51:37'),
	(1669, 'storage/documentos/escrito/dA6bhq1lrg_UFD correo texto circular SE Lic.pdf', 'dA6bhq1lrg_UFD correo texto circular SE Lic.pdf', 5, '2025-04-09 17:53:27', '2025-04-09 17:53:27'),
	(1670, 'storage/documentos/memorandum/e0YLJ3ogAQ_UFD memo-368-2025 se solicita alta de personal Cuarto.pdf', 'e0YLJ3ogAQ_UFD memo-368-2025 se solicita alta de personal Cuarto.pdf', 2, '2025-04-09 17:56:15', '2025-04-09 17:56:15'),
	(1671, 'storage/documentos/memorandum/2zkfd6eMcd_UFD memo-369-2025  se solicita desincorporación de personal Cuarto.pdf', '2zkfd6eMcd_UFD memo-369-2025  se solicita desincorporación de personal Cuarto.pdf', 2, '2025-04-09 17:58:42', '2025-04-09 17:58:42'),
	(1672, 'storage/documentos/memorandum/CmW6YEbOEW_INFORMÁTICA memo-063-2025 formatos transparencia Archivo.pdf', 'CmW6YEbOEW_INFORMÁTICA memo-063-2025 formatos transparencia Archivo.pdf', 2, '2025-04-09 18:43:15', '2025-04-09 18:43:15'),
	(1673, 'storage/documentos/memorandum/mS3aK2RDQF_SECRETARÍA memo-1489-2025 se autoriza certificación resp memo-0360-2025 Eder-Miros.pdf', 'mS3aK2RDQF_SECRETARÍA memo-1489-2025 se autoriza certificación resp memo-0360-2025 Eder-Miros.pdf', 2, '2025-04-09 19:00:00', '2025-04-09 19:00:00'),
	(1674, 'storage/documentos/memorandum/ESbaMpGYtx_ARCHIVOS memo-111-25 respuesta a memo da-0389-2025 Daniel-Eder.pdf', 'ESbaMpGYtx_ARCHIVOS memo-111-25 respuesta a memo da-0389-2025 Daniel-Eder.pdf', 2, '2025-04-10 21:54:01', '2025-04-10 21:54:01'),
	(1675, 'storage/documentos/memorandum/UBOcdkuahX_COMUNICACIÓN memo-095-2025 baj de mobiliario Daniel.pdf', 'UBOcdkuahX_COMUNICACIÓN memo-095-2025 baj de mobiliario Daniel.pdf', 2, '2025-04-10 21:57:07', '2025-04-10 21:57:07'),
	(1676, 'storage/documentos/memorandum/o8JLzsSOyY_DOE memo-291-2025 telesecundaria chignahuapan atencion a solicitud SOMETER A JUNTA E.pdf', 'o8JLzsSOyY_DOE memo-291-2025 telesecundaria chignahuapan atencion a solicitud SOMETER A JUNTA E.pdf', 2, '2025-04-10 21:59:01', '2025-04-10 21:59:01'),
	(1677, 'storage/documentos/circular/5xPCdyBq1K_JURÍDICO circular-002-2025 programa de trabajo de admón.pdf', '5xPCdyBq1K_JURÍDICO circular-002-2025 programa de trabajo de admón.pdf', 4, '2025-04-10 22:02:13', '2025-04-10 22:02:13'),
	(1678, 'storage/documentos/memorandum/rplSruJCEj_JURÍDICO memo-0912-2025 se reniten renuncias Cuarto.pdf', 'rplSruJCEj_JURÍDICO memo-0912-2025 se reniten renuncias Cuarto.pdf', 2, '2025-04-10 22:03:48', '2025-04-10 22:03:48'),
	(1679, 'storage/documentos/requisicion/0zGpYmUYbx_REQUISICIÓN No.pdf', '0zGpYmUYbx_REQUISICIÓN No.pdf', 1, '2025-04-10 22:10:26', '2025-04-10 22:10:26'),
	(1680, 'storage/documentos/requisicion/l4PmVimpvV_REQUISICIÓN No.pdf', 'l4PmVimpvV_REQUISICIÓN No.pdf', 1, '2025-04-10 22:22:01', '2025-04-10 22:22:01'),
	(1681, 'storage/documentos/requisicion/TKcLLUMxqd_REQUISICIÓN No.pdf', 'TKcLLUMxqd_REQUISICIÓN No.pdf', 1, '2025-04-10 22:27:54', '2025-04-10 22:27:54'),
	(1682, 'storage/documentos/requisicion/a8UKpMKAkK_REQUISICIÓN No.pdf', 'a8UKpMKAkK_REQUISICIÓN No.pdf', 1, '2025-04-10 22:29:43', '2025-04-10 22:29:43'),
	(1683, 'storage/documentos/requisicion/8n19iW17Ax_REQUISICIÓN No.pdf', '8n19iW17Ax_REQUISICIÓN No.pdf', 1, '2025-04-10 22:31:28', '2025-04-10 22:31:28'),
	(1684, 'storage/documentos/requisicion/S2ZrjLfIih_REQUISICIÓN No.pdf', 'S2ZrjLfIih_REQUISICIÓN No.pdf', 1, '2025-04-10 22:32:44', '2025-04-10 22:32:44'),
	(1685, 'storage/documentos/requisicion/lYiNCB926f_REQUISICIÓN No.pdf', 'lYiNCB926f_REQUISICIÓN No.pdf', 1, '2025-04-10 22:33:57', '2025-04-10 22:33:57'),
	(1686, 'storage/documentos/requisicion/muT83fv9GW_REQUISICIÓN No.pdf', 'muT83fv9GW_REQUISICIÓN No.pdf', 1, '2025-04-10 22:35:25', '2025-04-10 22:35:25'),
	(1687, 'storage/documentos/requisicion/CjmXtxUIjk_REQUISICIÓN No.pdf', 'CjmXtxUIjk_REQUISICIÓN No.pdf', 1, '2025-04-10 22:36:39', '2025-04-10 22:36:39'),
	(1688, 'storage/documentos/circular/HfgtZc8Mue_SECRETARÍA circular-051-2025 se informan días inhábiles a todo el personal.pdf', 'HfgtZc8Mue_SECRETARÍA circular-051-2025 se informan días inhábiles a todo el personal.pdf', 4, '2025-04-10 22:39:46', '2025-04-10 22:39:46'),
	(1689, 'storage/documentos/memorandum/WWShMoarqO_SECRETARÍA memo-1497-2025 se autoriza certificación Normatividad-Eder.pdf', 'WWShMoarqO_SECRETARÍA memo-1497-2025 se autoriza certificación Normatividad-Eder.pdf', 2, '2025-04-10 22:42:02', '2025-04-10 22:42:02'),
	(1690, 'storage/documentos/memorandum/jhhcrNjTdX_SECRETARÍA memo-1501-2025 se remite oficio circular sabg-os-sca-0019-2025 auditoría Eder-Emir-Ale.pdf', 'jhhcrNjTdX_SECRETARÍA memo-1501-2025 se remite oficio circular sabg-os-sca-0019-2025 auditoría Eder-Emir-Ale.pdf', 2, '2025-04-10 22:44:10', '2025-04-10 22:44:10'),
	(1691, 'storage/documentos/memorandum/06Fjk8Ry8X_SECRETARÍA memo-1504-2025 se autoriza certificación Eder-Normatividad.pdf', '06Fjk8Ry8X_SECRETARÍA memo-1504-2025 se autoriza certificación Eder-Normatividad.pdf', 2, '2025-04-10 22:45:39', '2025-04-10 22:45:39'),
	(1692, 'storage/documentos/memorandum/oJbLKW83U0_UFD memo-380-2025 se solicita entrega-recepción Eder-Normatividad.pdf', 'oJbLKW83U0_UFD memo-380-2025 se solicita entrega-recepción Eder-Normatividad.pdf', 2, '2025-04-10 22:47:44', '2025-04-10 22:47:44'),
	(1693, 'storage/documentos/oficio/W5AD8P42Md_PRESIDENCIA oficio-0305-2025 se remite información de solventación de resultados finales y observ.pdf', 'W5AD8P42Md_PRESIDENCIA oficio-0305-2025 se remite información de solventación de resultados finales y observ.pdf', 3, '2025-04-10 22:53:59', '2025-04-10 22:53:59'),
	(1694, 'storage/documentos/memorandum/sk2mLW2AzS_COMUNICACIÓN memo-096-2025 Boletín 27 Archivo.pdf', 'sk2mLW2AzS_COMUNICACIÓN memo-096-2025 Boletín 27 Archivo.pdf', 2, '2025-04-14 14:34:51', '2025-04-14 14:34:51'),
	(1695, 'storage/documentos/memorandum/l9Z9J7AVcE_CONTRALORÍA memo-211-2025 se solicita dar de baja mobiliario Daniel.pdf', 'l9Z9J7AVcE_CONTRALORÍA memo-211-2025 se solicita dar de baja mobiliario Daniel.pdf', 2, '2025-04-14 14:36:22', '2025-04-14 14:36:22'),
	(1696, 'storage/documentos/escrito/sA8jtbsuxr_OFICIALIA DE PARTES FOLIO 1946 escrito ALberto Maravilla Cuarto.pdf', 'sA8jtbsuxr_OFICIALIA DE PARTES FOLIO 1946 escrito ALberto Maravilla Cuarto.pdf', 5, '2025-04-14 14:44:49', '2025-04-14 14:44:49'),
	(1697, 'storage/documentos/oficio/XuSYf74QYm_PRESIDENCIA oficio-0389-2025 se remite estados financieros marzo 2025 Emir.pdf', 'XuSYf74QYm_PRESIDENCIA oficio-0389-2025 se remite estados financieros marzo 2025 Emir.pdf', 3, '2025-04-14 14:47:04', '2025-04-14 14:47:04'),
	(1698, 'storage/documentos/oficio/ioUhIHiEGu_PRESIDENCIA oficio-0390-2025 se remite información y documentación ASE Emir.pdf', 'ioUhIHiEGu_PRESIDENCIA oficio-0390-2025 se remite información y documentación ASE Emir.pdf', 3, '2025-04-14 14:49:34', '2025-04-14 14:49:34'),
	(1699, 'storage/documentos/oficio/3hrKSUDgeH_PRESIDENCIA oficio-0391-2025 se remite información y doumentacipón ASE Emir.pdf', '3hrKSUDgeH_PRESIDENCIA oficio-0391-2025 se remite información y doumentacipón ASE Emir.pdf', 3, '2025-04-14 14:52:30', '2025-04-14 14:52:30'),
	(1700, 'storage/documentos/requisicion/yj2fd6QiqU_REQUISICIÓN No.pdf', 'yj2fd6QiqU_REQUISICIÓN No.pdf', 1, '2025-04-14 15:00:44', '2025-04-14 15:00:44'),
	(1701, 'storage/documentos/requisicion/aWYQU2y9ch_REQUISICIÓN No.pdf', 'aWYQU2y9ch_REQUISICIÓN No.pdf', 1, '2025-04-14 15:02:32', '2025-04-14 15:02:32'),
	(1702, 'storage/documentos/circular/e4XobywLE3_SECRETARÍA  No.pdf', 'e4XobywLE3_SECRETARÍA  No.pdf', 4, '2025-04-14 15:04:14', '2025-04-14 15:04:14'),
	(1703, 'storage/documentos/memorandum/aggDdZJX43_SECRETARÍA memo-1511-2025 se autoriza certificación Normatividad-Eder.pdf', 'aggDdZJX43_SECRETARÍA memo-1511-2025 se autoriza certificación Normatividad-Eder.pdf', 2, '2025-04-14 15:06:29', '2025-04-14 15:06:29'),
	(1704, 'storage/documentos/memorandum/J6JTaf8NLD_SECRETARÍA memo-1520-2025 se remite folio 1946 escrito Raúl Maravilla Cuarto.pdf', 'J6JTaf8NLD_SECRETARÍA memo-1520-2025 se remite folio 1946 escrito Raúl Maravilla Cuarto.pdf', 2, '2025-04-14 15:10:14', '2025-04-14 15:10:14'),
	(1705, 'storage/documentos/memorandum/0BvnJiIvni_SECRETARÍA memo-1521-2025 se autoriza certificación Normatividad Eder.pdf', '0BvnJiIvni_SECRETARÍA memo-1521-2025 se autoriza certificación Normatividad Eder.pdf', 2, '2025-04-14 15:13:33', '2025-04-14 15:13:33'),
	(1706, 'storage/documentos/memorandum/ZVxIQNSaax_SECRETARÍA memo-ca-p0261-2025 se convoca a sesión ordinaria adquisiciones Eder-Normatividad.pdf', 'ZVxIQNSaax_SECRETARÍA memo-ca-p0261-2025 se convoca a sesión ordinaria adquisiciones Eder-Normatividad.pdf', 2, '2025-04-14 15:15:44', '2025-04-14 15:15:44'),
	(1707, 'storage/documentos/memorandum/muusAqPl7W_UFD memo-384-2025 se solicita desincorporación de personal Cuarto.pdf', 'muusAqPl7W_UFD memo-384-2025 se solicita desincorporación de personal Cuarto.pdf', 2, '2025-04-14 15:17:32', '2025-04-14 15:17:32'),
	(1708, 'storage/documentos/memorandum/hqIoH2WKkT_UFD memo-386-2025 se solicita alta de personal Cuarto.pdf', 'hqIoH2WKkT_UFD memo-386-2025 se solicita alta de personal Cuarto.pdf', 2, '2025-04-14 15:18:56', '2025-04-14 15:18:56'),
	(1709, 'storage/documentos/memorandum/cJ2YZxDbX3_UFD memo-379-2025 descuentos de personal Cuarto.pdf', 'cJ2YZxDbX3_UFD memo-379-2025 descuentos de personal Cuarto.pdf', 2, '2025-04-14 15:24:12', '2025-04-14 15:24:12'),
	(1710, 'storage/documentos/requisicion/WoJiKHEzoa_REQUISICIÓN No.pdf', 'WoJiKHEzoa_REQUISICIÓN No.pdf', 1, '2025-04-14 16:38:37', '2025-04-14 16:38:37'),
	(1711, 'storage/documentos/memorandum/bmEiQtU03d_UFD memo-387-2025 se remite información resp a memo-da-0406-2025 se remite información Eder-Miros.pdf', 'bmEiQtU03d_UFD memo-387-2025 se remite información resp a memo-da-0406-2025 se remite información Eder-Miros.pdf', 2, '2025-04-14 16:44:38', '2025-04-14 16:44:38'),
	(1712, 'storage/documentos/requisicion/8FBQfZLbFb_REQUISICIÓN No.pdf', '8FBQfZLbFb_REQUISICIÓN No.pdf', 1, '2025-04-14 17:09:13', '2025-04-14 17:09:13'),
	(1713, 'storage/documentos/memorandum/aWn9s9gJk5_ARCHIVOS memo-113-25 expurgo documental, checar depósito por kilo Eder.pdf', 'aWn9s9gJk5_ARCHIVOS memo-113-25 expurgo documental, checar depósito por kilo Eder.pdf', 2, '2025-04-14 20:20:33', '2025-04-14 20:20:33'),
	(1714, 'storage/documentos/requisicion/XjkGQ9ekAq_REQUISICIÓN No.pdf', 'XjkGQ9ekAq_REQUISICIÓN No.pdf', 1, '2025-04-14 20:49:12', '2025-04-14 20:49:12'),
	(1715, 'storage/documentos/requisicion/VnyVknmQJe_REQUISICIÓN No.pdf', 'VnyVknmQJe_REQUISICIÓN No.pdf', 1, '2025-04-14 20:50:33', '2025-04-14 20:50:33'),
	(1716, 'storage/documentos/requisicion/38SgIKthGV_REQUUSICIÓN No.pdf', '38SgIKthGV_REQUUSICIÓN No.pdf', 1, '2025-04-14 20:55:43', '2025-04-14 20:55:43'),
	(1717, 'storage/documentos/memorandum/IYBOcIBW48_JURÍDICO memo-ca-se-0044-2025 se remite instructivo adj-iee-005-2025 Normartividad-Eder.pdf', 'IYBOcIBW48_JURÍDICO memo-ca-se-0044-2025 se remite instructivo adj-iee-005-2025 Normartividad-Eder.pdf', 2, '2025-04-15 15:09:57', '2025-04-15 15:09:57'),
	(1718, 'storage/documentos/requisicion/uav8Yc4Hmx_REQUISICIÓN No.pdf', 'uav8Yc4Hmx_REQUISICIÓN No.pdf', 1, '2025-04-15 15:57:25', '2025-04-15 15:57:25'),
	(1719, 'storage/documentos/requisicion/VnmTlWjzMw_REQUISICIÓN No.pdf', 'VnmTlWjzMw_REQUISICIÓN No.pdf', 1, '2025-04-15 15:59:01', '2025-04-15 15:59:01'),
	(1720, 'storage/documentos/requisicion/i7rVUxUuzt_REQUISICIÓN No.pdf', 'i7rVUxUuzt_REQUISICIÓN No.pdf', 1, '2025-04-15 16:01:18', '2025-04-15 16:01:18'),
	(1721, 'storage/documentos/memorandum/HrwLiuwpJD_SECRETARÍA memo-ca-p-0273-2025 reanudación sesión ordinacio del comité de adquisiciones Franco-Eder.pdf', 'HrwLiuwpJD_SECRETARÍA memo-ca-p-0273-2025 reanudación sesión ordinacio del comité de adquisiciones Franco-Eder.pdf', 2, '2025-04-15 16:03:41', '2025-04-15 16:03:41'),
	(1722, 'storage/documentos/memorandum/u73MYeQfdF_COMUNICACIÓN memo-098-2025 boletín 28 Archivo.pdf', 'u73MYeQfdF_COMUNICACIÓN memo-098-2025 boletín 28 Archivo.pdf', 2, '2025-04-15 17:03:48', '2025-04-15 17:03:48'),
	(1723, 'storage/documentos/requisicion/a4KXU2BOV9_REQUISICIÓN No.pdf', 'a4KXU2BOV9_REQUISICIÓN No.pdf', 1, '2025-04-15 17:05:11', '2025-04-15 17:05:11'),
	(1724, 'storage/documentos/memorandum/12beHSo2Cb_JURÍDICO memo-ca-se-0046-2025 se remite instructivo adj-inv-iee-005-2025 Normatividad-Eder.pdf', '12beHSo2Cb_JURÍDICO memo-ca-se-0046-2025 se remite instructivo adj-inv-iee-005-2025 Normatividad-Eder.pdf', 2, '2025-04-15 18:07:59', '2025-04-15 18:07:59'),
	(1725, 'storage/documentos/oficio/EppSjGeSo5_ARCHIVOS memo-004-25 se remiten datos bancarios para que se pueda realizar el pago corresp.pdf', 'EppSjGeSo5_ARCHIVOS memo-004-25 se remiten datos bancarios para que se pueda realizar el pago corresp.pdf', 3, '2025-04-15 20:17:40', '2025-04-15 20:17:40'),
	(1726, 'storage/documentos/memorandum/liY0OxDVFa_COMUNICACIÓN memo-099-2025 subir galería a l página web Archivo.pdf', 'liY0OxDVFa_COMUNICACIÓN memo-099-2025 subir galería a l página web Archivo.pdf', 2, '2025-04-16 20:19:41', '2025-04-16 20:19:41'),
	(1727, 'storage/documentos/memorandum/f1doVRWCDr_JURÍDICO memo-ca-se-0047-2025 se remite contrato para su observación aj corporativo consultores de gobierno s.pdf', 'f1doVRWCDr_JURÍDICO memo-ca-se-0047-2025 se remite contrato para su observación aj corporativo consultores de gobierno s.pdf', 2, '2025-04-16 20:21:26', '2025-04-16 20:21:26'),
	(1728, 'storage/documentos/escrito/xVLaONtM4R_OFICIALIA DE PARTES correo remite oficio- sabg-os-uvsea-drevp-251-2025 se solicita información Eder-Cuarto.pdf', 'xVLaONtM4R_OFICIALIA DE PARTES correo remite oficio- sabg-os-uvsea-drevp-251-2025 se solicita información Eder-Cuarto.pdf', 5, '2025-04-16 20:24:10', '2025-04-16 20:24:10'),
	(1729, 'storage/documentos/escrito/NEpZra5p6f_OFICIALIA DE PARTES correo remite oficio- sabg-os-uvsea-drevp-2515-2025 se solicita información Eder-Cuarto.pdf', 'NEpZra5p6f_OFICIALIA DE PARTES correo remite oficio- sabg-os-uvsea-drevp-2515-2025 se solicita información Eder-Cuarto.pdf', 5, '2025-04-16 20:26:40', '2025-04-16 20:26:40'),
	(1730, 'storage/documentos/escrito/MTawg1Q84o_OFICIALIA DE PARTES correo remite oficio- sabg-os-uvsea-drevp-2517-2025 se solicita información Eder-Cuarto.pdf', 'MTawg1Q84o_OFICIALIA DE PARTES correo remite oficio- sabg-os-uvsea-drevp-2517-2025 se solicita información Eder-Cuarto.pdf', 5, '2025-04-16 20:28:38', '2025-04-16 20:28:38'),
	(1731, 'storage/documentos/escrito/QaZFM9ui1C_OFICIALIA DE PARTES correo remite oficio- sabg-os-uvsea-drevp-2518-2025 se solicita información Eder-Cuarto.pdf', 'QaZFM9ui1C_OFICIALIA DE PARTES correo remite oficio- sabg-os-uvsea-drevp-2518-2025 se solicita información Eder-Cuarto.pdf', 5, '2025-04-16 20:30:15', '2025-04-16 20:30:15'),
	(1732, 'storage/documentos/requisicion/tt6TJyYNSD_REQUISICIÓN No.pdf', 'tt6TJyYNSD_REQUISICIÓN No.pdf', 1, '2025-04-16 20:31:48', '2025-04-16 20:31:48'),
	(1733, 'storage/documentos/requisicion/4b9S3lnJU1_REQUISICIÓN No.pdf', '4b9S3lnJU1_REQUISICIÓN No.pdf', 1, '2025-04-16 20:37:19', '2025-04-16 20:37:19'),
	(1734, 'storage/documentos/requisicion/Ugt7A0xsRk_REQUISICIÓN No.pdf', 'Ugt7A0xsRk_REQUISICIÓN No.pdf', 1, '2025-04-16 20:43:11', '2025-04-16 20:43:11'),
	(1735, 'storage/documentos/requisicion/MMa4iYMh5V_REQUISICIÓN No.pdf', 'MMa4iYMh5V_REQUISICIÓN No.pdf', 1, '2025-04-16 20:45:03', '2025-04-16 20:45:03'),
	(1736, 'storage/documentos/requisicion/bhJpdrNGxy_REQUISICIÓN No.pdf', 'bhJpdrNGxy_REQUISICIÓN No.pdf', 1, '2025-04-16 20:49:55', '2025-04-16 20:49:55'),
	(1737, 'storage/documentos/requisicion/thuJXD8lg8_REQUISICIÓN No.pdf', 'thuJXD8lg8_REQUISICIÓN No.pdf', 1, '2025-04-16 20:51:34', '2025-04-16 20:51:34'),
	(1738, 'storage/documentos/requisicion/Nh4AKRJpqy_REQUISICIÓN No.pdf', 'Nh4AKRJpqy_REQUISICIÓN No.pdf', 1, '2025-04-16 20:52:50', '2025-04-16 20:52:50'),
	(1739, 'storage/documentos/requisicion/kthGJFlMJ9_REQUISICIÓN No.pdf', 'kthGJFlMJ9_REQUISICIÓN No.pdf', 1, '2025-04-16 20:58:03', '2025-04-16 20:58:03'),
	(1740, 'storage/documentos/requisicion/Gb1Ab1K7O1_REQUISICIÓN No.pdf', 'Gb1Ab1K7O1_REQUISICIÓN No.pdf', 1, '2025-04-16 20:59:14', '2025-04-16 20:59:14'),
	(1741, 'storage/documentos/circular/vaKR6tncC5_SECRETARÍA circular conferencia prevención del acoso y hostigamiento laboral y sexual Miros-Coco.pdf', 'vaKR6tncC5_SECRETARÍA circular conferencia prevención del acoso y hostigamiento laboral y sexual Miros-Coco.pdf', 4, '2025-04-16 21:03:59', '2025-04-16 21:03:59'),
	(1742, 'storage/documentos/memorandum/aYRdHJ8q3J_CONTRALORÍA memo-221-2025 desincorporación órganos transitorios Eder-Daniel.pdf', 'aYRdHJ8q3J_CONTRALORÍA memo-221-2025 desincorporación órganos transitorios Eder-Daniel.pdf', 2, '2025-04-21 14:13:06', '2025-04-21 14:13:06'),
	(1743, 'storage/documentos/memorandum/JPrltzuk3W_PRERROGATIVAS memo-0346-2025 se remiten recibos originales de financiamiento p Saúl-Eder.pdf', 'JPrltzuk3W_PRERROGATIVAS memo-0346-2025 se remiten recibos originales de financiamiento p Saúl-Eder.pdf', 2, '2025-04-21 14:21:39', '2025-04-21 14:21:39'),
	(1744, 'storage/documentos/escrito/n3UwdxImDX_SECRETARÍA correo nueva marca de agua para documentos oficiales a expedir a todos el personal.pdf', 'n3UwdxImDX_SECRETARÍA correo nueva marca de agua para documentos oficiales a expedir a todos el personal.pdf', 5, '2025-04-21 14:35:07', '2025-04-21 14:35:07'),
	(1745, 'storage/documentos/requisicion/Izxf1jwtKP_REQUISICIÓN No.pdf', 'Izxf1jwtKP_REQUISICIÓN No.pdf', 1, '2025-04-21 15:32:33', '2025-04-21 15:32:33'),
	(1746, 'storage/documentos/requisicion/gYQT5O2tsR_REQUISICIÓN No.pdf', 'gYQT5O2tsR_REQUISICIÓN No.pdf', 1, '2025-04-21 15:33:43', '2025-04-21 15:33:43'),
	(1747, 'storage/documentos/requisicion/I3UWxtLG0O_REQUISICIÓN No.pdf', 'I3UWxtLG0O_REQUISICIÓN No.pdf', 1, '2025-04-21 15:35:38', '2025-04-21 15:35:38'),
	(1748, 'storage/documentos/requisicion/uqbpPW9Y4F_REQUISICIÓN No.pdf', 'uqbpPW9Y4F_REQUISICIÓN No.pdf', 1, '2025-04-21 15:40:12', '2025-04-21 15:40:12'),
	(1749, 'storage/documentos/requisicion/PdFduM5gfp_REQUISICIÓN No.pdf', 'PdFduM5gfp_REQUISICIÓN No.pdf', 1, '2025-04-21 15:42:20', '2025-04-21 15:42:20'),
	(1750, 'storage/documentos/requisicion/GNeLj545XC_REQUISICIÓN No.pdf', 'GNeLj545XC_REQUISICIÓN No.pdf', 1, '2025-04-21 16:05:13', '2025-04-21 16:05:13'),
	(1751, 'storage/documentos/memorandum/fjBEH2etcD_SECRETARÍA memo-1556-2025 se remite folio interno 1986 folio interno 1986 c.pdf', 'fjBEH2etcD_SECRETARÍA memo-1556-2025 se remite folio interno 1986 folio interno 1986 c.pdf', 2, '2025-04-21 16:09:25', '2025-04-21 16:09:25'),
	(1752, 'storage/documentos/escrito/7JEbmgv32U_UFD correo  reporte general asystec abril del 01 al 15-2025 Caro-Jorge.pdf', '7JEbmgv32U_UFD correo  reporte general asystec abril del 01 al 15-2025 Caro-Jorge.pdf', 5, '2025-04-21 16:11:25', '2025-04-21 16:11:25'),
	(1753, 'storage/documentos/requisicion/RNozEQn9Ae_REQUISICIÓN No.pdf', 'RNozEQn9Ae_REQUISICIÓN No.pdf', 1, '2025-04-21 18:35:24', '2025-04-21 18:35:24'),
	(1754, 'storage/documentos/requisicion/eUgiTRCtO5_REQUISICIÓN No.pdf', 'eUgiTRCtO5_REQUISICIÓN No.pdf', 1, '2025-04-21 18:39:55', '2025-04-21 18:39:55'),
	(1755, 'storage/documentos/requisicion/vn5DH8snYZ_REQUISICIÓN No.pdf', 'vn5DH8snYZ_REQUISICIÓN No.pdf', 1, '2025-04-21 18:42:00', '2025-04-21 18:42:00'),
	(1756, 'storage/documentos/requisicion/ul2KrTDGQo_REQUISICIÓN No.pdf', 'ul2KrTDGQo_REQUISICIÓN No.pdf', 1, '2025-04-21 18:48:32', '2025-04-21 18:48:32'),
	(1757, 'storage/documentos/requisicion/AhxRah0s9e_REQUISICIÓN No.pdf', 'AhxRah0s9e_REQUISICIÓN No.pdf', 1, '2025-04-21 18:52:21', '2025-04-21 18:52:21'),
	(1758, 'storage/documentos/memorandum/7dYhL34t3U_UFD memo-392-2025 se remite calificación de examen Cuarto.pdf', '7dYhL34t3U_UFD memo-392-2025 se remite calificación de examen Cuarto.pdf', 2, '2025-04-21 18:55:29', '2025-04-21 18:55:29'),
	(1759, 'storage/documentos/memorandum/jtgsLdcrZl_UFD memo-408-2025 se solicita desincorporación de personal Cuarto.pdf', 'jtgsLdcrZl_UFD memo-408-2025 se solicita desincorporación de personal Cuarto.pdf', 2, '2025-04-21 18:58:23', '2025-04-21 18:58:23'),
	(1760, 'storage/documentos/requisicion/DmYYOQykqA_REQUISICIÓN No.pdf', 'DmYYOQykqA_REQUISICIÓN No.pdf', 1, '2025-04-21 19:17:20', '2025-04-21 19:17:20'),
	(1761, 'storage/documentos/memorandum/MRb7y11BrL_JURÍDICO memo-ca-se-0049-2025 se remite contrato para firma corporativo consultores de gobierno s.pdf', 'MRb7y11BrL_JURÍDICO memo-ca-se-0049-2025 se remite contrato para firma corporativo consultores de gobierno s.pdf', 2, '2025-04-21 19:19:47', '2025-04-21 19:19:47'),
	(1762, 'storage/documentos/requisicion/LiElwECB5A_REQUISICIÓN No.pdf', 'LiElwECB5A_REQUISICIÓN No.pdf', 1, '2025-04-21 20:22:13', '2025-04-21 20:22:13'),
	(1763, 'storage/documentos/requisicion/zivKFWA3UW_REQUISICIÓN No.pdf', 'zivKFWA3UW_REQUISICIÓN No.pdf', 1, '2025-04-21 20:24:10', '2025-04-21 20:24:10'),
	(1764, 'storage/documentos/memorandum/1byUEUrm8T_SECRETARÍA memo-1560-2025 se autoriza certificación Eder.pdf', '1byUEUrm8T_SECRETARÍA memo-1560-2025 se autoriza certificación Eder.pdf', 2, '2025-04-21 20:30:22', '2025-04-21 20:30:22'),
	(1765, 'storage/documentos/requisicion/WD8zz2tqma_REQUISICIÓN No.pdf', 'WD8zz2tqma_REQUISICIÓN No.pdf', 1, '2025-04-21 21:01:54', '2025-04-21 21:01:54'),
	(1766, 'storage/documentos/requisicion/cowzne9hMF_REQUISICIÓN No.pdf', 'cowzne9hMF_REQUISICIÓN No.pdf', 1, '2025-04-21 21:03:23', '2025-04-21 21:03:23'),
	(1767, 'storage/documentos/requisicion/Z5Y9qHAkt0_REQUISICIÓN No.pdf', 'Z5Y9qHAkt0_REQUISICIÓN No.pdf', 1, '2025-04-21 21:14:34', '2025-04-21 21:14:34'),
	(1768, 'storage/documentos/memorandum/yfSYycAkip_CONTRALORÍA memo-228-2025 hojas de trabajo mes de enero de 2025 Eder-Miroslava.pdf', 'yfSYycAkip_CONTRALORÍA memo-228-2025 hojas de trabajo mes de enero de 2025 Eder-Miroslava.pdf', 2, '2025-04-22 14:11:45', '2025-04-22 14:11:45'),
	(1769, 'storage/documentos/circular/4RQ5BSXTDj_SECRETARÍA circular-057-2025 colecta nacional 2025 cruz roja mexicana a todo el personal.pdf', '4RQ5BSXTDj_SECRETARÍA circular-057-2025 colecta nacional 2025 cruz roja mexicana a todo el personal.pdf', 4, '2025-04-22 14:16:11', '2025-04-22 14:16:11'),
	(1770, 'storage/documentos/circular/cmsR4FyuQW_PLANEACIÓN circular-spe-009-2025 reporte mensual hallazgos evaluación progr.pdf', 'cmsR4FyuQW_PLANEACIÓN circular-spe-009-2025 reporte mensual hallazgos evaluación progr.pdf', 4, '2025-04-22 14:19:27', '2025-04-22 14:19:27'),
	(1771, 'storage/documentos/memorandum/ZNPAzrq9mM_SECRETARÍA memo-1562-2025se autoriza certificación Normatividad.pdf', 'ZNPAzrq9mM_SECRETARÍA memo-1562-2025se autoriza certificación Normatividad.pdf', 2, '2025-04-22 14:21:46', '2025-04-22 14:21:46'),
	(1772, 'storage/documentos/requisicion/R4rJKVWHS4_REQUISICIÓN No.pdf', 'R4rJKVWHS4_REQUISICIÓN No.pdf', 1, '2025-04-22 15:09:28', '2025-04-22 15:09:28'),
	(1773, 'storage/documentos/requisicion/j60gs8f1O0_REQUISICIÓN No.pdf', 'j60gs8f1O0_REQUISICIÓN No.pdf', 1, '2025-04-22 15:13:58', '2025-04-22 15:13:58'),
	(1774, 'storage/documentos/memorandum/AQCUjlbAc5_SECRETARÍA memo-1562-2025se autoriza certificación Normatividad.pdf', 'AQCUjlbAc5_SECRETARÍA memo-1562-2025se autoriza certificación Normatividad.pdf', 2, '2025-04-22 15:16:43', '2025-04-22 15:16:43'),
	(1775, 'storage/documentos/memorandum/UF63wa9Jf2_UFD memo-411-2025 se solicita alta de personal Cuarto.pdf', 'UF63wa9Jf2_UFD memo-411-2025 se solicita alta de personal Cuarto.pdf', 2, '2025-04-22 15:28:30', '2025-04-22 15:28:30'),
	(1776, 'storage/documentos/memorandum/6z036UcHGD_JURÍDICO memo-ca-se-0050-2025 se remite contrato para resguardo corporativo consultores Normatividad-Eder.pdf', '6z036UcHGD_JURÍDICO memo-ca-se-0050-2025 se remite contrato para resguardo corporativo consultores Normatividad-Eder.pdf', 2, '2025-04-22 16:44:11', '2025-04-22 16:44:11'),
	(1777, 'storage/documentos/memorandum/tYnfqYan4b_PRESIDENCIA memo-je-077-2025 se convoca a sesión ordinaria de junta ejecutiva Eder-Normatividad.pdf', 'tYnfqYan4b_PRESIDENCIA memo-je-077-2025 se convoca a sesión ordinaria de junta ejecutiva Eder-Normatividad.pdf', 2, '2025-04-22 17:19:28', '2025-04-22 17:19:28'),
	(1778, 'storage/documentos/requisicion/D4bmDmdtCR_REQUISICIÓN No.pdf', 'D4bmDmdtCR_REQUISICIÓN No.pdf', 1, '2025-04-22 17:25:47', '2025-04-22 17:25:47'),
	(1779, 'storage/documentos/requisicion/Or5khCSAO8_REQUISICIÓN No.pdf', 'Or5khCSAO8_REQUISICIÓN No.pdf', 1, '2025-04-22 17:30:38', '2025-04-22 17:30:38'),
	(1780, 'storage/documentos/memorandum/FQx0LFNCM9_SECRETARÍA memo-ca-p-0285-2025 reanudación sesión adquisiciones Eder-Normatividad.pdf', 'FQx0LFNCM9_SECRETARÍA memo-ca-p-0285-2025 reanudación sesión adquisiciones Eder-Normatividad.pdf', 2, '2025-04-22 17:33:06', '2025-04-22 17:33:06'),
	(1781, 'storage/documentos/memorandum/J261TnMUza_SECRETARÍA memo-ca-p-0297-2025 reanudación sesión de adquiciciones Eder-Normatividad.pdf', 'J261TnMUza_SECRETARÍA memo-ca-p-0297-2025 reanudación sesión de adquiciciones Eder-Normatividad.pdf', 2, '2025-04-22 17:34:57', '2025-04-22 17:34:57'),
	(1782, 'storage/documentos/requisicion/XRrLkyjhP5_REQUISICIÓN No.pdf', 'XRrLkyjhP5_REQUISICIÓN No.pdf', 1, '2025-04-22 18:24:49', '2025-04-22 18:24:49'),
	(1783, 'storage/documentos/memorandum/kbDqvCpTa4_JURÍDICO memo-0945-2025 se remiten convenios para su resguardo Normatividad.pdf', 'kbDqvCpTa4_JURÍDICO memo-0945-2025 se remiten convenios para su resguardo Normatividad.pdf', 2, '2025-04-23 14:38:47', '2025-04-23 14:38:47'),
	(1784, 'storage/documentos/escrito/u5svnCSlol_OFICIALIA DE PARTES correo folio 2011 escrito c.pdf', 'u5svnCSlol_OFICIALIA DE PARTES correo folio 2011 escrito c.pdf', 5, '2025-04-23 14:42:15', '2025-04-23 14:42:15'),
	(1785, 'storage/documentos/requisicion/TE2GzaTevh_REQUISICIÓN No.pdf', 'TE2GzaTevh_REQUISICIÓN No.pdf', 1, '2025-04-23 14:43:34', '2025-04-23 14:43:34'),
	(1786, 'storage/documentos/memorandum/uYYAmhrGEa_PRESIDENCIA memo-1056-2025 ministración abril Eder-Saúl.pdf', 'uYYAmhrGEa_PRESIDENCIA memo-1056-2025 ministración abril Eder-Saúl.pdf', 2, '2025-04-23 17:34:58', '2025-04-23 17:34:58'),
	(1787, 'storage/documentos/memorandum/urZeJbL5gD_PRERROGATIVAS memo-0352-2025 se infroma suplente representante del Pan Eder-Saúl.pdf', 'urZeJbL5gD_PRERROGATIVAS memo-0352-2025 se infroma suplente representante del Pan Eder-Saúl.pdf', 2, '2025-04-23 17:36:42', '2025-04-23 17:36:42'),
	(1788, 'storage/documentos/requisicion/V18sdVzqzf_REQUISICIÓN No.pdf', 'V18sdVzqzf_REQUISICIÓN No.pdf', 1, '2025-04-23 17:37:47', '2025-04-23 17:37:47'),
	(1789, 'storage/documentos/requisicion/9IXUn3orxs_REQUISICIÓN No.pdf', '9IXUn3orxs_REQUISICIÓN No.pdf', 1, '2025-04-23 17:39:51', '2025-04-23 17:39:51'),
	(1790, 'storage/documentos/memorandum/5IiT4XvlUm_DOE memo-303-2025 baja de mobiliario Daniel.pdf', '5IiT4XvlUm_DOE memo-303-2025 baja de mobiliario Daniel.pdf', 2, '2025-04-23 19:07:47', '2025-04-23 19:07:47'),
	(1791, 'storage/documentos/memorandum/yiS4au2EJg_INFORMÁTICA memo-068-2025  baja de personal Eder-Cuarto.pdf', 'yiS4au2EJg_INFORMÁTICA memo-068-2025  baja de personal Eder-Cuarto.pdf', 2, '2025-04-23 19:09:15', '2025-04-23 19:09:15'),
	(1792, 'storage/documentos/memorandum/7M8TBPvBkW_SECRETARÍA memo-ca-p-0312-2025 se convoca a sesión ordinaria del comité de adqui Normatividad-Eder.pdf', '7M8TBPvBkW_SECRETARÍA memo-ca-p-0312-2025 se convoca a sesión ordinaria del comité de adqui Normatividad-Eder.pdf', 2, '2025-04-23 19:10:53', '2025-04-23 19:10:53'),
	(1793, 'storage/documentos/memorandum/IweM7K5EHn_JURÍDICO memo-ca-se-0054-2025 se remite instructivo adj-inv-iee-007-2025.pdf', 'IweM7K5EHn_JURÍDICO memo-ca-se-0054-2025 se remite instructivo adj-inv-iee-007-2025.pdf', 2, '2025-04-24 13:39:27', '2025-04-24 13:39:27'),
	(1794, 'storage/documentos/memorandum/s1gTAZU1sL_JURÍDICO memo-c-se-0052-2025 se remite instructivo adj-inv-iee-006-2025.pdf', 's1gTAZU1sL_JURÍDICO memo-c-se-0052-2025 se remite instructivo adj-inv-iee-006-2025.pdf', 2, '2025-04-24 13:43:15', '2025-04-24 13:43:15'),
	(1795, 'storage/documentos/oficio/hPuYcuOWwA_PRESIDENCIA oficio-0401-2025 entrega de información en respuesta al oficio aegf-2553-2025 Eder- Archivo.pdf', 'hPuYcuOWwA_PRESIDENCIA oficio-0401-2025 entrega de información en respuesta al oficio aegf-2553-2025 Eder- Archivo.pdf', 3, '2025-04-24 13:58:56', '2025-04-24 13:58:56'),
	(1796, 'storage/documentos/requisicion/H7gujVaIGc_REQUISICIÓN No.pdf', 'H7gujVaIGc_REQUISICIÓN No.pdf', 1, '2025-04-24 14:18:30', '2025-04-24 14:18:30'),
	(1797, 'storage/documentos/requisicion/SNWGegRGaV_REQUISICIÓN No.pdf', 'SNWGegRGaV_REQUISICIÓN No.pdf', 1, '2025-04-24 14:19:50', '2025-04-24 14:19:50'),
	(1798, 'storage/documentos/requisicion/caRdIlasLz_REQUISICIÓN No.pdf', 'caRdIlasLz_REQUISICIÓN No.pdf', 1, '2025-04-24 14:22:31', '2025-04-24 14:22:31'),
	(1799, 'storage/documentos/requisicion/LJuh4UOLmU_REQUISICIÓN No.pdf', 'LJuh4UOLmU_REQUISICIÓN No.pdf', 1, '2025-04-24 14:24:46', '2025-04-24 14:24:46'),
	(1800, 'storage/documentos/requisicion/MFKMZ0Acv2_REQUISICIÓN No.pdf', 'MFKMZ0Acv2_REQUISICIÓN No.pdf', 1, '2025-04-24 14:33:33', '2025-04-24 14:33:33'),
	(1801, 'storage/documentos/memorandum/q7KVN1mh0J_SECRETARÍA memo-ca-p-0324-2025 se cnvoca a sesión ordinaria de adquisiciones Normatividad Eder.pdf', 'q7KVN1mh0J_SECRETARÍA memo-ca-p-0324-2025 se cnvoca a sesión ordinaria de adquisiciones Normatividad Eder.pdf', 2, '2025-04-24 15:26:30', '2025-04-24 15:26:30'),
	(1802, 'storage/documentos/memorandum/jVo4fYQgCF_UFD memo-418-2025 se solicita alta de personal Cuarto.pdf', 'jVo4fYQgCF_UFD memo-418-2025 se solicita alta de personal Cuarto.pdf', 2, '2025-04-24 15:47:53', '2025-04-24 15:47:53'),
	(1803, 'storage/documentos/memorandum/VLx1PJO5XH_COMUNICACIÓN memo-102-2025 boletín 29 Archivo.pdf', 'VLx1PJO5XH_COMUNICACIÓN memo-102-2025 boletín 29 Archivo.pdf', 2, '2025-04-24 16:55:40', '2025-04-24 16:55:40'),
	(1804, 'storage/documentos/memorandum/B11xLE2FEh_CONTRALORÍA a.pdf', 'B11xLE2FEh_CONTRALORÍA a.pdf', 2, '2025-04-24 16:58:30', '2025-04-24 16:58:30'),
	(1805, 'storage/documentos/memorandum/p8KSvSMv1C_JURÍDICO memo-ca-se-0056-2025 se remite instructivo adj-inv-iee-006-2025 Eder-Normatividad.pdf', 'p8KSvSMv1C_JURÍDICO memo-ca-se-0056-2025 se remite instructivo adj-inv-iee-006-2025 Eder-Normatividad.pdf', 2, '2025-04-24 17:00:30', '2025-04-24 17:00:30'),
	(1806, 'storage/documentos/memorandum/hcyY9gu81S_JURÍDICO memo-ca-se-0057-2025 se remite instructivo adj-inv-iee-007-2025 Eder-Normatividad.pdf', 'hcyY9gu81S_JURÍDICO memo-ca-se-0057-2025 se remite instructivo adj-inv-iee-007-2025 Eder-Normatividad.pdf', 2, '2025-04-24 17:01:57', '2025-04-24 17:01:57'),
	(1807, 'storage/documentos/requisicion/2lJtyEkDei_REQUISICIÓN No.pdf', '2lJtyEkDei_REQUISICIÓN No.pdf', 1, '2025-04-24 17:18:19', '2025-04-24 17:18:19'),
	(1808, 'storage/documentos/requisicion/RnM4mSYrwf_REQUISICIÓN No.pdf', 'RnM4mSYrwf_REQUISICIÓN No.pdf', 1, '2025-04-24 17:23:31', '2025-04-24 17:23:31'),
	(1809, 'storage/documentos/memorandum/fBQoAgHFFj_SECRETARÍA memo-ca-p-0336-2025 se convoca a sesión ordinaria de adquisiciones Eder-Normatividad.pdf', 'fBQoAgHFFj_SECRETARÍA memo-ca-p-0336-2025 se convoca a sesión ordinaria de adquisiciones Eder-Normatividad.pdf', 2, '2025-04-24 17:25:15', '2025-04-24 17:25:15'),
	(1810, 'storage/documentos/memorandum/EpuiJNtoiX_SECRETARÍA memo-ca-p-0348-2025 se convoca a sesión ordinaria de adquisiciones Eder-Normatividad.pdf', 'EpuiJNtoiX_SECRETARÍA memo-ca-p-0348-2025 se convoca a sesión ordinaria de adquisiciones Eder-Normatividad.pdf', 2, '2025-04-24 17:29:30', '2025-04-24 17:29:30'),
	(1811, 'storage/documentos/requisicion/kgFdFHejBb_REQUISICIÓN No.pdf', 'kgFdFHejBb_REQUISICIÓN No.pdf', 1, '2025-04-24 20:23:27', '2025-04-24 20:23:27'),
	(1812, 'storage/documentos/memorandum/dOEmJnJvkX_ARCHIVOS memo-dar-004-25 se convoca a sesión ordinaria del grupo interdisciplinario Eder-Lic.pdf', 'dOEmJnJvkX_ARCHIVOS memo-dar-004-25 se convoca a sesión ordinaria del grupo interdisciplinario Eder-Lic.pdf', 2, '2025-04-24 20:29:31', '2025-04-24 20:29:31'),
	(1813, 'storage/documentos/memorandum/aSnjilu23k_CONSEJERA EVANGELINA memo-copead-004-2025 se convoca a sesión de copead Eder-Noratividad.pdf', 'aSnjilu23k_CONSEJERA EVANGELINA memo-copead-004-2025 se convoca a sesión de copead Eder-Noratividad.pdf', 2, '2025-04-24 20:32:04', '2025-04-24 20:32:04'),
	(1814, 'storage/documentos/memorandum/S1Sgjlopjq_DOE memo-306-2025 baja mobiliario Materiales.pdf', 'S1Sgjlopjq_DOE memo-306-2025 baja mobiliario Materiales.pdf', 2, '2025-04-24 20:35:12', '2025-04-24 20:35:12'),
	(1815, 'storage/documentos/circular/PPXngCbDLF_PLANEACIÓN circular-010-2025 solicitud de información para integrar la memoria electoral Eder-Emir.pdf', 'PPXngCbDLF_PLANEACIÓN circular-010-2025 solicitud de información para integrar la memoria electoral Eder-Emir.pdf', 4, '2025-04-24 20:39:17', '2025-04-24 20:39:17'),
	(1816, 'storage/documentos/memorandum/H2HvHJ0Vqo_DOE memo-308-2025 remisión de sellos Daniel.pdf', 'H2HvHJ0Vqo_DOE memo-308-2025 remisión de sellos Daniel.pdf', 2, '2025-04-25 14:47:46', '2025-04-25 14:47:46'),
	(1817, 'storage/documentos/memorandum/fLvX8q42Pz_JURÍDICO memo-ca-se-0058-2025 se remite instructivo adj-inv-008-2025.pdf', 'fLvX8q42Pz_JURÍDICO memo-ca-se-0058-2025 se remite instructivo adj-inv-008-2025.pdf', 2, '2025-04-25 15:55:16', '2025-04-25 15:55:16'),
	(1818, 'storage/documentos/oficio/kzoKaG8TXi_PRESIDENCIA oficio-0399-2025 ministración de abril Emir Archivo.pdf', 'kzoKaG8TXi_PRESIDENCIA oficio-0399-2025 ministración de abril Emir Archivo.pdf', 3, '2025-04-25 16:43:23', '2025-04-25 16:43:23'),
	(1819, 'storage/documentos/oficio/n8jWrNzrGp_PRESIDENCIA oficio-0399-2025 ministración de abril Emir Archivo.pdf', 'n8jWrNzrGp_PRESIDENCIA oficio-0399-2025 ministración de abril Emir Archivo.pdf', 3, '2025-04-25 16:48:34', '2025-04-25 16:48:34'),
	(1820, 'storage/documentos/circular/M0Z4tzDg5c_SECRETARÍA circular-001-2025 conv.pdf', 'M0Z4tzDg5c_SECRETARÍA circular-001-2025 conv.pdf', 4, '2025-04-25 16:55:03', '2025-04-25 16:55:03'),
	(1821, 'storage/documentos/memorandum/VIwW32ilmG_SECRETARÍA memo-001-2025 convocatoria a la primera sesión ordi grupo trabajo admpon riesgos Lic.pdf', 'VIwW32ilmG_SECRETARÍA memo-001-2025 convocatoria a la primera sesión ordi grupo trabajo admpon riesgos Lic.pdf', 2, '2025-04-25 16:59:04', '2025-04-25 16:59:04'),
	(1822, 'storage/documentos/memorandum/ur8JINsPfT_JURÍDICO memo-0957-2025 se remiten renuncias Eder-Cuarto.pdf', 'ur8JINsPfT_JURÍDICO memo-0957-2025 se remiten renuncias Eder-Cuarto.pdf', 2, '2025-04-25 20:27:20', '2025-04-25 20:27:20'),
	(1823, 'storage/documentos/memorandum/bGKesxqOPY_PRERROGATIVAS memo-0361-2025 se solicita aperturar sistemas nformáticos Archivo.pdf', 'bGKesxqOPY_PRERROGATIVAS memo-0361-2025 se solicita aperturar sistemas nformáticos Archivo.pdf', 2, '2025-04-25 20:47:05', '2025-04-25 20:47:05'),
	(1824, 'storage/documentos/escrito/eDTKK4Wvrf_ARCHIVOS correo sesión grupo interdisciplinario Eder.pdf', 'eDTKK4Wvrf_ARCHIVOS correo sesión grupo interdisciplinario Eder.pdf', 5, '2025-04-28 16:27:24', '2025-04-28 16:27:24'),
	(1825, 'storage/documentos/memorandum/Xss5HqOhKM_ARCHIVOS memo-126-25 cédula de verificación-DA Ale-Eder.pdf', 'Xss5HqOhKM_ARCHIVOS memo-126-25 cédula de verificación-DA Ale-Eder.pdf', 2, '2025-04-28 16:38:11', '2025-04-28 16:38:11'),
	(1826, 'storage/documentos/circular/k0OThKqqNX_PLANEACIÓN memo-011-2005 reporte del sistema de evalución del desempeño primer trimestre Emir.pdf', 'k0OThKqqNX_PLANEACIÓN memo-011-2005 reporte del sistema de evalución del desempeño primer trimestre Emir.pdf', 4, '2025-04-28 16:42:17', '2025-04-28 16:42:17'),
	(1827, 'storage/documentos/memorandum/NzPP88Jkx9_PRERROGATIVAS memo-0365-2025  se solicita se solicita sea efectuado el pago de financiaiento 28-04-2025 Eder-Saúl.pdf', 'NzPP88Jkx9_PRERROGATIVAS memo-0365-2025  se solicita se solicita sea efectuado el pago de financiaiento 28-04-2025 Eder-Saúl.pdf', 2, '2025-04-28 16:43:59', '2025-04-28 16:43:59'),
	(1828, 'storage/documentos/requisicion/6k46iAu7a4_REQUISICIÓN No.pdf', '6k46iAu7a4_REQUISICIÓN No.pdf', 1, '2025-04-28 18:34:29', '2025-04-28 18:34:29'),
	(1829, 'storage/documentos/circular/z7IkvKNdo2_CONSEJERA SUSANA circular-001-2025 invitación a actividad acciones afirmativas Daniel-Eder-Luis-Itzel.pdf', 'z7IkvKNdo2_CONSEJERA SUSANA circular-001-2025 invitación a actividad acciones afirmativas Daniel-Eder-Luis-Itzel.pdf', 4, '2025-04-28 19:02:42', '2025-04-28 19:02:42'),
	(1830, 'storage/documentos/memorandum/7biquE554e_CONSEJERO ARTURO memo-005-2025, justificación de asistrencia en sesión copead Normatividad.pdf', '7biquE554e_CONSEJERO ARTURO memo-005-2025, justificación de asistrencia en sesión copead Normatividad.pdf', 2, '2025-04-28 19:05:01', '2025-04-28 19:05:01'),
	(1831, 'storage/documentos/memorandum/p5ByAJj7X5_INFORMÁTICA memo-070-2025 sistemas informáticos Archivo.pdf', 'p5ByAJj7X5_INFORMÁTICA memo-070-2025 sistemas informáticos Archivo.pdf', 2, '2025-04-28 19:09:05', '2025-04-28 19:09:05'),
	(1832, 'storage/documentos/requisicion/zCiGabJOfx_REQUISICIÓN No.pdf', 'zCiGabJOfx_REQUISICIÓN No.pdf', 1, '2025-04-28 19:59:40', '2025-04-28 19:59:40'),
	(1833, 'storage/documentos/requisicion/2PU6wFD1F7_REQUISICIÓN No.pdf', '2PU6wFD1F7_REQUISICIÓN No.pdf', 1, '2025-04-28 20:17:01', '2025-04-28 20:17:01'),
	(1834, 'storage/documentos/memorandum/U6zP8KDP9g_CONSEJERA SUSANA memo-003-2025 se solicita material e insumos Daniel.pdf', 'U6zP8KDP9g_CONSEJERA SUSANA memo-003-2025 se solicita material e insumos Daniel.pdf', 2, '2025-04-29 14:43:56', '2025-04-29 14:43:56'),
	(1835, 'storage/documentos/memorandum/cyI8Xcbx87_JURÍDICO memo-0098bis-2025 se remite contrato para firma josé hanan Normatividad-Eder.pdf', 'cyI8Xcbx87_JURÍDICO memo-0098bis-2025 se remite contrato para firma josé hanan Normatividad-Eder.pdf', 2, '2025-04-29 21:40:38', '2025-04-29 21:40:38'),
	(1836, 'storage/documentos/memorandum/oSy4f7BThH_JURÍDICO memo-0979-2025 se solicita información Eder-Daniel.pdf', 'oSy4f7BThH_JURÍDICO memo-0979-2025 se solicita información Eder-Daniel.pdf', 2, '2025-04-29 21:50:33', '2025-04-29 21:50:33'),
	(1837, 'storage/documentos/memorandum/qKVYYAmi5h_JURÍDICO memo-ca-se-0001bis-2025 se remite contrato para firma hanan badry Normatividad-Eder.pdf', 'qKVYYAmi5h_JURÍDICO memo-ca-se-0001bis-2025 se remite contrato para firma hanan badry Normatividad-Eder.pdf', 2, '2025-04-29 21:57:46', '2025-04-29 21:57:46'),
	(1838, 'storage/documentos/escrito/P7YnOHmYro_PLANEACIÓN correo-abreviaturas-platilla word Emir-Eder.pdf', 'P7YnOHmYro_PLANEACIÓN correo-abreviaturas-platilla word Emir-Eder.pdf', 5, '2025-04-29 21:59:19', '2025-04-29 21:59:19'),
	(1839, 'storage/documentos/requisicion/hIHDuuuMRs_REQUISICIÓN No.pdf', 'hIHDuuuMRs_REQUISICIÓN No.pdf', 1, '2025-04-29 22:01:45', '2025-04-29 22:01:45'),
	(1840, 'storage/documentos/requisicion/YqVNAOMzbh_REQUISICIÓN No.pdf', 'YqVNAOMzbh_REQUISICIÓN No.pdf', 1, '2025-04-29 22:03:26', '2025-04-29 22:03:26'),
	(1841, 'storage/documentos/requisicion/rmssx2rOut_REQUISICIÓN No.pdf', 'rmssx2rOut_REQUISICIÓN No.pdf', 1, '2025-04-29 22:04:43', '2025-04-29 22:04:43'),
	(1842, 'storage/documentos/requisicion/xbDNxfdSeJ_REQUISICIÓN No.pdf', 'xbDNxfdSeJ_REQUISICIÓN No.pdf', 1, '2025-04-29 22:07:46', '2025-04-29 22:07:46'),
	(1843, 'storage/documentos/requisicion/Ic2S8jrmpn_REQUISICIÓN No.pdf', 'Ic2S8jrmpn_REQUISICIÓN No.pdf', 1, '2025-04-30 14:29:19', '2025-04-30 14:29:19'),
	(1844, 'storage/documentos/requisicion/kqpB0CAbv8_REQUISICIÓN No.pdf', 'kqpB0CAbv8_REQUISICIÓN No.pdf', 1, '2025-04-30 14:59:40', '2025-04-30 14:59:40'),
	(1845, 'storage/documentos/requisicion/KwIrhIv84L_REQUISICIÓN No.pdf', 'KwIrhIv84L_REQUISICIÓN No.pdf', 1, '2025-04-30 15:04:48', '2025-04-30 15:04:48'),
	(1846, 'storage/documentos/requisicion/3nxslrp4Ti_REQUISICIÓN No.pdf', '3nxslrp4Ti_REQUISICIÓN No.pdf', 1, '2025-04-30 15:46:16', '2025-04-30 15:46:16'),
	(1847, 'storage/documentos/requisicion/pNk28hMDSt_REQUISICIÓN No.pdf', 'pNk28hMDSt_REQUISICIÓN No.pdf', 1, '2025-04-30 15:48:59', '2025-04-30 15:48:59'),
	(1848, 'storage/documentos/requisicion/NlDGr5bgM5_REQUISICIÓN No.pdf', 'NlDGr5bgM5_REQUISICIÓN No.pdf', 1, '2025-04-30 15:57:19', '2025-04-30 15:57:19'),
	(1849, 'storage/documentos/requisicion/Dace28maQr_REQUISICIÓN No.pdf', 'Dace28maQr_REQUISICIÓN No.pdf', 1, '2025-04-30 16:03:17', '2025-04-30 16:03:17'),
	(1850, 'storage/documentos/requisicion/iGBaOL9Fhf_REQUISICIÓN No.pdf', 'iGBaOL9Fhf_REQUISICIÓN No.pdf', 1, '2025-04-30 16:35:53', '2025-04-30 16:35:53'),
	(1851, 'storage/documentos/requisicion/9Aprv8JAf5_REQUISICIÓN No.pdf', '9Aprv8JAf5_REQUISICIÓN No.pdf', 1, '2025-04-30 16:37:53', '2025-04-30 16:37:53'),
	(1852, 'storage/documentos/requisicion/i7DT4Q8DvE_REQUISICIÓN No.pdf', 'i7DT4Q8DvE_REQUISICIÓN No.pdf', 1, '2025-04-30 16:39:49', '2025-04-30 16:39:49'),
	(1853, 'storage/documentos/requisicion/GElloutdtV_REQUISICIÓN No.pdf', 'GElloutdtV_REQUISICIÓN No.pdf', 1, '2025-04-30 16:50:33', '2025-04-30 16:50:33'),
	(1854, 'storage/documentos/requisicion/Dj0VJ751bK_REQUISICIÓN No.pdf', 'Dj0VJ751bK_REQUISICIÓN No.pdf', 1, '2025-04-30 16:53:47', '2025-04-30 16:53:47'),
	(1855, 'storage/documentos/requisicion/5WA9iEL4bR_REQUISICIÓN No.pdf', '5WA9iEL4bR_REQUISICIÓN No.pdf', 1, '2025-04-30 17:43:44', '2025-04-30 17:43:44'),
	(1856, 'storage/documentos/requisicion/GqsX6fNAqx_REQUISICIÓN No.pdf', 'GqsX6fNAqx_REQUISICIÓN No.pdf', 1, '2025-04-30 17:45:53', '2025-04-30 17:45:53'),
	(1857, 'storage/documentos/memorandum/aweqC2vT1G_COMUNICACIÓN memo-110-2025 boletín 32 Archivo.pdf', 'aweqC2vT1G_COMUNICACIÓN memo-110-2025 boletín 32 Archivo.pdf', 2, '2025-05-07 17:08:07', '2025-05-07 17:08:07'),
	(1858, 'storage/documentos/requisicion/oIqqx1rRqz_REQUISICIÓN No.pdf', 'oIqqx1rRqz_REQUISICIÓN No.pdf', 1, '2025-05-08 15:34:29', '2025-05-08 15:34:29'),
	(1859, 'storage/documentos/circular/InLIM7T7hP_COMUNICACIÓN circular-05-2025 cobertura de eventos Luis.pdf', 'InLIM7T7hP_COMUNICACIÓN circular-05-2025 cobertura de eventos Luis.pdf', 4, '2025-05-08 15:42:22', '2025-05-08 15:42:22'),
	(1860, 'storage/documentos/circular/5rbayem1o7_CONTRALORÍA circular-004-2025 recordatorio para presentar la declaración patrimonial a todo el personal.pdf', '5rbayem1o7_CONTRALORÍA circular-004-2025 recordatorio para presentar la declaración patrimonial a todo el personal.pdf', 4, '2025-05-08 15:51:12', '2025-05-08 15:51:12'),
	(1861, 'storage/documentos/memorandum/bgCEJRi0Uf_CONTRALORÍA memo-261-2025 Devolución de 1 bien Daniel.pdf', 'bgCEJRi0Uf_CONTRALORÍA memo-261-2025 Devolución de 1 bien Daniel.pdf', 2, '2025-05-08 16:00:39', '2025-05-08 16:00:39'),
	(1862, 'storage/documentos/circular/sHxWm2ftNv_DTS circular-011-2025 temas a considerar a junta ejecutiva Normatividad-Eder.pdf', 'sHxWm2ftNv_DTS circular-011-2025 temas a considerar a junta ejecutiva Normatividad-Eder.pdf', 4, '2025-05-08 16:04:12', '2025-05-08 16:04:12'),
	(1863, 'storage/documentos/circular/YOANvFW1P1_DTS circular-012-2025 asunta a someter a consejo general Eder-Normatividad.pdf', 'YOANvFW1P1_DTS circular-012-2025 asunta a someter a consejo general Eder-Normatividad.pdf', 4, '2025-05-08 16:07:23', '2025-05-08 16:07:23'),
	(1864, 'storage/documentos/memorandum/fooX5rTxkY_IGUALDAD memo-124-2025 realizar actualizaciones en el diseño Archivo.pdf', 'fooX5rTxkY_IGUALDAD memo-124-2025 realizar actualizaciones en el diseño Archivo.pdf', 2, '2025-05-08 16:16:26', '2025-05-08 16:16:26'),
	(1865, 'storage/documentos/memorandum/5wWD2ugN4t_JURÍDICO memo-0099bis-2025 se remite contrato para resguardo josé asef hanan Eder-Normatividad.pdf', '5wWD2ugN4t_JURÍDICO memo-0099bis-2025 se remite contrato para resguardo josé asef hanan Eder-Normatividad.pdf', 2, '2025-05-08 16:20:51', '2025-05-08 16:20:51'),
	(1866, 'storage/documentos/memorandum/clxRIrirgX_JURÍDICO memo-ca-se-001ter-2025 se remite contrato para resgusrdo jose asef janan Eder-Normatividad.pdf', 'clxRIrirgX_JURÍDICO memo-ca-se-001ter-2025 se remite contrato para resgusrdo jose asef janan Eder-Normatividad.pdf', 2, '2025-05-08 16:23:59', '2025-05-08 16:23:59'),
	(1867, 'storage/documentos/requisicion/TLEzuFR7pN_REQUISICIÓN No 1129.pdf', 'TLEzuFR7pN_REQUISICIÓN No 1129.pdf', 1, '2025-05-08 16:31:05', '2025-05-08 16:31:05'),
	(1868, 'storage/documentos/requisicion/LmDwCkvmyX_REQUISICIÓN No.pdf', 'LmDwCkvmyX_REQUISICIÓN No.pdf', 1, '2025-05-08 16:35:31', '2025-05-08 16:35:31'),
	(1869, 'storage/documentos/requisicion/iMkCVKPPJ3_REQUISICIÓN No.pdf', 'iMkCVKPPJ3_REQUISICIÓN No.pdf', 1, '2025-05-08 16:39:24', '2025-05-08 16:39:24'),
	(1870, 'storage/documentos/requisicion/ocHknT634n_REQUISICIÓN No.pdf', 'ocHknT634n_REQUISICIÓN No.pdf', 1, '2025-05-08 16:43:26', '2025-05-08 16:43:26'),
	(1871, 'storage/documentos/requisicion/VTjI89jY0c_REQUISICIÓN No.pdf', 'VTjI89jY0c_REQUISICIÓN No.pdf', 1, '2025-05-08 16:46:23', '2025-05-08 16:46:23'),
	(1872, 'storage/documentos/requisicion/aFu8DSjBnb_REQUISICIÓN No.pdf', 'aFu8DSjBnb_REQUISICIÓN No.pdf', 1, '2025-05-08 16:48:09', '2025-05-08 16:48:09'),
	(1873, 'storage/documentos/requisicion/wWmYG5w3N4_REQUISICIÓN No.pdf', 'wWmYG5w3N4_REQUISICIÓN No.pdf', 1, '2025-05-08 16:50:18', '2025-05-08 16:50:18'),
	(1874, 'storage/documentos/requisicion/AyOS3Glfth_REQUISICIÓN No.pdf', 'AyOS3Glfth_REQUISICIÓN No.pdf', 1, '2025-05-08 16:51:53', '2025-05-08 16:51:53'),
	(1875, 'storage/documentos/requisicion/DdRb2SfSGU_REQUISICION No.pdf', 'DdRb2SfSGU_REQUISICION No.pdf', 1, '2025-05-08 16:57:09', '2025-05-08 16:57:09'),
	(1876, 'storage/documentos/requisicion/0IK2mKtPYr_REQUISICION No.pdf', '0IK2mKtPYr_REQUISICION No.pdf', 1, '2025-05-08 16:59:38', '2025-05-08 16:59:38'),
	(1877, 'storage/documentos/requisicion/WbsUNJlvAl_REQUISICIÓN No.pdf', 'WbsUNJlvAl_REQUISICIÓN No.pdf', 1, '2025-05-08 17:07:17', '2025-05-08 17:07:17'),
	(1878, 'storage/documentos/requisicion/l9jM9dbTtu_REQUISICIÓN No.pdf', 'l9jM9dbTtu_REQUISICIÓN No.pdf', 1, '2025-05-08 17:08:39', '2025-05-08 17:08:39'),
	(1879, 'storage/documentos/requisicion/016H8VNxsk_REQUISICIÓN No.pdf', '016H8VNxsk_REQUISICIÓN No.pdf', 1, '2025-05-08 17:12:10', '2025-05-08 17:12:10'),
	(1880, 'storage/documentos/requisicion/vHfu8KZC9m_REQUISICIÓN No.pdf', 'vHfu8KZC9m_REQUISICIÓN No.pdf', 1, '2025-05-08 17:13:58', '2025-05-08 17:13:58'),
	(1881, 'storage/documentos/requisicion/a9pVV08Wk4_REQUISICIÓN No.pdf', 'a9pVV08Wk4_REQUISICIÓN No.pdf', 1, '2025-05-08 17:19:25', '2025-05-08 17:19:25'),
	(1882, 'storage/documentos/requisicion/rMvmxvK5NS_REQUISICIÓN No.pdf', 'rMvmxvK5NS_REQUISICIÓN No.pdf', 1, '2025-05-08 17:20:36', '2025-05-08 17:20:36'),
	(1883, 'storage/documentos/requisicion/vq38PKmXUq_REQUISICIÓN No.pdf', 'vq38PKmXUq_REQUISICIÓN No.pdf', 1, '2025-05-08 17:21:45', '2025-05-08 17:21:45'),
	(1884, 'storage/documentos/requisicion/ORx4yqLAEH_REQUISICIÓN No.pdf', 'ORx4yqLAEH_REQUISICIÓN No.pdf', 1, '2025-05-08 17:24:58', '2025-05-08 17:24:58'),
	(1885, 'storage/documentos/requisicion/xpO9yp8PWY_REQUISICIÓN No.pdf', 'xpO9yp8PWY_REQUISICIÓN No.pdf', 1, '2025-05-08 17:33:23', '2025-05-08 17:33:23'),
	(1886, 'storage/documentos/requisicion/h18VWVjEWq_REQUISICIÓN No.pdf', 'h18VWVjEWq_REQUISICIÓN No.pdf', 1, '2025-05-08 17:37:52', '2025-05-08 17:37:52'),
	(1887, 'storage/documentos/requisicion/qeu8EkV8TH_REQUISICION No.pdf', 'qeu8EkV8TH_REQUISICION No.pdf', 1, '2025-05-08 17:38:48', '2025-05-08 17:38:48'),
	(1888, 'storage/documentos/requisicion/xyV5PWalIZ_REQUISICIÓN No.pdf', 'xyV5PWalIZ_REQUISICIÓN No.pdf', 1, '2025-05-08 17:39:34', '2025-05-08 17:39:34'),
	(1889, 'storage/documentos/requisicion/6jrCBH5u4E_REQUISICIÓN No.pdf', '6jrCBH5u4E_REQUISICIÓN No.pdf', 1, '2025-05-08 17:43:21', '2025-05-08 17:43:21'),
	(1890, 'storage/documentos/requisicion/sZoFq76dWP_REQUISICIÓN No.pdf', 'sZoFq76dWP_REQUISICIÓN No.pdf', 1, '2025-05-08 17:44:48', '2025-05-08 17:44:48'),
	(1891, 'storage/documentos/requisicion/S7bMWItRrd_REQUISICIÓN No.pdf', 'S7bMWItRrd_REQUISICIÓN No.pdf', 1, '2025-05-08 17:46:58', '2025-05-08 17:46:58'),
	(1892, 'storage/documentos/requisicion/QgscJM6SNX_REQUISICIÓN No.pdf', 'QgscJM6SNX_REQUISICIÓN No.pdf', 1, '2025-05-08 17:47:42', '2025-05-08 17:47:42'),
	(1893, 'storage/documentos/requisicion/tCBRsj9ZFm_REQUISICIÓN No.pdf', 'tCBRsj9ZFm_REQUISICIÓN No.pdf', 1, '2025-05-08 17:48:57', '2025-05-08 17:48:57'),
	(1894, 'storage/documentos/requisicion/7qY7q0TuTT_REQUISICIÓN No.pdf', '7qY7q0TuTT_REQUISICIÓN No.pdf', 1, '2025-05-08 17:49:53', '2025-05-08 17:49:53'),
	(1895, 'storage/documentos/requisicion/aah9oT4CLS_REQUISICIÓN No.pdf', 'aah9oT4CLS_REQUISICIÓN No.pdf', 1, '2025-05-08 17:51:04', '2025-05-08 17:51:04'),
	(1896, 'storage/documentos/requisicion/KJ11U2dHQE_REQUISICIÓN No.pdf', 'KJ11U2dHQE_REQUISICIÓN No.pdf', 1, '2025-05-08 17:52:09', '2025-05-08 17:52:09'),
	(1897, 'storage/documentos/requisicion/yNmTB6PZh1_REQUISICIÓN No.pdf', 'yNmTB6PZh1_REQUISICIÓN No.pdf', 1, '2025-05-08 17:55:28', '2025-05-08 17:55:28'),
	(1898, 'storage/documentos/requisicion/sk6iWkJTqy_REQUISICIÓN No.pdf', 'sk6iWkJTqy_REQUISICIÓN No.pdf', 1, '2025-05-08 17:56:54', '2025-05-08 17:56:54'),
	(1899, 'storage/documentos/requisicion/qP5uTYXVZT_REQUISICIÓN No.pdf', 'qP5uTYXVZT_REQUISICIÓN No.pdf', 1, '2025-05-08 17:58:09', '2025-05-08 17:58:09'),
	(1900, 'storage/documentos/requisicion/3hFCPKDyJv_REQUISICIÓN No.pdf', '3hFCPKDyJv_REQUISICIÓN No.pdf', 1, '2025-05-08 18:00:11', '2025-05-08 18:00:11'),
	(1901, 'storage/documentos/requisicion/p8gYUCFvcv_REQUISICIÓN No.pdf', 'p8gYUCFvcv_REQUISICIÓN No.pdf', 1, '2025-05-08 18:01:32', '2025-05-08 18:01:32'),
	(1902, 'storage/documentos/requisicion/7vhtETxx4O_REQUISICIÓN No.pdf', '7vhtETxx4O_REQUISICIÓN No.pdf', 1, '2025-05-08 18:02:37', '2025-05-08 18:02:37'),
	(1903, 'storage/documentos/requisicion/trFC4f4dAi_REQUISICIÓN No.pdf', 'trFC4f4dAi_REQUISICIÓN No.pdf', 1, '2025-05-08 18:03:29', '2025-05-08 18:03:29'),
	(1904, 'storage/documentos/requisicion/LIRWBqoW2I_REQUISICIÓN No.pdf', 'LIRWBqoW2I_REQUISICIÓN No.pdf', 1, '2025-05-08 18:04:28', '2025-05-08 18:04:28'),
	(1905, 'storage/documentos/requisicion/xjFhdSBOz6_REQUISICIÓN No.pdf', 'xjFhdSBOz6_REQUISICIÓN No.pdf', 1, '2025-05-08 18:06:01', '2025-05-08 18:06:01'),
	(1906, 'storage/documentos/requisicion/uIRmbmwYrW_REQUISICIÓN No.pdf', 'uIRmbmwYrW_REQUISICIÓN No.pdf', 1, '2025-05-08 18:07:03', '2025-05-08 18:07:03'),
	(1907, 'storage/documentos/requisicion/aJi1o38sHL_REQUISICIÓN No.pdf', 'aJi1o38sHL_REQUISICIÓN No.pdf', 1, '2025-05-08 18:09:00', '2025-05-08 18:09:00'),
	(1908, 'storage/documentos/requisicion/rW6wU5LTu1_REQUISICIÓN No.pdf', 'rW6wU5LTu1_REQUISICIÓN No.pdf', 1, '2025-05-08 18:10:45', '2025-05-08 18:10:45'),
	(1909, 'storage/documentos/requisicion/UA6mapeyNa_REQUISICIÓN No.pdf', 'UA6mapeyNa_REQUISICIÓN No.pdf', 1, '2025-05-08 18:11:39', '2025-05-08 18:11:39'),
	(1910, 'storage/documentos/requisicion/lvsnCaXaQM_REQUISICIÓN No.pdf', 'lvsnCaXaQM_REQUISICIÓN No.pdf', 1, '2025-05-08 18:12:51', '2025-05-08 18:12:51'),
	(1911, 'storage/documentos/requisicion/YS4zU5oBeD_REQUISICIÓN No.pdf', 'YS4zU5oBeD_REQUISICIÓN No.pdf', 1, '2025-05-08 18:13:30', '2025-05-08 18:13:30'),
	(1912, 'storage/documentos/requisicion/6a8AKHogDU_REQUISICIÓN No.pdf', '6a8AKHogDU_REQUISICIÓN No.pdf', 1, '2025-05-08 18:14:59', '2025-05-08 18:14:59'),
	(1913, 'storage/documentos/requisicion/Ipcs1CywNJ_REQUISICIÓN No.pdf', 'Ipcs1CywNJ_REQUISICIÓN No.pdf', 1, '2025-05-08 18:15:44', '2025-05-08 18:15:44'),
	(1914, 'storage/documentos/requisicion/ZELNND5In9_REQUISICIÓN No.pdf', 'ZELNND5In9_REQUISICIÓN No.pdf', 1, '2025-05-08 18:16:35', '2025-05-08 18:16:35'),
	(1915, 'storage/documentos/requisicion/gW4SnBOm7r_REQUISICIÓN No.pdf', 'gW4SnBOm7r_REQUISICIÓN No.pdf', 1, '2025-05-08 18:17:34', '2025-05-08 18:17:34'),
	(1916, 'storage/documentos/requisicion/chGOv9Si1i_REQUISICIÓN No.pdf', 'chGOv9Si1i_REQUISICIÓN No.pdf', 1, '2025-05-08 18:18:53', '2025-05-08 18:18:53'),
	(1917, 'storage/documentos/requisicion/dIvyKwCgWX_REQUISICIÓN No.pdf', 'dIvyKwCgWX_REQUISICIÓN No.pdf', 1, '2025-05-08 18:19:52', '2025-05-08 18:19:52'),
	(1918, 'storage/documentos/requisicion/qRtO4ly1R2_REQUISICIÓN No.pdf', 'qRtO4ly1R2_REQUISICIÓN No.pdf', 1, '2025-05-08 18:20:40', '2025-05-08 18:20:40'),
	(1919, 'storage/documentos/requisicion/1xlkxLe0Ic_REQUISICIÓN No.pdf', '1xlkxLe0Ic_REQUISICIÓN No.pdf', 1, '2025-05-08 18:21:29', '2025-05-08 18:21:29'),
	(1920, 'storage/documentos/requisicion/zpa33UGh2a_REQUISICIÓN No.pdf', 'zpa33UGh2a_REQUISICIÓN No.pdf', 1, '2025-05-08 18:22:25', '2025-05-08 18:22:25'),
	(1921, 'storage/documentos/requisicion/u9DbmM2bm9_REQUISICION No.pdf', 'u9DbmM2bm9_REQUISICION No.pdf', 1, '2025-05-08 18:23:31', '2025-05-08 18:23:31'),
	(1922, 'storage/documentos/requisicion/TUbjODVMYx_REQUISICIÓN No.pdf', 'TUbjODVMYx_REQUISICIÓN No.pdf', 1, '2025-05-08 18:24:46', '2025-05-08 18:24:46'),
	(1923, 'storage/documentos/requisicion/bdVyBdk2LY_REQUISICIÓN No.pdf', 'bdVyBdk2LY_REQUISICIÓN No.pdf', 1, '2025-05-08 18:26:50', '2025-05-08 18:26:50'),
	(1924, 'storage/documentos/requisicion/yHuCmmkpzc_REQUISICIÓN No.pdf', 'yHuCmmkpzc_REQUISICIÓN No.pdf', 1, '2025-05-08 18:27:47', '2025-05-08 18:27:47'),
	(1925, 'storage/documentos/requisicion/du3PdSVH1L_REQUISICIÓN No.pdf', 'du3PdSVH1L_REQUISICIÓN No.pdf', 1, '2025-05-08 18:29:03', '2025-05-08 18:29:03'),
	(1926, 'storage/documentos/requisicion/Fqa6OodCks_REQUISICIÓN No.pdf', 'Fqa6OodCks_REQUISICIÓN No.pdf', 1, '2025-05-08 18:31:01', '2025-05-08 18:31:01'),
	(1927, 'storage/documentos/requisicion/EEs1c4MfYH_REQUISICIÓN No.pdf', 'EEs1c4MfYH_REQUISICIÓN No.pdf', 1, '2025-05-08 18:31:53', '2025-05-08 18:31:53'),
	(1928, 'storage/documentos/requisicion/YzyCMqFeix_REQUISICIÓN No.pdf', 'YzyCMqFeix_REQUISICIÓN No.pdf', 1, '2025-05-08 18:32:42', '2025-05-08 18:32:42'),
	(1929, 'storage/documentos/requisicion/YfxSQ2zLzH_REQUISICIÓN No.pdf', 'YfxSQ2zLzH_REQUISICIÓN No.pdf', 1, '2025-05-08 18:33:52', '2025-05-08 18:33:52'),
	(1930, 'storage/documentos/requisicion/WFMMDWF0in_REQUISICIÓN No.pdf', 'WFMMDWF0in_REQUISICIÓN No.pdf', 1, '2025-05-08 18:34:47', '2025-05-08 18:34:47'),
	(1931, 'storage/documentos/requisicion/p9zQpOKNqk_REQUISICIÓN No.pdf', 'p9zQpOKNqk_REQUISICIÓN No.pdf', 1, '2025-05-08 18:36:08', '2025-05-08 18:36:08'),
	(1932, 'storage/documentos/requisicion/8uBLQldiLk_REQUISICIÓN No.pdf', '8uBLQldiLk_REQUISICIÓN No.pdf', 1, '2025-05-08 18:37:02', '2025-05-08 18:37:02'),
	(1933, 'storage/documentos/circular/V5VdXM7xaS_SECRETARÍA circular-011-2025 reporte se sistema de evaluación 1er trimestre Emir-Eder.pdf', 'V5VdXM7xaS_SECRETARÍA circular-011-2025 reporte se sistema de evaluación 1er trimestre Emir-Eder.pdf', 4, '2025-05-08 18:42:04', '2025-05-08 18:42:04'),
	(1934, 'storage/documentos/circular/zrzAROQniY_SECRETARÍA circular-058-2025 se solicita información de personal Cuarto.pdf', 'zrzAROQniY_SECRETARÍA circular-058-2025 se solicita información de personal Cuarto.pdf', 4, '2025-05-08 18:43:24', '2025-05-08 18:43:24'),
	(1935, 'storage/documentos/memorandum/4DLjfCJa5a_SECRETARÍA memo-1585-2025 se autoriza certificación Eder-Luis.pdf', '4DLjfCJa5a_SECRETARÍA memo-1585-2025 se autoriza certificación Eder-Luis.pdf', 2, '2025-05-08 18:45:47', '2025-05-08 18:45:47'),
	(1936, 'storage/documentos/memorandum/gri72L0SqR_SECRETARÍA memo-ca-p-0361-2025 reanudación de sesión ordinaria del comité de adquisiciones Normatividad-Eder.pdf', 'gri72L0SqR_SECRETARÍA memo-ca-p-0361-2025 reanudación de sesión ordinaria del comité de adquisiciones Normatividad-Eder.pdf', 2, '2025-05-08 18:48:23', '2025-05-08 18:48:23'),
	(1937, 'storage/documentos/memorandum/wMFMRGpG06_SECRETARÍA memo-ca-p-0361-2025 se covoca a sesión ordinaria de adquisiciones.pdf', 'wMFMRGpG06_SECRETARÍA memo-ca-p-0361-2025 se covoca a sesión ordinaria de adquisiciones.pdf', 2, '2025-05-08 18:50:01', '2025-05-08 18:50:01'),
	(1938, 'storage/documentos/memorandum/PQMzOK1L81_UFD memo-428-2025 se solicita desincorporación de personal Eder-Cuarto.pdf', 'PQMzOK1L81_UFD memo-428-2025 se solicita desincorporación de personal Eder-Cuarto.pdf', 2, '2025-05-08 18:52:35', '2025-05-08 18:52:35'),
	(1939, 'storage/documentos/memorandum/DDzVIxsVkG_UFD memo-429-2025 descuentos de personaL Cuarto.pdf', 'DDzVIxsVkG_UFD memo-429-2025 descuentos de personaL Cuarto.pdf', 2, '2025-05-08 18:54:30', '2025-05-08 18:54:30'),
	(1940, 'storage/documentos/memorandum/Vp19QpzheV_UFD memo-432-2025 se solicita desincorporación de personal Cuarto.pdf', 'Vp19QpzheV_UFD memo-432-2025 se solicita desincorporación de personal Cuarto.pdf', 2, '2025-05-08 18:56:33', '2025-05-08 18:56:33'),
	(1941, 'storage/documentos/escrito/GOEXSZin9l_ROSARIO LOBATO correo aclaración de duda deudor Eder-Caro.pdf', 'GOEXSZin9l_ROSARIO LOBATO correo aclaración de duda deudor Eder-Caro.pdf', 5, '2025-05-08 20:28:32', '2025-05-08 20:28:32'),
	(1942, 'storage/documentos/memorandum/jVe0GQHdWY_CONSEJERA SUSANA memo-004-2025 acciones afirmativas Luis-Itzel.pdf', 'jVe0GQHdWY_CONSEJERA SUSANA memo-004-2025 acciones afirmativas Luis-Itzel.pdf', 2, '2025-05-08 20:32:16', '2025-05-08 20:32:16'),
	(1943, 'storage/documentos/escrito/Luxurqh7j6_CRISTINA PAREDES correo devolución Eder-Caro.pdf', 'Luxurqh7j6_CRISTINA PAREDES correo devolución Eder-Caro.pdf', 5, '2025-05-08 20:34:47', '2025-05-08 20:34:47'),
	(1944, 'storage/documentos/escrito/zKCamEbQHo_CRISTNA PAREDES correo se informa Eder-Caro.pdf', 'zKCamEbQHo_CRISTNA PAREDES correo se informa Eder-Caro.pdf', 5, '2025-05-08 20:36:17', '2025-05-08 20:36:17'),
	(1945, 'storage/documentos/correo/Udkl4sVpwm_INFORMÁTICA INFORMÁTICA tarjeta informativa-029-2025  no se instalaron equipos en e mes de abril Archivo.pdf', 'Udkl4sVpwm_INFORMÁTICA INFORMÁTICA tarjeta informativa-029-2025  no se instalaron equipos en e mes de abril Archivo.pdf', 7, '2025-05-08 20:38:49', '2025-05-08 20:38:49'),
	(1946, 'storage/documentos/memorandum/aR02rJpSrq_INFORMÁTICA memo-071-2025 reposición de multifuncional Archivo.pdf', 'aR02rJpSrq_INFORMÁTICA memo-071-2025 reposición de multifuncional Archivo.pdf', 2, '2025-05-08 20:41:25', '2025-05-08 20:41:25'),
	(1947, 'storage/documentos/correo/JRNNy02TkE_INFORMÁTICA tarjeta informativa-025-2025 se proporcionaron ligas Archivo.pdf', 'JRNNy02TkE_INFORMÁTICA tarjeta informativa-025-2025 se proporcionaron ligas Archivo.pdf', 7, '2025-05-08 20:42:49', '2025-05-08 20:42:49'),
	(1948, 'storage/documentos/correo/V5oWi1ZmZh_INFORMÁTICA tarjeta informativa-026-2025 se realizaron respaldos  Archivo.pdf', 'V5oWi1ZmZh_INFORMÁTICA tarjeta informativa-026-2025 se realizaron respaldos  Archivo.pdf', 7, '2025-05-08 20:44:19', '2025-05-08 20:44:19'),
	(1949, 'storage/documentos/correo/t4FhmPBLx5_INFORMÁTICA tarjeta informativa-027-2025  se atendieron solicitudes Archivo.pdf', 't4FhmPBLx5_INFORMÁTICA tarjeta informativa-027-2025  se atendieron solicitudes Archivo.pdf', 7, '2025-05-08 20:45:40', '2025-05-08 20:45:40'),
	(1950, 'storage/documentos/correo/NJ4MHS1H36_INFORMÁTICA tarjeta informativa-028-2025  se realizaron respaldos de las bases de datos Archivo.pdf', 'NJ4MHS1H36_INFORMÁTICA tarjeta informativa-028-2025  se realizaron respaldos de las bases de datos Archivo.pdf', 7, '2025-05-08 20:46:35', '2025-05-08 20:46:35'),
	(1951, 'storage/documentos/correo/JmCJ0r9HE0_INFORMÁTICA tarjeta informativa-030-2025  no se presentaron incidencias Archivo.pdf', 'JmCJ0r9HE0_INFORMÁTICA tarjeta informativa-030-2025  no se presentaron incidencias Archivo.pdf', 7, '2025-05-08 20:48:38', '2025-05-08 20:48:38'),
	(1952, 'storage/documentos/escrito/aqMRAIyBqT_JESÚS MERINO PÉREZ correo-Eder-Caro.pdf', 'aqMRAIyBqT_JESÚS MERINO PÉREZ correo-Eder-Caro.pdf', 5, '2025-05-08 20:51:12', '2025-05-08 20:51:12'),
	(1953, 'storage/documentos/escrito/6mc7J93Phj_JORGE BECERRIL certificado de no adeudo Eder-Caro.pdf', '6mc7J93Phj_JORGE BECERRIL certificado de no adeudo Eder-Caro.pdf', 5, '2025-05-08 20:53:36', '2025-05-08 20:53:36'),
	(1954, 'storage/documentos/escrito/BBMzO0oUtT_JORGE BECERRIL correo Eder-Caro.pdf', 'BBMzO0oUtT_JORGE BECERRIL correo Eder-Caro.pdf', 5, '2025-05-08 20:55:40', '2025-05-08 20:55:40'),
	(1955, 'storage/documentos/escrito/R8M5vi5gP3_LEO GARCÍA correo Eder-Caro.pdf', 'R8M5vi5gP3_LEO GARCÍA correo Eder-Caro.pdf', 5, '2025-05-08 20:57:43', '2025-05-08 20:57:43'),
	(1956, 'storage/documentos/escrito/A0Ob7VzMfG_LISSET RAMÍREZ HERNANDEZ correo eder-Caro.pdf', 'A0Ob7VzMfG_LISSET RAMÍREZ HERNANDEZ correo eder-Caro.pdf', 5, '2025-05-08 20:59:12', '2025-05-08 20:59:12'),
	(1957, 'storage/documentos/escrito/OMsclhDhSw_LUIS ALBERTO VARQUEZ correo Eder-Caro.pdf', 'OMsclhDhSw_LUIS ALBERTO VARQUEZ correo Eder-Caro.pdf', 5, '2025-05-08 21:00:39', '2025-05-08 21:00:39'),
	(1958, 'storage/documentos/escrito/hYBy4T19L1_MARYLU FLORES correo Eder-Caro.pdf', 'hYBy4T19L1_MARYLU FLORES correo Eder-Caro.pdf', 5, '2025-05-08 21:01:33', '2025-05-08 21:01:33'),
	(1959, 'storage/documentos/escrito/9CaBy0O8ti_OFICIALÍA DE PARTES folio 2074 escrito c.pdf', '9CaBy0O8ti_OFICIALÍA DE PARTES folio 2074 escrito c.pdf', 5, '2025-05-08 21:03:20', '2025-05-08 21:03:20'),
	(1960, 'storage/documentos/memorandum/PesPxnccn6_PRERROGATIVAS memo-0370-2025 se solicita devolución de mobiliario Daniel.pdf', 'PesPxnccn6_PRERROGATIVAS memo-0370-2025 se solicita devolución de mobiliario Daniel.pdf', 2, '2025-05-08 21:05:45', '2025-05-08 21:05:45'),
	(1961, 'storage/documentos/requisicion/Ipmw0M8ynd_REQUISICIÓN No.pdf', 'Ipmw0M8ynd_REQUISICIÓN No.pdf', 1, '2025-05-08 21:06:53', '2025-05-08 21:06:53'),
	(1962, 'storage/documentos/requisicion/t2nGydFdgZ_REQUISICIÓN No.pdf', 't2nGydFdgZ_REQUISICIÓN No.pdf', 1, '2025-05-08 21:10:33', '2025-05-08 21:10:33'),
	(1963, 'storage/documentos/requisicion/78CTJOhbP7_REQUISICIÓN No.pdf', '78CTJOhbP7_REQUISICIÓN No.pdf', 1, '2025-05-09 17:18:40', '2025-05-09 17:18:40'),
	(1964, 'storage/documentos/requisicion/kub8Qc5fsZ_REQUISICIÓN No.pdf', 'kub8Qc5fsZ_REQUISICIÓN No.pdf', 1, '2025-05-09 17:21:38', '2025-05-09 17:21:38'),
	(1965, 'storage/documentos/requisicion/eYKcpF3IGh_REQUISICIÓN No.pdf', 'eYKcpF3IGh_REQUISICIÓN No.pdf', 1, '2025-05-09 17:22:35', '2025-05-09 17:22:35'),
	(1966, 'storage/documentos/requisicion/Ws3UjZxlvI_REQUISICIÓN No.pdf', 'Ws3UjZxlvI_REQUISICIÓN No.pdf', 1, '2025-05-09 17:24:22', '2025-05-09 17:24:22'),
	(1967, 'storage/documentos/requisicion/KSswzaL6u8_REQUISICIÓN No.pdf', 'KSswzaL6u8_REQUISICIÓN No.pdf', 1, '2025-05-09 17:25:17', '2025-05-09 17:25:17'),
	(1968, 'storage/documentos/requisicion/1ekugYEuKT_REQUISICIÓN No.pdf', '1ekugYEuKT_REQUISICIÓN No.pdf', 1, '2025-05-09 17:27:40', '2025-05-09 17:27:40'),
	(1969, 'storage/documentos/requisicion/GQNQjGolse_REQUISICIÓN No.pdf', 'GQNQjGolse_REQUISICIÓN No.pdf', 1, '2025-05-09 17:29:12', '2025-05-09 17:29:12'),
	(1970, 'storage/documentos/requisicion/JJJ7jnPU7u_REQUISICIÓN No.pdf', 'JJJ7jnPU7u_REQUISICIÓN No.pdf', 1, '2025-05-09 17:30:37', '2025-05-09 17:30:37'),
	(1971, 'storage/documentos/requisicion/K95lJ9Egoi_REQUISICIÓN No.pdf', 'K95lJ9Egoi_REQUISICIÓN No.pdf', 1, '2025-05-09 17:31:38', '2025-05-09 17:31:38'),
	(1972, 'storage/documentos/requisicion/mxX1ANsHLD_REQUISICIÓN No.pdf', 'mxX1ANsHLD_REQUISICIÓN No.pdf', 1, '2025-05-09 17:33:08', '2025-05-09 17:33:08'),
	(1973, 'storage/documentos/requisicion/F1vEeXI2mA_REQUISICIÓN No.pdf', 'F1vEeXI2mA_REQUISICIÓN No.pdf', 1, '2025-05-09 17:34:35', '2025-05-09 17:34:35'),
	(1974, 'storage/documentos/requisicion/5bjneccNEY_REQUISICIÓN No.pdf', '5bjneccNEY_REQUISICIÓN No.pdf', 1, '2025-05-09 17:35:28', '2025-05-09 17:35:28'),
	(1975, 'storage/documentos/requisicion/2Zslh8BMfd_REQUISICIÓN No.pdf', '2Zslh8BMfd_REQUISICIÓN No.pdf', 1, '2025-05-09 17:36:20', '2025-05-09 17:36:20'),
	(1976, 'storage/documentos/requisicion/mSaOf5qgAc_REQUISICIÓN No.pdf', 'mSaOf5qgAc_REQUISICIÓN No.pdf', 1, '2025-05-09 17:37:14', '2025-05-09 17:37:14'),
	(1977, 'storage/documentos/requisicion/bHtzLNAwtW_REQUISICIÓN No.pdf', 'bHtzLNAwtW_REQUISICIÓN No.pdf', 1, '2025-05-09 17:38:03', '2025-05-09 17:38:03'),
	(1978, 'storage/documentos/requisicion/ylNLIJXemv_REQUISICIÓN No.pdf', 'ylNLIJXemv_REQUISICIÓN No.pdf', 1, '2025-05-09 17:39:47', '2025-05-09 17:39:47'),
	(1979, 'storage/documentos/requisicion/Lsc5F7u7TU_REQUISICIÓN No.pdf', 'Lsc5F7u7TU_REQUISICIÓN No.pdf', 1, '2025-05-09 17:40:49', '2025-05-09 17:40:49'),
	(1980, 'storage/documentos/requisicion/dxEn4lipKW_REQUISICIÓN No.pdf', 'dxEn4lipKW_REQUISICIÓN No.pdf', 1, '2025-05-09 17:41:43', '2025-05-09 17:41:43'),
	(1981, 'storage/documentos/requisicion/Vo2Y8qFRcT_REQUISICIÓN No.pdf', 'Vo2Y8qFRcT_REQUISICIÓN No.pdf', 1, '2025-05-09 17:42:45', '2025-05-09 17:42:45'),
	(1982, 'storage/documentos/requisicion/gVRrI9445A_REQUISICIÓN No.pdf', 'gVRrI9445A_REQUISICIÓN No.pdf', 1, '2025-05-09 17:43:40', '2025-05-09 17:43:40'),
	(1983, 'storage/documentos/requisicion/9iuXGiqtqF_REQUISICIÓN No.pdf', '9iuXGiqtqF_REQUISICIÓN No.pdf', 1, '2025-05-09 17:44:29', '2025-05-09 17:44:29'),
	(1984, 'storage/documentos/requisicion/hwBPiWQt6T_REQUISICIÓN No.pdf', 'hwBPiWQt6T_REQUISICIÓN No.pdf', 1, '2025-05-09 17:45:53', '2025-05-09 17:45:53'),
	(1985, 'storage/documentos/requisicion/PeRiansGnJ_REQUISICIÓN No.pdf', 'PeRiansGnJ_REQUISICIÓN No.pdf', 1, '2025-05-09 17:47:04', '2025-05-09 17:47:04'),
	(1986, 'storage/documentos/requisicion/JzsxUVsg7v_REQUISICIÓN No.pdf', 'JzsxUVsg7v_REQUISICIÓN No.pdf', 1, '2025-05-09 17:48:35', '2025-05-09 17:48:35'),
	(1987, 'storage/documentos/requisicion/SBg5Tq1CKz_REQUISICIÓN No.pdf', 'SBg5Tq1CKz_REQUISICIÓN No.pdf', 1, '2025-05-09 17:50:06', '2025-05-09 17:50:06'),
	(1988, 'storage/documentos/requisicion/94sNWgdwms_REQUISICION No.pdf', '94sNWgdwms_REQUISICION No.pdf', 1, '2025-05-09 17:50:43', '2025-05-09 17:50:43'),
	(1989, 'storage/documentos/requisicion/QFKBIAwhFx_REQUISICIÓN No.pdf', 'QFKBIAwhFx_REQUISICIÓN No.pdf', 1, '2025-05-09 17:51:29', '2025-05-09 17:51:29'),
	(1990, 'storage/documentos/requisicion/Jr11H2lNAL_REQUISICIÓN No.pdf', 'Jr11H2lNAL_REQUISICIÓN No.pdf', 1, '2025-05-09 17:52:34', '2025-05-09 17:52:34'),
	(1991, 'storage/documentos/requisicion/2ns4xe5Qyg_REQUISICIÓN No.pdf', '2ns4xe5Qyg_REQUISICIÓN No.pdf', 1, '2025-05-09 17:53:54', '2025-05-09 17:53:54'),
	(1992, 'storage/documentos/oficio/XJLTvbsBy5_SECRETARÍA ANTICORRUPCIÓN oficio sabg-os-sca-3264-2025 se remite informació y documentación auditoría Eder-Emir.pdf', 'XJLTvbsBy5_SECRETARÍA ANTICORRUPCIÓN oficio sabg-os-sca-3264-2025 se remite informació y documentación auditoría Eder-Emir.pdf', 3, '2025-05-09 17:57:40', '2025-05-09 17:57:40'),
	(1993, 'storage/documentos/circular/zs6wrGKLR9_SECRETARÍA circular-60-2025 círculo de masculinidades efectivas Poblano-Emir-Luis.pdf', 'zs6wrGKLR9_SECRETARÍA circular-60-2025 círculo de masculinidades efectivas Poblano-Emir-Luis.pdf', 4, '2025-05-09 17:59:37', '2025-05-09 17:59:37'),
	(1994, 'storage/documentos/escrito/tcsTXaPZIN_SEVAC APERTURA DE PLATAFORMA eder-Ale-Emir.pdf', 'tcsTXaPZIN_SEVAC APERTURA DE PLATAFORMA eder-Ale-Emir.pdf', 5, '2025-05-09 18:01:47', '2025-05-09 18:01:47'),
	(1995, 'storage/documentos/escrito/LIZq1UKFGI_SEVAC- USUARIO Y CONTRASEÑA Ale-Eder-Emir.pdf', 'LIZq1UKFGI_SEVAC- USUARIO Y CONTRASEÑA Ale-Eder-Emir.pdf', 5, '2025-05-09 18:04:27', '2025-05-09 18:04:27'),
	(1996, 'storage/documentos/circular/1ADBw0Wqin_TRANSPARENCIA circular-030-2025 se solicita agenda de actividades Luis.pdf', '1ADBw0Wqin_TRANSPARENCIA circular-030-2025 se solicita agenda de actividades Luis.pdf', 4, '2025-05-09 18:05:48', '2025-05-09 18:05:48'),
	(1997, 'storage/documentos/memorandum/Rmd4m6Jlm1_UFD memo-448-2025 se remite calificación de exámen Cuarto.pdf', 'Rmd4m6Jlm1_UFD memo-448-2025 se remite calificación de exámen Cuarto.pdf', 2, '2025-05-09 18:07:35', '2025-05-09 18:07:35'),
	(1998, 'storage/documentos/memorandum/tYAURRy63t_UFD memo-449-2025 se solicita alta de personal Cuarto.pdf', 'tYAURRy63t_UFD memo-449-2025 se solicita alta de personal Cuarto.pdf', 2, '2025-05-09 18:09:35', '2025-05-09 18:09:35'),
	(1999, 'storage/documentos/escrito/boXR9gUcKt_UFD reporte general asystec abril 16-30 Cuarto-Caro-Eder.pdf', 'boXR9gUcKt_UFD reporte general asystec abril 16-30 Cuarto-Caro-Eder.pdf', 5, '2025-05-09 18:20:56', '2025-05-09 18:20:56'),
	(2000, 'storage/documentos/escrito/l3aK8Z9dSO_YADIRA CRISTINA NIEVES correo Eder-Caro.pdf', 'l3aK8Z9dSO_YADIRA CRISTINA NIEVES correo Eder-Caro.pdf', 5, '2025-05-09 18:23:38', '2025-05-09 18:23:38'),
	(2001, 'storage/documentos/memorandum/SdWIwTlpXt_COMUNICACIÓN memo-112-2025 boletín 33 Archivo.pdf', 'SdWIwTlpXt_COMUNICACIÓN memo-112-2025 boletín 33 Archivo.pdf', 2, '2025-05-09 18:27:41', '2025-05-09 18:27:41'),
	(2002, 'storage/documentos/memorandum/eNpnKedfXB_COMUNICACIÓN No.pdf', 'eNpnKedfXB_COMUNICACIÓN No.pdf', 2, '2025-05-09 18:28:56', '2025-05-09 18:28:56'),
	(2003, 'storage/documentos/memorandum/14ZmRKsYkt_CONTRALORÍA memo-259-2025 informes y actas finales Archivo.pdf', '14ZmRKsYkt_CONTRALORÍA memo-259-2025 informes y actas finales Archivo.pdf', 2, '2025-05-09 18:34:41', '2025-05-09 18:34:41'),
	(2004, 'storage/documentos/memorandum/2fEOouGsh9_INFORMÁTICA memo-072-2025 baja de personal Cuarto.pdf', '2fEOouGsh9_INFORMÁTICA memo-072-2025 baja de personal Cuarto.pdf', 2, '2025-05-09 19:18:03', '2025-05-09 19:18:03'),
	(2005, 'storage/documentos/escrito/lhsKSDfy5v_JESSICA LUNA respuesta a correo Eder Caro.pdf', 'lhsKSDfy5v_JESSICA LUNA respuesta a correo Eder Caro.pdf', 5, '2025-05-09 19:22:06', '2025-05-09 19:22:06'),
	(2006, 'storage/documentos/memorandum/6J6La0d08x_JURÍDICO memo-0724-2025 se remite adenda xiutetelco para firma  Eder-Normatividad.pdf', '6J6La0d08x_JURÍDICO memo-0724-2025 se remite adenda xiutetelco para firma  Eder-Normatividad.pdf', 2, '2025-05-09 19:24:21', '2025-05-09 19:24:21'),
	(2007, 'storage/documentos/memorandum/8dNoD1bRXL_JURÍDICO memo-01012-2025 se remiten convenios partidos políticos para resguardo Normatividad-Eder.pdf', '8dNoD1bRXL_JURÍDICO memo-01012-2025 se remiten convenios partidos políticos para resguardo Normatividad-Eder.pdf', 2, '2025-05-09 19:26:07', '2025-05-09 19:26:07'),
	(2008, 'storage/documentos/escrito/owFULUZc6T_OFICIALÍA DE PARTES FOIO 2110 respuesta a correo c.pdf', 'owFULUZc6T_OFICIALÍA DE PARTES FOIO 2110 respuesta a correo c.pdf', 5, '2025-05-09 19:28:51', '2025-05-09 19:28:51'),
	(2009, 'storage/documentos/memorandum/0jQH8erFk7_PRERROGATIVAS memo-0380-2025 e remiten recibos originales Saúl-Eder.pdf', '0jQH8erFk7_PRERROGATIVAS memo-0380-2025 e remiten recibos originales Saúl-Eder.pdf', 2, '2025-05-09 19:30:35', '2025-05-09 19:30:35'),
	(2010, 'storage/documentos/memorandum/CJwe3TqzrO_PRERROGATIVAS memo-0382-2025 se soicita Información  Saúl-Eder.pdf', 'CJwe3TqzrO_PRERROGATIVAS memo-0382-2025 se soicita Información  Saúl-Eder.pdf', 2, '2025-05-09 19:36:36', '2025-05-09 19:36:36'),
	(2011, 'storage/documentos/requisicion/L8UBfPdPT8_REQUISICIÓN No.pdf', 'L8UBfPdPT8_REQUISICIÓN No.pdf', 1, '2025-05-09 19:37:39', '2025-05-09 19:37:39'),
	(2012, 'storage/documentos/requisicion/lwqJcaJPtI_REQUISICIÓN No.pdf', 'lwqJcaJPtI_REQUISICIÓN No.pdf', 1, '2025-05-09 19:38:31', '2025-05-09 19:38:31'),
	(2013, 'storage/documentos/requisicion/fCPLIdaI2X_REQUISICIÓN No.pdf', 'fCPLIdaI2X_REQUISICIÓN No.pdf', 1, '2025-05-09 19:40:39', '2025-05-09 19:40:39'),
	(2014, 'storage/documentos/requisicion/XZIOZV79Wy_REQUISICIÓN No.pdf', 'XZIOZV79Wy_REQUISICIÓN No.pdf', 1, '2025-05-09 19:41:23', '2025-05-09 19:41:23'),
	(2015, 'storage/documentos/requisicion/cwnxf0UGPl_REQUISICIÓN No.pdf', 'cwnxf0UGPl_REQUISICIÓN No.pdf', 1, '2025-05-09 19:42:23', '2025-05-09 19:42:23'),
	(2016, 'storage/documentos/requisicion/0kgw1OPe5y_REQUISICIÓN No.pdf', '0kgw1OPe5y_REQUISICIÓN No.pdf', 1, '2025-05-09 19:43:20', '2025-05-09 19:43:20'),
	(2017, 'storage/documentos/requisicion/wt9UuKTwko_REQUISICIÓN No.pdf', 'wt9UuKTwko_REQUISICIÓN No.pdf', 1, '2025-05-09 19:44:17', '2025-05-09 19:44:17'),
	(2018, 'storage/documentos/requisicion/pEuDg0GH2z_REQUISICIÓN No.pdf', 'pEuDg0GH2z_REQUISICIÓN No.pdf', 1, '2025-05-09 20:42:45', '2025-05-09 20:42:45'),
	(2019, 'storage/documentos/requisicion/NZSGLfzjnE_REQUISICIÓN No.pdf', 'NZSGLfzjnE_REQUISICIÓN No.pdf', 1, '2025-05-09 20:43:33', '2025-05-09 20:43:33'),
	(2020, 'storage/documentos/requisicion/BnsyENGkIR_REQUISICIÓN No.pdf', 'BnsyENGkIR_REQUISICIÓN No.pdf', 1, '2025-05-09 20:44:18', '2025-05-09 20:44:18'),
	(2021, 'storage/documentos/memorandum/UihFdohIkS_TRANSPARENCIA memo-318-2025 baja de mobiliario Daniel.pdf', 'UihFdohIkS_TRANSPARENCIA memo-318-2025 baja de mobiliario Daniel.pdf', 2, '2025-05-09 20:45:33', '2025-05-09 20:45:33'),
	(2022, 'storage/documentos/memorandum/Av00djfsdt_UFD memo-460-2025 se solicita alta de personal eventual Cuarto.pdf', 'Av00djfsdt_UFD memo-460-2025 se solicita alta de personal eventual Cuarto.pdf', 2, '2025-05-09 20:50:29', '2025-05-09 20:50:29'),
	(2023, 'storage/documentos/memorandum/vGRaWp5zui_UFD memo-461-2025 se informa licencia con goce de sueldo Cuarto.pdf', 'vGRaWp5zui_UFD memo-461-2025 se informa licencia con goce de sueldo Cuarto.pdf', 2, '2025-05-09 20:52:10', '2025-05-09 20:52:10'),
	(2024, 'storage/documentos/requisicion/SvSSrBuewL_REQUISICIÓN No.pdf', 'SvSSrBuewL_REQUISICIÓN No.pdf', 1, '2025-05-12 16:18:35', '2025-05-12 16:18:35'),
	(2025, 'storage/documentos/escrito/n4QBCQKMGx_CECILIA SANTOS correo ampliación de recursos oficios upp-03-2025, oficio circular spf-se-06-2024 Eder-Emir.pdf', 'n4QBCQKMGx_CECILIA SANTOS correo ampliación de recursos oficios upp-03-2025, oficio circular spf-se-06-2024 Eder-Emir.pdf', 5, '2025-05-12 17:54:03', '2025-05-12 17:54:03'),
	(2026, 'storage/documentos/escrito/QqA6f5Fb5w_OFICIALIA DE PARTES correo folio 2121 oficio circular upp-03-2025 ampliación de recursos Eder-Emir.pdf', 'QqA6f5Fb5w_OFICIALIA DE PARTES correo folio 2121 oficio circular upp-03-2025 ampliación de recursos Eder-Emir.pdf', 5, '2025-05-12 17:55:44', '2025-05-12 17:55:44'),
	(2027, 'storage/documentos/requisicion/Ec8UNvjSTE_REQUISICIÓN No.pdf', 'Ec8UNvjSTE_REQUISICIÓN No.pdf', 1, '2025-05-12 17:56:38', '2025-05-12 17:56:38'),
	(2028, 'storage/documentos/requisicion/EHwIG4srSz_REQUISICIÓN No.pdf', 'EHwIG4srSz_REQUISICIÓN No.pdf', 1, '2025-05-12 18:08:56', '2025-05-12 18:08:56'),
	(2029, 'storage/documentos/requisicion/MpiVVYnZmm_REQUISICIÓN No.pdf', 'MpiVVYnZmm_REQUISICIÓN No.pdf', 1, '2025-05-12 18:24:46', '2025-05-12 18:24:46'),
	(2030, 'storage/documentos/requisicion/4O4euP3dVd_REQUISICIÓN No.pdf', '4O4euP3dVd_REQUISICIÓN No.pdf', 1, '2025-05-12 18:26:05', '2025-05-12 18:26:05'),
	(2031, 'storage/documentos/requisicion/pMl7IgbSKj_REQUISICIÓN No.pdf', 'pMl7IgbSKj_REQUISICIÓN No.pdf', 1, '2025-05-12 18:27:13', '2025-05-12 18:27:13'),
	(2032, 'storage/documentos/requisicion/idU7wzO7Ff_REQUISICIÓN No.pdf', 'idU7wzO7Ff_REQUISICIÓN No.pdf', 1, '2025-05-12 18:27:55', '2025-05-12 18:27:55'),
	(2033, 'storage/documentos/requisicion/b0hm5BkbR9_REQUISICIÓN No.pdf', 'b0hm5BkbR9_REQUISICIÓN No.pdf', 1, '2025-05-12 18:28:50', '2025-05-12 18:28:50'),
	(2034, 'storage/documentos/requisicion/nQyNO7IfTW_REQUISICIÓN No.pdf', 'nQyNO7IfTW_REQUISICIÓN No.pdf', 1, '2025-05-12 18:29:34', '2025-05-12 18:29:34'),
	(2035, 'storage/documentos/requisicion/Duy5nbIoYM_REQUISICIÓN No.pdf', 'Duy5nbIoYM_REQUISICIÓN No.pdf', 1, '2025-05-12 18:30:23', '2025-05-12 18:30:23'),
	(2036, 'storage/documentos/requisicion/4nRspSnw1P_REQUISICIÓN No.pdf', '4nRspSnw1P_REQUISICIÓN No.pdf', 1, '2025-05-12 18:31:16', '2025-05-12 18:31:16'),
	(2037, 'storage/documentos/requisicion/pdZJbdRXfA_REQUISICIÓN No.pdf', 'pdZJbdRXfA_REQUISICIÓN No.pdf', 1, '2025-05-12 18:32:46', '2025-05-12 18:32:46'),
	(2038, 'storage/documentos/requisicion/l6rpxwk4U9_REQUISICIÓN No.pdf', 'l6rpxwk4U9_REQUISICIÓN No.pdf', 1, '2025-05-12 18:33:30', '2025-05-12 18:33:30'),
	(2039, 'storage/documentos/requisicion/C8FDEA1Gsz_REQUISICION No.pdf', 'C8FDEA1Gsz_REQUISICION No.pdf', 1, '2025-05-12 18:34:50', '2025-05-12 18:34:50'),
	(2040, 'storage/documentos/memorandum/JzXmCYIpJU_UFD memo-164-2025 se remite incapacidad médica Cuarto.pdf', 'JzXmCYIpJU_UFD memo-164-2025 se remite incapacidad médica Cuarto.pdf', 2, '2025-05-12 18:36:32', '2025-05-12 18:36:32'),
	(2041, 'storage/documentos/memorandum/t637CiJCTJ_JURÍDICO memo-1029-2025 se solicita información Municipio Cuyuaco Eder-Normatividad.pdf', 't637CiJCTJ_JURÍDICO memo-1029-2025 se solicita información Municipio Cuyuaco Eder-Normatividad.pdf', 2, '2025-05-12 18:48:21', '2025-05-12 18:48:21'),
	(2042, 'storage/documentos/memorandum/UkKM8cZibD_JURÍDICO memo-1030-2025 se solicita información ayuntamiento de Puebla Normatividad-Eder.pdf', 'UkKM8cZibD_JURÍDICO memo-1030-2025 se solicita información ayuntamiento de Puebla Normatividad-Eder.pdf', 2, '2025-05-12 18:53:34', '2025-05-12 18:53:34'),
	(2043, 'storage/documentos/memorandum/de3wiJHCrA_UFD memo-470-2025 se solicita alta de personal Cuarto.pdf', 'de3wiJHCrA_UFD memo-470-2025 se solicita alta de personal Cuarto.pdf', 2, '2025-05-12 18:55:08', '2025-05-12 18:55:08'),
	(2044, 'storage/documentos/requisicion/9pDiBILop2_REQUISICIÓN No.pdf', '9pDiBILop2_REQUISICIÓN No.pdf', 1, '2025-05-12 18:56:32', '2025-05-12 18:56:32'),
	(2045, 'storage/documentos/escrito/MJ9JjH70Hn_AYLÍN LIZETH GRCÍA CRUZ correo Eder-Caro.pdf', 'MJ9JjH70Hn_AYLÍN LIZETH GRCÍA CRUZ correo Eder-Caro.pdf', 5, '2025-05-12 19:20:35', '2025-05-12 19:20:35'),
	(2046, 'storage/documentos/escrito/bu3aGCmLlE_MARIO MARTÍNEZ respuesta a correo deudores Eder-Caro.pdf', 'bu3aGCmLlE_MARIO MARTÍNEZ respuesta a correo deudores Eder-Caro.pdf', 5, '2025-05-12 20:24:48', '2025-05-12 20:24:48'),
	(2047, 'storage/documentos/escrito/Ms5WkHcT6C_LAURA LEZAMA LEZAMA correo Eder-Caro.pdf', 'Ms5WkHcT6C_LAURA LEZAMA LEZAMA correo Eder-Caro.pdf', 5, '2025-05-13 14:10:06', '2025-05-13 14:10:06'),
	(2048, 'storage/documentos/requisicion/xntzgmVAer_REQUISICIÓN No.pdf', 'xntzgmVAer_REQUISICIÓN No.pdf', 1, '2025-05-13 14:13:54', '2025-05-13 14:13:54'),
	(2049, 'storage/documentos/requisicion/d6s6125JMJ_REQUISICIÓN No.pdf', 'd6s6125JMJ_REQUISICIÓN No.pdf', 1, '2025-05-13 14:15:12', '2025-05-13 14:15:12'),
	(2050, 'storage/documentos/requisicion/c9QEOKJBzx_REQUISICIÓN No.pdf', 'c9QEOKJBzx_REQUISICIÓN No.pdf', 1, '2025-05-13 14:16:49', '2025-05-13 14:16:49'),
	(2051, 'storage/documentos/memorandum/fPdgAq0hhn_UFD memo-472-2025 se solicita alta de personal Cuarto.pdf', 'fPdgAq0hhn_UFD memo-472-2025 se solicita alta de personal Cuarto.pdf', 2, '2025-05-13 14:18:47', '2025-05-13 14:18:47'),
	(2052, 'storage/documentos/escrito/FvVNgcd7rF_AYLIN LIZETH GARCÍA CRUZ respuesta a correo Eder-Caro.pdf', 'FvVNgcd7rF_AYLIN LIZETH GARCÍA CRUZ respuesta a correo Eder-Caro.pdf', 5, '2025-05-13 19:50:43', '2025-05-13 19:50:43'),
	(2053, 'storage/documentos/escrito/rR6GJMhq4f_AYLIN LIZETH GARCÍA CRUZ respuesta a correo recibido Eder-Caro.pdf', 'rR6GJMhq4f_AYLIN LIZETH GARCÍA CRUZ respuesta a correo recibido Eder-Caro.pdf', 5, '2025-05-13 19:52:45', '2025-05-13 19:52:45'),
	(2054, 'storage/documentos/escrito/VH81PaZiwQ_LAURA LEZAMA LEZAMA correo respuesta Eder-Caro.pdf', 'VH81PaZiwQ_LAURA LEZAMA LEZAMA correo respuesta Eder-Caro.pdf', 5, '2025-05-13 19:55:06', '2025-05-13 19:55:06'),
	(2055, 'storage/documentos/oficio/oICcQ4p9vO_PRESIDENCIA oficio-0422-2025 ministración del mes de mayo Emir.pdf', 'oICcQ4p9vO_PRESIDENCIA oficio-0422-2025 ministración del mes de mayo Emir.pdf', 3, '2025-05-13 19:57:46', '2025-05-13 19:57:46'),
	(2056, 'storage/documentos/requisicion/6t8WFSn6We_REQUISICIÓN No.pdf', '6t8WFSn6We_REQUISICIÓN No.pdf', 1, '2025-05-13 20:00:17', '2025-05-13 20:00:17'),
	(2057, 'storage/documentos/circular/GrufZQqIRN_SECRETARÍA circular-062-2025 Conferencia virtual Berny-Luis-Juan Carlos.pdf', 'GrufZQqIRN_SECRETARÍA circular-062-2025 Conferencia virtual Berny-Luis-Juan Carlos.pdf', 4, '2025-05-13 20:01:34', '2025-05-13 20:01:34'),
	(2058, 'storage/documentos/escrito/F0egBp9NnW_SOPHIE BERMUDEZ respuesta a correo recibido Eder-Caro.pdf', 'F0egBp9NnW_SOPHIE BERMUDEZ respuesta a correo recibido Eder-Caro.pdf', 5, '2025-05-13 20:02:46', '2025-05-13 20:02:46'),
	(2059, 'storage/documentos/memorandum/ZFh7da1KoH_TRANSPARENCIA memo-ut-sol-036-2025 se solicita información Eder-Daniel.pdf', 'ZFh7da1KoH_TRANSPARENCIA memo-ut-sol-036-2025 se solicita información Eder-Daniel.pdf', 2, '2025-05-13 20:06:53', '2025-05-13 20:06:53'),
	(2060, 'storage/documentos/memorandum/uze09DXTNG_SECRETARÍA memo-1665-2025 se autoriza certificación Saúl.pdf', 'uze09DXTNG_SECRETARÍA memo-1665-2025 se autoriza certificación Saúl.pdf', 2, '2025-05-13 20:59:20', '2025-05-13 20:59:20'),
	(2061, 'storage/documentos/memorandum/HYU0oaa0a5_SECRETARÍA memo-1666-2025 se autoriza certificación Saúl.pdf', 'HYU0oaa0a5_SECRETARÍA memo-1666-2025 se autoriza certificación Saúl.pdf', 2, '2025-05-13 21:25:30', '2025-05-13 21:25:30'),
	(2062, 'storage/documentos/requisicion/bWXGjRulZ7_REQUISICIÓN No.pdf', 'bWXGjRulZ7_REQUISICIÓN No.pdf', 1, '2025-05-14 15:42:10', '2025-05-14 15:42:10'),
	(2063, 'storage/documentos/requisicion/gAdLQUhuus_REQUISICIÓN No.pdf', 'gAdLQUhuus_REQUISICIÓN No.pdf', 1, '2025-05-14 15:55:33', '2025-05-14 15:55:33'),
	(2064, 'storage/documentos/escrito/7XlAmqPIVR_SEVAC recordatorio aviso apertura de plataforma Eder-Emir-Ale.pdf', '7XlAmqPIVR_SEVAC recordatorio aviso apertura de plataforma Eder-Emir-Ale.pdf', 5, '2025-05-14 16:05:15', '2025-05-14 16:05:15'),
	(2065, 'storage/documentos/memorandum/hNCygMLLkh_COMUNICACIÓN memo-114-2025 boletín 34 Archivo.pdf', 'hNCygMLLkh_COMUNICACIÓN memo-114-2025 boletín 34 Archivo.pdf', 2, '2025-05-14 17:01:27', '2025-05-14 17:01:27'),
	(2066, 'storage/documentos/escrito/0k7KV14zD6_MIGUEL ÁNGEL VALENCIA BOLAÑOS respuesta a correo Eder-Caro.pdf', '0k7KV14zD6_MIGUEL ÁNGEL VALENCIA BOLAÑOS respuesta a correo Eder-Caro.pdf', 5, '2025-05-14 18:23:05', '2025-05-14 18:23:05'),
	(2067, 'storage/documentos/memorandum/naT8oIqj4d_PRERROGATIVAS memo-0386-2025 se solicita retirtar cableado sobrante en su área Daniel.pdf', 'naT8oIqj4d_PRERROGATIVAS memo-0386-2025 se solicita retirtar cableado sobrante en su área Daniel.pdf', 2, '2025-05-14 18:26:15', '2025-05-14 18:26:15'),
	(2068, 'storage/documentos/requisicion/8XNI6iDov0_REQUISICIÓN No.pdf', '8XNI6iDov0_REQUISICIÓN No.pdf', 1, '2025-05-14 18:27:18', '2025-05-14 18:27:18'),
	(2069, 'storage/documentos/requisicion/P0iKiq1mUS_REQUISICIÓN No.pdf', 'P0iKiq1mUS_REQUISICIÓN No.pdf', 1, '2025-05-14 18:28:28', '2025-05-14 18:28:28'),
	(2070, 'storage/documentos/requisicion/pQAosrfdfJ_REQUISICIÓN No.pdf', 'pQAosrfdfJ_REQUISICIÓN No.pdf', 1, '2025-05-14 18:41:48', '2025-05-14 18:41:48'),
	(2071, 'storage/documentos/requisicion/PdqF20GXsL_REQUISICIÓN No.pdf', 'PdqF20GXsL_REQUISICIÓN No.pdf', 1, '2025-05-14 18:49:00', '2025-05-14 18:49:00'),
	(2072, 'storage/documentos/memorandum/gADpYEjt6g_COMUNICACIÓN memo-114-2025 boletín 34 Archivo.pdf', 'gADpYEjt6g_COMUNICACIÓN memo-114-2025 boletín 34 Archivo.pdf', 2, '2025-05-15 15:51:33', '2025-05-15 15:51:33'),
	(2073, 'storage/documentos/memorandum/yp8qKcXdh4_JURÍDICO memo-0696BIS-2025 se remite contrato para observación eventos especiales ayala Eder-Normatividad.pdf', 'yp8qKcXdh4_JURÍDICO memo-0696BIS-2025 se remite contrato para observación eventos especiales ayala Eder-Normatividad.pdf', 2, '2025-05-15 15:54:40', '2025-05-15 15:54:40'),
	(2074, 'storage/documentos/escrito/uHbiPsmoc7_MIGUEL ÁNGEL VALENCIA BOLAÑOS respuesta a correo Eder-Caro.pdf', 'uHbiPsmoc7_MIGUEL ÁNGEL VALENCIA BOLAÑOS respuesta a correo Eder-Caro.pdf', 5, '2025-05-15 15:57:46', '2025-05-15 15:57:46'),
	(2075, 'storage/documentos/memorandum/KHHiar4zcu_PRERROGATIVAS memo-0386-2025 se solicita retirtar cableado sobrante en su área Daniel.pdf', 'KHHiar4zcu_PRERROGATIVAS memo-0386-2025 se solicita retirtar cableado sobrante en su área Daniel.pdf', 2, '2025-05-15 15:58:56', '2025-05-15 15:58:56'),
	(2076, 'storage/documentos/requisicion/AuqhJsRefP_REQUISICIÓN No.pdf', 'AuqhJsRefP_REQUISICIÓN No.pdf', 1, '2025-05-15 15:59:48', '2025-05-15 15:59:48'),
	(2077, 'storage/documentos/requisicion/pBbd2jQr2x_REQUISICIÓN No.pdf', 'pBbd2jQr2x_REQUISICIÓN No.pdf', 1, '2025-05-15 16:00:35', '2025-05-15 16:00:35'),
	(2078, 'storage/documentos/memorandum/40JSPRqg4u_ARCHIVOS memo-0144-25 solicitud.pdf', '40JSPRqg4u_ARCHIVOS memo-0144-25 solicitud.pdf', 2, '2025-05-15 20:44:38', '2025-05-15 20:44:38'),
	(2079, 'storage/documentos/escrito/qtCEIT54IV_JHONAY ORTIZ respuesta a correo Eder-Caro.pdf', 'qtCEIT54IV_JHONAY ORTIZ respuesta a correo Eder-Caro.pdf', 5, '2025-05-15 20:47:43', '2025-05-15 20:47:43'),
	(2080, 'storage/documentos/memorandum/0Jm3OcCsdo_JURÍDICO memo-0026-2025 se remite convenio para resguardo Eder-Normatividad.pdf', '0Jm3OcCsdo_JURÍDICO memo-0026-2025 se remite convenio para resguardo Eder-Normatividad.pdf', 2, '2025-05-15 20:49:23', '2025-05-15 20:49:23'),
	(2081, 'storage/documentos/memorandum/U55tkgMUQJ_JURÍDICO memo-ca-se-0016-2025 se remite convenio prep Eder-Normatividad.pdf', 'U55tkgMUQJ_JURÍDICO memo-ca-se-0016-2025 se remite convenio prep Eder-Normatividad.pdf', 2, '2025-05-15 20:50:36', '2025-05-15 20:50:36'),
	(2082, 'storage/documentos/memorandum/ws5Mo8GAtr_UFD memo-487-2025 se solicita desincorporación de personal Cuarto.pdf', 'ws5Mo8GAtr_UFD memo-487-2025 se solicita desincorporación de personal Cuarto.pdf', 2, '2025-05-15 20:53:15', '2025-05-15 20:53:15'),
	(2083, 'storage/documentos/requisicion/ant3TqmJIF_REQUISICIÓN No.pdf', 'ant3TqmJIF_REQUISICIÓN No.pdf', 1, '2025-05-15 20:54:59', '2025-05-15 20:54:59'),
	(2084, 'storage/documentos/requisicion/ODk0t2FS0n_REQUISICIÓN No.pdf', 'ODk0t2FS0n_REQUISICIÓN No.pdf', 1, '2025-05-15 20:56:03', '2025-05-15 20:56:03'),
	(2085, 'storage/documentos/requisicion/IznmRAyfiz_REQUISICIÓN No.pdf', 'IznmRAyfiz_REQUISICIÓN No.pdf', 1, '2025-05-15 20:57:03', '2025-05-15 20:57:03'),
	(2086, 'storage/documentos/requisicion/DkSYcHQLvU_REQUISICIÓN No.pdf', 'DkSYcHQLvU_REQUISICIÓN No.pdf', 1, '2025-05-15 20:58:03', '2025-05-15 20:58:03'),
	(2087, 'storage/documentos/requisicion/xjtzNQrNHo_REQUISICIÓN NO.pdf', 'xjtzNQrNHo_REQUISICIÓN NO.pdf', 1, '2025-05-15 20:58:58', '2025-05-15 20:58:58'),
	(2088, 'storage/documentos/requisicion/v8YYufq6ae_REQUISICIÓN No.pdf', 'v8YYufq6ae_REQUISICIÓN No.pdf', 1, '2025-05-15 21:00:26', '2025-05-15 21:00:26'),
	(2089, 'storage/documentos/requisicion/StdHT3DiV8_REQUISICIÓN No.pdf', 'StdHT3DiV8_REQUISICIÓN No.pdf', 1, '2025-05-15 21:02:04', '2025-05-15 21:02:04'),
	(2090, 'storage/documentos/oficio/DkrDj4V2Md_AUDITOR EXTERNO oficio aj-ae-04-2025 solicitud de Información Control Interno  Eder-Dalila.pdf', 'DkrDj4V2Md_AUDITOR EXTERNO oficio aj-ae-04-2025 solicitud de Información Control Interno  Eder-Dalila.pdf', 3, '2025-05-16 15:35:56', '2025-05-16 15:35:56'),
	(2091, 'storage/documentos/memorandum/Q8cNpqGVgg_CONTRALORÍA memo-270-2025.pdf', 'Q8cNpqGVgg_CONTRALORÍA memo-270-2025.pdf', 2, '2025-05-16 15:38:26', '2025-05-16 15:38:26'),
	(2092, 'storage/documentos/oficio/SoBcwhb2rr_PRERROGATIVAS oficio-0075-2025  inconsistencias en recibos fuerza por méxico Saúl.pdf', 'SoBcwhb2rr_PRERROGATIVAS oficio-0075-2025  inconsistencias en recibos fuerza por méxico Saúl.pdf', 3, '2025-05-16 15:41:34', '2025-05-16 15:41:34'),
	(2093, 'storage/documentos/requisicion/4gXChcglB5_REQUISICIÓN No.pdf', '4gXChcglB5_REQUISICIÓN No.pdf', 1, '2025-05-16 15:44:38', '2025-05-16 15:44:38'),
	(2094, 'storage/documentos/escrito/yO3UOdNjza_OFICIALIA DE PARTES folio 2188 escrito c.pdf', 'yO3UOdNjza_OFICIALIA DE PARTES folio 2188 escrito c.pdf', 5, '2025-05-19 16:43:28', '2025-05-19 16:43:28'),
	(2095, 'storage/documentos/escrito/CBp6VNts0b_DA CORREO PRESUPUESTO ALE-EDER.pdf', 'CBp6VNts0b_DA CORREO PRESUPUESTO ALE-EDER.pdf', 5, '2025-05-19 16:49:26', '2025-05-19 16:49:26'),
	(2096, 'storage/documentos/memorandum/SyuCZyeV9W_CONTRALORÍA memo-256-2025 fotomultas Daniel-Ángel.pdf', 'SyuCZyeV9W_CONTRALORÍA memo-256-2025 fotomultas Daniel-Ángel.pdf', 2, '2025-05-20 18:25:41', '2025-05-20 18:25:41'),
	(2097, 'storage/documentos/escrito/7HrOao5Rkf_LILIA TAVERA ORTIZ correo Eder-Caro.pdf', '7HrOao5Rkf_LILIA TAVERA ORTIZ correo Eder-Caro.pdf', 5, '2025-05-20 18:26:57', '2025-05-20 18:26:57'),
	(2098, 'storage/documentos/escrito/qfZ481HgHA_UFD reporte de asystec entradas y salidas mayo 1-15 Caro-Jorge.pdf', 'qfZ481HgHA_UFD reporte de asystec entradas y salidas mayo 1-15 Caro-Jorge.pdf', 5, '2025-05-20 18:28:14', '2025-05-20 18:28:14'),
	(2099, 'storage/documentos/escrito/V4T2kL1yFr_ALEJANDRA FERNANDEZ CORREO RESPUESTA OFICIO EDER-CARO.pdf', 'V4T2kL1yFr_ALEJANDRA FERNANDEZ CORREO RESPUESTA OFICIO EDER-CARO.pdf', 5, '2025-05-20 19:01:36', '2025-05-20 19:01:36'),
	(2100, 'storage/documentos/memorandum/5sFKthShpj_CONSEJERA EVANGELINA MEMO PRE-COPEAD-005-2025 SESION ESPECIAL COPEAD FRANCO.pdf', '5sFKthShpj_CONSEJERA EVANGELINA MEMO PRE-COPEAD-005-2025 SESION ESPECIAL COPEAD FRANCO.pdf', 2, '2025-05-20 19:03:42', '2025-05-20 19:03:42'),
	(2101, 'storage/documentos/memorandum/AlxsnX8lbr_CONSEJERA EVANGELINA MEMO PRE-COPED-005-2025 FRANCO.pdf', 'AlxsnX8lbr_CONSEJERA EVANGELINA MEMO PRE-COPED-005-2025 FRANCO.pdf', 2, '2025-05-20 19:09:00', '2025-05-20 19:09:00'),
	(2102, 'storage/documentos/escrito/jNDJy1uIIG_DA CORREO ENCUESTA INDIVIDUAL EMIR ALE.pdf', 'jNDJy1uIIG_DA CORREO ENCUESTA INDIVIDUAL EMIR ALE.pdf', 5, '2025-05-20 20:16:01', '2025-05-20 20:16:01'),
	(2103, 'storage/documentos/memorandum/dEIsHAu31x_DA MEMO DA-0561-2025 SOLICITUD DE INFORMACION.pdf', 'dEIsHAu31x_DA MEMO DA-0561-2025 SOLICITUD DE INFORMACION.pdf', 2, '2025-05-20 20:19:12', '2025-05-20 20:19:12'),
	(2104, 'storage/documentos/memorandum/I6kE0fBQLp_DA memo-0534-2025 Ingresos Normatividad.pdf', 'I6kE0fBQLp_DA memo-0534-2025 Ingresos Normatividad.pdf', 2, '2025-05-20 20:21:35', '2025-05-20 20:21:35'),
	(2105, 'storage/documentos/memorandum/s6zJnvHuoK_DA memo-548-2025orden del día COPEAD.pdf', 's6zJnvHuoK_DA memo-548-2025orden del día COPEAD.pdf', 2, '2025-05-20 20:30:13', '2025-05-20 20:30:13'),
	(2106, 'storage/documentos/memorandum/1Fesr537Xx_DA MEMO-0555-2025 AUTORIZACION PARA CERTIFICAR.pdf', '1Fesr537Xx_DA MEMO-0555-2025 AUTORIZACION PARA CERTIFICAR.pdf', 2, '2025-05-20 20:32:36', '2025-05-20 20:32:36'),
	(2107, 'storage/documentos/memorandum/j1agMglPcR_DJ MEMO DJ-1068-2025 SOLICITUD DE INFORMACION FRANCO-EDER.pdf', 'j1agMglPcR_DJ MEMO DJ-1068-2025 SOLICITUD DE INFORMACION FRANCO-EDER.pdf', 2, '2025-05-20 20:37:39', '2025-05-20 20:37:39'),
	(2108, 'storage/documentos/memorandum/R7M8YDSFz4_DPPP MEMO 0397-2025  RECIBOS NAP Y MORENA SAUL.pdf', 'R7M8YDSFz4_DPPP MEMO 0397-2025  RECIBOS NAP Y MORENA SAUL.pdf', 2, '2025-05-20 20:39:10', '2025-05-20 20:39:10'),
	(2109, 'storage/documentos/memorandum/ewUOtuPVdF_JURÍDICO memo-0058BIS-2025 se remite contrato para su observación Eder-Normatividad.pdf', 'ewUOtuPVdF_JURÍDICO memo-0058BIS-2025 se remite contrato para su observación Eder-Normatividad.pdf', 2, '2025-05-20 20:42:26', '2025-05-20 20:42:26'),
	(2110, 'storage/documentos/memorandum/jSQJBD3Rdh_JURÍDICO memo-0058BIS-2025 se remite contrato para su observación entornos imprenta digital Eder-Normatividad.pdf', 'jSQJBD3Rdh_JURÍDICO memo-0058BIS-2025 se remite contrato para su observación entornos imprenta digital Eder-Normatividad.pdf', 2, '2025-05-20 20:43:34', '2025-05-20 20:43:34'),
	(2111, 'storage/documentos/memorandum/YYe9eEUa0z_JURÍDICO memo-ca-se-002bis-2025 se remite contrato para su resguardo broxer Eder-Normatividad.pdf', 'YYe9eEUa0z_JURÍDICO memo-ca-se-002bis-2025 se remite contrato para su resguardo broxer Eder-Normatividad.pdf', 2, '2025-05-20 20:45:16', '2025-05-20 20:45:16'),
	(2112, 'storage/documentos/memorandum/zZf7hG2sJt_JURÍDICO memo-CA-SE-21BIS-2025 se envía contrato para su resguardo broxel Eder-Normartividad.pdf', 'zZf7hG2sJt_JURÍDICO memo-CA-SE-21BIS-2025 se envía contrato para su resguardo broxel Eder-Normartividad.pdf', 2, '2025-05-20 20:46:48', '2025-05-20 20:46:48'),
	(2113, 'storage/documentos/escrito/P8cOuhjJd1_LAURA LEZAMA LEZAMA respuesta a correo Eder-Caro.pdf', 'P8cOuhjJd1_LAURA LEZAMA LEZAMA respuesta a correo Eder-Caro.pdf', 5, '2025-05-20 20:48:18', '2025-05-20 20:48:18'),
	(2114, 'storage/documentos/escrito/PNbqKQ0EjE_Lic.pdf', 'PNbqKQ0EjE_Lic.pdf', 5, '2025-05-20 20:49:27', '2025-05-20 20:49:27'),
	(2115, 'storage/documentos/escrito/m5ZZlKFNMr_LIC.pdf', 'm5ZZlKFNMr_LIC.pdf', 5, '2025-05-20 20:50:33', '2025-05-20 20:50:33'),
	(2116, 'storage/documentos/oficio/NwmUqO3LCp_Memorándum No.pdf', 'NwmUqO3LCp_Memorándum No.pdf', 3, '2025-05-20 20:53:01', '2025-05-20 20:53:01'),
	(2117, 'storage/documentos/tarjeta/Iog5rDdoMn_OFICIALIA ESCRITO FOLIO 2214 LIBERACION EDER-CARO.pdf', 'Iog5rDdoMn_OFICIALIA ESCRITO FOLIO 2214 LIBERACION EDER-CARO.pdf', 6, '2025-05-20 20:54:15', '2025-05-20 20:54:15'),
	(2118, 'storage/documentos/oficio/47Flq2G8FR_PRERROGATIVAS oficio-69-2025inconsistencias en recibos Eder-Saúl.pdf', '47Flq2G8FR_PRERROGATIVAS oficio-69-2025inconsistencias en recibos Eder-Saúl.pdf', 3, '2025-05-20 20:56:05', '2025-05-20 20:56:05'),
	(2119, 'storage/documentos/oficio/1KVfm3VkWm_PRERROGATIVAS oficio-0071-2025 inconsistencias en recibos ministración Eder-Saúl.pdf', '1KVfm3VkWm_PRERROGATIVAS oficio-0071-2025 inconsistencias en recibos ministración Eder-Saúl.pdf', 3, '2025-05-20 20:57:24', '2025-05-20 20:57:24'),
	(2120, 'storage/documentos/oficio/03wVpMlaeY_PRERROGATIVAS oficio-0072-2025 inconsitencias recibos ministraciónEder-Saúl.pdf', '03wVpMlaeY_PRERROGATIVAS oficio-0072-2025 inconsitencias recibos ministraciónEder-Saúl.pdf', 3, '2025-05-20 21:00:25', '2025-05-20 21:00:25'),
	(2121, 'storage/documentos/oficio/fUrvn0NvsQ_PRERROGATIVAS oficio-0073-2025 otrora encuentro solidario Eder-Saúl.pdf', 'fUrvn0NvsQ_PRERROGATIVAS oficio-0073-2025 otrora encuentro solidario Eder-Saúl.pdf', 3, '2025-05-20 21:02:05', '2025-05-20 21:02:05'),
	(2122, 'storage/documentos/oficio/fo5ZtxlTiO_Prerrogativas oficio-0074-2025 recibos pendientes financiamiento Eder-Saúl.pdf', 'fo5ZtxlTiO_Prerrogativas oficio-0074-2025 recibos pendientes financiamiento Eder-Saúl.pdf', 3, '2025-05-20 21:03:06', '2025-05-20 21:03:06'),
	(2123, 'storage/documentos/oficio/3Kv7YzLCiV_PRERROGATIVASoficio-70-2025 inconsistencias recibos ministración Eder-Saúl.pdf', '3Kv7YzLCiV_PRERROGATIVASoficio-70-2025 inconsistencias recibos ministración Eder-Saúl.pdf', 3, '2025-05-20 21:04:13', '2025-05-20 21:04:13'),
	(2124, 'storage/documentos/memorandum/HhWUvNOOOB_PRESIDENCIA MEMO PRE-1156-2025 MINISTRACION MAYO SAUL.pdf', 'HhWUvNOOOB_PRESIDENCIA MEMO PRE-1156-2025 MINISTRACION MAYO SAUL.pdf', 2, '2025-05-20 21:05:11', '2025-05-20 21:05:11'),
	(2125, 'storage/documentos/requisicion/RLnoOmfTVi_REQUISICIÓN No 1204.pdf', 'RLnoOmfTVi_REQUISICIÓN No 1204.pdf', 1, '2025-05-20 21:06:24', '2025-05-20 21:06:24'),
	(2126, 'storage/documentos/requisicion/VoS9sPtgu2_REQUISICIÓN No.pdf', 'VoS9sPtgu2_REQUISICIÓN No.pdf', 1, '2025-05-20 21:07:06', '2025-05-20 21:07:06'),
	(2127, 'storage/documentos/requisicion/XTZjoA7cos_REQUISICIÓN No.pdf', 'XTZjoA7cos_REQUISICIÓN No.pdf', 1, '2025-05-20 21:08:02', '2025-05-20 21:08:02'),
	(2128, 'storage/documentos/requisicion/zeliQXsBQB_REQUISICIÓN No.pdf', 'zeliQXsBQB_REQUISICIÓN No.pdf', 1, '2025-05-20 21:19:19', '2025-05-20 21:19:19'),
	(2129, 'storage/documentos/requisicion/F91fcAJbq2_REQUISICIÓN No.pdf', 'F91fcAJbq2_REQUISICIÓN No.pdf', 1, '2025-05-21 14:51:16', '2025-05-21 14:51:16'),
	(2130, 'storage/documentos/requisicion/iBdt2bzjCz_REQUISICIÓN No.pdf', 'iBdt2bzjCz_REQUISICIÓN No.pdf', 1, '2025-05-21 14:52:41', '2025-05-21 14:52:41'),
	(2131, 'storage/documentos/requisicion/11IY1geSxW_REQUISICIÓN No.pdf', '11IY1geSxW_REQUISICIÓN No.pdf', 1, '2025-05-21 14:55:38', '2025-05-21 14:55:38'),
	(2132, 'storage/documentos/requisicion/NxTD2odv1q_REQUISICIÓN No.pdf', 'NxTD2odv1q_REQUISICIÓN No.pdf', 1, '2025-05-21 15:13:31', '2025-05-21 15:13:31'),
	(2133, 'storage/documentos/requisicion/S7w0fyHzGN_REQUISICIÓN No.pdf', 'S7w0fyHzGN_REQUISICIÓN No.pdf', 1, '2025-05-21 15:14:19', '2025-05-21 15:14:19'),
	(2134, 'storage/documentos/requisicion/sT8MdxbLCK_REQUISICIÓN No.pdf', 'sT8MdxbLCK_REQUISICIÓN No.pdf', 1, '2025-05-21 15:16:52', '2025-05-21 15:16:52'),
	(2135, 'storage/documentos/escrito/r0gb1IrjMJ_SANDRA PERALTA CORREO RESPUESTA OFICIO EDER-CARO.pdf', 'r0gb1IrjMJ_SANDRA PERALTA CORREO RESPUESTA OFICIO EDER-CARO.pdf', 5, '2025-05-21 15:24:16', '2025-05-21 15:24:16'),
	(2136, 'storage/documentos/oficio/0nfWf92dKp_SE OFICIO 0896 DESIGANCION DE ENCARGO CUARTO.pdf', '0nfWf92dKp_SE OFICIO 0896 DESIGANCION DE ENCARGO CUARTO.pdf', 3, '2025-05-21 15:26:10', '2025-05-21 15:26:10'),
	(2137, 'storage/documentos/memorandum/b8YVyYRxcG_SECRETARÍA memo-1687-2025 se autoriza certificación Eder.pdf', 'b8YVyYRxcG_SECRETARÍA memo-1687-2025 se autoriza certificación Eder.pdf', 2, '2025-05-21 15:30:02', '2025-05-21 15:30:02'),
	(2138, 'storage/documentos/memorandum/Z7Me8kv3Hj_SECRETARÍA memo-1707-2025 se remite foio interno 2214 oficio sabg-os-sca-028-2025 Eder.pdf', 'Z7Me8kv3Hj_SECRETARÍA memo-1707-2025 se remite foio interno 2214 oficio sabg-os-sca-028-2025 Eder.pdf', 2, '2025-05-21 15:32:33', '2025-05-21 15:32:33'),
	(2139, 'storage/documentos/memorandum/gORKFRiexO_UFD memo-498-2025 se informa conclusión de encargos de despacho spen.pdf', 'gORKFRiexO_UFD memo-498-2025 se informa conclusión de encargos de despacho spen.pdf', 2, '2025-05-21 15:35:56', '2025-05-21 15:35:56'),
	(2140, 'storage/documentos/memorandum/z2ZPxSFDaA_UFD memo-499-2025 se informa encargo de despacho spen Cuarto.pdf', 'z2ZPxSFDaA_UFD memo-499-2025 se informa encargo de despacho spen Cuarto.pdf', 2, '2025-05-21 15:39:44', '2025-05-21 15:39:44'),
	(2141, 'storage/documentos/memorandum/GCgs9yI74a_DOE memo-054-2025 se remite adenda xiutetelco  Normatividad.pdf', 'GCgs9yI74a_DOE memo-054-2025 se remite adenda xiutetelco  Normatividad.pdf', 2, '2025-05-21 16:20:46', '2025-05-21 16:20:46'),
	(2142, 'storage/documentos/memorandum/D4t6rWFoN9_JURÍDICO memo-ca-se-0064-2025 se remite contrato para su observación mayoristas Eder-Normatividad.pdf', 'D4t6rWFoN9_JURÍDICO memo-ca-se-0064-2025 se remite contrato para su observación mayoristas Eder-Normatividad.pdf', 2, '2025-05-21 16:22:11', '2025-05-21 16:22:11'),
	(2143, 'storage/documentos/escrito/GUCim29U60_LOURDES OLIVER respuesta a correo Eder-Caro.pdf', 'GUCim29U60_LOURDES OLIVER respuesta a correo Eder-Caro.pdf', 5, '2025-05-21 16:23:19', '2025-05-21 16:23:19'),
	(2144, 'storage/documentos/memorandum/RCq6cmgTV9_PRERROGATIVAS memo-0394-2025 se remiten recibos originales Saúl.pdf', 'RCq6cmgTV9_PRERROGATIVAS memo-0394-2025 se remiten recibos originales Saúl.pdf', 2, '2025-05-21 16:24:41', '2025-05-21 16:24:41'),
	(2145, 'storage/documentos/memorandum/JtUK5SJL4s_PRESIDENCIA memo-copead-006-2025 informe anual de la comisión permanente adm.pdf', 'JtUK5SJL4s_PRESIDENCIA memo-copead-006-2025 informe anual de la comisión permanente adm.pdf', 2, '2025-05-21 16:25:57', '2025-05-21 16:25:57'),
	(2146, 'storage/documentos/oficio/5pGRFUGPV1_PRESIDENCIA oficio-0432-2025 ministración del mes de mayo Archivo.pdf', '5pGRFUGPV1_PRESIDENCIA oficio-0432-2025 ministración del mes de mayo Archivo.pdf', 3, '2025-05-21 16:27:11', '2025-05-21 16:27:11'),
	(2147, 'storage/documentos/oficio/7Asqz449gq_PRESIDENCIA oficio-0433-2025 se remiten estados financieros mes abril Emir.pdf', '7Asqz449gq_PRESIDENCIA oficio-0433-2025 se remiten estados financieros mes abril Emir.pdf', 3, '2025-05-21 16:30:01', '2025-05-21 16:30:01'),
	(2148, 'storage/documentos/oficio/7qofdIEBvi_PRESIDENCIA oficio-0434-2025 se remite información y docu Emir-Eder.pdf', '7qofdIEBvi_PRESIDENCIA oficio-0434-2025 se remite información y docu Emir-Eder.pdf', 3, '2025-05-21 16:34:45', '2025-05-21 16:34:45'),
	(2149, 'storage/documentos/oficio/cIIGeumOYe_PRESIDENCIA oficio-0434-2025 se remite información y docu Emir-Eder-.pdf', 'cIIGeumOYe_PRESIDENCIA oficio-0434-2025 se remite información y docu Emir-Eder-.pdf', 3, '2025-05-21 16:35:58', '2025-05-21 16:35:58'),
	(2150, 'storage/documentos/oficio/bKfKxALexI_PRESIDENCIA oficio-0435-2025 se remite información y docu Emir-Eder.pdf', 'bKfKxALexI_PRESIDENCIA oficio-0435-2025 se remite información y docu Emir-Eder.pdf', 3, '2025-05-21 16:37:04', '2025-05-21 16:37:04'),
	(2151, 'storage/documentos/oficio/ueS4IPtuSz_PRESIDENCIA oficio-0436-2025 se remite información y docu Emir-Eder.pdf', 'ueS4IPtuSz_PRESIDENCIA oficio-0436-2025 se remite información y docu Emir-Eder.pdf', 3, '2025-05-21 16:38:26', '2025-05-21 16:38:26'),
	(2152, 'storage/documentos/oficio/8k631p2wu4_PRESIDENCIA oficio-0437-2025 se remite informacipon y docu Emir-Eder.pdf', '8k631p2wu4_PRESIDENCIA oficio-0437-2025 se remite informacipon y docu Emir-Eder.pdf', 3, '2025-05-21 16:39:40', '2025-05-21 16:39:40'),
	(2153, 'storage/documentos/oficio/3DQYVIdPpg_PRESIDENCIA oficio-0438-2025 se remite informacipon y docu Emir-Eder.pdf', '3DQYVIdPpg_PRESIDENCIA oficio-0438-2025 se remite informacipon y docu Emir-Eder.pdf', 3, '2025-05-21 16:40:58', '2025-05-21 16:40:58'),
	(2154, 'storage/documentos/oficio/x2gv7wKpS2_PRESIDENCIA oficio-0439-2025 se remite información y docu Emir-Eder.pdf', 'x2gv7wKpS2_PRESIDENCIA oficio-0439-2025 se remite información y docu Emir-Eder.pdf', 3, '2025-05-21 16:42:14', '2025-05-21 16:42:14'),
	(2155, 'storage/documentos/oficio/f5y15Mggci_PRESIDENCIA oficio-0440-2025 se remite información y docu Emir-Eder.pdf', 'f5y15Mggci_PRESIDENCIA oficio-0440-2025 se remite información y docu Emir-Eder.pdf', 3, '2025-05-21 16:43:11', '2025-05-21 16:43:11'),
	(2156, 'storage/documentos/oficio/L1UBKIrgpd_PRESIDENCIA oficio-0441-2025 se remite información y docu Emir-Eder.pdf', 'L1UBKIrgpd_PRESIDENCIA oficio-0441-2025 se remite información y docu Emir-Eder.pdf', 3, '2025-05-21 16:43:58', '2025-05-21 16:43:58'),
	(2157, 'storage/documentos/oficio/A2xjI0zNs2_PRESIDENCIA oficio-0442-2025 se remite información y docu Emir-Eder.pdf', 'A2xjI0zNs2_PRESIDENCIA oficio-0442-2025 se remite información y docu Emir-Eder.pdf', 3, '2025-05-21 16:44:51', '2025-05-21 16:44:51'),
	(2158, 'storage/documentos/requisicion/xCU1XZysST_REQUISICIÓN No.pdf', 'xCU1XZysST_REQUISICIÓN No.pdf', 1, '2025-05-21 16:45:41', '2025-05-21 16:45:41'),
	(2159, 'storage/documentos/requisicion/DXv83KnZww_REQUISICIÓN No.pdf', 'DXv83KnZww_REQUISICIÓN No.pdf', 1, '2025-05-21 16:46:24', '2025-05-21 16:46:24'),
	(2160, 'storage/documentos/requisicion/lZEBz1T0vQ_REQUISICIÓN No.pdf', 'lZEBz1T0vQ_REQUISICIÓN No.pdf', 1, '2025-05-21 16:47:07', '2025-05-21 16:47:07'),
	(2161, 'storage/documentos/escrito/CkfSVNJf74_IRIS VAZQUEZ respuesta a correo Eder-Caro.pdf', 'CkfSVNJf74_IRIS VAZQUEZ respuesta a correo Eder-Caro.pdf', 5, '2025-05-21 17:40:31', '2025-05-21 17:40:31'),
	(2162, 'storage/documentos/escrito/8GDCKHcIJI_JESÚS MERINO PEREZ respuesta a correo Eder-Caro.pdf', '8GDCKHcIJI_JESÚS MERINO PEREZ respuesta a correo Eder-Caro.pdf', 5, '2025-05-21 17:41:35', '2025-05-21 17:41:35'),
	(2163, 'storage/documentos/escrito/Nqi2cRjw0b_LOURDES OLIVER respuesta a correo Eder-Caro.pdf', 'Nqi2cRjw0b_LOURDES OLIVER respuesta a correo Eder-Caro.pdf', 5, '2025-05-21 17:42:23', '2025-05-21 17:42:23'),
	(2164, 'storage/documentos/memorandum/gH8DfkSJ4Y_PRERROGATIVAS memo-0399-2025 recibos de financiamiento publico Eder-Saúl.pdf', 'gH8DfkSJ4Y_PRERROGATIVAS memo-0399-2025 recibos de financiamiento publico Eder-Saúl.pdf', 2, '2025-05-21 17:44:05', '2025-05-21 17:44:05'),
	(2165, 'storage/documentos/requisicion/XV0FaAxnEt_REQUISICIÓN No.pdf', 'XV0FaAxnEt_REQUISICIÓN No.pdf', 1, '2025-05-21 17:44:47', '2025-05-21 17:44:47'),
	(2166, 'storage/documentos/requisicion/6zP2AbeMvG_REQUISICIÓN No.pdf', '6zP2AbeMvG_REQUISICIÓN No.pdf', 1, '2025-05-21 17:45:44', '2025-05-21 17:45:44'),
	(2167, 'storage/documentos/requisicion/vZP7AmyVnO_REQUISICIÓN No.pdf', 'vZP7AmyVnO_REQUISICIÓN No.pdf', 1, '2025-05-21 17:51:33', '2025-05-21 17:51:33'),
	(2168, 'storage/documentos/circular/KDKuqDnbh5_SECRETARÍA circular-065-2025 conferencia reescribiendo historias maternidades  y  estereoporosis a todo el personal.pdf', 'KDKuqDnbh5_SECRETARÍA circular-065-2025 conferencia reescribiendo historias maternidades  y  estereoporosis a todo el personal.pdf', 4, '2025-05-21 17:52:49', '2025-05-21 17:52:49'),
	(2169, 'storage/documentos/circular/k9D7hLZL7I_SECRETARÍA circular-066-2025 feria cívica Lic.pdf', 'k9D7hLZL7I_SECRETARÍA circular-066-2025 feria cívica Lic.pdf', 4, '2025-05-21 17:53:46', '2025-05-21 17:53:46'),
	(2170, 'storage/documentos/circular/3jYaxLLSaH_SECRETARÍA circular-068-2025 presentación del libro tribunal incómodo Itzel, Mayra, Aranxxa.pdf', '3jYaxLLSaH_SECRETARÍA circular-068-2025 presentación del libro tribunal incómodo Itzel, Mayra, Aranxxa.pdf', 4, '2025-05-21 17:55:01', '2025-05-21 17:55:01'),
	(2171, 'storage/documentos/circular/pVS3ZEXxrp_SECRETARÍA circular-069-2025 jornada de vacunación A todo el personal.pdf', 'pVS3ZEXxrp_SECRETARÍA circular-069-2025 jornada de vacunación A todo el personal.pdf', 4, '2025-05-21 17:57:31', '2025-05-21 17:57:31'),
	(2172, 'storage/documentos/memorandum/EGm8oQNTSf_SECRETARÍA memo-1718-2025 se autoriza certificación Saúl.pdf', 'EGm8oQNTSf_SECRETARÍA memo-1718-2025 se autoriza certificación Saúl.pdf', 2, '2025-05-21 18:03:01', '2025-05-21 18:03:01'),
	(2173, 'storage/documentos/escrito/teb1B8UXTw_SEVAC correo notificación encuesta individual Ale-Emir-Eder.pdf', 'teb1B8UXTw_SEVAC correo notificación encuesta individual Ale-Emir-Eder.pdf', 5, '2025-05-21 18:04:05', '2025-05-21 18:04:05'),
	(2174, 'storage/documentos/circular/3Vrv8p7O9P_TRANSPARENCIA circular-033-2025 el que se indica Luis-Cuarto.pdf', '3Vrv8p7O9P_TRANSPARENCIA circular-033-2025 el que se indica Luis-Cuarto.pdf', 4, '2025-05-21 18:09:29', '2025-05-21 18:09:29'),
	(2175, 'storage/documentos/oficio/j1vjT2A5iZ_AUDIRTOR EXTERNO oficio-aj-ae-01-2025 presentación de equipo Eder-Dali.pdf', 'j1vjT2A5iZ_AUDIRTOR EXTERNO oficio-aj-ae-01-2025 presentación de equipo Eder-Dali.pdf', 3, '2025-05-22 15:03:16', '2025-05-22 15:03:16'),
	(2176, 'storage/documentos/memorandum/b4VXcu14UV_DA memo-0564-2025 se remite información Saúl.pdf', 'b4VXcu14UV_DA memo-0564-2025 se remite información Saúl.pdf', 2, '2025-05-22 15:04:39', '2025-05-22 15:04:39'),
	(2177, 'storage/documentos/memorandum/UkLsn48bpc_DTS memo-0857-2025 se solicita dar de baja mobiliario Daniel.pdf', 'UkLsn48bpc_DTS memo-0857-2025 se solicita dar de baja mobiliario Daniel.pdf', 2, '2025-05-22 15:06:09', '2025-05-22 15:06:09'),
	(2178, 'storage/documentos/tarjeta/UwXqtico4q_OFICIALIA DE PARTES folio 2239 escrito respuesta a correo  josé agustpin navarro morales Eder-Caro.pdf', 'UwXqtico4q_OFICIALIA DE PARTES folio 2239 escrito respuesta a correo  josé agustpin navarro morales Eder-Caro.pdf', 6, '2025-05-22 15:08:54', '2025-05-22 15:08:54'),
	(2179, 'storage/documentos/memorandum/0nO1d3owSd_PRESIDENCIA informe anual de la comisión permnente.pdf', '0nO1d3owSd_PRESIDENCIA informe anual de la comisión permnente.pdf', 2, '2025-05-22 15:11:19', '2025-05-22 15:11:19'),
	(2180, 'storage/documentos/memorandum/mwp5sUGWpn_PRESIDENCIA memo-copead- 007-202025-sesión ordinaria copead Normatividad-Eder.pdf', 'mwp5sUGWpn_PRESIDENCIA memo-copead- 007-202025-sesión ordinaria copead Normatividad-Eder.pdf', 2, '2025-05-22 15:12:35', '2025-05-22 15:12:35'),
	(2181, 'storage/documentos/requisicion/zl1f7w1j92_REQUISICIÓN No.pdf', 'zl1f7w1j92_REQUISICIÓN No.pdf', 1, '2025-05-22 15:13:45', '2025-05-22 15:13:45'),
	(2182, 'storage/documentos/requisicion/x8UtsWkh8f_REQUISICIÓN No.pdf', 'x8UtsWkh8f_REQUISICIÓN No.pdf', 1, '2025-05-22 15:14:43', '2025-05-22 15:14:43'),
	(2183, 'storage/documentos/memorandum/gsuuwJTyaz_UFD memo-504-2025 se solicita alta de personal Cuarto.pdf', 'gsuuwJTyaz_UFD memo-504-2025 se solicita alta de personal Cuarto.pdf', 2, '2025-05-22 15:16:43', '2025-05-22 15:16:43'),
	(2184, 'storage/documentos/escrito/iiexaK4iRm_SEVAC curso virtual jueves 29 mayo Ale-Jorge-Eder.pdf', 'iiexaK4iRm_SEVAC curso virtual jueves 29 mayo Ale-Jorge-Eder.pdf', 5, '2025-05-22 17:36:47', '2025-05-22 17:36:47'),
	(2185, 'storage/documentos/requisicion/mw5EtpwRGV_REQUISICIÓN No.pdf', 'mw5EtpwRGV_REQUISICIÓN No.pdf', 1, '2025-05-22 17:38:24', '2025-05-22 17:38:24'),
	(2186, 'storage/documentos/requisicion/bcfn1q7270_REQUISICIÓN No.pdf', 'bcfn1q7270_REQUISICIÓN No.pdf', 1, '2025-05-22 17:46:50', '2025-05-22 17:46:50'),
	(2187, 'storage/documentos/requisicion/Gbc2jwm4EK_REQUISICIÓN No.pdf', 'Gbc2jwm4EK_REQUISICIÓN No.pdf', 1, '2025-05-22 17:50:38', '2025-05-22 17:50:38'),
	(2188, 'storage/documentos/requisicion/qddi1WyuSG_REQUISICIÓN No.pdf', 'qddi1WyuSG_REQUISICIÓN No.pdf', 1, '2025-05-22 17:55:11', '2025-05-22 17:55:11'),
	(2189, 'storage/documentos/requisicion/szOiveWaIS_REQUISICIÓN No.pdf', 'szOiveWaIS_REQUISICIÓN No.pdf', 1, '2025-05-22 17:56:31', '2025-05-22 17:56:31'),
	(2190, 'storage/documentos/tarjeta/iS0OtZQVHs_ROBERTO FORNACÉ GARCÍA escrito informe sobre daño en vehículo Eder-Caro-Daniel-Ángel.pdf', 'iS0OtZQVHs_ROBERTO FORNACÉ GARCÍA escrito informe sobre daño en vehículo Eder-Caro-Daniel-Ángel.pdf', 6, '2025-05-22 20:00:27', '2025-05-22 20:00:27'),
	(2191, 'storage/documentos/memorandum/X7DGe7r3BG_JURÍDICO memo-0499bis-2025 se remite contrato para su obsevación  entornos imprenta digitalNormatividad.pdf', 'X7DGe7r3BG_JURÍDICO memo-0499bis-2025 se remite contrato para su obsevación  entornos imprenta digitalNormatividad.pdf', 2, '2025-05-23 14:39:55', '2025-05-23 14:39:55'),
	(2192, 'storage/documentos/memorandum/rNAv6HPgSZ_JURÍDICO memo-1096-2025 solicitud de información Normatividad.pdf', 'rNAv6HPgSZ_JURÍDICO memo-1096-2025 solicitud de información Normatividad.pdf', 2, '2025-05-23 14:41:43', '2025-05-23 14:41:43'),
	(2193, 'storage/documentos/tarjeta/YChoFfvPC2_OFICIALIA DE PARTES folio 2247 escrito metlife Israel.pdf', 'YChoFfvPC2_OFICIALIA DE PARTES folio 2247 escrito metlife Israel.pdf', 6, '2025-05-23 14:45:00', '2025-05-23 14:45:00'),
	(2194, 'storage/documentos/memorandum/kk7R8MdICp_PLANEACIÓN memo-039-2025 información solicitada por auditor.pdf', 'kk7R8MdICp_PLANEACIÓN memo-039-2025 información solicitada por auditor.pdf', 2, '2025-05-23 14:46:44', '2025-05-23 14:46:44'),
	(2195, 'storage/documentos/memorandum/LhL0obqmFV_PRERROGATIVAS memo-00412-2025 se remiten recibos originales Saúl.pdf', 'LhL0obqmFV_PRERROGATIVAS memo-00412-2025 se remiten recibos originales Saúl.pdf', 2, '2025-05-23 14:48:15', '2025-05-23 14:48:15'),
	(2196, 'storage/documentos/requisicion/SdY1vy1BJO_REQUISICIÓN No.pdf', 'SdY1vy1BJO_REQUISICIÓN No.pdf', 1, '2025-05-23 14:49:13', '2025-05-23 14:49:13'),
	(2197, 'storage/documentos/requisicion/XnA3asstSo_REQUISICIÓN No.pdf', 'XnA3asstSo_REQUISICIÓN No.pdf', 1, '2025-05-23 14:50:49', '2025-05-23 14:50:49'),
	(2198, 'storage/documentos/requisicion/MJOe0RLEkr_REQUISICIÓN No.pdf', 'MJOe0RLEkr_REQUISICIÓN No.pdf', 1, '2025-05-23 14:52:21', '2025-05-23 14:52:21'),
	(2199, 'storage/documentos/requisicion/Tt97wYMQT6_REQUISICIÓN No.pdf', 'Tt97wYMQT6_REQUISICIÓN No.pdf', 1, '2025-05-23 14:53:12', '2025-05-23 14:53:12'),
	(2200, 'storage/documentos/requisicion/Lq6ReKplA8_REQUISICIÓN nO.pdf', 'Lq6ReKplA8_REQUISICIÓN nO.pdf', 1, '2025-05-23 14:54:11', '2025-05-23 14:54:11'),
	(2201, 'storage/documentos/requisicion/PmZCTv1A9P_REQUISICIÓN No.pdf', 'PmZCTv1A9P_REQUISICIÓN No.pdf', 1, '2025-05-23 14:55:04', '2025-05-23 14:55:04'),
	(2202, 'storage/documentos/escrito/gr3WASi8Jo_LOURDES OLIVER respuesta a correo deudores Caro-Eder.pdf', 'gr3WASi8Jo_LOURDES OLIVER respuesta a correo deudores Caro-Eder.pdf', 5, '2025-05-23 16:21:24', '2025-05-23 16:21:24'),
	(2203, 'storage/documentos/requisicion/ZNyZlYhH4R_REQUISICIÓN No.pdf', 'ZNyZlYhH4R_REQUISICIÓN No.pdf', 1, '2025-05-23 16:25:37', '2025-05-23 16:25:37'),
	(2204, 'storage/documentos/memorandum/XnYuv9k1wx_COMUNICACIÓN memo-118-2025 boletín 35 Archivo.pdf', 'XnYuv9k1wx_COMUNICACIÓN memo-118-2025 boletín 35 Archivo.pdf', 2, '2025-05-26 13:59:06', '2025-05-26 13:59:06'),
	(2205, 'storage/documentos/memorandum/qXABojDPdT_DOE memo-329-2025 se remite información resp a memo da-0586-2025 Normatividad.pdf', 'qXABojDPdT_DOE memo-329-2025 se remite información resp a memo da-0586-2025 Normatividad.pdf', 2, '2025-05-26 14:01:37', '2025-05-26 14:01:37'),
	(2206, 'storage/documentos/memorandum/O5YpbqSoWF_DTS memo-0873-2025 se solicita dar de baja mobiliario Juan carlos.pdf', 'O5YpbqSoWF_DTS memo-0873-2025 se solicita dar de baja mobiliario Juan carlos.pdf', 2, '2025-05-26 14:03:52', '2025-05-26 14:03:52'),
	(2207, 'storage/documentos/requisicion/Tgew2pR2ID_REQUISICIÓN No.pdf', 'Tgew2pR2ID_REQUISICIÓN No.pdf', 1, '2025-05-26 14:12:58', '2025-05-26 14:12:58'),
	(2208, 'storage/documentos/requisicion/CeDmGqjvnB_REQUISICIÓN No.pdf', 'CeDmGqjvnB_REQUISICIÓN No.pdf', 1, '2025-05-26 14:14:12', '2025-05-26 14:14:12'),
	(2209, 'storage/documentos/memorandum/qXKjOP1QO3_SECRETARÍA memo-1734-2025 se autoriza certificación Saúl.pdf', 'qXKjOP1QO3_SECRETARÍA memo-1734-2025 se autoriza certificación Saúl.pdf', 2, '2025-05-26 14:15:41', '2025-05-26 14:15:41'),
	(2210, 'storage/documentos/memorandum/JsWHCoucBH_UFD memo-511-2025 se remite información Cuarto.pdf', 'JsWHCoucBH_UFD memo-511-2025 se remite información Cuarto.pdf', 2, '2025-05-26 14:17:30', '2025-05-26 14:17:30'),
	(2211, 'storage/documentos/memorandum/7q7ShDIh5E_UFD memo-515-2025 se solicita desincorporación de personal Cuarto.pdf', '7q7ShDIh5E_UFD memo-515-2025 se solicita desincorporación de personal Cuarto.pdf', 2, '2025-05-26 14:20:57', '2025-05-26 14:20:57'),
	(2212, 'storage/documentos/escrito/bM54cEkM34_ESTEFANÍA NEPOMUCENO correo respuesta deudores Eder-Caro.pdf', 'bM54cEkM34_ESTEFANÍA NEPOMUCENO correo respuesta deudores Eder-Caro.pdf', 5, '2025-05-26 15:24:40', '2025-05-26 15:24:40'),
	(2213, 'storage/documentos/oficio/GhzFccAPVm_PRESIDENCIA oficio-PRE-0433-2025 se remite estados financieros abril 2025 Emir.pdf', 'GhzFccAPVm_PRESIDENCIA oficio-PRE-0433-2025 se remite estados financieros abril 2025 Emir.pdf', 3, '2025-05-26 16:16:05', '2025-05-26 16:16:05'),
	(2214, 'storage/documentos/escrito/Yu83mUgdlu_CORREO alcance al correo de fecha 19-05-2025 suditoría superior de la federación Eder-Emir-Ale.pdf', 'Yu83mUgdlu_CORREO alcance al correo de fecha 19-05-2025 suditoría superior de la federación Eder-Emir-Ale.pdf', 5, '2025-05-26 16:31:31', '2025-05-26 16:31:31'),
	(2215, 'storage/documentos/requisicion/GFMDCBMEA8_REQUISICIÓN No.pdf', 'GFMDCBMEA8_REQUISICIÓN No.pdf', 1, '2025-05-26 16:38:17', '2025-05-26 16:38:17'),
	(2216, 'storage/documentos/requisicion/6A70evHk9X_REQUISICIÓN No.pdf', '6A70evHk9X_REQUISICIÓN No.pdf', 1, '2025-05-26 16:52:57', '2025-05-26 16:52:57'),
	(2217, 'storage/documentos/escrito/2ZEmpiXbih_IVAN GUZMÁN DÍAZ resp a correo de deudores Eder-Caro.pdf', '2ZEmpiXbih_IVAN GUZMÁN DÍAZ resp a correo de deudores Eder-Caro.pdf', 5, '2025-05-26 17:02:30', '2025-05-26 17:02:30'),
	(2218, 'storage/documentos/escrito/Hi7USkPRWR_AUDITOR EXTERNO 1er.pdf', 'Hi7USkPRWR_AUDITOR EXTERNO 1er.pdf', 5, '2025-05-26 18:10:00', '2025-05-26 18:10:00'),
	(2219, 'storage/documentos/memorandum/YKik5OW0ey_COMUNICACIÓN memo-119-2025 boletín 36 Archivo.pdf', 'YKik5OW0ey_COMUNICACIÓN memo-119-2025 boletín 36 Archivo.pdf', 2, '2025-05-26 18:11:18', '2025-05-26 18:11:18'),
	(2220, 'storage/documentos/requisicion/3bbKXBoJPN_REQUISICIÓN No.pdf', '3bbKXBoJPN_REQUISICIÓN No.pdf', 1, '2025-05-26 18:12:22', '2025-05-26 18:12:22'),
	(2221, 'storage/documentos/requisicion/LGbRSS5CSy_REQUISICIÓN No.pdf', 'LGbRSS5CSy_REQUISICIÓN No.pdf', 1, '2025-05-26 18:14:16', '2025-05-26 18:14:16'),
	(2222, 'storage/documentos/memorandum/2ier7PJecr_INFORMÁTICA memo-073-2025 sistema informático Archivo.pdf', '2ier7PJecr_INFORMÁTICA memo-073-2025 sistema informático Archivo.pdf', 2, '2025-05-26 19:32:02', '2025-05-26 19:32:02'),
	(2223, 'storage/documentos/memorandum/rtbevsK70N_JURÍDICO memo-0251-2025 se remite contrato para su observación motores japoneses Eder-Normatividad.pdf', 'rtbevsK70N_JURÍDICO memo-0251-2025 se remite contrato para su observación motores japoneses Eder-Normatividad.pdf', 2, '2025-05-26 20:53:35', '2025-05-26 20:53:35'),
	(2224, 'storage/documentos/memorandum/woGrw5gT2t_DTS memo-0883-2025 se solicita dar de baja mobiliario Juan carlos Materiales.pdf', 'woGrw5gT2t_DTS memo-0883-2025 se solicita dar de baja mobiliario Juan carlos Materiales.pdf', 2, '2025-05-27 14:32:34', '2025-05-27 14:32:34'),
	(2225, 'storage/documentos/memorandum/gxximhgMo8_JURÍDICO memo-0251-2025 se remite contrato para su observación motores japoneses Eder-Normatividad.pdf', 'gxximhgMo8_JURÍDICO memo-0251-2025 se remite contrato para su observación motores japoneses Eder-Normatividad.pdf', 2, '2025-05-27 14:34:38', '2025-05-27 14:34:38'),
	(2226, 'storage/documentos/memorandum/kb3P3xffE8_JURÍDICO memo-1119-2025 se remite contrato para su observación oficina 19 Eder-Normatividad.pdf', 'kb3P3xffE8_JURÍDICO memo-1119-2025 se remite contrato para su observación oficina 19 Eder-Normatividad.pdf', 2, '2025-05-27 14:36:01', '2025-05-27 14:36:01'),
	(2227, 'storage/documentos/escrito/r8b3bKGCWP_OFICIALIA DE PARTES folio 2270 oficio spfa-dbmi-dpv-1432-2025 enovación de los contratos de comodato   Eder-Materiales-Normatividad- Vehículos.pdf', 'r8b3bKGCWP_OFICIALIA DE PARTES folio 2270 oficio spfa-dbmi-dpv-1432-2025 enovación de los contratos de comodato   Eder-Materiales-Normatividad- Vehículos.pdf', 5, '2025-05-27 14:38:31', '2025-05-27 14:38:31'),
	(2228, 'storage/documentos/escrito/k5q8zfu56c_OFICIALIA DE PARTES regresa 8 SOBRES  Caro-DEUDORES.pdf', 'k5q8zfu56c_OFICIALIA DE PARTES regresa 8 SOBRES  Caro-DEUDORES.pdf', 5, '2025-05-27 14:41:49', '2025-05-27 14:41:49'),
	(2229, 'storage/documentos/memorandum/G1m7U9Ll3C_PRERROGATIVAS memo-0416-2025 se solicita creación de correo sistema para consejeros Archivo.pdf', 'G1m7U9Ll3C_PRERROGATIVAS memo-0416-2025 se solicita creación de correo sistema para consejeros Archivo.pdf', 2, '2025-05-27 14:44:56', '2025-05-27 14:44:56'),
	(2230, 'storage/documentos/memorandum/WPDklvwTfr_SECRETARÍA memo-1745-2025 se remite documentación Eder.pdf', 'WPDklvwTfr_SECRETARÍA memo-1745-2025 se remite documentación Eder.pdf', 2, '2025-05-27 14:46:48', '2025-05-27 14:46:48'),
	(2231, 'storage/documentos/requisicion/c9CLJXWCNs_REQUISICIÓN No.pdf', 'c9CLJXWCNs_REQUISICIÓN No.pdf', 1, '2025-05-27 16:12:23', '2025-05-27 16:12:23'),
	(2232, 'storage/documentos/requisicion/Fb3SffsTE7_REQUISICIÓN No.pdf', 'Fb3SffsTE7_REQUISICIÓN No.pdf', 1, '2025-05-27 16:13:56', '2025-05-27 16:13:56'),
	(2233, 'storage/documentos/memorandum/R3DFKXavuH_JURÍDICO memo-1124-2025 se remiten convenios de indemnización Normatividad-Cuarto.pdf', 'R3DFKXavuH_JURÍDICO memo-1124-2025 se remiten convenios de indemnización Normatividad-Cuarto.pdf', 2, '2025-05-27 18:21:34', '2025-05-27 18:21:34'),
	(2234, 'storage/documentos/memorandum/i4AIzaJQ4l_CONSEJERA MARISOL memo-010-2025 justificación para no participar en sesió de copead Normatividad.pdf', 'i4AIzaJQ4l_CONSEJERA MARISOL memo-010-2025 justificación para no participar en sesió de copead Normatividad.pdf', 2, '2025-05-27 19:00:27', '2025-05-27 19:00:27'),
	(2235, 'storage/documentos/memorandum/CtdM3Xcsiu_CAPACITACIÓN memo-122-2025 se solicita baja de mobiliario JC.pdf', 'CtdM3Xcsiu_CAPACITACIÓN memo-122-2025 se solicita baja de mobiliario JC.pdf', 2, '2025-05-27 19:01:43', '2025-05-27 19:01:43'),
	(2236, 'storage/documentos/memorandum/zB8zGbJxHY_DTS memo-0886-2025 se solicita  se realice revisión y actualización del resguardo JC-Materiales.pdf', 'zB8zGbJxHY_DTS memo-0886-2025 se solicita  se realice revisión y actualización del resguardo JC-Materiales.pdf', 2, '2025-05-27 19:03:50', '2025-05-27 19:03:50'),
	(2237, 'storage/documentos/memorandum/AvhGRtCA8f_PRERROGATIVAS memo-04158-2025 se solicita la creación de un sistema informático Archivo.pdf', 'AvhGRtCA8f_PRERROGATIVAS memo-04158-2025 se solicita la creación de un sistema informático Archivo.pdf', 2, '2025-05-27 19:05:22', '2025-05-27 19:05:22'),
	(2238, 'storage/documentos/memorandum/BQW0jkBMbM_SECRETARÍA memo-1751-2025 se autoriza certificación FGEP-FEIDE-321-2025-M1 Normatividad.pdf', 'BQW0jkBMbM_SECRETARÍA memo-1751-2025 se autoriza certificación FGEP-FEIDE-321-2025-M1 Normatividad.pdf', 2, '2025-05-27 19:14:17', '2025-05-27 19:14:17'),
	(2239, 'storage/documentos/escrito/xrUcmLbK8Q_OFICIALIA DE PARTES correo 3 sobres deudores Eder-Caro.pdf', 'xrUcmLbK8Q_OFICIALIA DE PARTES correo 3 sobres deudores Eder-Caro.pdf', 5, '2025-05-27 21:18:48', '2025-05-27 21:18:48'),
	(2240, 'storage/documentos/escrito/Wuc4zauuhr_IVÁN GUZMÁN DÍAZ respuesta a correo deudores Eder-Caro.pdf', 'Wuc4zauuhr_IVÁN GUZMÁN DÍAZ respuesta a correo deudores Eder-Caro.pdf', 5, '2025-05-27 21:20:52', '2025-05-27 21:20:52'),
	(2241, 'storage/documentos/requisicion/O4gces2osU_REQUISICIÓN No.pdf', 'O4gces2osU_REQUISICIÓN No.pdf', 1, '2025-05-27 21:22:17', '2025-05-27 21:22:17'),
	(2242, 'storage/documentos/requisicion/Wq17dKS2Xt_REQUISICIÓN No.pdf', 'Wq17dKS2Xt_REQUISICIÓN No.pdf', 1, '2025-05-27 21:23:21', '2025-05-27 21:23:21'),
	(2243, 'storage/documentos/requisicion/LJIFQxq3MI_REQUISICIÓN No.pdf', 'LJIFQxq3MI_REQUISICIÓN No.pdf', 1, '2025-05-27 21:24:30', '2025-05-27 21:24:30'),
	(2244, 'storage/documentos/memorandum/a7xZFt5hSB_SECRETARÍA memo-1754-2025 se autoriza certificación resp-memo da-0596-2025 Normatividad-Eder.pdf', 'a7xZFt5hSB_SECRETARÍA memo-1754-2025 se autoriza certificación resp-memo da-0596-2025 Normatividad-Eder.pdf', 2, '2025-05-28 17:05:44', '2025-05-28 17:05:44'),
	(2245, 'storage/documentos/memorandum/3D0e0zA35R_SECRETARÍA memo-1759-2025 se remiten observaciones en atención a memo dj-1127-2025 proyecto comodato Normatividad-Eder.pdf', '3D0e0zA35R_SECRETARÍA memo-1759-2025 se remiten observaciones en atención a memo dj-1127-2025 proyecto comodato Normatividad-Eder.pdf', 2, '2025-05-28 17:08:31', '2025-05-28 17:08:31'),
	(2246, 'storage/documentos/requisicion/uEKouSOBf2_REQUISICIÓN No.pdf', 'uEKouSOBf2_REQUISICIÓN No.pdf', 1, '2025-05-28 17:12:49', '2025-05-28 17:12:49'),
	(2247, 'storage/documentos/requisicion/iPH3VG189d_REQUISICIÓN No.pdf', 'iPH3VG189d_REQUISICIÓN No.pdf', 1, '2025-05-28 17:49:38', '2025-05-28 17:49:38'),
	(2248, 'storage/documentos/requisicion/qIwW65IMoa_REQUISICIÓN No.pdf', 'qIwW65IMoa_REQUISICIÓN No.pdf', 1, '2025-05-28 17:51:04', '2025-05-28 17:51:04'),
	(2249, 'storage/documentos/requisicion/lls7ZkXAI3_REQUISICIÓN No.pdf', 'lls7ZkXAI3_REQUISICIÓN No.pdf', 1, '2025-05-28 19:19:11', '2025-05-28 19:19:11'),
	(2250, 'storage/documentos/memorandum/YPpEylsqrx_JURÍDICO memo-00461bis-2025 se remite contrato para su observación entornos imprenta digital Normatividad-Eder.pdf', 'YPpEylsqrx_JURÍDICO memo-00461bis-2025 se remite contrato para su observación entornos imprenta digital Normatividad-Eder.pdf', 2, '2025-05-28 19:21:25', '2025-05-28 19:21:25'),
	(2251, 'storage/documentos/escrito/UirLLv28ET_DTS correo se remiten anexos para sesión ordinaria de junta ejecutiva Normatividad-Eder.pdf', 'UirLLv28ET_DTS correo se remiten anexos para sesión ordinaria de junta ejecutiva Normatividad-Eder.pdf', 5, '2025-05-28 20:11:32', '2025-05-28 20:11:32'),
	(2252, 'storage/documentos/escrito/hYVw0L5DgR_IVONE EUGENIA ABURTO ARELLANO correo deudores Eder-Caro.pdf', 'hYVw0L5DgR_IVONE EUGENIA ABURTO ARELLANO correo deudores Eder-Caro.pdf', 5, '2025-05-28 21:13:06', '2025-05-28 21:13:06'),
	(2253, 'storage/documentos/memorandum/3BuEELi1Ry_CONTRALORÍA memo-293-2025 se remiten hojas de trabajo mes de febrero 2025 Eder-Dali.pdf', '3BuEELi1Ry_CONTRALORÍA memo-293-2025 se remiten hojas de trabajo mes de febrero 2025 Eder-Dali.pdf', 2, '2025-05-28 21:16:34', '2025-05-28 21:16:34'),
	(2254, 'storage/documentos/requisicion/AgxzDdcYD8_REQUISICIÓN No.pdf', 'AgxzDdcYD8_REQUISICIÓN No.pdf', 1, '2025-05-28 21:18:19', '2025-05-28 21:18:19'),
	(2255, 'storage/documentos/requisicion/47bKtDnLGZ_REQUISICIÓN No.pdf', '47bKtDnLGZ_REQUISICIÓN No.pdf', 1, '2025-05-28 21:20:50', '2025-05-28 21:20:50'),
	(2256, 'storage/documentos/oficio/qb4fieLKc4_PRESIDENCIA oficio-0452-2025 se remite información de la orden de auditoría 1530 entidades federativas.pdf', 'qb4fieLKc4_PRESIDENCIA oficio-0452-2025 se remite información de la orden de auditoría 1530 entidades federativas.pdf', 3, '2025-05-29 16:16:22', '2025-05-29 16:16:22'),
	(2257, 'storage/documentos/circular/rXikoFbpf6_SECRETARÍA circular-se-070-2025 módulo informativo a todo el personal.pdf', 'rXikoFbpf6_SECRETARÍA circular-se-070-2025 módulo informativo a todo el personal.pdf', 4, '2025-05-29 16:35:16', '2025-05-29 16:35:16'),
	(2258, 'storage/documentos/requisicion/HkqBpU6zup_REQUISICIÓN No.pdf', 'HkqBpU6zup_REQUISICIÓN No.pdf', 1, '2025-05-29 16:39:36', '2025-05-29 16:39:36'),
	(2259, 'storage/documentos/escrito/AacWweszLN_ACCESO A CAJERO AUTOMÁTICO 28 DE JUNIO DE 2025 Daniel-Mayra.pdf', 'AacWweszLN_ACCESO A CAJERO AUTOMÁTICO 28 DE JUNIO DE 2025 Daniel-Mayra.pdf', 5, '2025-05-29 18:38:35', '2025-05-29 18:38:35'),
	(2260, 'storage/documentos/oficio/nIyyRwLsRT_AUDITOR EXTERNO oficio aj-ae-06-2025 en alcance al oficio aj-ae-05-2025 Eder-Dali.pdf', 'nIyyRwLsRT_AUDITOR EXTERNO oficio aj-ae-06-2025 en alcance al oficio aj-ae-05-2025 Eder-Dali.pdf', 3, '2025-05-29 18:42:42', '2025-05-29 18:42:42'),
	(2261, 'storage/documentos/tarjeta/7AazD5M52k_FISCALIZACIÓN montos a descontar a partidos políticos Saúl.pdf', '7AazD5M52k_FISCALIZACIÓN montos a descontar a partidos políticos Saúl.pdf', 6, '2025-05-29 18:46:35', '2025-05-29 18:46:35'),
	(2262, 'storage/documentos/memorandum/G0lPfGwAxy_PRERROGATIVAS memo-0420-2025 se solicita pago a prerrogativas Saúl.pdf', 'G0lPfGwAxy_PRERROGATIVAS memo-0420-2025 se solicita pago a prerrogativas Saúl.pdf', 2, '2025-05-29 21:01:09', '2025-05-29 21:01:09'),
	(2263, 'storage/documentos/requisicion/uSMnJUC1W2_REQUISICIÓN No.pdf', 'uSMnJUC1W2_REQUISICIÓN No.pdf', 1, '2025-05-29 21:04:17', '2025-05-29 21:04:17'),
	(2264, 'storage/documentos/circular/z6kzbxCPWP_ARCHIVOS circular-006-2025 se solicita correo electrónico gmail.pdf', 'z6kzbxCPWP_ARCHIVOS circular-006-2025 se solicita correo electrónico gmail.pdf', 4, '2025-05-30 18:31:23', '2025-05-30 18:31:23'),
	(2265, 'storage/documentos/oficio/0WBXTX25vv_AUDITOR EXTERNO oficio-aj-ae-07-2025 solicitud de infromación y documentación Eder-Dali.pdf', '0WBXTX25vv_AUDITOR EXTERNO oficio-aj-ae-07-2025 solicitud de infromación y documentación Eder-Dali.pdf', 3, '2025-05-30 18:35:12', '2025-05-30 18:35:12'),
	(2266, 'storage/documentos/oficio/sBxhYnAA3s_AUDITOR EXTERNO oficio-aj-ae-08-2025 Auditoría de desempeño Eder-Dali.pdf', 'sBxhYnAA3s_AUDITOR EXTERNO oficio-aj-ae-08-2025 Auditoría de desempeño Eder-Dali.pdf', 3, '2025-05-30 18:38:03', '2025-05-30 18:38:03'),
	(2267, 'storage/documentos/memorandum/PEyUZZMo92_COMUNICACIÓN memo-120-2025 boletín 37 Archivo.pdf', 'PEyUZZMo92_COMUNICACIÓN memo-120-2025 boletín 37 Archivo.pdf', 2, '2025-05-30 18:39:30', '2025-05-30 18:39:30'),
	(2268, 'storage/documentos/escrito/O6FzM3b8Zb_J MALEO HERNÁNDEZ CASTILLO respuesta a correo deudores Eder-Caro.pdf', 'O6FzM3b8Zb_J MALEO HERNÁNDEZ CASTILLO respuesta a correo deudores Eder-Caro.pdf', 5, '2025-05-30 18:40:51', '2025-05-30 18:40:51'),
	(2269, 'storage/documentos/memorandum/i1Melgskmr_UFD memo-531-2025 se solicita desincorporación de personal Cuarto.pdf', 'i1Melgskmr_UFD memo-531-2025 se solicita desincorporación de personal Cuarto.pdf', 2, '2025-05-30 18:42:50', '2025-05-30 18:42:50'),
	(2270, 'storage/documentos/memorandum/5hRxibEhxS_JURÍDICO memo-0041-2025 se remite contrato para su observación Eder-Normatividad.pdf', '5hRxibEhxS_JURÍDICO memo-0041-2025 se remite contrato para su observación Eder-Normatividad.pdf', 2, '2025-05-30 18:43:09', '2025-05-30 18:43:09'),
	(2271, 'storage/documentos/memorandum/JNLGT4iI0A_SECRETARÍA memo-1768-2025 se remite acuerdo cg-ac-0049-2025 Normatividad-Eder-Cuarto.pdf', 'JNLGT4iI0A_SECRETARÍA memo-1768-2025 se remite acuerdo cg-ac-0049-2025 Normatividad-Eder-Cuarto.pdf', 2, '2025-05-30 18:45:53', '2025-05-30 18:45:53'),
	(2272, 'storage/documentos/memorandum/w5ZyX9Z9Mm_SECRETARÍA memo-1771-2025 se remite acuerdo cg-ac-0050-2025 Eder-Normatividad Saúl.pdf', 'w5ZyX9Z9Mm_SECRETARÍA memo-1771-2025 se remite acuerdo cg-ac-0050-2025 Eder-Normatividad Saúl.pdf', 2, '2025-05-30 18:47:23', '2025-05-30 18:47:23'),
	(2273, 'storage/documentos/memorandum/DwR98sz3wa_UFD memo-532-2025 se informa licencia con goce de sueldo Cuarto.pdf', 'DwR98sz3wa_UFD memo-532-2025 se informa licencia con goce de sueldo Cuarto.pdf', 2, '2025-05-30 18:48:58', '2025-05-30 18:48:58'),
	(2274, 'storage/documentos/memorandum/34Axy95IlE_SECRETARÍA memo-1779-2025 el que se indica Eder-Emir.pdf', '34Axy95IlE_SECRETARÍA memo-1779-2025 el que se indica Eder-Emir.pdf', 2, '2025-05-30 18:49:11', '2025-05-30 18:49:11'),
	(2275, 'storage/documentos/requisicion/9nUHu1UuxY_REQUISICIÓN No.pdf', '9nUHu1UuxY_REQUISICIÓN No.pdf', 1, '2025-05-30 18:50:25', '2025-05-30 18:50:25'),
	(2276, 'storage/documentos/requisicion/RvbwWyQBFM_REQUISICIÓN No.pdf', 'RvbwWyQBFM_REQUISICIÓN No.pdf', 1, '2025-05-30 18:50:29', '2025-05-30 18:50:29'),
	(2277, 'storage/documentos/requisicion/heN8CQBZkM_REQUISICIÓN No.pdf', 'heN8CQBZkM_REQUISICIÓN No.pdf', 1, '2025-05-30 18:51:18', '2025-05-30 18:51:18'),
	(2278, 'storage/documentos/requisicion/vh95MYxPDH_REQUISICIÓN No.pdf', 'vh95MYxPDH_REQUISICIÓN No.pdf', 1, '2025-05-30 18:51:59', '2025-05-30 18:51:59'),
	(2279, 'storage/documentos/requisicion/Lj9KeTKynN_REQUISICIÓN No.pdf', 'Lj9KeTKynN_REQUISICIÓN No.pdf', 1, '2025-05-30 18:53:03', '2025-05-30 18:53:03'),
	(2280, 'storage/documentos/requisicion/uyLoJAyqhC_REQUISICIÓN No.pdf', 'uyLoJAyqhC_REQUISICIÓN No.pdf', 1, '2025-05-30 18:54:37', '2025-05-30 18:54:37'),
	(2281, 'storage/documentos/requisicion/IPpkd80tX1_REQUISICIÓN No.pdf', 'IPpkd80tX1_REQUISICIÓN No.pdf', 1, '2025-05-30 18:56:01', '2025-05-30 18:56:01'),
	(2282, 'storage/documentos/requisicion/rqY7MmOKl1_REQUISICIÓN No.pdf', 'rqY7MmOKl1_REQUISICIÓN No.pdf', 1, '2025-05-30 18:59:02', '2025-05-30 18:59:02'),
	(2283, 'storage/documentos/memorandum/sjXyNKd2Ox_UFD memo-542-2025 se remite calificación de exámen Cuarto.pdf', 'sjXyNKd2Ox_UFD memo-542-2025 se remite calificación de exámen Cuarto.pdf', 2, '2025-06-02 15:00:06', '2025-06-02 15:00:06'),
	(2284, 'storage/documentos/memorandum/ETDMtUSQlX_UFD memo-541-2025 se solicita pago Cuarto.pdf', 'ETDMtUSQlX_UFD memo-541-2025 se solicita pago Cuarto.pdf', 2, '2025-06-02 15:01:17', '2025-06-02 15:01:17'),
	(2285, 'storage/documentos/memorandum/RNBIXjaah1_UFD memo-539-2025 se informa encargos de despacho Cuarto.pdf', 'RNBIXjaah1_UFD memo-539-2025 se informa encargos de despacho Cuarto.pdf', 2, '2025-06-02 15:02:27', '2025-06-02 15:02:27'),
	(2286, 'storage/documentos/oficio/lNy7gPAQiF_SECRETRÍA oficio-0923-2025 designación de despacho Cuarto.pdf', 'lNy7gPAQiF_SECRETRÍA oficio-0923-2025 designación de despacho Cuarto.pdf', 3, '2025-06-02 15:03:53', '2025-06-02 15:03:53'),
	(2287, 'storage/documentos/oficio/Bon9ZSWWN5_SECRETARÍA oficio-0922-2025 designación de encargo de despacho Cuarto.pdf', 'Bon9ZSWWN5_SECRETARÍA oficio-0922-2025 designación de encargo de despacho Cuarto.pdf', 3, '2025-06-02 15:05:28', '2025-06-02 15:05:28'),
	(2288, 'storage/documentos/memorandum/gQrn2Z0Axm_SECRETARÍA memo-1776-2025 se remite documentación Eder-Ale-Emir.pdf', 'gQrn2Z0Axm_SECRETARÍA memo-1776-2025 se remite documentación Eder-Ale-Emir.pdf', 2, '2025-06-02 15:07:34', '2025-06-02 15:07:34'),
	(2289, 'storage/documentos/requisicion/2WM08Iqsrn_REQUISICIÓN No.pdf', '2WM08Iqsrn_REQUISICIÓN No.pdf', 1, '2025-06-02 15:08:25', '2025-06-02 15:08:25'),
	(2290, 'storage/documentos/requisicion/VropIHTeRK_REQUISICIÓN No.pdf', 'VropIHTeRK_REQUISICIÓN No.pdf', 1, '2025-06-02 15:09:22', '2025-06-02 15:09:22'),
	(2291, 'storage/documentos/requisicion/PCpnM1caGx_REQUISICIÓN No.pdf', 'PCpnM1caGx_REQUISICIÓN No.pdf', 1, '2025-06-02 15:10:16', '2025-06-02 15:10:16'),
	(2292, 'storage/documentos/memorandum/yolxqvTQIu_INFORMÁTICA memo-074-2025 micrositio Archivo.pdf', 'yolxqvTQIu_INFORMÁTICA memo-074-2025 micrositio Archivo.pdf', 2, '2025-06-02 15:12:40', '2025-06-02 15:12:40'),
	(2293, 'storage/documentos/escrito/UCxbEdeQOc_UFD reporte de entradas y salidas Caro-Cuarto-Eder.pdf', 'UCxbEdeQOc_UFD reporte de entradas y salidas Caro-Cuarto-Eder.pdf', 5, '2025-06-02 17:10:25', '2025-06-02 17:10:25'),
	(2294, 'storage/documentos/oficio/Cl2zom64aK_SECRETARÍA oficio-0925-2025 se remiten acuerdos Normtividad-Eder.pdf', 'Cl2zom64aK_SECRETARÍA oficio-0925-2025 se remiten acuerdos Normtividad-Eder.pdf', 3, '2025-06-02 17:12:45', '2025-06-02 17:12:45'),
	(2295, 'storage/documentos/memorandum/XU5fdIK7jK_SECRETARÍA memorándum No.pdf', 'XU5fdIK7jK_SECRETARÍA memorándum No.pdf', 2, '2025-06-02 17:14:15', '2025-06-02 17:14:15'),
	(2296, 'storage/documentos/requisicion/Rmv9AjFgor_REQUISICIÓN No.pdf', 'Rmv9AjFgor_REQUISICIÓN No.pdf', 1, '2025-06-02 17:17:29', '2025-06-02 17:17:29'),
	(2297, 'storage/documentos/requisicion/2hn29hRZT0_REQUISICIÓN No.pdf', '2hn29hRZT0_REQUISICIÓN No.pdf', 1, '2025-06-02 17:18:23', '2025-06-02 17:18:23'),
	(2298, 'storage/documentos/requisicion/NDRVmRrr0l_REQUISICIÓN No.pdf', 'NDRVmRrr0l_REQUISICIÓN No.pdf', 1, '2025-06-02 17:19:46', '2025-06-02 17:19:46'),
	(2299, 'storage/documentos/requisicion/iXw1V4pmxH_REQUISICIÓN No.pdf', 'iXw1V4pmxH_REQUISICIÓN No.pdf', 1, '2025-06-02 17:20:42', '2025-06-02 17:20:42'),
	(2300, 'storage/documentos/requisicion/s8qb4DhqAE_REQUISICIÓN No.pdf', 's8qb4DhqAE_REQUISICIÓN No.pdf', 1, '2025-06-02 17:48:06', '2025-06-02 17:48:06'),
	(2301, 'storage/documentos/requisicion/5HaxJjbPBL_REQUISICIÓN No.pdf', '5HaxJjbPBL_REQUISICIÓN No.pdf', 1, '2025-06-02 17:48:59', '2025-06-02 17:48:59'),
	(2302, 'storage/documentos/requisicion/MYgdINwwL8_REQUISICIÓN No.pdf', 'MYgdINwwL8_REQUISICIÓN No.pdf', 1, '2025-06-02 17:51:46', '2025-06-02 17:51:46'),
	(2303, 'storage/documentos/requisicion/Zh5bbYsdMl_REQUISICIÓN No.pdf', 'Zh5bbYsdMl_REQUISICIÓN No.pdf', 1, '2025-06-02 17:52:38', '2025-06-02 17:52:38'),
	(2304, 'storage/documentos/requisicion/AhMSNAu68M_REQUISICIÓN No.pdf', 'AhMSNAu68M_REQUISICIÓN No.pdf', 1, '2025-06-02 17:56:45', '2025-06-02 17:56:45'),
	(2305, 'storage/documentos/escrito/QIs1hhP0LE_SIVOPLE correo solicita desafiliación voluntaria al partido acción nacional Emir-Eder.pdf', 'QIs1hhP0LE_SIVOPLE correo solicita desafiliación voluntaria al partido acción nacional Emir-Eder.pdf', 5, '2025-06-02 18:21:23', '2025-06-02 18:21:23'),
	(2306, 'storage/documentos/memorandum/8nGLICoVLF_UFD memo-550-2025 se solicita desincorporación de personal Cuarto.pdf', '8nGLICoVLF_UFD memo-550-2025 se solicita desincorporación de personal Cuarto.pdf', 2, '2025-06-03 15:15:40', '2025-06-03 15:15:40'),
	(2307, 'storage/documentos/circular/RrxfvAb8HA_TRANSPARENCIA circular-036-2025  se solicita agenda de actuvidades Eder-Poblano.pdf', 'RrxfvAb8HA_TRANSPARENCIA circular-036-2025  se solicita agenda de actuvidades Eder-Poblano.pdf', 4, '2025-06-03 15:18:02', '2025-06-03 15:18:02'),
	(2308, 'storage/documentos/memorandum/XeuZXmdQUt_SECRETARÍA memo-1791-2025 se autoriza indemnización Cuarto.pdf', 'XeuZXmdQUt_SECRETARÍA memo-1791-2025 se autoriza indemnización Cuarto.pdf', 2, '2025-06-03 15:20:50', '2025-06-03 15:20:50'),
	(2309, 'storage/documentos/circular/CbM3JKQxDH_COMUNICACIÓN circular-06-2025 cobertura de eventos Edr-Poblano.pdf', 'CbM3JKQxDH_COMUNICACIÓN circular-06-2025 cobertura de eventos Edr-Poblano.pdf', 4, '2025-06-03 15:21:46', '2025-06-03 15:21:46'),
	(2310, 'storage/documentos/circular/BGCL70CAbV_DTS circular-013-2025 temas  considerar a junta ejecutiva Eder-Normatividad.pdf', 'BGCL70CAbV_DTS circular-013-2025 temas  considerar a junta ejecutiva Eder-Normatividad.pdf', 4, '2025-06-03 15:22:43', '2025-06-03 15:22:43'),
	(2311, 'storage/documentos/circular/MDECb5TPZ3_DTS circular-014-2025 temas a considerar a consejo general Eder-Normatividad.pdf', 'MDECb5TPZ3_DTS circular-014-2025 temas a considerar a consejo general Eder-Normatividad.pdf', 4, '2025-06-03 15:23:40', '2025-06-03 15:23:40'),
	(2312, 'storage/documentos/memorandum/SpHOkLoSs4_JURÍDICO memo-0299bis-2025 se remite contrato para su obsrvación Normatividad Eder.pdf', 'SpHOkLoSs4_JURÍDICO memo-0299bis-2025 se remite contrato para su obsrvación Normatividad Eder.pdf', 2, '2025-06-03 15:27:18', '2025-06-03 15:27:18'),
	(2313, 'storage/documentos/memorandum/fbhnl45eZO_JURÍDICO memo-1154-2025 relación de asuntos laborales Eder-Normatividad.pdf', 'fbhnl45eZO_JURÍDICO memo-1154-2025 relación de asuntos laborales Eder-Normatividad.pdf', 2, '2025-06-03 15:29:16', '2025-06-03 15:29:16'),
	(2314, 'storage/documentos/requisicion/yxIlCuuOha_REQIUISICIÓN No.pdf', 'yxIlCuuOha_REQIUISICIÓN No.pdf', 1, '2025-06-03 15:32:30', '2025-06-03 15:32:30'),
	(2315, 'storage/documentos/requisicion/BvWmoDwMAU_REQUISICIÓN  No.pdf', 'BvWmoDwMAU_REQUISICIÓN  No.pdf', 1, '2025-06-03 15:33:27', '2025-06-03 15:33:27'),
	(2316, 'storage/documentos/requisicion/fHZKtQoGuP_REQUISICIÓN No.pdf', 'fHZKtQoGuP_REQUISICIÓN No.pdf', 1, '2025-06-03 15:34:40', '2025-06-03 15:34:40'),
	(2317, 'storage/documentos/requisicion/5VvgqNI3Z5_REQUISICIÓN No.pdf', '5VvgqNI3Z5_REQUISICIÓN No.pdf', 1, '2025-06-03 15:36:10', '2025-06-03 15:36:10'),
	(2318, 'storage/documentos/requisicion/B39E3VjChT_REQUISICIÓN No.pdf', 'B39E3VjChT_REQUISICIÓN No.pdf', 1, '2025-06-03 15:37:06', '2025-06-03 15:37:06'),
	(2319, 'storage/documentos/requisicion/0YeaBCpuqi_REQUISICIÓN No.pdf', '0YeaBCpuqi_REQUISICIÓN No.pdf', 1, '2025-06-03 15:37:52', '2025-06-03 15:37:52'),
	(2320, 'storage/documentos/requisicion/wlyx3Sb2yL_REQUISICIÓN No.pdf', 'wlyx3Sb2yL_REQUISICIÓN No.pdf', 1, '2025-06-03 15:38:45', '2025-06-03 15:38:45'),
	(2321, 'storage/documentos/requisicion/7q0gQwvycN_REQUISICIÓN No.pdf', '7q0gQwvycN_REQUISICIÓN No.pdf', 1, '2025-06-03 15:39:37', '2025-06-03 15:39:37'),
	(2322, 'storage/documentos/requisicion/wtYeyRMZbo_REQUISICIÓN No.pdf', 'wtYeyRMZbo_REQUISICIÓN No.pdf', 1, '2025-06-03 15:40:24', '2025-06-03 15:40:24'),
	(2323, 'storage/documentos/requisicion/83PiSEWsBl_REQUISICIÓN No.pdf', '83PiSEWsBl_REQUISICIÓN No.pdf', 1, '2025-06-03 15:41:17', '2025-06-03 15:41:17'),
	(2324, 'storage/documentos/requisicion/bcQhJrbGFr_REQUISICIÓN No.pdf', 'bcQhJrbGFr_REQUISICIÓN No.pdf', 1, '2025-06-03 15:42:16', '2025-06-03 15:42:16'),
	(2325, 'storage/documentos/requisicion/Bu7IVHu5bZ_REQUISICIÓN No.pdf', 'Bu7IVHu5bZ_REQUISICIÓN No.pdf', 1, '2025-06-03 20:48:16', '2025-06-03 20:48:16'),
	(2326, 'storage/documentos/requisicion/QYAOG7Gv0K_REQUISICIÓN No.pdf', 'QYAOG7Gv0K_REQUISICIÓN No.pdf', 1, '2025-06-03 20:49:09', '2025-06-03 20:49:09'),
	(2327, 'storage/documentos/requisicion/JOfKmTajGi_REQUISICIÓN No.pdf', 'JOfKmTajGi_REQUISICIÓN No.pdf', 1, '2025-06-03 20:49:48', '2025-06-03 20:49:48'),
	(2328, 'storage/documentos/requisicion/pkDG6ZVvk2_REQUISICIÓN No.pdf', 'pkDG6ZVvk2_REQUISICIÓN No.pdf', 1, '2025-06-03 20:50:57', '2025-06-03 20:50:57'),
	(2329, 'storage/documentos/requisicion/krKzkRmF3h_REQUISICIÓN No.pdf', 'krKzkRmF3h_REQUISICIÓN No.pdf', 1, '2025-06-03 20:51:43', '2025-06-03 20:51:43'),
	(2330, 'storage/documentos/requisicion/Fi3Pxstlbr_REQUISICIÓN No.pdf', 'Fi3Pxstlbr_REQUISICIÓN No.pdf', 1, '2025-06-03 20:52:29', '2025-06-03 20:52:29'),
	(2331, 'storage/documentos/requisicion/gjfO8xIqFb_REQUISICIÓN No.pdf', 'gjfO8xIqFb_REQUISICIÓN No.pdf', 1, '2025-06-03 20:53:38', '2025-06-03 20:53:38'),
	(2332, 'storage/documentos/requisicion/2yYQN8sfQS_REQUISICIÓN No.pdf', '2yYQN8sfQS_REQUISICIÓN No.pdf', 1, '2025-06-03 20:55:21', '2025-06-03 20:55:21'),
	(2333, 'storage/documentos/requisicion/Go4NmYJRmu_REQUISICIÓN No.pdf', 'Go4NmYJRmu_REQUISICIÓN No.pdf', 1, '2025-06-03 20:56:30', '2025-06-03 20:56:30'),
	(2334, 'storage/documentos/requisicion/IhNg7TaazD_REQUISICIÓN No.pdf', 'IhNg7TaazD_REQUISICIÓN No.pdf', 1, '2025-06-03 20:57:22', '2025-06-03 20:57:22'),
	(2335, 'storage/documentos/requisicion/VPN3zR71sG_REQUISICIÓN No.pdf', 'VPN3zR71sG_REQUISICIÓN No.pdf', 1, '2025-06-03 20:58:58', '2025-06-03 20:58:58'),
	(2336, 'storage/documentos/requisicion/PQJKFf32o3_REQUISICIÓN No.pdf', 'PQJKFf32o3_REQUISICIÓN No.pdf', 1, '2025-06-03 20:59:57', '2025-06-03 20:59:57'),
	(2337, 'storage/documentos/requisicion/0Pj7ejxST3_REQUISICIÓN No.pdf', '0Pj7ejxST3_REQUISICIÓN No.pdf', 1, '2025-06-03 21:04:09', '2025-06-03 21:04:09'),
	(2338, 'storage/documentos/requisicion/plMBwpOBV9_REQUISICIÓN No.pdf', 'plMBwpOBV9_REQUISICIÓN No.pdf', 1, '2025-06-03 21:05:00', '2025-06-03 21:05:00'),
	(2339, 'storage/documentos/memorandum/zWdtzAyxkb_CONTRALORÍA memo-307-2025 entregas de proveedores Eder-Normatividad.pdf', 'zWdtzAyxkb_CONTRALORÍA memo-307-2025 entregas de proveedores Eder-Normatividad.pdf', 2, '2025-06-04 16:34:01', '2025-06-04 16:34:01'),
	(2340, 'storage/documentos/escrito/yq6jHHR83e_OFICIALIA DE PARTES folio 2345 curso de registro patrimonial de ingresos públicos Eder-Ale-Emir.pdf', 'yq6jHHR83e_OFICIALIA DE PARTES folio 2345 curso de registro patrimonial de ingresos públicos Eder-Ale-Emir.pdf', 5, '2025-06-04 16:38:10', '2025-06-04 16:38:10'),
	(2341, 'storage/documentos/memorandum/jn9lx2jCi3_PLANEACIÓN memo-043-2025 información auditoría de desempeño 1er trimestre Eder-Delia.pdf', 'jn9lx2jCi3_PLANEACIÓN memo-043-2025 información auditoría de desempeño 1er trimestre Eder-Delia.pdf', 2, '2025-06-04 16:40:45', '2025-06-04 16:40:45'),
	(2342, 'storage/documentos/escrito/YkbPx6gYok_SECRETARÍA correo anexo del memo-se-1810 folio 2344 Ale-Eder-Emir.pdf', 'YkbPx6gYok_SECRETARÍA correo anexo del memo-se-1810 folio 2344 Ale-Eder-Emir.pdf', 5, '2025-06-04 16:42:24', '2025-06-04 16:42:24'),
	(2343, 'storage/documentos/memorandum/bEnP2CtMn8_SECRETARÍA memo-1794-2025 se envían observaciones ASE  Eder-Franco.pdf', 'bEnP2CtMn8_SECRETARÍA memo-1794-2025 se envían observaciones ASE  Eder-Franco.pdf', 2, '2025-06-04 16:44:49', '2025-06-04 16:44:49'),
	(2344, 'storage/documentos/memorandum/IAT5afCZ4p_SECRETARÍA memo-1810-2025 se remite invitación Eder-Ale-Emir.pdf', 'IAT5afCZ4p_SECRETARÍA memo-1810-2025 se remite invitación Eder-Ale-Emir.pdf', 2, '2025-06-04 16:46:16', '2025-06-04 16:46:16'),
	(2345, 'storage/documentos/memorandum/om17oP29VJ_SECRETARÍA memo-1811-2025 se remite correo electrónico folio 2345 Eder-Ale-Emir.pdf', 'om17oP29VJ_SECRETARÍA memo-1811-2025 se remite correo electrónico folio 2345 Eder-Ale-Emir.pdf', 2, '2025-06-04 16:48:17', '2025-06-04 16:48:17'),
	(2346, 'storage/documentos/oficio/2VtOVf83IW_SECRETARÍA oficio-0933-2025 se notifica renovación de encargo de despacho Cuarto.pdf', '2VtOVf83IW_SECRETARÍA oficio-0933-2025 se notifica renovación de encargo de despacho Cuarto.pdf', 3, '2025-06-04 16:49:56', '2025-06-04 16:49:56'),
	(2347, 'storage/documentos/escrito/LgEwmNjh0j_TRANSPARENCIA correo respuesta a correo Eder-Dali.pdf', 'LgEwmNjh0j_TRANSPARENCIA correo respuesta a correo Eder-Dali.pdf', 5, '2025-06-04 16:51:04', '2025-06-04 16:51:04'),
	(2348, 'storage/documentos/memorandum/kCVcL5Tesv_UFD memo-555-2025 se informa renovación de encargo de desp Cuarto.pdf', 'kCVcL5Tesv_UFD memo-555-2025 se informa renovación de encargo de desp Cuarto.pdf', 2, '2025-06-04 16:52:35', '2025-06-04 16:52:35'),
	(2349, 'storage/documentos/requisicion/PSoXFiZWR8_REQUISICIÓ No.pdf', 'PSoXFiZWR8_REQUISICIÓ No.pdf', 1, '2025-06-04 16:54:02', '2025-06-04 16:54:02'),
	(2350, 'storage/documentos/requisicion/7eaQFeJud1_REQUISICIÓN No.pdf', '7eaQFeJud1_REQUISICIÓN No.pdf', 1, '2025-06-04 16:54:51', '2025-06-04 16:54:51'),
	(2351, 'storage/documentos/requisicion/W43pr8Cjmn_REQUISICIÓN No.pdf', 'W43pr8Cjmn_REQUISICIÓN No.pdf', 1, '2025-06-04 16:56:12', '2025-06-04 16:56:12'),
	(2352, 'storage/documentos/requisicion/fGG2AvjAHi_REQUISICIÓN No.pdf', 'fGG2AvjAHi_REQUISICIÓN No.pdf', 1, '2025-06-04 18:55:06', '2025-06-04 18:55:06'),
	(2353, 'storage/documentos/requisicion/iCidjo3M9o_REQUISICIÓN No.pdf', 'iCidjo3M9o_REQUISICIÓN No.pdf', 1, '2025-06-04 18:56:40', '2025-06-04 18:56:40'),
	(2354, 'storage/documentos/requisicion/rKytTT7Xmy_REQUISICIÓN No.pdf', 'rKytTT7Xmy_REQUISICIÓN No.pdf', 1, '2025-06-04 18:58:02', '2025-06-04 18:58:02'),
	(2355, 'storage/documentos/requisicion/cL2BgkTRTu_REQUISICIÓN No.pdf', 'cL2BgkTRTu_REQUISICIÓN No.pdf', 1, '2025-06-04 19:00:11', '2025-06-04 19:00:11'),
	(2356, 'storage/documentos/requisicion/o65KgmKWm1_REQUISICIÓN No.pdf', 'o65KgmKWm1_REQUISICIÓN No.pdf', 1, '2025-06-04 19:01:12', '2025-06-04 19:01:12'),
	(2357, 'storage/documentos/requisicion/7iqoJC0Vcd_REQUISICIÓN No.pdf', '7iqoJC0Vcd_REQUISICIÓN No.pdf', 1, '2025-06-04 19:03:15', '2025-06-04 19:03:15'),
	(2358, 'storage/documentos/requisicion/ex2hf9iq5i_REQUISICIÓN No.pdf', 'ex2hf9iq5i_REQUISICIÓN No.pdf', 1, '2025-06-05 15:18:37', '2025-06-05 15:18:37'),
	(2359, 'storage/documentos/requisicion/1oVp5aXuMm_REQUISICIÓN No.pdf', '1oVp5aXuMm_REQUISICIÓN No.pdf', 1, '2025-06-05 15:20:29', '2025-06-05 15:20:29'),
	(2360, 'storage/documentos/requisicion/cffI3Ux6BK_REQUISICIÓN No.pdf', 'cffI3Ux6BK_REQUISICIÓN No.pdf', 1, '2025-06-05 15:21:37', '2025-06-05 15:21:37'),
	(2361, 'storage/documentos/requisicion/vhhEP6v15B_REQUISICIÓN No.pdf', 'vhhEP6v15B_REQUISICIÓN No.pdf', 1, '2025-06-05 15:23:08', '2025-06-05 15:23:08'),
	(2362, 'storage/documentos/requisicion/rbqoV5KqFB_REQUISICIÓN No.pdf', 'rbqoV5KqFB_REQUISICIÓN No.pdf', 1, '2025-06-05 15:24:02', '2025-06-05 15:24:02'),
	(2363, 'storage/documentos/requisicion/ai0cFMRZk0_REQUISICIÓN No.pdf', 'ai0cFMRZk0_REQUISICIÓN No.pdf', 1, '2025-06-05 15:25:37', '2025-06-05 15:25:37'),
	(2364, 'storage/documentos/requisicion/ekQCsbnRbL_REQUISICIÓN No.pdf', 'ekQCsbnRbL_REQUISICIÓN No.pdf', 1, '2025-06-05 15:26:45', '2025-06-05 15:26:45'),
	(2365, 'storage/documentos/requisicion/yiavKy7Nmf_REQUISICIÓN No.pdf', 'yiavKy7Nmf_REQUISICIÓN No.pdf', 1, '2025-06-05 15:27:46', '2025-06-05 15:27:46'),
	(2366, 'storage/documentos/requisicion/yG04T2Lxsp_REQUISICIÓN No.pdf', 'yG04T2Lxsp_REQUISICIÓN No.pdf', 1, '2025-06-05 15:28:48', '2025-06-05 15:28:48'),
	(2367, 'storage/documentos/requisicion/26qPG5rk1K_REQUISICIÓN No.pdf', '26qPG5rk1K_REQUISICIÓN No.pdf', 1, '2025-06-05 15:30:14', '2025-06-05 15:30:14'),
	(2368, 'storage/documentos/requisicion/kAYMl6Sclo_REQUISICIÓN No.pdf', 'kAYMl6Sclo_REQUISICIÓN No.pdf', 1, '2025-06-05 15:33:15', '2025-06-05 15:33:15'),
	(2369, 'storage/documentos/requisicion/UsnhgrR0pK_REQUISICIÓN No.pdf', 'UsnhgrR0pK_REQUISICIÓN No.pdf', 1, '2025-06-05 15:34:04', '2025-06-05 15:34:04'),
	(2370, 'storage/documentos/requisicion/99jGJ3xEQF_REQUISICIÓN No.pdf', '99jGJ3xEQF_REQUISICIÓN No.pdf', 1, '2025-06-05 15:35:08', '2025-06-05 15:35:08'),
	(2371, 'storage/documentos/requisicion/RVeRytBiW0_REQISICIÓN No.pdf', 'RVeRytBiW0_REQISICIÓN No.pdf', 1, '2025-06-05 15:39:42', '2025-06-05 15:39:42'),
	(2372, 'storage/documentos/requisicion/j5Os2yoP90_REQUISICIÓN No.pdf', 'j5Os2yoP90_REQUISICIÓN No.pdf', 1, '2025-06-05 15:46:08', '2025-06-05 15:46:08'),
	(2373, 'storage/documentos/requisicion/dIDph9LnMo_REQUISICIÓN No.pdf', 'dIDph9LnMo_REQUISICIÓN No.pdf', 1, '2025-06-05 15:47:05', '2025-06-05 15:47:05'),
	(2374, 'storage/documentos/requisicion/wTvixoA4kL_REQUISICIÓN No.pdf', 'wTvixoA4kL_REQUISICIÓN No.pdf', 1, '2025-06-05 15:47:55', '2025-06-05 15:47:55'),
	(2375, 'storage/documentos/requisicion/QDe8QvufCX_REQUISICIÓN No.pdf', 'QDe8QvufCX_REQUISICIÓN No.pdf', 1, '2025-06-05 15:50:48', '2025-06-05 15:50:48'),
	(2376, 'storage/documentos/requisicion/FqkAbKCxcc_REQUISICIÓN No.pdf', 'FqkAbKCxcc_REQUISICIÓN No.pdf', 1, '2025-06-05 15:52:19', '2025-06-05 15:52:19'),
	(2377, 'storage/documentos/requisicion/OHkN7w5Fe1_REQUISICIÓN No.pdf', 'OHkN7w5Fe1_REQUISICIÓN No.pdf', 1, '2025-06-05 15:53:23', '2025-06-05 15:53:23'),
	(2378, 'storage/documentos/requisicion/bV3LqK4BRa_REQUISICIÓN No.pdf', 'bV3LqK4BRa_REQUISICIÓN No.pdf', 1, '2025-06-05 15:54:37', '2025-06-05 15:54:37'),
	(2379, 'storage/documentos/requisicion/twvCexEBVh_REQUISICIÓNN No.pdf', 'twvCexEBVh_REQUISICIÓNN No.pdf', 1, '2025-06-05 15:56:14', '2025-06-05 15:56:14'),
	(2380, 'storage/documentos/memorandum/AZDog2IMR4_COMUNICACIÓN memo-122-2025 subir galería a la página web Archivo.pdf', 'AZDog2IMR4_COMUNICACIÓN memo-122-2025 subir galería a la página web Archivo.pdf', 2, '2025-06-05 15:58:48', '2025-06-05 15:58:48'),
	(2381, 'storage/documentos/correo/mFyIzK3eyf_INFORMÁTICA tarjeta cin-031-2025 se informa que no se dió atención a 16 solicitudes de videoconfe.pdf', 'mFyIzK3eyf_INFORMÁTICA tarjeta cin-031-2025 se informa que no se dió atención a 16 solicitudes de videoconfe.pdf', 7, '2025-06-05 16:00:25', '2025-06-05 16:00:25'),
	(2382, 'storage/documentos/correo/HhhxUDRwIm_INFORMÁTICA tarjeta cin-032-2025 se informa que se realizaron reapaldos a base de datos  Archivo.pdf', 'HhhxUDRwIm_INFORMÁTICA tarjeta cin-032-2025 se informa que se realizaron reapaldos a base de datos  Archivo.pdf', 7, '2025-06-05 16:03:27', '2025-06-05 16:03:27'),
	(2383, 'storage/documentos/correo/nznNY30EGW_INFORMÁTICA tarjeta cin-033-2025 se informa que no se instalaron equipos Archivo.pdf', 'nznNY30EGW_INFORMÁTICA tarjeta cin-033-2025 se informa que no se instalaron equipos Archivo.pdf', 7, '2025-06-05 16:09:12', '2025-06-05 16:09:12'),
	(2384, 'storage/documentos/correo/uCdPdqP6Nv_INFORMÁTICA tarjeta cin-034-2025 se informa que loa respaldos en base de datos Archivo.pdf', 'uCdPdqP6Nv_INFORMÁTICA tarjeta cin-034-2025 se informa que loa respaldos en base de datos Archivo.pdf', 7, '2025-06-05 16:11:52', '2025-06-05 16:11:52'),
	(2385, 'storage/documentos/memorandum/PosXJHIQra_DOE memo-343-2025 se solicita desincorporación de cajas contenedoras de cartón Eder-Daniel-Normatividad.pdf', 'PosXJHIQra_DOE memo-343-2025 se solicita desincorporación de cajas contenedoras de cartón Eder-Daniel-Normatividad.pdf', 2, '2025-06-05 16:35:16', '2025-06-05 16:35:16'),
	(2386, 'storage/documentos/memorandum/0dUp7l1b7d_SECRETARÍA memo-1817-2025 se remite documentación Eder-Normatividad.pdf', '0dUp7l1b7d_SECRETARÍA memo-1817-2025 se remite documentación Eder-Normatividad.pdf', 2, '2025-06-05 17:50:47', '2025-06-05 17:50:47'),
	(2387, 'storage/documentos/memorandum/oZX03iMQYP_SECRETARÍA memo-1792-2025 se solicita alta de personal Cuarto.pdf', 'oZX03iMQYP_SECRETARÍA memo-1792-2025 se solicita alta de personal Cuarto.pdf', 2, '2025-06-05 17:54:22', '2025-06-05 17:54:22'),
	(2388, 'storage/documentos/memorandum/5S1ciahJdp_SECRETARÍA memo-1428-2025 se autoriza indemnización Cuarto.pdf', '5S1ciahJdp_SECRETARÍA memo-1428-2025 se autoriza indemnización Cuarto.pdf', 2, '2025-06-05 17:57:38', '2025-06-05 17:57:38'),
	(2389, 'storage/documentos/memorandum/sUnmR389hH_IGUALDAD memo-145-2025 se solicita realización de micrositio Archivo.pdf', 'sUnmR389hH_IGUALDAD memo-145-2025 se solicita realización de micrositio Archivo.pdf', 2, '2025-06-05 17:58:15', '2025-06-05 17:58:15'),
	(2390, 'storage/documentos/memorandum/ISXf3FhXCS_IGUALDAD memo-142-2025 se remite resp a memo da-0614-2025 Eder-Dali.pdf', 'ISXf3FhXCS_IGUALDAD memo-142-2025 se remite resp a memo da-0614-2025 Eder-Dali.pdf', 2, '2025-06-05 17:59:21', '2025-06-05 17:59:21'),
	(2391, 'storage/documentos/requisicion/rQ964EWJxi_REQUISICIÓN No.pdf', 'rQ964EWJxi_REQUISICIÓN No.pdf', 1, '2025-06-05 17:59:55', '2025-06-05 17:59:55'),
	(2392, 'storage/documentos/memorandum/n2sDIQzUBh_COMUNICACIÓN memo-124-2025 Archivo.pdf', 'n2sDIQzUBh_COMUNICACIÓN memo-124-2025 Archivo.pdf', 2, '2025-06-05 18:00:55', '2025-06-05 18:00:55'),
	(2393, 'storage/documentos/requisicion/7FJTfhDZKf_REQUISICIÓN No, 1409.pdf', '7FJTfhDZKf_REQUISICIÓN No, 1409.pdf', 1, '2025-06-05 18:06:29', '2025-06-05 18:06:29'),
	(2394, 'storage/documentos/requisicion/rP0xasF2FZ_REQUISICIÓN No.pdf', 'rP0xasF2FZ_REQUISICIÓN No.pdf', 1, '2025-06-05 18:08:08', '2025-06-05 18:08:08'),
	(2395, 'storage/documentos/requisicion/lDlbS8EFmr_REQUISICIÓN No.pdf', 'lDlbS8EFmr_REQUISICIÓN No.pdf', 1, '2025-06-05 18:23:29', '2025-06-05 18:23:29'),
	(2396, 'storage/documentos/requisicion/gvSjfRUv07_REQUISICIÓN No.pdf', 'gvSjfRUv07_REQUISICIÓN No.pdf', 1, '2025-06-05 18:24:28', '2025-06-05 18:24:28'),
	(2397, 'storage/documentos/requisicion/oyP2YJGoYq_REQUISICIÓN No.pdf', 'oyP2YJGoYq_REQUISICIÓN No.pdf', 1, '2025-06-05 18:25:33', '2025-06-05 18:25:33'),
	(2398, 'storage/documentos/requisicion/D6dUUJimJi_REQUISICIÓN No.pdf', 'D6dUUJimJi_REQUISICIÓN No.pdf', 1, '2025-06-05 18:26:35', '2025-06-05 18:26:35'),
	(2399, 'storage/documentos/requisicion/lsG6Y9t2Ao_REQUISICIÓN No.pdf', 'lsG6Y9t2Ao_REQUISICIÓN No.pdf', 1, '2025-06-05 18:27:48', '2025-06-05 18:27:48'),
	(2400, 'storage/documentos/requisicion/y6CvmepuWZ_REQUISICIÓN No.pdf', 'y6CvmepuWZ_REQUISICIÓN No.pdf', 1, '2025-06-05 18:30:03', '2025-06-05 18:30:03'),
	(2401, 'storage/documentos/requisicion/nyzernqoNM_REQUISICIÓN No.pdf', 'nyzernqoNM_REQUISICIÓN No.pdf', 1, '2025-06-05 18:31:14', '2025-06-05 18:31:14'),
	(2402, 'storage/documentos/requisicion/kwvmfqsh8V_REQUISICIÓN No.pdf', 'kwvmfqsh8V_REQUISICIÓN No.pdf', 1, '2025-06-05 18:32:33', '2025-06-05 18:32:33'),
	(2403, 'storage/documentos/requisicion/vkxZc4EWyV_REQUISICIÓN No.pdf', 'vkxZc4EWyV_REQUISICIÓN No.pdf', 1, '2025-06-05 18:33:32', '2025-06-05 18:33:32'),
	(2404, 'storage/documentos/requisicion/HMI1ogNCtT_REQUISICIÓN No.pdf', 'HMI1ogNCtT_REQUISICIÓN No.pdf', 1, '2025-06-05 18:34:52', '2025-06-05 18:34:52'),
	(2405, 'storage/documentos/requisicion/DLi0IYDrbf_REQUISICIÓN No.pdf', 'DLi0IYDrbf_REQUISICIÓN No.pdf', 1, '2025-06-05 18:36:52', '2025-06-05 18:36:52'),
	(2406, 'storage/documentos/requisicion/3AQYJi9boK_REQUISICIÓN No.pdf', '3AQYJi9boK_REQUISICIÓN No.pdf', 1, '2025-06-05 18:37:59', '2025-06-05 18:37:59'),
	(2407, 'storage/documentos/requisicion/VbmUjo23gU_REQUISICIÓN No.pdf', 'VbmUjo23gU_REQUISICIÓN No.pdf', 1, '2025-06-05 18:41:49', '2025-06-05 18:41:49'),
	(2408, 'storage/documentos/requisicion/yh0naitJTl_REQUISICIÓN No.pdf', 'yh0naitJTl_REQUISICIÓN No.pdf', 1, '2025-06-05 18:44:03', '2025-06-05 18:44:03'),
	(2409, 'storage/documentos/requisicion/Nn461CfXV6_REQUISICIÓN No.pdf', 'Nn461CfXV6_REQUISICIÓN No.pdf', 1, '2025-06-05 18:45:17', '2025-06-05 18:45:17'),
	(2410, 'storage/documentos/requisicion/FwehZbSbSg_REQUISICIÓN No.pdf', 'FwehZbSbSg_REQUISICIÓN No.pdf', 1, '2025-06-05 18:46:12', '2025-06-05 18:46:12'),
	(2411, 'storage/documentos/memorandum/4Jkx0UL4EF_TRANSPARENCIA memo-360-2025 se solicita informa anual de actividades 2024-2025 Eder-Normatividad-Poblano.pdf', '4Jkx0UL4EF_TRANSPARENCIA memo-360-2025 se solicita informa anual de actividades 2024-2025 Eder-Normatividad-Poblano.pdf', 2, '2025-06-05 19:05:23', '2025-06-05 19:05:23'),
	(2412, 'storage/documentos/requisicion/m4ZKkiEUUB_REQUISICIÓN No.pdf', 'm4ZKkiEUUB_REQUISICIÓN No.pdf', 1, '2025-06-06 14:00:19', '2025-06-06 14:00:19'),
	(2413, 'storage/documentos/requisicion/9ut6tdzrot_REQUISICIÓN No.pdf', '9ut6tdzrot_REQUISICIÓN No.pdf', 1, '2025-06-06 14:06:15', '2025-06-06 14:06:15'),
	(2414, 'storage/documentos/requisicion/ZE3CTL81ju_REQUISICIÓN No.pdf', 'ZE3CTL81ju_REQUISICIÓN No.pdf', 1, '2025-06-06 14:07:49', '2025-06-06 14:07:49'),
	(2415, 'storage/documentos/requisicion/z3HoyvlT6D_REQUISICIÓN No.pdf', 'z3HoyvlT6D_REQUISICIÓN No.pdf', 1, '2025-06-06 14:38:18', '2025-06-06 14:38:18'),
	(2416, 'storage/documentos/memorandum/7AJYSlSyBw_UFD memo-563-2025 se solicita alta de personal Cuarto.pdf', '7AJYSlSyBw_UFD memo-563-2025 se solicita alta de personal Cuarto.pdf', 2, '2025-06-06 14:41:28', '2025-06-06 14:41:28'),
	(2417, 'storage/documentos/memorandum/vdB8FOKI6I_SECRETARÍA memo-1561-2025 se autoriza indemnización  Cuarto.pdf', 'vdB8FOKI6I_SECRETARÍA memo-1561-2025 se autoriza indemnización  Cuarto.pdf', 2, '2025-06-06 16:58:12', '2025-06-06 16:58:12'),
	(2418, 'storage/documentos/memorandum/v4ikbhQuW2_PRERROGATIVAS memo-0434-2025 se solicita activación de sistema Archivo.pdf', 'v4ikbhQuW2_PRERROGATIVAS memo-0434-2025 se solicita activación de sistema Archivo.pdf', 2, '2025-06-06 17:13:19', '2025-06-06 17:13:19'),
	(2419, 'storage/documentos/memorandum/qie1666Kz0_INFORMÁTICA memo-078-2025 sistema informativo Archivo.pdf', 'qie1666Kz0_INFORMÁTICA memo-078-2025 sistema informativo Archivo.pdf', 2, '2025-06-06 18:51:03', '2025-06-06 18:51:03'),
	(2420, 'storage/documentos/memorandum/nPM17Ni0lQ_PRERROGATIVAS memo-0436-2025 se remiten recibos originales de financiamiento público Eder-Saúl.pdf', 'nPM17Ni0lQ_PRERROGATIVAS memo-0436-2025 se remiten recibos originales de financiamiento público Eder-Saúl.pdf', 2, '2025-06-06 21:07:44', '2025-06-06 21:07:44'),
	(2421, 'storage/documentos/oficio/ccchmG2JWd_PRERROGATIVAS oficio-0084-2025 solicitud de recibos de financiamiento Eder Saúl.pdf', 'ccchmG2JWd_PRERROGATIVAS oficio-0084-2025 solicitud de recibos de financiamiento Eder Saúl.pdf', 3, '2025-06-06 21:09:43', '2025-06-06 21:09:43'),
	(2422, 'storage/documentos/memorandum/l4eHMXRCWZ_CONTRALORÍA memo-coi-a.pdf', 'l4eHMXRCWZ_CONTRALORÍA memo-coi-a.pdf', 2, '2025-06-09 15:16:00', '2025-06-09 15:16:00'),
	(2423, 'storage/documentos/requisicion/oBjQU0fpOo_REQUISICIÓN No.pdf', 'oBjQU0fpOo_REQUISICIÓN No.pdf', 1, '2025-06-09 15:18:00', '2025-06-09 15:18:00'),
	(2424, 'storage/documentos/requisicion/NMrsQDgcqf_REQUISICIÓN No.pdf', 'NMrsQDgcqf_REQUISICIÓN No.pdf', 1, '2025-06-09 15:19:06', '2025-06-09 15:19:06'),
	(2425, 'storage/documentos/oficio/Ua7pKQjufa_SECRETARÍA oficio-0944-2025 se remiten observaciones de proyectos contratos de comodato Archivo.pdf', 'Ua7pKQjufa_SECRETARÍA oficio-0944-2025 se remiten observaciones de proyectos contratos de comodato Archivo.pdf', 3, '2025-06-09 15:22:26', '2025-06-09 15:22:26'),
	(2426, 'storage/documentos/requisicion/w3C2ddurES_REQUISICIÓN No.pdf', 'w3C2ddurES_REQUISICIÓN No.pdf', 1, '2025-06-09 17:49:53', '2025-06-09 17:49:53'),
	(2427, 'storage/documentos/requisicion/Z7AnTiWlSC_REQUISICIÓN No.pdf', 'Z7AnTiWlSC_REQUISICIÓN No.pdf', 1, '2025-06-09 17:50:59', '2025-06-09 17:50:59'),
	(2428, 'storage/documentos/requisicion/eOhaDp2lMu_REQUISICIÓN No.pdf', 'eOhaDp2lMu_REQUISICIÓN No.pdf', 1, '2025-06-09 17:52:03', '2025-06-09 17:52:03'),
	(2429, 'storage/documentos/requisicion/jZbpzcq7aX_REQUISICIÓN No.pdf', 'jZbpzcq7aX_REQUISICIÓN No.pdf', 1, '2025-06-09 17:54:01', '2025-06-09 17:54:01'),
	(2430, 'storage/documentos/requisicion/X2JqyiFjQO_REQUISICIÓN No.pdf', 'X2JqyiFjQO_REQUISICIÓN No.pdf', 1, '2025-06-09 17:55:00', '2025-06-09 17:55:00'),
	(2431, 'storage/documentos/requisicion/TlDQ2S73Dd_REQUISICIÓN No.pdf', 'TlDQ2S73Dd_REQUISICIÓN No.pdf', 1, '2025-06-09 18:05:07', '2025-06-09 18:05:07'),
	(2432, 'storage/documentos/requisicion/aytYOoc1tE_REQUISICIÓN No.pdf', 'aytYOoc1tE_REQUISICIÓN No.pdf', 1, '2025-06-10 15:12:25', '2025-06-10 15:12:25'),
	(2433, 'storage/documentos/memorandum/iwKz5qz7SV_PRERROGATIVAS memo-0438-2025 se informa apertura de nueva cuenta bancaria PRI Eder-Saúl.pdf', 'iwKz5qz7SV_PRERROGATIVAS memo-0438-2025 se informa apertura de nueva cuenta bancaria PRI Eder-Saúl.pdf', 2, '2025-06-10 16:36:26', '2025-06-10 16:36:26'),
	(2434, 'storage/documentos/escrito/IEoMWmqlGM_Correos devuletos.pdf', 'IEoMWmqlGM_Correos devuletos.pdf', 5, '2025-06-10 17:26:05', '2025-06-10 17:26:05'),
	(2435, 'storage/documentos/escrito/qtSo2jfraL_OFICIALIA DE PARTES folio 2394 correo escrito floriberta ortiz Eder-Caro.pdf', 'qtSo2jfraL_OFICIALIA DE PARTES folio 2394 correo escrito floriberta ortiz Eder-Caro.pdf', 5, '2025-06-10 17:30:10', '2025-06-10 17:30:10'),
	(2436, 'storage/documentos/memorandum/ROzBhkRDT2_SECRETARÍA memo-ca-p-0375-2025 se convoca a sesión o.pdf', 'ROzBhkRDT2_SECRETARÍA memo-ca-p-0375-2025 se convoca a sesión o.pdf', 2, '2025-06-10 17:33:51', '2025-06-10 17:33:51'),
	(2437, 'storage/documentos/memorandum/7vsk4BnthV_UFD memo-574-2025 se remite incapacidad Cuarto.pdf', '7vsk4BnthV_UFD memo-574-2025 se remite incapacidad Cuarto.pdf', 2, '2025-06-10 17:36:45', '2025-06-10 17:36:45'),
	(2438, 'storage/documentos/requisicion/TKT0DxNH7T_REQUISICIÓN No.pdf', 'TKT0DxNH7T_REQUISICIÓN No.pdf', 1, '2025-06-10 17:39:57', '2025-06-10 17:39:57'),
	(2439, 'storage/documentos/requisicion/2YNRlmnGzf_REQUISICIÓN No.pdf', '2YNRlmnGzf_REQUISICIÓN No.pdf', 1, '2025-06-10 17:41:46', '2025-06-10 17:41:46'),
	(2440, 'storage/documentos/requisicion/9uuclMGMxX_REQUISICIÓN No.pdf', '9uuclMGMxX_REQUISICIÓN No.pdf', 1, '2025-06-10 17:43:14', '2025-06-10 17:43:14'),
	(2441, 'storage/documentos/requisicion/K3xy80rhOy_REQUISICIÓN No.pdf', 'K3xy80rhOy_REQUISICIÓN No.pdf', 1, '2025-06-10 17:44:25', '2025-06-10 17:44:25'),
	(2442, 'storage/documentos/requisicion/YCLefQVWIV_REQUISICIÓN No.pdf', 'YCLefQVWIV_REQUISICIÓN No.pdf', 1, '2025-06-10 17:47:50', '2025-06-10 17:47:50'),
	(2443, 'storage/documentos/requisicion/omNBps6YlF_REQUISICIÓN No.pdf', 'omNBps6YlF_REQUISICIÓN No.pdf', 1, '2025-06-10 17:49:17', '2025-06-10 17:49:17'),
	(2444, 'storage/documentos/requisicion/MLExWYZjuN_REQUISICIÓN No.pdf', 'MLExWYZjuN_REQUISICIÓN No.pdf', 1, '2025-06-10 17:52:56', '2025-06-10 17:52:56'),
	(2445, 'storage/documentos/requisicion/u445rgHtNe_REQUISICIÓN No.pdf', 'u445rgHtNe_REQUISICIÓN No.pdf', 1, '2025-06-10 17:58:43', '2025-06-10 17:58:43'),
	(2446, 'storage/documentos/escrito/q9qZkRoGrw_CONSEJO DE ARMONIZACIÓN CONTABLE CACEP reprogramación del curso nuevas reglas registro y valuación del patrimonio Ale-Emir-Eder.pdf', 'q9qZkRoGrw_CONSEJO DE ARMONIZACIÓN CONTABLE CACEP reprogramación del curso nuevas reglas registro y valuación del patrimonio Ale-Emir-Eder.pdf', 5, '2025-06-11 14:32:52', '2025-06-11 14:32:52'),
	(2447, 'storage/documentos/requisicion/KaRbwJMugp_REQUISICIÓN No.pdf', 'KaRbwJMugp_REQUISICIÓN No.pdf', 1, '2025-06-11 14:53:57', '2025-06-11 14:53:57'),
	(2448, 'storage/documentos/oficio/kJwYaiyRxB_PRESIDENCIA oficio-0454-2025 ministración mes de junio Emir.pdf', 'kJwYaiyRxB_PRESIDENCIA oficio-0454-2025 ministración mes de junio Emir.pdf', 3, '2025-06-11 14:55:58', '2025-06-11 14:55:58'),
	(2449, 'storage/documentos/memorandum/hHm96aPIUu_CONTRALORÍA memo-a.pdf', 'hHm96aPIUu_CONTRALORÍA memo-a.pdf', 2, '2025-06-12 14:21:18', '2025-06-12 14:21:18'),
	(2450, 'storage/documentos/oficio/ozihM0O6YE_SECRETARÍA oficio-0945-2025 se solicita se otorgue de manera gratuita licenciamiento.pdf', 'ozihM0O6YE_SECRETARÍA oficio-0945-2025 se solicita se otorgue de manera gratuita licenciamiento.pdf', 3, '2025-06-12 14:25:16', '2025-06-12 14:25:16'),
	(2451, 'storage/documentos/memorandum/vjBJmdxlMx_UFD memo-587-2025 se solicita alta de personal Cuarto.pdf', 'vjBJmdxlMx_UFD memo-587-2025 se solicita alta de personal Cuarto.pdf', 2, '2025-06-12 14:27:02', '2025-06-12 14:27:02'),
	(2452, 'storage/documentos/memorandum/4hMt98tbOY_INFORMÁTICA memo-079-2025 micrositios Archivo.pdf', '4hMt98tbOY_INFORMÁTICA memo-079-2025 micrositios Archivo.pdf', 2, '2025-06-12 14:28:51', '2025-06-12 14:28:51'),
	(2453, 'storage/documentos/requisicion/MfrXLBBdB1_REQUISICIÓN No.pdf', 'MfrXLBBdB1_REQUISICIÓN No.pdf', 1, '2025-06-12 14:33:29', '2025-06-12 14:33:29'),
	(2454, 'storage/documentos/requisicion/yyAYQD0rxR_REQUISICIÓN No.pdf', 'yyAYQD0rxR_REQUISICIÓN No.pdf', 1, '2025-06-12 14:35:04', '2025-06-12 14:35:04'),
	(2455, 'storage/documentos/requisicion/LwW9Ubkaw8_REQUISICIÓN No.pdf', 'LwW9Ubkaw8_REQUISICIÓN No.pdf', 1, '2025-06-12 14:37:56', '2025-06-12 14:37:56'),
	(2456, 'storage/documentos/requisicion/phYeWyclkV_REQUISICIÓN No.pdf', 'phYeWyclkV_REQUISICIÓN No.pdf', 1, '2025-06-12 14:38:56', '2025-06-12 14:38:56'),
	(2457, 'storage/documentos/requisicion/H37NmT1R7n_REQUISICIÓN No.pdf', 'H37NmT1R7n_REQUISICIÓN No.pdf', 1, '2025-06-12 14:40:54', '2025-06-12 14:40:54'),
	(2458, 'storage/documentos/requisicion/knz7oN9dg9_REQUISICIÓN No.pdf', 'knz7oN9dg9_REQUISICIÓN No.pdf', 1, '2025-06-12 14:42:24', '2025-06-12 14:42:24'),
	(2459, 'storage/documentos/requisicion/uXXk8AQ2ZN_REQUISICIÓN No.pdf', 'uXXk8AQ2ZN_REQUISICIÓN No.pdf', 1, '2025-06-12 14:44:03', '2025-06-12 14:44:03'),
	(2460, 'storage/documentos/requisicion/ErSkoxeA3U_REQUISICIÓN No.pdf', 'ErSkoxeA3U_REQUISICIÓN No.pdf', 1, '2025-06-12 14:46:23', '2025-06-12 14:46:23'),
	(2461, 'storage/documentos/requisicion/4VAZ0ANyiI_REQUISICIÓN No.pdf', '4VAZ0ANyiI_REQUISICIÓN No.pdf', 1, '2025-06-12 14:47:22', '2025-06-12 14:47:22'),
	(2462, 'storage/documentos/requisicion/x0yszrmLjc_REQUISICIÓN No.pdf', 'x0yszrmLjc_REQUISICIÓN No.pdf', 1, '2025-06-12 14:48:34', '2025-06-12 14:48:34'),
	(2463, 'storage/documentos/memorandum/2JMITYnQvK_UFD memo-588-2025 se remite calificación de examen Cuarto.pdf', '2JMITYnQvK_UFD memo-588-2025 se remite calificación de examen Cuarto.pdf', 2, '2025-06-12 14:58:19', '2025-06-12 14:58:19'),
	(2464, 'storage/documentos/circular/6pEOGSrvin_CONSEJERA SOFÍA circular-ce-smmg-001-2025 se infroman cuentas de correos electrónicos Archivo.pdf', '6pEOGSrvin_CONSEJERA SOFÍA circular-ce-smmg-001-2025 se infroman cuentas de correos electrónicos Archivo.pdf', 4, '2025-06-13 14:33:39', '2025-06-13 14:33:39'),
	(2465, 'storage/documentos/memorandum/nNi7vCsvIi_JURÍDICO memo-1197-2025 se solicita alta de correo institucional Archivo.pdf', 'nNi7vCsvIi_JURÍDICO memo-1197-2025 se solicita alta de correo institucional Archivo.pdf', 2, '2025-06-13 14:35:01', '2025-06-13 14:35:01'),
	(2466, 'storage/documentos/memorandum/oEFQqKME67_JURÍDICO memo-ca-se-0035-2025.pdf', 'oEFQqKME67_JURÍDICO memo-ca-se-0035-2025.pdf', 2, '2025-06-13 14:36:23', '2025-06-13 14:36:23'),
	(2467, 'storage/documentos/requisicion/NyghaZnsR1_REQUISICIÓN No.pdf', 'NyghaZnsR1_REQUISICIÓN No.pdf', 1, '2025-06-13 14:37:24', '2025-06-13 14:37:24'),
	(2468, 'storage/documentos/requisicion/EreZZl2Stw_REQUISICIÓN No.pdf', 'EreZZl2Stw_REQUISICIÓN No.pdf', 1, '2025-06-13 14:39:22', '2025-06-13 14:39:22'),
	(2469, 'storage/documentos/requisicion/VcgyHlSgCG_REQUISICIÓN No.pdf', 'VcgyHlSgCG_REQUISICIÓN No.pdf', 1, '2025-06-13 14:42:01', '2025-06-13 14:42:01'),
	(2470, 'storage/documentos/requisicion/pmZk2VVQET_REQUISICIÓN No.pdf', 'pmZk2VVQET_REQUISICIÓN No.pdf', 1, '2025-06-13 14:48:44', '2025-06-13 14:48:44'),
	(2471, 'storage/documentos/requisicion/KwGDMgWujW_REQUISICIÓN No.pdf', 'KwGDMgWujW_REQUISICIÓN No.pdf', 1, '2025-06-13 14:50:27', '2025-06-13 14:50:27'),
	(2472, 'storage/documentos/requisicion/Bx3q1iN1Fw_REQUISICIÓN No.pdf', 'Bx3q1iN1Fw_REQUISICIÓN No.pdf', 1, '2025-06-13 14:51:08', '2025-06-13 14:51:08'),
	(2473, 'storage/documentos/requisicion/vQYIBUjUGo_REQUISICIÓN No.pdf', 'vQYIBUjUGo_REQUISICIÓN No.pdf', 1, '2025-06-13 14:52:13', '2025-06-13 14:52:13'),
	(2474, 'storage/documentos/requisicion/41TjHZZhQW_REQUISICIÓN No.pdf', '41TjHZZhQW_REQUISICIÓN No.pdf', 1, '2025-06-13 15:01:56', '2025-06-13 15:01:56'),
	(2475, 'storage/documentos/requisicion/4jizUejFvm_REQUISICIÓN No.pdf', '4jizUejFvm_REQUISICIÓN No.pdf', 1, '2025-06-13 17:35:01', '2025-06-13 17:35:01'),
	(2476, 'storage/documentos/oficio/Fa694snKNX_AUDITOR EXTERNO oficio aj-ae-09-2025 entrega de gupia Eder.pdf', 'Fa694snKNX_AUDITOR EXTERNO oficio aj-ae-09-2025 entrega de gupia Eder.pdf', 3, '2025-06-17 15:46:24', '2025-06-17 15:46:24'),
	(2477, 'storage/documentos/oficio/HYK7qFCauw_AUDITOR EXTERNO oficio aj-ae-10-2025 solicitud de información, sobre visitas de inspección Eder.pdf', 'HYK7qFCauw_AUDITOR EXTERNO oficio aj-ae-10-2025 solicitud de información, sobre visitas de inspección Eder.pdf', 3, '2025-06-17 15:48:51', '2025-06-17 15:48:51'),
	(2478, 'storage/documentos/memorandum/vJtEUMVOwZ_DA memo-0662-2025 incidencia de personal Cuarto.pdf', 'vJtEUMVOwZ_DA memo-0662-2025 incidencia de personal Cuarto.pdf', 2, '2025-06-17 15:50:33', '2025-06-17 15:50:33'),
	(2479, 'storage/documentos/memorandum/5dUPUHEcze_IGUALDAD memo-155-2025 se solicita actualización en micrositios  Archivo.pdf', '5dUPUHEcze_IGUALDAD memo-155-2025 se solicita actualización en micrositios  Archivo.pdf', 2, '2025-06-17 15:52:02', '2025-06-17 15:52:02'),
	(2480, 'storage/documentos/memorandum/tlyDYvDWUT_JURÍDICO memo-00492bis-2025 se remite contrato para su observación 300 cuadernillos entornos imprenta digital Eder-Normatividad.pdf', 'tlyDYvDWUT_JURÍDICO memo-00492bis-2025 se remite contrato para su observación 300 cuadernillos entornos imprenta digital Eder-Normatividad.pdf', 2, '2025-06-17 15:53:35', '2025-06-17 15:53:35'),
	(2481, 'storage/documentos/memorandum/haDC2dTfzs_JURÍDICO memo-00494bis-2025 se remite contrato para su observación 1600 instructivos entornos imprenta digital Eder-Normatividad.pdf', 'haDC2dTfzs_JURÍDICO memo-00494bis-2025 se remite contrato para su observación 1600 instructivos entornos imprenta digital Eder-Normatividad.pdf', 2, '2025-06-17 15:56:37', '2025-06-17 15:56:37'),
	(2482, 'storage/documentos/memorandum/vSxILPt8z8_PLANEACIÓN memo-046-2025 contestación informe final auditoria de desempeño 2023 Eder.pdf', 'vSxILPt8z8_PLANEACIÓN memo-046-2025 contestación informe final auditoria de desempeño 2023 Eder.pdf', 2, '2025-06-17 15:58:30', '2025-06-17 15:58:30'),
	(2483, 'storage/documentos/requisicion/tEWOtPWO2E_REQUISICIÓN No.pdf', 'tEWOtPWO2E_REQUISICIÓN No.pdf', 1, '2025-06-17 15:59:27', '2025-06-17 15:59:27'),
	(2484, 'storage/documentos/requisicion/JmStmi4uAB_REQUISICIÓN No.pdf', 'JmStmi4uAB_REQUISICIÓN No.pdf', 1, '2025-06-17 16:01:13', '2025-06-17 16:01:13'),
	(2485, 'storage/documentos/requisicion/J3JIm0hJgm_REQUISICIÓN No.pdf', 'J3JIm0hJgm_REQUISICIÓN No.pdf', 1, '2025-06-17 16:02:25', '2025-06-17 16:02:25'),
	(2486, 'storage/documentos/requisicion/Np2FAEhrru_REQUISICIÓN No.pdf', 'Np2FAEhrru_REQUISICIÓN No.pdf', 1, '2025-06-17 16:03:41', '2025-06-17 16:03:41'),
	(2487, 'storage/documentos/requisicion/eGedmCFj6Z_REQUISICIÓN No.pdf', 'eGedmCFj6Z_REQUISICIÓN No.pdf', 1, '2025-06-17 16:05:12', '2025-06-17 16:05:12'),
	(2488, 'storage/documentos/requisicion/3FAGllf20J_REQUISICIÓN No.pdf', '3FAGllf20J_REQUISICIÓN No.pdf', 1, '2025-06-17 16:10:59', '2025-06-17 16:10:59'),
	(2489, 'storage/documentos/requisicion/d5Scr9uxQz_REQUISICIÓN No.pdf', 'd5Scr9uxQz_REQUISICIÓN No.pdf', 1, '2025-06-17 16:15:25', '2025-06-17 16:15:25'),
	(2490, 'storage/documentos/requisicion/nJCrnPQ7Er_REQUISICIÓN No.pdf', 'nJCrnPQ7Er_REQUISICIÓN No.pdf', 1, '2025-06-17 16:16:29', '2025-06-17 16:16:29'),
	(2491, 'storage/documentos/requisicion/uDJ4TP55O5_REQUISICIÓN No.pdf', 'uDJ4TP55O5_REQUISICIÓN No.pdf', 1, '2025-06-17 16:17:35', '2025-06-17 16:17:35'),
	(2492, 'storage/documentos/requisicion/j8xdvuXgz7_REQUISICIÓN No.pdf', 'j8xdvuXgz7_REQUISICIÓN No.pdf', 1, '2025-06-17 16:18:34', '2025-06-17 16:18:34'),
	(2493, 'storage/documentos/requisicion/zYJO9tfeXw_REQUISICIÓN No.pdf', 'zYJO9tfeXw_REQUISICIÓN No.pdf', 1, '2025-06-17 16:19:18', '2025-06-17 16:19:18'),
	(2494, 'storage/documentos/memorandum/YHakylAEIt_SECRETARÍA memo-1881-2025 se remite documentación oficio ase-0451-09062-acre-22-dfe-2025 Eder.pdf', 'YHakylAEIt_SECRETARÍA memo-1881-2025 se remite documentación oficio ase-0451-09062-acre-22-dfe-2025 Eder.pdf', 2, '2025-06-17 16:20:39', '2025-06-17 16:20:39'),
	(2495, 'storage/documentos/memorandum/GRzIHMMUSb_SECRETARÍA memo-1882-2025 se remite documentación oficio ase-0451-09062-orau-24-dfe-dade-2025 Eder.pdf', 'GRzIHMMUSb_SECRETARÍA memo-1882-2025 se remite documentación oficio ase-0451-09062-orau-24-dfe-dade-2025 Eder.pdf', 2, '2025-06-17 16:46:26', '2025-06-17 16:46:26'),
	(2496, 'storage/documentos/memorandum/WPTCpg3Rkz_UFD memo-595-2025 se solicita desincorporación de personal.pdf', 'WPTCpg3Rkz_UFD memo-595-2025 se solicita desincorporación de personal.pdf', 2, '2025-06-17 16:49:59', '2025-06-17 16:49:59'),
	(2497, 'storage/documentos/escrito/cH7FkOMBL0_UFD REPORTE DE ASYSTEC JUNIO 1-15 Caro-Cuarto-Eder.pdf', 'cH7FkOMBL0_UFD REPORTE DE ASYSTEC JUNIO 1-15 Caro-Cuarto-Eder.pdf', 5, '2025-06-17 16:51:17', '2025-06-17 16:51:17'),
	(2498, 'storage/documentos/memorandum/2W3B4afh5c_UFD memo-556-2025 se solicita alta de personal Cuarto.pdf', '2W3B4afh5c_UFD memo-556-2025 se solicita alta de personal Cuarto.pdf', 2, '2025-06-17 19:59:41', '2025-06-17 19:59:41'),
	(2499, 'storage/documentos/escrito/K2jKMkltvh_CECILIA SANTOS VÁZQUEZ correo anexo alineación pec 2025 Eder-Emir-Ale.pdf', 'K2jKMkltvh_CECILIA SANTOS VÁZQUEZ correo anexo alineación pec 2025 Eder-Emir-Ale.pdf', 5, '2025-06-18 18:22:10', '2025-06-18 18:22:10'),
	(2500, 'storage/documentos/memorandum/Om5MCbvaLc_CONTRALORÍA exp.pdf', 'Om5MCbvaLc_CONTRALORÍA exp.pdf', 2, '2025-06-18 18:24:35', '2025-06-18 18:24:35'),
	(2501, 'storage/documentos/memorandum/qw0cykSgoN_DTS memo-oe-220-2025 dts-0e-102-2025 de determina fecha y hora para la destrucción de los kits Archivar.pdf', 'qw0cykSgoN_DTS memo-oe-220-2025 dts-0e-102-2025 de determina fecha y hora para la destrucción de los kits Archivar.pdf', 2, '2025-06-18 18:27:39', '2025-06-18 18:27:39'),
	(2502, 'storage/documentos/escrito/NZoHh2vlXh_IGUALDAD correo se remiten constancias de personal que asistió a prevención del acoso y hostigamiento laboral y sexual Viole.pdf', 'NZoHh2vlXh_IGUALDAD correo se remiten constancias de personal que asistió a prevención del acoso y hostigamiento laboral y sexual Viole.pdf', 5, '2025-06-18 18:30:43', '2025-06-18 18:30:43'),
	(2503, 'storage/documentos/requisicion/KcBwx56iOb_REQUISICIÓN No.pdf', 'KcBwx56iOb_REQUISICIÓN No.pdf', 1, '2025-06-18 18:33:16', '2025-06-18 18:33:16'),
	(2504, 'storage/documentos/requisicion/Sh31B5ZbgV_REQUISICIÓN No.pdf', 'Sh31B5ZbgV_REQUISICIÓN No.pdf', 1, '2025-06-18 18:34:17', '2025-06-18 18:34:17'),
	(2505, 'storage/documentos/requisicion/xvn0B6QCtc_REQUISICIÓN No.pdf', 'xvn0B6QCtc_REQUISICIÓN No.pdf', 1, '2025-06-18 18:35:03', '2025-06-18 18:35:03'),
	(2506, 'storage/documentos/requisicion/MpxEFoAZQi_REQUISICIÓN No.pdf', 'MpxEFoAZQi_REQUISICIÓN No.pdf', 1, '2025-06-18 18:36:00', '2025-06-18 18:36:00'),
	(2507, 'storage/documentos/requisicion/S5XDKuPsLc_REQUISICIÓN No.pdf', 'S5XDKuPsLc_REQUISICIÓN No.pdf', 1, '2025-06-18 18:38:36', '2025-06-18 18:38:36'),
	(2508, 'storage/documentos/requisicion/msvJ1Trftn_REQUISICIÓN No.pdf', 'msvJ1Trftn_REQUISICIÓN No.pdf', 1, '2025-06-18 18:40:25', '2025-06-18 18:40:25'),
	(2509, 'storage/documentos/requisicion/vPyeBzuKgQ_REQUISICIÓN No.pdf', 'vPyeBzuKgQ_REQUISICIÓN No.pdf', 1, '2025-06-18 18:41:34', '2025-06-18 18:41:34'),
	(2510, 'storage/documentos/memorandum/w7X81uDB04_SECRETARÍA memo-0685-2025 solicitud de intervención de la contraloría Interna Daniel-Mary.pdf', 'w7X81uDB04_SECRETARÍA memo-0685-2025 solicitud de intervención de la contraloría Interna Daniel-Mary.pdf', 2, '2025-06-18 18:44:36', '2025-06-18 18:44:36'),
	(2511, 'storage/documentos/memorandum/jLPi521O10_SECRETARÍA memo-1888-2025 se solicita el ejercicio de la función de oficialía electoral  en atención a su memo da-0669-2025 Archivo.pdf', 'jLPi521O10_SECRETARÍA memo-1888-2025 se solicita el ejercicio de la función de oficialía electoral  en atención a su memo da-0669-2025 Archivo.pdf', 2, '2025-06-18 18:46:30', '2025-06-18 18:46:30'),
	(2512, 'storage/documentos/memorandum/pO8bqW5j6r_SECRETARÍA memo-1889-2025 se remite documentación  en atención a su memo da-0669-2025 Archivo.pdf', 'pO8bqW5j6r_SECRETARÍA memo-1889-2025 se remite documentación  en atención a su memo da-0669-2025 Archivo.pdf', 2, '2025-06-18 18:48:27', '2025-06-18 18:48:27'),
	(2513, 'storage/documentos/memorandum/1YQY0ko3Fi_SECRETARÍA memo-1892-2025 se autoriza certificación Normatividad-Eder.pdf', '1YQY0ko3Fi_SECRETARÍA memo-1892-2025 se autoriza certificación Normatividad-Eder.pdf', 2, '2025-06-18 18:53:52', '2025-06-18 18:53:52'),
	(2514, 'storage/documentos/memorandum/LDgUXccyBF_SECRETARÍA memo-1893-2025 se informa atención a solicitud Normatividad.pdf', 'LDgUXccyBF_SECRETARÍA memo-1893-2025 se informa atención a solicitud Normatividad.pdf', 2, '2025-06-18 18:56:26', '2025-06-18 18:56:26'),
	(2515, 'storage/documentos/memorandum/tPm06ubJDE_UFD se remite información ase-1726-25-of-oas se remite información  servicios personales Cuarto.pdf', 'tPm06ubJDE_UFD se remite información ase-1726-25-of-oas se remite información  servicios personales Cuarto.pdf', 2, '2025-06-18 18:57:56', '2025-06-18 18:57:56'),
	(2516, 'storage/documentos/memorandum/7YIFSEHpph_CONTRALORÍA memo-coi-a.pdf', '7YIFSEHpph_CONTRALORÍA memo-coi-a.pdf', 2, '2025-06-18 19:00:17', '2025-06-18 19:00:17'),
	(2517, 'storage/documentos/memorandum/6hjj4byewb_JURÍDICO memo-1216-2025 se remite contrato para su revisión c.pdf', '6hjj4byewb_JURÍDICO memo-1216-2025 se remite contrato para su revisión c.pdf', 2, '2025-06-18 19:01:41', '2025-06-18 19:01:41'),
	(2518, 'storage/documentos/escrito/wSec5SecPT_OFICIALIA DE PARTES 7 SOBRES deudores Eder.pdf', 'wSec5SecPT_OFICIALIA DE PARTES 7 SOBRES deudores Eder.pdf', 5, '2025-06-18 19:02:44', '2025-06-18 19:02:44'),
	(2519, 'storage/documentos/escrito/WaN8p8kB0R_PLANEACIÓN correo resp a cecilia santos anexo alineación ped 2025 iee Eder-Emir.pdf', 'WaN8p8kB0R_PLANEACIÓN correo resp a cecilia santos anexo alineación ped 2025 iee Eder-Emir.pdf', 5, '2025-06-18 19:05:02', '2025-06-18 19:05:02'),
	(2520, 'storage/documentos/requisicion/c3Gosu5nOd_REQUISICIÓN No.pdf', 'c3Gosu5nOd_REQUISICIÓN No.pdf', 1, '2025-06-18 19:06:14', '2025-06-18 19:06:14'),
	(2521, 'storage/documentos/requisicion/DlzY7wQHs9_REQUISICIÓN No.pdf', 'DlzY7wQHs9_REQUISICIÓN No.pdf', 1, '2025-06-18 19:07:15', '2025-06-18 19:07:15'),
	(2522, 'storage/documentos/circular/AneZQuwTvi_SECRETARÍA circular-074-2025 invitación micrositios para fomentar la participación política en mujeres Shanty-Elena-Julieta.pdf', 'AneZQuwTvi_SECRETARÍA circular-074-2025 invitación micrositios para fomentar la participación política en mujeres Shanty-Elena-Julieta.pdf', 4, '2025-06-18 19:09:04', '2025-06-18 19:09:04'),
	(2523, 'storage/documentos/memorandum/26PEYwaTEy_UFD memo-614-2025 se remite calificación de examen Cuarto.pdf', '26PEYwaTEy_UFD memo-614-2025 se remite calificación de examen Cuarto.pdf', 2, '2025-06-20 17:32:44', '2025-06-20 17:32:44'),
	(2524, 'storage/documentos/memorandum/LfeZyyphwu_UFD memo-615-2025 se solicita desincorporación de personal Cuarto.pdf', 'LfeZyyphwu_UFD memo-615-2025 se solicita desincorporación de personal Cuarto.pdf', 2, '2025-06-20 17:34:21', '2025-06-20 17:34:21'),
	(2525, 'storage/documentos/memorandum/pRVns8YOmA_CONTRALORÍA memo-314-2025 se remite información Eder.pdf', 'pRVns8YOmA_CONTRALORÍA memo-314-2025 se remite información Eder.pdf', 2, '2025-06-20 18:02:13', '2025-06-20 18:02:13'),
	(2526, 'storage/documentos/requisicion/h1sHNEEDsj_REQUISICIÓN No.pdf', 'h1sHNEEDsj_REQUISICIÓN No.pdf', 1, '2025-06-20 18:11:49', '2025-06-20 18:11:49'),
	(2527, 'storage/documentos/requisicion/YBgeV7rORA_REQUISICIÓN No.pdf', 'YBgeV7rORA_REQUISICIÓN No.pdf', 1, '2025-06-20 18:13:12', '2025-06-20 18:13:12'),
	(2528, 'storage/documentos/memorandum/sP44Kw6uGl_COMUNICACIÓN memo-130-2025 boletín 38 Archivo.pdf', 'sP44Kw6uGl_COMUNICACIÓN memo-130-2025 boletín 38 Archivo.pdf', 2, '2025-06-20 18:59:13', '2025-06-20 18:59:13'),
	(2529, 'storage/documentos/memorandum/3fQJpm3xBX_CONTRALORÍA memo-316-2025 hojas de trabajo mes de marzo de 2025 Eder-Dali.pdf', '3fQJpm3xBX_CONTRALORÍA memo-316-2025 hojas de trabajo mes de marzo de 2025 Eder-Dali.pdf', 2, '2025-06-20 19:00:37', '2025-06-20 19:00:37'),
	(2530, 'storage/documentos/memorandum/oALnaLawea_DTS memo-iee-oe-224-2025 exp.pdf', 'oALnaLawea_DTS memo-iee-oe-224-2025 exp.pdf', 2, '2025-06-20 19:03:33', '2025-06-20 19:03:33'),
	(2531, 'storage/documentos/escrito/sJPdNQgeE9_IGUALDAD correo remite constancias de conferencia inclusión sin límites Viole Archivo.pdf', 'sJPdNQgeE9_IGUALDAD correo remite constancias de conferencia inclusión sin límites Viole Archivo.pdf', 5, '2025-06-20 19:04:23', '2025-06-20 19:04:23'),
	(2532, 'storage/documentos/memorandum/i1mdsPOK2d_JURÍDICO memo-0117-2025 se remite para firma entornos imprenta digital 1,000 calendarios Eder-Normatividad.pdf', 'i1mdsPOK2d_JURÍDICO memo-0117-2025 se remite para firma entornos imprenta digital 1,000 calendarios Eder-Normatividad.pdf', 2, '2025-06-20 19:05:41', '2025-06-20 19:05:41'),
	(2533, 'storage/documentos/memorandum/Gnfbsgff1f_JURÍDICO memo-0441bis-2025 se remite contrato para firma entornos imprneta digital 400 agendas feministas Eder-Normatividad.pdf', 'Gnfbsgff1f_JURÍDICO memo-0441bis-2025 se remite contrato para firma entornos imprneta digital 400 agendas feministas Eder-Normatividad.pdf', 2, '2025-06-20 19:07:27', '2025-06-20 19:07:27'),
	(2534, 'storage/documentos/memorandum/5IGs1TgN6B_JURÍDICO memo-1225-2025 se remite renuncia Cuarto.pdf', '5IGs1TgN6B_JURÍDICO memo-1225-2025 se remite renuncia Cuarto.pdf', 2, '2025-06-20 19:08:59', '2025-06-20 19:08:59'),
	(2535, 'storage/documentos/circular/Tdz0fDvoGI_PLANEACIÓN circular capacitación sobre programación y presupuestación 2026 Emir-Eder.pdf', 'Tdz0fDvoGI_PLANEACIÓN circular capacitación sobre programación y presupuestación 2026 Emir-Eder.pdf', 4, '2025-06-20 19:10:12', '2025-06-20 19:10:12'),
	(2536, 'storage/documentos/memorandum/xYZJ3c47oT_PRESIDENCIA memo-1281-2025 ministración junio Saúl.pdf', 'xYZJ3c47oT_PRESIDENCIA memo-1281-2025 ministración junio Saúl.pdf', 2, '2025-06-20 19:11:44', '2025-06-20 19:11:44'),
	(2537, 'storage/documentos/oficio/drPtC92mHx_PRESIDENCIA oficio-0469-2025 se remite información y documentación ase-1086-25-of-oas Archivo.pdf', 'drPtC92mHx_PRESIDENCIA oficio-0469-2025 se remite información y documentación ase-1086-25-of-oas Archivo.pdf', 3, '2025-06-20 19:14:52', '2025-06-20 19:14:52'),
	(2538, 'storage/documentos/oficio/KSy5juDRmq_PRESIDENCIA oficio-0470-2025 se remite información y documentación ase-1086-25-of-oas Archivo.pdf', 'KSy5juDRmq_PRESIDENCIA oficio-0470-2025 se remite información y documentación ase-1086-25-of-oas Archivo.pdf', 3, '2025-06-20 19:17:41', '2025-06-20 19:17:41'),
	(2539, 'storage/documentos/oficio/qnMZhHRs49_PRESIDENCIA oficio-0471-2025 se remite información y documentación ase-1086-25-of-oas Archivo.pdf', 'qnMZhHRs49_PRESIDENCIA oficio-0471-2025 se remite información y documentación ase-1086-25-of-oas Archivo.pdf', 3, '2025-06-20 19:19:01', '2025-06-20 19:19:01'),
	(2540, 'storage/documentos/oficio/fanFESdZVo_PRESIDENCIA oficio-0472-2025 se remite información y documentación ase-1086-25-of-oas Archivo.pdf', 'fanFESdZVo_PRESIDENCIA oficio-0472-2025 se remite información y documentación ase-1086-25-of-oas Archivo.pdf', 3, '2025-06-20 19:20:54', '2025-06-20 19:20:54'),
	(2541, 'storage/documentos/oficio/6D0SiCC9ai_PRESIDENCIA oficio-0473-2025 se remite información y documentación ase-1086-25-of-oas Archivo.pdf', '6D0SiCC9ai_PRESIDENCIA oficio-0473-2025 se remite información y documentación ase-1086-25-of-oas Archivo.pdf', 3, '2025-06-20 19:23:00', '2025-06-20 19:23:00'),
	(2542, 'storage/documentos/requisicion/wFNDeVlytw_REQUISICIÓN 1476.pdf', 'wFNDeVlytw_REQUISICIÓN 1476.pdf', 1, '2025-06-20 19:23:45', '2025-06-20 19:23:45'),
	(2543, 'storage/documentos/requisicion/3jzZ4hD8vg_REQUISICIÓN No.pdf', '3jzZ4hD8vg_REQUISICIÓN No.pdf', 1, '2025-06-20 19:24:44', '2025-06-20 19:24:44'),
	(2544, 'storage/documentos/requisicion/SdQx3gBHG1_REQUISICIÓN No.pdf', 'SdQx3gBHG1_REQUISICIÓN No.pdf', 1, '2025-06-20 19:25:25', '2025-06-20 19:25:25'),
	(2545, 'storage/documentos/requisicion/Oo2SS5IIl0_REQUISICIÓN No.pdf', 'Oo2SS5IIl0_REQUISICIÓN No.pdf', 1, '2025-06-20 19:26:11', '2025-06-20 19:26:11'),
	(2546, 'storage/documentos/requisicion/EYcBU3zLfs_REQUISICIÓN No.pdf', 'EYcBU3zLfs_REQUISICIÓN No.pdf', 1, '2025-06-20 19:27:34', '2025-06-20 19:27:34'),
	(2547, 'storage/documentos/requisicion/Z7WlAO6fbj_REQUISICIÓN No.pdf', 'Z7WlAO6fbj_REQUISICIÓN No.pdf', 1, '2025-06-20 19:28:33', '2025-06-20 19:28:33'),
	(2548, 'storage/documentos/requisicion/n4cRKbPsLQ_REQUISICIÓN No.pdf', 'n4cRKbPsLQ_REQUISICIÓN No.pdf', 1, '2025-06-20 19:30:05', '2025-06-20 19:30:05'),
	(2549, 'storage/documentos/requisicion/lWRTFG0QHf_REQUISICIÓN No.pdf', 'lWRTFG0QHf_REQUISICIÓN No.pdf', 1, '2025-06-20 19:30:52', '2025-06-20 19:30:52'),
	(2550, 'storage/documentos/requisicion/w28nVGeJhq_REQUISICIÓN No.pdf', 'w28nVGeJhq_REQUISICIÓN No.pdf', 1, '2025-06-20 19:33:15', '2025-06-20 19:33:15'),
	(2551, 'storage/documentos/requisicion/j8wO7hQfP3_REQUISICIÓN No.pdf', 'j8wO7hQfP3_REQUISICIÓN No.pdf', 1, '2025-06-20 20:52:56', '2025-06-20 20:52:56'),
	(2552, 'storage/documentos/requisicion/ozhHx0dod4_REQUISICIÓN No.pdf', 'ozhHx0dod4_REQUISICIÓN No.pdf', 1, '2025-06-20 20:53:51', '2025-06-20 20:53:51'),
	(2553, 'storage/documentos/requisicion/b1MLkLxyCA_REQUISICIÓN No.pdf', 'b1MLkLxyCA_REQUISICIÓN No.pdf', 1, '2025-06-20 20:54:29', '2025-06-20 20:54:29'),
	(2554, 'storage/documentos/requisicion/LIfNdutXjx_REQUISICIÓN No.pdf', 'LIfNdutXjx_REQUISICIÓN No.pdf', 1, '2025-06-20 20:55:30', '2025-06-20 20:55:30'),
	(2555, 'storage/documentos/requisicion/pqE5nsNa3N_REQUISICIÓN No.pdf', 'pqE5nsNa3N_REQUISICIÓN No.pdf', 1, '2025-06-20 20:56:16', '2025-06-20 20:56:16'),
	(2556, 'storage/documentos/circular/8TSZMkEt5v_SECRETARÍA circular-071-2025 círculo de masculinidades efectivas  Benjamín, Javier, Juan Carlos.pdf', '8TSZMkEt5v_SECRETARÍA circular-071-2025 círculo de masculinidades efectivas  Benjamín, Javier, Juan Carlos.pdf', 4, '2025-06-20 21:04:13', '2025-06-20 21:04:13'),
	(2557, 'storage/documentos/circular/HTxBTbf5qD_SECRETARÍA circular-0075-2025 inicio del proceso del programación y presupuestación 2026.pdf', 'HTxBTbf5qD_SECRETARÍA circular-0075-2025 inicio del proceso del programación y presupuestación 2026.pdf', 4, '2025-06-23 15:16:44', '2025-06-23 15:16:44'),
	(2558, 'storage/documentos/circular/s2Z3dFJQ19_SECRETARÍA circular-076-2025 actividad paternidades consientes Martín-Benjamín.pdf', 's2Z3dFJQ19_SECRETARÍA circular-076-2025 actividad paternidades consientes Martín-Benjamín.pdf', 4, '2025-06-23 15:17:37', '2025-06-23 15:17:37'),
	(2559, 'storage/documentos/memorandum/4TTLBP3BtA_SECRETARÍA memo-1896-2025 se autoriza certificación Normatividad.pdf', '4TTLBP3BtA_SECRETARÍA memo-1896-2025 se autoriza certificación Normatividad.pdf', 2, '2025-06-23 15:18:53', '2025-06-23 15:18:53'),
	(2560, 'storage/documentos/memorandum/pujTfxv6Xe_SECRETARÍA memo-1899-2025 se solicita la continuación del ejercicio de la función de oficialía electoral Normatividad.pdf', 'pujTfxv6Xe_SECRETARÍA memo-1899-2025 se solicita la continuación del ejercicio de la función de oficialía electoral Normatividad.pdf', 2, '2025-06-23 15:20:42', '2025-06-23 15:20:42'),
	(2561, 'storage/documentos/memorandum/yQKyS9hzmU_SECRETARÍA memo-1902-2025 se remite solicitud Saúl-Eder.pdf', 'yQKyS9hzmU_SECRETARÍA memo-1902-2025 se remite solicitud Saúl-Eder.pdf', 2, '2025-06-23 15:22:53', '2025-06-23 15:22:53'),
	(2562, 'storage/documentos/memorandum/MH1J9k0KkM_UFD memo-610-2025 se remite información en atencipon al da-0686-2025 Eder-Dali.pdf', 'MH1J9k0KkM_UFD memo-610-2025 se remite información en atencipon al da-0686-2025 Eder-Dali.pdf', 2, '2025-06-23 15:24:51', '2025-06-23 15:24:51'),
	(2563, 'storage/documentos/memorandum/2TtCgTwSUf_ARCHIVOS memo-022-25 se convoca a sesión ordinaria del Grupo Interdisciplinario Lic.pdf', '2TtCgTwSUf_ARCHIVOS memo-022-25 se convoca a sesión ordinaria del Grupo Interdisciplinario Lic.pdf', 2, '2025-06-23 15:27:15', '2025-06-23 15:27:15'),
	(2564, 'storage/documentos/memorandum/I7f6WKM1VO_CONTRALORÍA memo-coi-ai-m-145-2025coi-inv-018-2024 requerimiento yadira Eder-Urgente.pdf', 'I7f6WKM1VO_CONTRALORÍA memo-coi-ai-m-145-2025coi-inv-018-2024 requerimiento yadira Eder-Urgente.pdf', 2, '2025-06-23 15:28:36', '2025-06-23 15:28:36'),
	(2565, 'storage/documentos/oficio/DCQfvgfER6_PRERROGATIVAS oficio-0083-2025 se solicita recibo original calpan Saúl.pdf', 'DCQfvgfER6_PRERROGATIVAS oficio-0083-2025 se solicita recibo original calpan Saúl.pdf', 3, '2025-06-23 15:31:37', '2025-06-23 15:31:37'),
	(2566, 'storage/documentos/oficio/hpDzrufbSp_PRESIDENCIA oficio-0468-2025 ministración de junio.pdf', 'hpDzrufbSp_PRESIDENCIA oficio-0468-2025 ministración de junio.pdf', 3, '2025-06-23 15:32:55', '2025-06-23 15:32:55'),
	(2567, 'storage/documentos/requisicion/DB5dkKy8wY_REQUISICIÓN No.pdf', 'DB5dkKy8wY_REQUISICIÓN No.pdf', 1, '2025-06-23 15:34:05', '2025-06-23 15:34:05'),
	(2568, 'storage/documentos/oficio/GJFBDx92rP_AUDITOR EXTERNO oficio-aj-ae-11-2025 solicitud de información mes de mayo de 2025 Eder-Dali.pdf', 'GJFBDx92rP_AUDITOR EXTERNO oficio-aj-ae-11-2025 solicitud de información mes de mayo de 2025 Eder-Dali.pdf', 3, '2025-06-24 14:23:25', '2025-06-24 14:23:25'),
	(2569, 'storage/documentos/escrito/wlb2k3WcCf_DIM DESTRUCCIÓN DE INDUMENTARIA CORREO DIM LIC.pdf', 'wlb2k3WcCf_DIM DESTRUCCIÓN DE INDUMENTARIA CORREO DIM LIC.pdf', 5, '2025-06-24 14:25:08', '2025-06-24 14:25:08'),
	(2570, 'storage/documentos/memorandum/ZY0hyMNcTf_PRESIDENCIA memo-pre-copead-008-2025 se convoca a sesión de copead Normatividad.pdf', 'ZY0hyMNcTf_PRESIDENCIA memo-pre-copead-008-2025 se convoca a sesión de copead Normatividad.pdf', 2, '2025-06-24 14:26:30', '2025-06-24 14:26:30'),
	(2571, 'storage/documentos/oficio/rEyRxlKuPn_PRESIDENCIA oficio-0475-2025 se remite información de solventación  de solventación de informe individual 2023 ASE Eder.pdf', 'rEyRxlKuPn_PRESIDENCIA oficio-0475-2025 se remite información de solventación  de solventación de informe individual 2023 ASE Eder.pdf', 3, '2025-06-24 14:28:35', '2025-06-24 14:28:35'),
	(2572, 'storage/documentos/oficio/WjtcTFyhvz_PRESIDENCIA oficio-0476-2025 se remite información de solventación  de resultados finales y observaciones preliminares 2023 ASE Eder.pdf', 'WjtcTFyhvz_PRESIDENCIA oficio-0476-2025 se remite información de solventación  de resultados finales y observaciones preliminares 2023 ASE Eder.pdf', 3, '2025-06-24 14:30:07', '2025-06-24 14:30:07'),
	(2573, 'storage/documentos/requisicion/bb5y8x4IQw_REQUISICIÓN No.pdf', 'bb5y8x4IQw_REQUISICIÓN No.pdf', 1, '2025-06-24 14:30:59', '2025-06-24 14:30:59'),
	(2574, 'storage/documentos/requisicion/a0qslFSIp8_REQUISICIÓN No.pdf', 'a0qslFSIp8_REQUISICIÓN No.pdf', 1, '2025-06-24 14:32:18', '2025-06-24 14:32:18'),
	(2575, 'storage/documentos/requisicion/e1x72G8bjg_REQUISICIÓN No.pdf', 'e1x72G8bjg_REQUISICIÓN No.pdf', 1, '2025-06-24 14:33:02', '2025-06-24 14:33:02'),
	(2576, 'storage/documentos/requisicion/ANpkwkh8tN_REQUISICIÓN No.pdf', 'ANpkwkh8tN_REQUISICIÓN No.pdf', 1, '2025-06-24 14:34:07', '2025-06-24 14:34:07'),
	(2577, 'storage/documentos/requisicion/oDuXAtt7vN_REQUISICIÓN No.pdf', 'oDuXAtt7vN_REQUISICIÓN No.pdf', 1, '2025-06-24 14:35:55', '2025-06-24 14:35:55'),
	(2578, 'storage/documentos/requisicion/38HnB8yNz3_REQUISICIÓN No.pdf', '38HnB8yNz3_REQUISICIÓN No.pdf', 1, '2025-06-24 14:37:17', '2025-06-24 14:37:17'),
	(2579, 'storage/documentos/escrito/51POTSdvZF_SAJID CORREO CACEP SEVAC INDETEC JUEVES 19 DE JUNIO CURSO Ale-Emir-Eder.pdf', '51POTSdvZF_SAJID CORREO CACEP SEVAC INDETEC JUEVES 19 DE JUNIO CURSO Ale-Emir-Eder.pdf', 5, '2025-06-24 14:39:41', '2025-06-24 14:39:41'),
	(2580, 'storage/documentos/escrito/m9n34Vk1KF_SECRETARÍA ALCANCE A LA CIRCULAR IEE-SE-075-2025 INICIO DE PROCESO DE  PROGRAMACIÓN Y PRESUPUESTACIÓN 2026 Emir-Eder.pdf', 'm9n34Vk1KF_SECRETARÍA ALCANCE A LA CIRCULAR IEE-SE-075-2025 INICIO DE PROCESO DE  PROGRAMACIÓN Y PRESUPUESTACIÓN 2026 Emir-Eder.pdf', 5, '2025-06-24 14:41:10', '2025-06-24 14:41:10'),
	(2581, 'storage/documentos/memorandum/W0UfQBkP3I_UFD memo-621-2025 se solicita información para solventación a contraloria c.pdf', 'W0UfQBkP3I_UFD memo-621-2025 se solicita información para solventación a contraloria c.pdf', 2, '2025-06-24 14:42:41', '2025-06-24 14:42:41'),
	(2582, 'storage/documentos/memorandum/uEvPFavuB1_UFD memo-622-2025 se remite incapacidad médica leonardo cholula Cuarto.pdf', 'uEvPFavuB1_UFD memo-622-2025 se remite incapacidad médica leonardo cholula Cuarto.pdf', 2, '2025-06-24 14:43:50', '2025-06-24 14:43:50'),
	(2583, 'storage/documentos/memorandum/RmsFatA2n8_IGUALDAD memo-158-2025 resp a memo da-0680-2025 información a la ASE Eder.pdf', 'RmsFatA2n8_IGUALDAD memo-158-2025 resp a memo da-0680-2025 información a la ASE Eder.pdf', 2, '2025-06-25 15:09:44', '2025-06-25 15:09:44'),
	(2584, 'storage/documentos/memorandum/S8K9eiVNdZ_JURÍDICO memo-1143bis-2025 se remite contrato para firma oficina 19 Eder-Normatividad.pdf', 'S8K9eiVNdZ_JURÍDICO memo-1143bis-2025 se remite contrato para firma oficina 19 Eder-Normatividad.pdf', 2, '2025-06-25 15:13:48', '2025-06-25 15:13:48'),
	(2585, 'storage/documentos/memorandum/wzE9sylGlD_PRESIDENCIA memo-je-101-2025 se convoca a sesión ordinaria de junta ejecutiva Eder-Normatividad.pdf', 'wzE9sylGlD_PRESIDENCIA memo-je-101-2025 se convoca a sesión ordinaria de junta ejecutiva Eder-Normatividad.pdf', 2, '2025-06-25 15:16:40', '2025-06-25 15:16:40'),
	(2586, 'storage/documentos/requisicion/8EvV1Pjsxo_REQUISICIÓN No.pdf', '8EvV1Pjsxo_REQUISICIÓN No.pdf', 1, '2025-06-25 15:17:24', '2025-06-25 15:17:24'),
	(2587, 'storage/documentos/requisicion/h3FPLg0azg_REQUISICIÓN No.pdf', 'h3FPLg0azg_REQUISICIÓN No.pdf', 1, '2025-06-25 15:18:23', '2025-06-25 15:18:23'),
	(2588, 'storage/documentos/requisicion/Z3xoJbJBqM_REQUISICIÓN No.pdf', 'Z3xoJbJBqM_REQUISICIÓN No.pdf', 1, '2025-06-25 15:19:22', '2025-06-25 15:19:22'),
	(2589, 'storage/documentos/requisicion/eBqKBBBXAC_REQUISICIÓN No.pdf', 'eBqKBBBXAC_REQUISICIÓN No.pdf', 1, '2025-06-25 15:20:31', '2025-06-25 15:20:31'),
	(2590, 'storage/documentos/escrito/dqtul1DUah_SANDRA TIMAL alcance a correo remite proyecto de acurdo de grupo interdisciplinario Eder.pdf', 'dqtul1DUah_SANDRA TIMAL alcance a correo remite proyecto de acurdo de grupo interdisciplinario Eder.pdf', 5, '2025-06-25 15:21:32', '2025-06-25 15:21:32'),
	(2591, 'storage/documentos/escrito/CvzotvNymG_SEVAC INDETEC correo invitación a curso orientación para el registro contable remanente, disponibilidades adefas y donativos Eder-Ale-Emir.pdf', 'CvzotvNymG_SEVAC INDETEC correo invitación a curso orientación para el registro contable remanente, disponibilidades adefas y donativos Eder-Ale-Emir.pdf', 5, '2025-06-25 15:23:28', '2025-06-25 15:23:28'),
	(2592, 'storage/documentos/memorandum/kWNxQebBMp_CAPACITACIÓN memo-130-2025 respuesta a requerimiento da-0682-2025  Eder.pdf', 'kWNxQebBMp_CAPACITACIÓN memo-130-2025 respuesta a requerimiento da-0682-2025  Eder.pdf', 2, '2025-06-25 15:24:27', '2025-06-25 15:24:27'),
	(2593, 'storage/documentos/escrito/96vhtb1GBj_OFICIALIA DE PARTES 16 SOBRES DEUDORES Eder.pdf', '96vhtb1GBj_OFICIALIA DE PARTES 16 SOBRES DEUDORES Eder.pdf', 5, '2025-06-25 15:26:26', '2025-06-25 15:26:26'),
	(2594, 'storage/documentos/memorandum/hZ01k9zP6r_PLANEACIÓN memo-50-2025 resp a memo da-0681-2025 Eder.pdf', 'hZ01k9zP6r_PLANEACIÓN memo-50-2025 resp a memo da-0681-2025 Eder.pdf', 2, '2025-06-25 15:28:38', '2025-06-25 15:28:38'),
	(2595, 'storage/documentos/requisicion/2MCjfw5pHZ_REQUISICIÓN No.pdf', '2MCjfw5pHZ_REQUISICIÓN No.pdf', 1, '2025-06-25 15:30:29', '2025-06-25 15:30:29'),
	(2596, 'storage/documentos/requisicion/cN6Sopcma0_REQUISICIÓN No.pdf', 'cN6Sopcma0_REQUISICIÓN No.pdf', 1, '2025-06-25 15:31:14', '2025-06-25 15:31:14'),
	(2597, 'storage/documentos/requisicion/wnLB0QEMLQ_REQUISICIÓN No.pdf', 'wnLB0QEMLQ_REQUISICIÓN No.pdf', 1, '2025-06-25 15:32:08', '2025-06-25 15:32:08'),
	(2598, 'storage/documentos/requisicion/kzzKkTymDY_REQUISICIÓN No.pdf', 'kzzKkTymDY_REQUISICIÓN No.pdf', 1, '2025-06-25 15:33:12', '2025-06-25 15:33:12'),
	(2599, 'storage/documentos/requisicion/HE1TccrBRO_REQUISICIÓN No.pdf', 'HE1TccrBRO_REQUISICIÓN No.pdf', 1, '2025-06-25 15:33:48', '2025-06-25 15:33:48'),
	(2600, 'storage/documentos/requisicion/znsFEpccZj_REQUISICIÓN No.pdf', 'znsFEpccZj_REQUISICIÓN No.pdf', 1, '2025-06-25 15:34:34', '2025-06-25 15:34:34'),
	(2601, 'storage/documentos/requisicion/KJmsky997p_REQUISICIÓN No.pdf', 'KJmsky997p_REQUISICIÓN No.pdf', 1, '2025-06-25 15:35:31', '2025-06-25 15:35:31'),
	(2602, 'storage/documentos/memorandum/ffB6KDc92t_TRANSPARENCIA memo-379-2025 se da contestación a memo 0979-2025 Eder.pdf', 'ffB6KDc92t_TRANSPARENCIA memo-379-2025 se da contestación a memo 0979-2025 Eder.pdf', 2, '2025-06-25 15:36:52', '2025-06-25 15:36:52'),
	(2603, 'storage/documentos/memorandum/WmsWjdEXa5_TRANSPARENCIA memo-ut-sol-052-2025 solicitud de información Eder-Saúl.pdf', 'WmsWjdEXa5_TRANSPARENCIA memo-ut-sol-052-2025 solicitud de información Eder-Saúl.pdf', 2, '2025-06-25 15:39:53', '2025-06-25 15:39:53'),
	(2604, 'storage/documentos/escrito/tTMy0ergy4_UFD correo formato de presupuesto 2026 inicio de proceso Eder-Emir.pdf', 'tTMy0ergy4_UFD correo formato de presupuesto 2026 inicio de proceso Eder-Emir.pdf', 5, '2025-06-25 15:42:38', '2025-06-25 15:42:38'),
	(2605, 'storage/documentos/circular/36PrzxwC3K_PLANEACIÓN circular-014-2025  metodología para elaboración del programa presupuestario 2026 Eder-Emir.pdf', '36PrzxwC3K_PLANEACIÓN circular-014-2025  metodología para elaboración del programa presupuestario 2026 Eder-Emir.pdf', 4, '2025-06-26 16:02:45', '2025-06-26 16:02:45'),
	(2606, 'storage/documentos/escrito/AVMtLdGyD8_PLANEACIÓN correo formato para programa presupuestario 2026 Emir-eder.pdf', 'AVMtLdGyD8_PLANEACIÓN correo formato para programa presupuestario 2026 Emir-eder.pdf', 5, '2025-06-26 16:42:27', '2025-06-26 16:42:27'),
	(2607, 'storage/documentos/memorandum/9pH1j4GBQe_PRERROGATIVAS  memo-0457-2025 en seguimiento al memo dppp-0418-2025 Archivo.pdf', '9pH1j4GBQe_PRERROGATIVAS  memo-0457-2025 en seguimiento al memo dppp-0418-2025 Archivo.pdf', 2, '2025-06-26 16:50:54', '2025-06-26 16:50:54'),
	(2608, 'storage/documentos/requisicion/x3g5MbRNRZ_REQUISICIÓN No.pdf', 'x3g5MbRNRZ_REQUISICIÓN No.pdf', 1, '2025-06-26 16:52:57', '2025-06-26 16:52:57'),
	(2609, 'storage/documentos/requisicion/0TlIQeZuad_REQUISICIÓN No.pdf', '0TlIQeZuad_REQUISICIÓN No.pdf', 1, '2025-06-26 16:53:44', '2025-06-26 16:53:44'),
	(2610, 'storage/documentos/requisicion/PE1KTwldS7_REQUISICIÓN No.pdf', 'PE1KTwldS7_REQUISICIÓN No.pdf', 1, '2025-06-26 17:12:28', '2025-06-26 17:12:28'),
	(2611, 'storage/documentos/requisicion/YWaIGI5NTN_REQUISICIÓN No.pdf', 'YWaIGI5NTN_REQUISICIÓN No.pdf', 1, '2025-06-26 17:13:31', '2025-06-26 17:13:31'),
	(2612, 'storage/documentos/requisicion/utPJzF3yYB_REQUISICIÓN No.pdf', 'utPJzF3yYB_REQUISICIÓN No.pdf', 1, '2025-06-26 17:14:25', '2025-06-26 17:14:25'),
	(2613, 'storage/documentos/requisicion/8j4FW1mCzN_REQUISICIÓN No.pdf', '8j4FW1mCzN_REQUISICIÓN No.pdf', 1, '2025-06-26 17:15:18', '2025-06-26 17:15:18'),
	(2614, 'storage/documentos/requisicion/j2qLaKFZjf_REQUISICIÓN No.pdf', 'j2qLaKFZjf_REQUISICIÓN No.pdf', 1, '2025-06-26 17:16:14', '2025-06-26 17:16:14'),
	(2615, 'storage/documentos/requisicion/SdM9qgjYHe_REQUISICIÓN No.pdf', 'SdM9qgjYHe_REQUISICIÓN No.pdf', 1, '2025-06-26 17:17:28', '2025-06-26 17:17:28'),
	(2616, 'storage/documentos/requisicion/vFUzzff1QS_REQUISICIÓN No.pdf', 'vFUzzff1QS_REQUISICIÓN No.pdf', 1, '2025-06-26 17:18:26', '2025-06-26 17:18:26'),
	(2617, 'storage/documentos/requisicion/ARFOaOCLEz_REQUISICIÓN No.pdf', 'ARFOaOCLEz_REQUISICIÓN No.pdf', 1, '2025-06-26 17:19:19', '2025-06-26 17:19:19'),
	(2618, 'storage/documentos/requisicion/qTEOc3Vr7C_REQUISICIÓN No.pdf', 'qTEOc3Vr7C_REQUISICIÓN No.pdf', 1, '2025-06-26 17:20:01', '2025-06-26 17:20:01'),
	(2619, 'storage/documentos/escrito/v84REZQ36E_SECRETARÍA correo listado de correos institucionales Eder.pdf', 'v84REZQ36E_SECRETARÍA correo listado de correos institucionales Eder.pdf', 5, '2025-06-26 17:21:14', '2025-06-26 17:21:14'),
	(2620, 'storage/documentos/circular/1qItquKqF7_TRANSPARENCIA circular-039-2025 obligaciones de trasparencia 2do.pdf', '1qItquKqF7_TRANSPARENCIA circular-039-2025 obligaciones de trasparencia 2do.pdf', 4, '2025-06-26 17:22:10', '2025-06-26 17:22:10'),
	(2621, 'storage/documentos/memorandum/1UwHaTOuf7_TRASPARENCIA memo-ut-sol-053-2025 solicitud de información Eder.pdf', '1UwHaTOuf7_TRASPARENCIA memo-ut-sol-053-2025 solicitud de información Eder.pdf', 2, '2025-06-26 17:23:35', '2025-06-26 17:23:35'),
	(2622, 'storage/documentos/memorandum/NlfzPJHzWw_UFD memo-625-2025 se remite información Eder.pdf', 'NlfzPJHzWw_UFD memo-625-2025 se remite información Eder.pdf', 2, '2025-06-26 17:24:51', '2025-06-26 17:24:51'),
	(2623, 'storage/documentos/escrito/etq0NLA7Ew_DOE correo formato presupuesto 2023, cde- formato presupuesto 2023 doe Cuarto-Emir.pdf', 'etq0NLA7Ew_DOE correo formato presupuesto 2023, cde- formato presupuesto 2023 doe Cuarto-Emir.pdf', 5, '2025-06-27 14:26:49', '2025-06-27 14:26:49'),
	(2624, 'storage/documentos/memorandum/AgIDSiSDSz_IGUALDAD memo-160-2025 se detectaron inconsistencias, se solciita realizar cambios, ajustes Archivo.pdf', 'AgIDSiSDSz_IGUALDAD memo-160-2025 se detectaron inconsistencias, se solciita realizar cambios, ajustes Archivo.pdf', 2, '2025-06-27 14:28:12', '2025-06-27 14:28:12'),
	(2625, 'storage/documentos/requisicion/ZOfhr4m3WL_REQUISICIÓN No.pdf', 'ZOfhr4m3WL_REQUISICIÓN No.pdf', 1, '2025-06-27 14:29:03', '2025-06-27 14:29:03'),
	(2626, 'storage/documentos/requisicion/GtT3vyHX0x_REQUISICIÓN No.pdf', 'GtT3vyHX0x_REQUISICIÓN No.pdf', 1, '2025-06-27 14:29:44', '2025-06-27 14:29:44'),
	(2627, 'storage/documentos/requisicion/oc0T22kvhL_REQUISICIÓN No.pdf', 'oc0T22kvhL_REQUISICIÓN No.pdf', 1, '2025-06-27 14:30:36', '2025-06-27 14:30:36'),
	(2628, 'storage/documentos/circular/Zk3fnlDPxu_TRANSPARENCIA circular-040-2025 índices expedientes clasificados como reservados Eder- Poblano.pdf', 'Zk3fnlDPxu_TRANSPARENCIA circular-040-2025 índices expedientes clasificados como reservados Eder- Poblano.pdf', 4, '2025-06-27 14:31:42', '2025-06-27 14:31:42'),
	(2629, 'storage/documentos/memorandum/4ZjSq3Tg06_UFD memo-634-2025 se solicita alta de personal Cuarto.pdf', '4ZjSq3Tg06_UFD memo-634-2025 se solicita alta de personal Cuarto.pdf', 2, '2025-06-27 14:33:47', '2025-06-27 14:33:47'),
	(2630, 'storage/documentos/requisicion/TVBo8EhH7c_REQUISICIÓN No.pdf', 'TVBo8EhH7c_REQUISICIÓN No.pdf', 1, '2025-06-27 15:07:39', '2025-06-27 15:07:39'),
	(2631, 'storage/documentos/escrito/H0JvfN3iSv_BANORTE MANTENIMIENTO A CAJERO AUTOMÁTICO  Daniel-Mayra.pdf', 'H0JvfN3iSv_BANORTE MANTENIMIENTO A CAJERO AUTOMÁTICO  Daniel-Mayra.pdf', 5, '2025-06-30 16:17:06', '2025-06-30 16:17:06'),
	(2632, 'storage/documentos/memorandum/vDOhv5wsVW_COMUNICACIÓN memo-132-2025 boletín 39 Archivo.pdf', 'vDOhv5wsVW_COMUNICACIÓN memo-132-2025 boletín 39 Archivo.pdf', 2, '2025-06-30 16:18:10', '2025-06-30 16:18:10'),
	(2633, 'storage/documentos/memorandum/j2B7RzFOGm_CONTRALORÍA memo-329-2025 se remiten observaciones documento que se indica resp-0058-2025 Normatividad.pdf', 'j2B7RzFOGm_CONTRALORÍA memo-329-2025 se remiten observaciones documento que se indica resp-0058-2025 Normatividad.pdf', 2, '2025-06-30 16:19:43', '2025-06-30 16:19:43'),
	(2634, 'storage/documentos/escrito/2T32fyPYFW_IGUALDAD correo-día del LGTBTTTIQA a todo el  personal.pdf', '2T32fyPYFW_IGUALDAD correo-día del LGTBTTTIQA a todo el  personal.pdf', 5, '2025-06-30 16:24:40', '2025-06-30 16:24:40'),
	(2635, 'storage/documentos/memorandum/V9sPFSHbyr_INFORMÁTICA memo-083-2025 baja de personal Eder-Cuarto.pdf', 'V9sPFSHbyr_INFORMÁTICA memo-083-2025 baja de personal Eder-Cuarto.pdf', 2, '2025-06-30 16:25:53', '2025-06-30 16:25:53'),
	(2636, 'storage/documentos/memorandum/lPX2cvMBmg_PRERROGATIVAS memo-0462-2025 se solicita pago de prerrogativas Saúl.pdf', 'lPX2cvMBmg_PRERROGATIVAS memo-0462-2025 se solicita pago de prerrogativas Saúl.pdf', 2, '2025-06-30 16:27:06', '2025-06-30 16:27:06'),
	(2637, 'storage/documentos/requisicion/9no6ILKAnE_REQUISICIÓN No.pdf', '9no6ILKAnE_REQUISICIÓN No.pdf', 1, '2025-06-30 16:38:53', '2025-06-30 16:38:53'),
	(2638, 'storage/documentos/requisicion/EhdISr2tcm_REQUISICIÓN No.pdf', 'EhdISr2tcm_REQUISICIÓN No.pdf', 1, '2025-06-30 16:39:57', '2025-06-30 16:39:57'),
	(2639, 'storage/documentos/requisicion/FcD5g4iDAu_REQUISICIÓN No.pdf', 'FcD5g4iDAu_REQUISICIÓN No.pdf', 1, '2025-06-30 16:47:58', '2025-06-30 16:47:58'),
	(2640, 'storage/documentos/requisicion/KBA3qQ7IxB_REQUISICIÓN No.pdf', 'KBA3qQ7IxB_REQUISICIÓN No.pdf', 1, '2025-06-30 16:49:52', '2025-06-30 16:49:52'),
	(2641, 'storage/documentos/circular/198osCUSJA_SECRETARÍA circular-077-2025 actividad clase de yoga Anita-Gil-Elisa-July.pdf', '198osCUSJA_SECRETARÍA circular-077-2025 actividad clase de yoga Anita-Gil-Elisa-July.pdf', 4, '2025-06-30 16:54:14', '2025-06-30 16:54:14'),
	(2642, 'storage/documentos/circular/gbejY05RIt_SECRETARÍA circular-078-2025 se informa el primer periodo vacacional a todo el personal.pdf', 'gbejY05RIt_SECRETARÍA circular-078-2025 se informa el primer periodo vacacional a todo el personal.pdf', 4, '2025-06-30 17:16:21', '2025-06-30 17:16:21'),
	(2643, 'storage/documentos/memorandum/ttJ4WKAVwy_SECRETARÍA memo-1958-2025 se remiten observaciones de convocatoria Normatividad-Eder.pdf', 'ttJ4WKAVwy_SECRETARÍA memo-1958-2025 se remiten observaciones de convocatoria Normatividad-Eder.pdf', 2, '2025-06-30 17:20:09', '2025-06-30 17:20:09'),
	(2644, 'storage/documentos/memorandum/QVDPc5IRAX_UFD memo-641-2025 se solicita desincorporación de personal Cuarto.pdf', 'QVDPc5IRAX_UFD memo-641-2025 se solicita desincorporación de personal Cuarto.pdf', 2, '2025-06-30 17:21:33', '2025-06-30 17:21:33'),
	(2645, 'storage/documentos/correo/znrLjxEeTl_FISCALIZACIÓN montos a descontar financiamiento público Saúl.pdf', 'znrLjxEeTl_FISCALIZACIÓN montos a descontar financiamiento público Saúl.pdf', 7, '2025-06-30 17:23:05', '2025-06-30 17:23:05'),
	(2646, 'storage/documentos/circular/5yR5BTw4yx_COMUNICACIÓN circular-07-2025 Poblano-Eder.pdf', '5yR5BTw4yx_COMUNICACIÓN circular-07-2025 Poblano-Eder.pdf', 4, '2025-07-03 14:15:39', '2025-07-03 14:15:39'),
	(2647, 'storage/documentos/memorandum/BWCWEdDhgf_CONTRALORÍA memo-101-2025 bienes obsoletos dañados Daniel-Eder.pdf', 'BWCWEdDhgf_CONTRALORÍA memo-101-2025 bienes obsoletos dañados Daniel-Eder.pdf', 2, '2025-07-03 14:20:22', '2025-07-03 14:20:22'),
	(2648, 'storage/documentos/circular/zxulf3hBrd_DTS circular-015-2025 Normatividad-Eder.pdf', 'zxulf3hBrd_DTS circular-015-2025 Normatividad-Eder.pdf', 4, '2025-07-03 14:25:20', '2025-07-03 14:25:20'),
	(2649, 'storage/documentos/memorandum/1Y5Cq8UzZI_DTS memo-iee-oe-236-2025 iee-dts-oe-102-2025 se remite acta circunstanciada de kits Normatividad.pdf', '1Y5Cq8UzZI_DTS memo-iee-oe-236-2025 iee-dts-oe-102-2025 se remite acta circunstanciada de kits Normatividad.pdf', 2, '2025-07-03 14:27:08', '2025-07-03 14:27:08'),
	(2650, 'storage/documentos/correo/hV83yFVTJi_INFORMÁTICA tarjeta informativa 044-2025 se hace de conocimiento control y equipo de impresión y fotocopiado de renta Archivo.pdf', 'hV83yFVTJi_INFORMÁTICA tarjeta informativa 044-2025 se hace de conocimiento control y equipo de impresión y fotocopiado de renta Archivo.pdf', 7, '2025-07-03 14:28:26', '2025-07-03 14:28:26'),
	(2651, 'storage/documentos/memorandum/OCXiZIXDJo_JURÍDICO memo-128-2025 asuntos laborales Normatividad-Eder.pdf', 'OCXiZIXDJo_JURÍDICO memo-128-2025 asuntos laborales Normatividad-Eder.pdf', 2, '2025-07-03 14:29:34', '2025-07-03 14:29:34'),
	(2652, 'storage/documentos/memorandum/lQgkTKWyDK_JURÍDICO memo-1144BIS-2025  se remite contrato para su resguardo oficina 19 Proveedor-Normatividad-Eder.pdf', 'lQgkTKWyDK_JURÍDICO memo-1144BIS-2025  se remite contrato para su resguardo oficina 19 Proveedor-Normatividad-Eder.pdf', 2, '2025-07-03 14:32:40', '2025-07-03 14:32:40'),
	(2653, 'storage/documentos/memorandum/qV9HjivD4t_JURÍDICO memo-1274-2025 se remite evaluación Cuarto.pdf', 'qV9HjivD4t_JURÍDICO memo-1274-2025 se remite evaluación Cuarto.pdf', 2, '2025-07-03 14:33:52', '2025-07-03 14:33:52'),
	(2654, 'storage/documentos/memorandum/LXK9sIzJ42_JURÍDICO memo-1275-2025 se remite renuncia Cuarto.pdf', 'LXK9sIzJ42_JURÍDICO memo-1275-2025 se remite renuncia Cuarto.pdf', 2, '2025-07-03 14:35:00', '2025-07-03 14:35:00'),
	(2655, 'storage/documentos/correo/YHfAJVQCF1_OFICIALIA DE PARTES RECIBO RECIBIDO POR DEUDORES Caro-Eder.pdf', 'YHfAJVQCF1_OFICIALIA DE PARTES RECIBO RECIBIDO POR DEUDORES Caro-Eder.pdf', 7, '2025-07-03 14:36:07', '2025-07-03 14:36:07'),
	(2656, 'storage/documentos/memorandum/leWOB7PoXs_PLANEACIÓN No.pdf', 'leWOB7PoXs_PLANEACIÓN No.pdf', 2, '2025-07-03 14:39:08', '2025-07-03 14:39:08'),
	(2657, 'storage/documentos/requisicion/ealYIVyUNZ_REQUISICIÓN No.pdf', 'ealYIVyUNZ_REQUISICIÓN No.pdf', 1, '2025-07-03 14:40:14', '2025-07-03 14:40:14'),
	(2658, 'storage/documentos/requisicion/9nAXLlIwne_REQUISICIÓN No.pdf', '9nAXLlIwne_REQUISICIÓN No.pdf', 1, '2025-07-03 14:41:27', '2025-07-03 14:41:27'),
	(2659, 'storage/documentos/requisicion/0uALtDkIch_REQUISICIÓN No.pdf', '0uALtDkIch_REQUISICIÓN No.pdf', 1, '2025-07-03 14:42:17', '2025-07-03 14:42:17'),
	(2660, 'storage/documentos/requisicion/CHFVCx0265_REQUISICIÓN No.pdf', 'CHFVCx0265_REQUISICIÓN No.pdf', 1, '2025-07-03 14:43:44', '2025-07-03 14:43:44'),
	(2661, 'storage/documentos/requisicion/61HYJq3YJ5_REQUISICIÓN No.pdf', '61HYJq3YJ5_REQUISICIÓN No.pdf', 1, '2025-07-03 14:44:28', '2025-07-03 14:44:28'),
	(2662, 'storage/documentos/requisicion/IjESXhV1Mh_REQUISICIÓN No.pdf', 'IjESXhV1Mh_REQUISICIÓN No.pdf', 1, '2025-07-03 14:45:24', '2025-07-03 14:45:24'),
	(2663, 'storage/documentos/requisicion/GQku8K0j5j_REQUISICIÓN No.pdf', 'GQku8K0j5j_REQUISICIÓN No.pdf', 1, '2025-07-03 14:46:40', '2025-07-03 14:46:40'),
	(2664, 'storage/documentos/requisicion/bZPZBAkmLy_REQUISICIÓN No.pdf', 'bZPZBAkmLy_REQUISICIÓN No.pdf', 1, '2025-07-03 14:47:31', '2025-07-03 14:47:31'),
	(2665, 'storage/documentos/requisicion/3jT7NlxJlc_REQUISICIÓN No.pdf', '3jT7NlxJlc_REQUISICIÓN No.pdf', 1, '2025-07-03 14:48:16', '2025-07-03 14:48:16'),
	(2666, 'storage/documentos/requisicion/3t3DIRMiHP_REQUISICIÓN No.pdf', '3t3DIRMiHP_REQUISICIÓN No.pdf', 1, '2025-07-03 14:48:59', '2025-07-03 14:48:59'),
	(2667, 'storage/documentos/requisicion/jr1YInRNMU_REQUISICIÓN No.pdf', 'jr1YInRNMU_REQUISICIÓN No.pdf', 1, '2025-07-03 14:49:48', '2025-07-03 14:49:48'),
	(2668, 'storage/documentos/requisicion/NWNx8lIl6Z_REQUISICIÓN No.pdf', 'NWNx8lIl6Z_REQUISICIÓN No.pdf', 1, '2025-07-03 14:50:45', '2025-07-03 14:50:45'),
	(2669, 'storage/documentos/requisicion/RsPslg5AYz_REQUISICIÓN No.pdf', 'RsPslg5AYz_REQUISICIÓN No.pdf', 1, '2025-07-03 14:51:46', '2025-07-03 14:51:46'),
	(2670, 'storage/documentos/requisicion/AdzKFgeWoG_REQUISICIÓN No.pdf', 'AdzKFgeWoG_REQUISICIÓN No.pdf', 1, '2025-07-03 14:53:19', '2025-07-03 14:53:19'),
	(2671, 'storage/documentos/requisicion/zDasMZ0PTQ_REQUISICIÓN No.pdf', 'zDasMZ0PTQ_REQUISICIÓN No.pdf', 1, '2025-07-03 14:54:15', '2025-07-03 14:54:15'),
	(2672, 'storage/documentos/requisicion/f5mOq0CNHH_REQUISICIÓN No.pdf', 'f5mOq0CNHH_REQUISICIÓN No.pdf', 1, '2025-07-03 15:02:01', '2025-07-03 15:02:01'),
	(2673, 'storage/documentos/requisicion/snjld7kdHJ_REQUISICIÓN No.pdf', 'snjld7kdHJ_REQUISICIÓN No.pdf', 1, '2025-07-03 15:04:10', '2025-07-03 15:04:10'),
	(2674, 'storage/documentos/requisicion/edlu8sw98m_REQUISICIÓN No.pdf', 'edlu8sw98m_REQUISICIÓN No.pdf', 1, '2025-07-03 15:06:29', '2025-07-03 15:06:29'),
	(2675, 'storage/documentos/requisicion/VNRpN41YWP_REQUISICIÓN No.pdf', 'VNRpN41YWP_REQUISICIÓN No.pdf', 1, '2025-07-03 15:07:16', '2025-07-03 15:07:16'),
	(2676, 'storage/documentos/requisicion/yqIJRs4LdH_REQUISICIÓN No.pdf', 'yqIJRs4LdH_REQUISICIÓN No.pdf', 1, '2025-07-03 15:08:17', '2025-07-03 15:08:17'),
	(2677, 'storage/documentos/requisicion/J2v3qCpmMf_REQUISICIÓN No.pdf', 'J2v3qCpmMf_REQUISICIÓN No.pdf', 1, '2025-07-03 15:09:23', '2025-07-03 15:09:23'),
	(2678, 'storage/documentos/requisicion/Gzr15gePCe_REQUISICIÓN No.pdf', 'Gzr15gePCe_REQUISICIÓN No.pdf', 1, '2025-07-03 15:12:17', '2025-07-03 15:12:17'),
	(2679, 'storage/documentos/requisicion/TLFLeJbWOt_REQUISICIÓN No.pdf', 'TLFLeJbWOt_REQUISICIÓN No.pdf', 1, '2025-07-03 15:13:07', '2025-07-03 15:13:07'),
	(2680, 'storage/documentos/requisicion/E85bhPuuxw_REQUISICIÓN No.pdf', 'E85bhPuuxw_REQUISICIÓN No.pdf', 1, '2025-07-03 15:14:02', '2025-07-03 15:14:02'),
	(2681, 'storage/documentos/requisicion/Deq53CrM9V_REQUISICIÓN No.pdf', 'Deq53CrM9V_REQUISICIÓN No.pdf', 1, '2025-07-03 15:14:41', '2025-07-03 15:14:41'),
	(2682, 'storage/documentos/requisicion/CiCZdGKJrq_REQUISICIÓN No.pdf', 'CiCZdGKJrq_REQUISICIÓN No.pdf', 1, '2025-07-03 15:15:20', '2025-07-03 15:15:20'),
	(2683, 'storage/documentos/requisicion/REEeFWlHl8_REQUISICIÓN No.pdf', 'REEeFWlHl8_REQUISICIÓN No.pdf', 1, '2025-07-03 15:16:07', '2025-07-03 15:16:07'),
	(2684, 'storage/documentos/requisicion/zEdJpcHJn9_REQUISICIÓN No.pdf', 'zEdJpcHJn9_REQUISICIÓN No.pdf', 1, '2025-07-03 15:33:22', '2025-07-03 15:33:22'),
	(2685, 'storage/documentos/requisicion/vDR3JKy7mV_REQUISICIÓN No.pdf', 'vDR3JKy7mV_REQUISICIÓN No.pdf', 1, '2025-07-03 15:34:35', '2025-07-03 15:34:35'),
	(2686, 'storage/documentos/requisicion/tM8D6lc7pE_REQUISICIÓN No.pdf', 'tM8D6lc7pE_REQUISICIÓN No.pdf', 1, '2025-07-03 15:37:39', '2025-07-03 15:37:39'),
	(2687, 'storage/documentos/requisicion/3DBxZP3fhE_REQUISICIÓN No.pdf', '3DBxZP3fhE_REQUISICIÓN No.pdf', 1, '2025-07-03 15:39:27', '2025-07-03 15:39:27'),
	(2688, 'storage/documentos/requisicion/c9tsxGLG8D_REQUISICIÓN No.pdf', 'c9tsxGLG8D_REQUISICIÓN No.pdf', 1, '2025-07-03 15:40:09', '2025-07-03 15:40:09'),
	(2689, 'storage/documentos/requisicion/WuseyjaiSL_REQUISICIÓN No.pdf', 'WuseyjaiSL_REQUISICIÓN No.pdf', 1, '2025-07-03 15:49:46', '2025-07-03 15:49:46'),
	(2690, 'storage/documentos/requisicion/B9Kwp6p4gJ_REQUISICIÓN No.pdf', 'B9Kwp6p4gJ_REQUISICIÓN No.pdf', 1, '2025-07-03 15:51:05', '2025-07-03 15:51:05'),
	(2691, 'storage/documentos/requisicion/zwpBusQQ6f_REQUISICIÓN No.pdf', 'zwpBusQQ6f_REQUISICIÓN No.pdf', 1, '2025-07-03 15:53:03', '2025-07-03 15:53:03'),
	(2692, 'storage/documentos/requisicion/dNVR5nuz6D_REQUISICIÓN No.pdf', 'dNVR5nuz6D_REQUISICIÓN No.pdf', 1, '2025-07-03 15:54:46', '2025-07-03 15:54:46'),
	(2693, 'storage/documentos/requisicion/HfFSG1DoSL_REQUISICIÓN No.pdf', 'HfFSG1DoSL_REQUISICIÓN No.pdf', 1, '2025-07-03 15:56:00', '2025-07-03 15:56:00'),
	(2694, 'storage/documentos/requisicion/BRmfH6gyyt_REQUISICIÓN No.pdf', 'BRmfH6gyyt_REQUISICIÓN No.pdf', 1, '2025-07-03 15:56:57', '2025-07-03 15:56:57'),
	(2695, 'storage/documentos/requisicion/s1vlA7LYNh_REQUISICIÓN No.pdf', 's1vlA7LYNh_REQUISICIÓN No.pdf', 1, '2025-07-03 15:58:26', '2025-07-03 15:58:26'),
	(2696, 'storage/documentos/requisicion/HTMzrq4wgj_REQUISICIÓN No.pdf', 'HTMzrq4wgj_REQUISICIÓN No.pdf', 1, '2025-07-03 15:59:09', '2025-07-03 15:59:09'),
	(2697, 'storage/documentos/requisicion/bHsd6SgXvh_REQUISICIÓN No.pdf', 'bHsd6SgXvh_REQUISICIÓN No.pdf', 1, '2025-07-03 16:01:22', '2025-07-03 16:01:22'),
	(2698, 'storage/documentos/requisicion/78Kczx7LnF_REQUISICIÓN No.pdf', '78Kczx7LnF_REQUISICIÓN No.pdf', 1, '2025-07-03 16:03:11', '2025-07-03 16:03:11'),
	(2699, 'storage/documentos/requisicion/8bulSI2uom_REQUISICIÓN No.pdf', '8bulSI2uom_REQUISICIÓN No.pdf', 1, '2025-07-03 16:15:38', '2025-07-03 16:15:38'),
	(2700, 'storage/documentos/requisicion/kOgjI4oVKz_REQUISICIÓN No.pdf', 'kOgjI4oVKz_REQUISICIÓN No.pdf', 1, '2025-07-03 16:18:28', '2025-07-03 16:18:28'),
	(2701, 'storage/documentos/requisicion/D5bn3tOl5O_REQUISICIÓN No.pdf', 'D5bn3tOl5O_REQUISICIÓN No.pdf', 1, '2025-07-03 16:19:18', '2025-07-03 16:19:18'),
	(2702, 'storage/documentos/requisicion/gdQ4xEg5HK_REQUISICIÓN No.pdf', 'gdQ4xEg5HK_REQUISICIÓN No.pdf', 1, '2025-07-03 16:20:27', '2025-07-03 16:20:27'),
	(2703, 'storage/documentos/memorandum/MsEv1aFm1b_SECRETARÍA memo-1960-2025 se remite acuerdo cg-ac-0051-2025 Normatividad-Eder.pdf', 'MsEv1aFm1b_SECRETARÍA memo-1960-2025 se remite acuerdo cg-ac-0051-2025 Normatividad-Eder.pdf', 2, '2025-07-03 16:25:20', '2025-07-03 16:25:20'),
	(2704, 'storage/documentos/memorandum/ZnAXHqWhj3_SECRETARÍA memo-1979-2025 se autoriza certificación resp a memo da- 740-2025.pdf', 'ZnAXHqWhj3_SECRETARÍA memo-1979-2025 se autoriza certificación resp a memo da- 740-2025.pdf', 2, '2025-07-03 16:30:19', '2025-07-03 16:30:19'),
	(2705, 'storage/documentos/memorandum/q08RZisr1C_UFD memo-643-2025 se remite información  auditor externo Eder-Dali Cuarto.pdf', 'q08RZisr1C_UFD memo-643-2025 se remite información  auditor externo Eder-Dali Cuarto.pdf', 2, '2025-07-03 16:33:01', '2025-07-03 16:33:01'),
	(2706, 'storage/documentos/memorandum/SSGQ9BwRN0_UFD memo-649-2025 se solicita desincorporación de personal Cuarto.pdf', 'SSGQ9BwRN0_UFD memo-649-2025 se solicita desincorporación de personal Cuarto.pdf', 2, '2025-07-03 16:34:03', '2025-07-03 16:34:03'),
	(2707, 'storage/documentos/memorandum/uhBqsBeVzw_UFD memo-650-2025 se remite calificacón de examen Cuarto.pdf', 'uhBqsBeVzw_UFD memo-650-2025 se remite calificacón de examen Cuarto.pdf', 2, '2025-07-03 16:36:00', '2025-07-03 16:36:00'),
	(2708, 'storage/documentos/memorandum/y91pwhqlJQ_UFD memo-654-2025 se solicita entrega-recepción Normatividad-Cuarto.pdf', 'y91pwhqlJQ_UFD memo-654-2025 se solicita entrega-recepción Normatividad-Cuarto.pdf', 2, '2025-07-03 16:39:40', '2025-07-03 16:39:40'),
	(2709, 'storage/documentos/escrito/bGCzKp0Skg_UFD reporte de entradas y salidas aystec  junio 16-30 -2025 Caro-Jorge.pdf', 'bGCzKp0Skg_UFD reporte de entradas y salidas aystec  junio 16-30 -2025 Caro-Jorge.pdf', 5, '2025-07-03 16:40:43', '2025-07-03 16:40:43'),
	(2710, 'storage/documentos/memorandum/CYXiRavIOW_INFORMÁTICA memo-084-2025 micrositios.pdf', 'CYXiRavIOW_INFORMÁTICA memo-084-2025 micrositios.pdf', 2, '2025-07-03 17:11:30', '2025-07-03 17:11:30'),
	(2711, 'storage/documentos/requisicion/242gPl2HWL_REQUISICIÓN No.pdf', '242gPl2HWL_REQUISICIÓN No.pdf', 1, '2025-07-03 17:14:45', '2025-07-03 17:14:45'),
	(2712, 'storage/documentos/requisicion/ny46uPL4Vl_REQUISICIÓN No.pdf', 'ny46uPL4Vl_REQUISICIÓN No.pdf', 1, '2025-07-03 17:15:28', '2025-07-03 17:15:28'),
	(2713, 'storage/documentos/requisicion/XPNqZJJsuZ_REQUISICIÓN No.pdf', 'XPNqZJJsuZ_REQUISICIÓN No.pdf', 1, '2025-07-03 17:22:09', '2025-07-03 17:22:09'),
	(2714, 'storage/documentos/requisicion/zOzfHInaPT_REQUISICIÓN No.pdf', 'zOzfHInaPT_REQUISICIÓN No.pdf', 1, '2025-07-03 17:24:20', '2025-07-03 17:24:20'),
	(2715, 'storage/documentos/requisicion/SCDjSDdLB4_REQUISICIÓN No.pdf', 'SCDjSDdLB4_REQUISICIÓN No.pdf', 1, '2025-07-03 17:25:26', '2025-07-03 17:25:26'),
	(2716, 'storage/documentos/requisicion/rIWLKVnLPm_REQUISICIÓN No.pdf', 'rIWLKVnLPm_REQUISICIÓN No.pdf', 1, '2025-07-03 17:26:17', '2025-07-03 17:26:17'),
	(2717, 'storage/documentos/escrito/cBShiL9n71_ANSELMO BOLAÑOS SÁNCHEZ correo-deudor Caro-Eder.pdf', 'cBShiL9n71_ANSELMO BOLAÑOS SÁNCHEZ correo-deudor Caro-Eder.pdf', 5, '2025-07-03 17:28:17', '2025-07-03 17:28:17'),
	(2718, 'storage/documentos/memorandum/Xr6Gy3YBwK_COMUNICACIÓN memo-134-2025 subir galería fotográfica junio Archivo.pdf', 'Xr6Gy3YBwK_COMUNICACIÓN memo-134-2025 subir galería fotográfica junio Archivo.pdf', 2, '2025-07-03 17:30:04', '2025-07-03 17:30:04'),
	(2719, 'storage/documentos/memorandum/08dChAwUkJ_DOE memo-366-2025 destrucción de documentación electoral Normatividad.pdf', '08dChAwUkJ_DOE memo-366-2025 destrucción de documentación electoral Normatividad.pdf', 2, '2025-07-03 17:31:11', '2025-07-03 17:31:11'),
	(2720, 'storage/documentos/circular/g7N57xKvay_IGUALDAD circular-002-2025  taller lenguaje sexista y diversidades a todo el personal.pdf', 'g7N57xKvay_IGUALDAD circular-002-2025  taller lenguaje sexista y diversidades a todo el personal.pdf', 4, '2025-07-03 17:32:33', '2025-07-03 17:32:33'),
	(2721, 'storage/documentos/circular/7K2qdzv6sH_IGUALDAD circular-002-2025 taller lenguaje xesista y las diversidades en uso Eder-Poblano.pdf', '7K2qdzv6sH_IGUALDAD circular-002-2025 taller lenguaje xesista y las diversidades en uso Eder-Poblano.pdf', 4, '2025-07-03 17:33:33', '2025-07-03 17:33:33'),
	(2722, 'storage/documentos/correo/jq4o4YszTn_INFORMÁTICA TARJETA INFORMATIVA 036-2025 se informa que se dió atención a 13 solicitudes de videoconfe.pdf', 'jq4o4YszTn_INFORMÁTICA TARJETA INFORMATIVA 036-2025 se informa que se dió atención a 13 solicitudes de videoconfe.pdf', 7, '2025-07-03 17:34:26', '2025-07-03 17:34:26'),
	(2723, 'storage/documentos/correo/dhpu2cCBmI_INFORMÁTICA TARJETA INFORMATIVA 037-2025 se informa que se realizaron respaldos de base de datos Archivo.pdf', 'dhpu2cCBmI_INFORMÁTICA TARJETA INFORMATIVA 037-2025 se informa que se realizaron respaldos de base de datos Archivo.pdf', 7, '2025-07-03 17:35:51', '2025-07-03 17:35:51'),
	(2724, 'storage/documentos/correo/hCqWEvsySX_INFORMÁTICA TARJETA INFORMATIVA 038-2025 se informa que se atendieron 28 solicitudes Archivo.pdf', 'hCqWEvsySX_INFORMÁTICA TARJETA INFORMATIVA 038-2025 se informa que se atendieron 28 solicitudes Archivo.pdf', 7, '2025-07-03 17:37:01', '2025-07-03 17:37:01'),
	(2725, 'storage/documentos/correo/hGA2wjvkhl_INFORMÁTICA TARJETA INFORMATIVA 039-2025 se informa que se realizaron respaldos Archivo.pdf', 'hGA2wjvkhl_INFORMÁTICA TARJETA INFORMATIVA 039-2025 se informa que se realizaron respaldos Archivo.pdf', 7, '2025-07-03 17:38:07', '2025-07-03 17:38:07'),
	(2726, 'storage/documentos/correo/sswff9Z3s2_INFORMÁTICA TARJETA INFORMATIVA 040-2025 se informa que se instalaron equipos de cómputo Archivo.pdf', 'sswff9Z3s2_INFORMÁTICA TARJETA INFORMATIVA 040-2025 se informa que se instalaron equipos de cómputo Archivo.pdf', 7, '2025-07-03 17:39:10', '2025-07-03 17:39:10'),
	(2727, 'storage/documentos/memorandum/umCkZVV7Fn_JURÍDICO memo-0584bis-2024 se remite adenda césar españa hernández Normatividad-Eder.pdf', 'umCkZVV7Fn_JURÍDICO memo-0584bis-2024 se remite adenda césar españa hernández Normatividad-Eder.pdf', 2, '2025-07-03 17:40:46', '2025-07-03 17:40:46'),
	(2728, 'storage/documentos/memorandum/LtV802DYrY_JURÍDICO memo-0670-2025 se remite convenio de indemnización Cuarto.pdf', 'LtV802DYrY_JURÍDICO memo-0670-2025 se remite convenio de indemnización Cuarto.pdf', 2, '2025-07-03 18:05:30', '2025-07-03 18:05:30'),
	(2729, 'storage/documentos/oficio/YlNq8ipDQp_PRESIDENCIA oficio-0523-2025 se informa de enlace a la orden de auditoría Eder-Poblano.pdf', 'YlNq8ipDQp_PRESIDENCIA oficio-0523-2025 se informa de enlace a la orden de auditoría Eder-Poblano.pdf', 3, '2025-07-03 18:07:18', '2025-07-03 18:07:18'),
	(2730, 'storage/documentos/oficio/1GA6IHb8dx_PRESIDENCIA oficio-0523-2025 se informa de enlace a la órden de auditoría Eder-Poblano.pdf', '1GA6IHb8dx_PRESIDENCIA oficio-0523-2025 se informa de enlace a la órden de auditoría Eder-Poblano.pdf', 3, '2025-07-03 18:08:58', '2025-07-03 18:08:58'),
	(2731, 'storage/documentos/oficio/mr2cd8nrA7_PRESIDENCIA oficio-0524-2025 se informa de enlace a la órden de auditoría Eder-Poblano.pdf', 'mr2cd8nrA7_PRESIDENCIA oficio-0524-2025 se informa de enlace a la órden de auditoría Eder-Poblano.pdf', 3, '2025-07-03 18:11:45', '2025-07-03 18:11:45'),
	(2732, 'storage/documentos/oficio/HToXajTsF6_PRESIDENCIA oficio-0525-2025 se informa de enlace a la órden de auditoría Eder-Poblano.pdf', 'HToXajTsF6_PRESIDENCIA oficio-0525-2025 se informa de enlace a la órden de auditoría Eder-Poblano.pdf', 3, '2025-07-03 18:13:13', '2025-07-03 18:13:13'),
	(2733, 'storage/documentos/oficio/8q6leUnCPk_PRESIDENCIA oficio-0526-2025 se informa de enlace a la órden de auditoría Eder-Poblano.pdf', '8q6leUnCPk_PRESIDENCIA oficio-0526-2025 se informa de enlace a la órden de auditoría Eder-Poblano.pdf', 3, '2025-07-03 18:15:36', '2025-07-03 18:15:36'),
	(2734, 'storage/documentos/requisicion/ESw2whr0Jg_REQUISICIÓN No.pdf', 'ESw2whr0Jg_REQUISICIÓN No.pdf', 1, '2025-07-03 18:16:21', '2025-07-03 18:16:21'),
	(2735, 'storage/documentos/requisicion/MWGn17OvHG_REQUISICIÓN No.pdf', 'MWGn17OvHG_REQUISICIÓN No.pdf', 1, '2025-07-03 18:17:05', '2025-07-03 18:17:05'),
	(2736, 'storage/documentos/requisicion/w5TFPQ28F3_REQUISICIÓN No.pdf', 'w5TFPQ28F3_REQUISICIÓN No.pdf', 1, '2025-07-03 18:34:25', '2025-07-03 18:34:25'),
	(2737, 'storage/documentos/requisicion/8OlfXZcdGw_REQUISICIÓN No.pdf', '8OlfXZcdGw_REQUISICIÓN No.pdf', 1, '2025-07-03 18:35:10', '2025-07-03 18:35:10'),
	(2738, 'storage/documentos/requisicion/foja4vnoB0_REQUISICIÓN No.pdf', 'foja4vnoB0_REQUISICIÓN No.pdf', 1, '2025-07-03 18:36:13', '2025-07-03 18:36:13'),
	(2739, 'storage/documentos/requisicion/prjJ8z9cB5_REQUISICIÓN No.pdf', 'prjJ8z9cB5_REQUISICIÓN No.pdf', 1, '2025-07-03 18:37:03', '2025-07-03 18:37:03'),
	(2740, 'storage/documentos/requisicion/NcNSgA8IuQ_REQUISICIÓN No.pdf', 'NcNSgA8IuQ_REQUISICIÓN No.pdf', 1, '2025-07-03 18:38:13', '2025-07-03 18:38:13'),
	(2741, 'storage/documentos/requisicion/1JZ1dRvOa9_REQUISICIÓN No.pdf', '1JZ1dRvOa9_REQUISICIÓN No.pdf', 1, '2025-07-03 18:39:37', '2025-07-03 18:39:37'),
	(2742, 'storage/documentos/requisicion/CFAPxMFOj0_REQUISICIÓN No.pdf', 'CFAPxMFOj0_REQUISICIÓN No.pdf', 1, '2025-07-03 18:40:22', '2025-07-03 18:40:22'),
	(2743, 'storage/documentos/requisicion/j57VTdtNTO_REQUISICIÓN No.pdf', 'j57VTdtNTO_REQUISICIÓN No.pdf', 1, '2025-07-03 19:00:20', '2025-07-03 19:00:20'),
	(2744, 'storage/documentos/requisicion/LD1oxqcjzg_REQUISICIÓN No.pdf', 'LD1oxqcjzg_REQUISICIÓN No.pdf', 1, '2025-07-03 19:01:14', '2025-07-03 19:01:14'),
	(2745, 'storage/documentos/requisicion/66aMYKqH3L_REQUISICIÓN No.pdf', '66aMYKqH3L_REQUISICIÓN No.pdf', 1, '2025-07-03 19:02:16', '2025-07-03 19:02:16'),
	(2746, 'storage/documentos/requisicion/g1eIGKjYCm_REQUISICIÓN No.pdf', 'g1eIGKjYCm_REQUISICIÓN No.pdf', 1, '2025-07-03 19:03:34', '2025-07-03 19:03:34'),
	(2747, 'storage/documentos/requisicion/KW1eFopmnt_REQUISICIÓN No.pdf', 'KW1eFopmnt_REQUISICIÓN No.pdf', 1, '2025-07-03 19:04:45', '2025-07-03 19:04:45'),
	(2748, 'storage/documentos/requisicion/2Y5ife9g48_REQUISICIÓN No.pdf', '2Y5ife9g48_REQUISICIÓN No.pdf', 1, '2025-07-03 19:06:03', '2025-07-03 19:06:03'),
	(2749, 'storage/documentos/requisicion/VwA8MHhGHk_REQUISICIÓN No.pdf', 'VwA8MHhGHk_REQUISICIÓN No.pdf', 1, '2025-07-03 19:07:30', '2025-07-03 19:07:30'),
	(2750, 'storage/documentos/requisicion/ymM8WCZwUF_REQUISICIÓN No.pdf', 'ymM8WCZwUF_REQUISICIÓN No.pdf', 1, '2025-07-03 19:08:26', '2025-07-03 19:08:26'),
	(2751, 'storage/documentos/requisicion/58186Xoltd_REQUISICIÓN No.pdf', '58186Xoltd_REQUISICIÓN No.pdf', 1, '2025-07-03 19:09:26', '2025-07-03 19:09:26'),
	(2752, 'storage/documentos/requisicion/06QW9V4ahb_REQUISICIÓN No.pdf', '06QW9V4ahb_REQUISICIÓN No.pdf', 1, '2025-07-03 19:10:18', '2025-07-03 19:10:18'),
	(2753, 'storage/documentos/requisicion/ddfdTRa6KR_REQUISICIÓN No.pdf', 'ddfdTRa6KR_REQUISICIÓN No.pdf', 1, '2025-07-03 19:11:18', '2025-07-03 19:11:18'),
	(2754, 'storage/documentos/requisicion/X20VO96gX0_REQUISICIÓN No.pdf', 'X20VO96gX0_REQUISICIÓN No.pdf', 1, '2025-07-03 19:12:04', '2025-07-03 19:12:04'),
	(2755, 'storage/documentos/requisicion/bj1XbIqrQE_REQUISICIÓN No.pdf', 'bj1XbIqrQE_REQUISICIÓN No.pdf', 1, '2025-07-03 19:12:56', '2025-07-03 19:12:56'),
	(2756, 'storage/documentos/requisicion/KP3I1tU5N4_REQUISICIÓN No.pdf', 'KP3I1tU5N4_REQUISICIÓN No.pdf', 1, '2025-07-03 20:36:51', '2025-07-03 20:36:51'),
	(2757, 'storage/documentos/requisicion/U1SpSdzKJh_REQUISICIÓN No.pdf', 'U1SpSdzKJh_REQUISICIÓN No.pdf', 1, '2025-07-03 20:37:49', '2025-07-03 20:37:49'),
	(2758, 'storage/documentos/requisicion/3InXlW3xMC_REQUISICIÓN No.pdf', '3InXlW3xMC_REQUISICIÓN No.pdf', 1, '2025-07-03 20:38:30', '2025-07-03 20:38:30'),
	(2759, 'storage/documentos/requisicion/4ERC8yqebT_REQUISICIÓN No.pdf', '4ERC8yqebT_REQUISICIÓN No.pdf', 1, '2025-07-03 20:39:35', '2025-07-03 20:39:35'),
	(2760, 'storage/documentos/escrito/IxlnNmbChW_SECRETARÍA correo proyecto de plazas 2026-2027 Cuarto.pdf', 'IxlnNmbChW_SECRETARÍA correo proyecto de plazas 2026-2027 Cuarto.pdf', 5, '2025-07-03 20:41:24', '2025-07-03 20:41:24'),
	(2761, 'storage/documentos/memorandum/ekUf0zkp5K_SECRETARÍA memo-1965-2025 se remite acuerdo cg-ac-0052-2025 Normatividad-Eder.pdf', 'ekUf0zkp5K_SECRETARÍA memo-1965-2025 se remite acuerdo cg-ac-0052-2025 Normatividad-Eder.pdf', 2, '2025-07-03 20:44:16', '2025-07-03 20:44:16'),
	(2762, 'storage/documentos/oficio/3vRxL1v6zh_SECRETARÍA oficio-0995-2025 se remiten acuerdos para su conocimiento Eder-Normatividad.pdf', '3vRxL1v6zh_SECRETARÍA oficio-0995-2025 se remiten acuerdos para su conocimiento Eder-Normatividad.pdf', 3, '2025-07-03 20:49:20', '2025-07-03 20:49:20'),
	(2763, 'storage/documentos/circular/RK4IPIf6bi_TRANSPARENCIA circular-041-2025 se solicita agenda de actividades Eder-Oscar Poblano.pdf', 'RK4IPIf6bi_TRANSPARENCIA circular-041-2025 se solicita agenda de actividades Eder-Oscar Poblano.pdf', 4, '2025-07-03 20:51:05', '2025-07-03 20:51:05'),
	(2764, 'storage/documentos/circular/wiEn3Q4GrU_DTS circular-016-2025 temas a tratar a consejo general Normatividad-Eder.pdf', 'wiEn3Q4GrU_DTS circular-016-2025 temas a tratar a consejo general Normatividad-Eder.pdf', 4, '2025-07-04 14:45:32', '2025-07-04 14:45:32'),
	(2765, 'storage/documentos/escrito/Mr3mow4ShF_JENNIFER ESTRELLA HOTEL FOUR POINTS PUEBLA.pdf', 'Mr3mow4ShF_JENNIFER ESTRELLA HOTEL FOUR POINTS PUEBLA.pdf', 5, '2025-07-04 14:48:16', '2025-07-04 14:48:16'),
	(2766, 'storage/documentos/memorandum/12sZaXmAmZ_JURÍDICO memo-1310-2025 se remite contrato para firma JOSÉ HANAN Normatividad-Eder.pdf', '12sZaXmAmZ_JURÍDICO memo-1310-2025 se remite contrato para firma JOSÉ HANAN Normatividad-Eder.pdf', 2, '2025-07-04 14:49:57', '2025-07-04 14:49:57'),
	(2767, 'storage/documentos/memorandum/4qLHX6ZT0Y_JURÍDICO memo-ca-se-0002ter-2025 se remite contrato para firma Normatividad-Eder.pdf', '4qLHX6ZT0Y_JURÍDICO memo-ca-se-0002ter-2025 se remite contrato para firma Normatividad-Eder.pdf', 2, '2025-07-04 14:51:23', '2025-07-04 14:51:23'),
	(2768, 'storage/documentos/memorandum/k5LtNCz98O_JURÍDICO memo-ca-se-0075-2025 se remite contrato para su observación josé hanan Normatividad-Eder.pdf', 'k5LtNCz98O_JURÍDICO memo-ca-se-0075-2025 se remite contrato para su observación josé hanan Normatividad-Eder.pdf', 2, '2025-07-04 14:52:46', '2025-07-04 14:52:46'),
	(2769, 'storage/documentos/requisicion/A4N7gffYVU_REQUISICIÓN No.pdf', 'A4N7gffYVU_REQUISICIÓN No.pdf', 1, '2025-07-04 14:54:42', '2025-07-04 14:54:42'),
	(2770, 'storage/documentos/requisicion/S8t7gsHiBU_REQUISICIÓN No.pdf', 'S8t7gsHiBU_REQUISICIÓN No.pdf', 1, '2025-07-04 14:55:38', '2025-07-04 14:55:38'),
	(2771, 'storage/documentos/requisicion/qVchGjrXy8_REQUISICIÓN No.pdf', 'qVchGjrXy8_REQUISICIÓN No.pdf', 1, '2025-07-04 14:56:29', '2025-07-04 14:56:29'),
	(2772, 'storage/documentos/requisicion/Gy14HTtldU_REQUISICIÓN No.pdf', 'Gy14HTtldU_REQUISICIÓN No.pdf', 1, '2025-07-04 14:57:14', '2025-07-04 14:57:14'),
	(2773, 'storage/documentos/requisicion/KcNjau0XMR_REQUISICIÓN No.pdf', 'KcNjau0XMR_REQUISICIÓN No.pdf', 1, '2025-07-04 14:58:03', '2025-07-04 14:58:03'),
	(2774, 'storage/documentos/requisicion/bIg5G0G7Bz_REQUISICIÓN No.pdf', 'bIg5G0G7Bz_REQUISICIÓN No.pdf', 1, '2025-07-04 14:58:58', '2025-07-04 14:58:58'),
	(2775, 'storage/documentos/requisicion/i1bbT0pZoZ_REQUISICIÓN No.pdf', 'i1bbT0pZoZ_REQUISICIÓN No.pdf', 1, '2025-07-04 15:00:00', '2025-07-04 15:00:00'),
	(2776, 'storage/documentos/requisicion/Vd6fuX6lyK_REQUISICIÓN No.pdf', 'Vd6fuX6lyK_REQUISICIÓN No.pdf', 1, '2025-07-04 15:00:42', '2025-07-04 15:00:42'),
	(2777, 'storage/documentos/memorandum/9uAnl6rDoc_CONTRALORÍA memo-333-2025 fotomultas Ángel.pdf', '9uAnl6rDoc_CONTRALORÍA memo-333-2025 fotomultas Ángel.pdf', 2, '2025-07-07 14:55:34', '2025-07-07 14:55:34'),
	(2778, 'storage/documentos/tarjeta/7fjJCTqrYZ_ITARI SOFÍA CARRANZA escrito revolución de cheque Cuarto-Eder-Saúl.pdf', '7fjJCTqrYZ_ITARI SOFÍA CARRANZA escrito revolución de cheque Cuarto-Eder-Saúl.pdf', 6, '2025-07-07 14:59:44', '2025-07-07 14:59:44'),
	(2779, 'storage/documentos/memorandum/HELF41eOd5_JURÍDICO memo-1056-2025 se remite Convenio de Indemnización Cuarto.pdf', 'HELF41eOd5_JURÍDICO memo-1056-2025 se remite Convenio de Indemnización Cuarto.pdf', 2, '2025-07-07 15:03:20', '2025-07-07 15:03:20'),
	(2780, 'storage/documentos/escrito/8BXGYjPhTQ_PLANEACIÓN JOSEFINA correo-formato pp 2026 Eder-Emir.pdf', '8BXGYjPhTQ_PLANEACIÓN JOSEFINA correo-formato pp 2026 Eder-Emir.pdf', 5, '2025-07-07 15:06:01', '2025-07-07 15:06:01'),
	(2781, 'storage/documentos/requisicion/k2bjupzIr9_REQUISICIÓN No.pdf', 'k2bjupzIr9_REQUISICIÓN No.pdf', 1, '2025-07-07 15:07:07', '2025-07-07 15:07:07'),
	(2782, 'storage/documentos/requisicion/45FwGiQ3sy_REQUISICIÓN No.pdf', '45FwGiQ3sy_REQUISICIÓN No.pdf', 1, '2025-07-07 15:08:31', '2025-07-07 15:08:31'),
	(2783, 'storage/documentos/requisicion/w1qUbLLfSi_REQUISICIÓN No.pdf', 'w1qUbLLfSi_REQUISICIÓN No.pdf', 1, '2025-07-07 15:09:33', '2025-07-07 15:09:33'),
	(2784, 'storage/documentos/requisicion/VJXSBTpX4O_REQUISICIÓN No.pdf', 'VJXSBTpX4O_REQUISICIÓN No.pdf', 1, '2025-07-07 15:10:37', '2025-07-07 15:10:37'),
	(2785, 'storage/documentos/requisicion/OSvl8vuYUM_REQUISICIÓN No.pdf', 'OSvl8vuYUM_REQUISICIÓN No.pdf', 1, '2025-07-07 15:12:14', '2025-07-07 15:12:14'),
	(2786, 'storage/documentos/requisicion/g9IJlTMHqK_REQUISICIÓN No.pdf', 'g9IJlTMHqK_REQUISICIÓN No.pdf', 1, '2025-07-07 15:13:06', '2025-07-07 15:13:06'),
	(2787, 'storage/documentos/requisicion/XoxaEGd4Jr_REQUISICIÓN No.pdf', 'XoxaEGd4Jr_REQUISICIÓN No.pdf', 1, '2025-07-07 15:13:58', '2025-07-07 15:13:58'),
	(2788, 'storage/documentos/requisicion/7vpXhyw16E_REQUISICIÓN No.pdf', '7vpXhyw16E_REQUISICIÓN No.pdf', 1, '2025-07-07 15:14:45', '2025-07-07 15:14:45'),
	(2789, 'storage/documentos/requisicion/hDRe0KXzSX_REQUISICIÓN No.pdf', 'hDRe0KXzSX_REQUISICIÓN No.pdf', 1, '2025-07-07 15:18:09', '2025-07-07 15:18:09'),
	(2790, 'storage/documentos/requisicion/SLBpi0RiLf_REQUISICIÓN No.pdf', 'SLBpi0RiLf_REQUISICIÓN No.pdf', 1, '2025-07-07 15:20:31', '2025-07-07 15:20:31'),
	(2791, 'storage/documentos/requisicion/G3rUtA2hZS_REQUISICIÓN No.pdf', 'G3rUtA2hZS_REQUISICIÓN No.pdf', 1, '2025-07-07 15:21:27', '2025-07-07 15:21:27'),
	(2792, 'storage/documentos/requisicion/culIla6YmD_REQUISICIÓN No.pdf', 'culIla6YmD_REQUISICIÓN No.pdf', 1, '2025-07-07 15:22:36', '2025-07-07 15:22:36'),
	(2793, 'storage/documentos/requisicion/MLMY3aDNCZ_REQUISICIÓN No.pdf', 'MLMY3aDNCZ_REQUISICIÓN No.pdf', 1, '2025-07-07 15:26:03', '2025-07-07 15:26:03'),
	(2794, 'storage/documentos/requisicion/V0GZHgDiRN_REQUISICIÓN No.pdf', 'V0GZHgDiRN_REQUISICIÓN No.pdf', 1, '2025-07-07 15:27:33', '2025-07-07 15:27:33'),
	(2795, 'storage/documentos/requisicion/Cp3jOcU3c5_REQUISICIÓN No.pdf', 'Cp3jOcU3c5_REQUISICIÓN No.pdf', 1, '2025-07-07 15:28:23', '2025-07-07 15:28:23'),
	(2796, 'storage/documentos/requisicion/sBDzyslbVV_REQUISICIÓN No.pdf', 'sBDzyslbVV_REQUISICIÓN No.pdf', 1, '2025-07-07 15:29:31', '2025-07-07 15:29:31'),
	(2797, 'storage/documentos/circular/S6mqVxLZO5_SECRETARÍA circular-0082-2025 detección de necesidades de capacitación 2025 a todo el personal.pdf', 'S6mqVxLZO5_SECRETARÍA circular-0082-2025 detección de necesidades de capacitación 2025 a todo el personal.pdf', 4, '2025-07-07 15:30:31', '2025-07-07 15:30:31'),
	(2798, 'storage/documentos/circular/qggDFI9g68_SECRETARÍA circular-0083-2025 capacitación interna a todo el personal.pdf', 'qggDFI9g68_SECRETARÍA circular-0083-2025 capacitación interna a todo el personal.pdf', 4, '2025-07-07 15:31:32', '2025-07-07 15:31:32'),
	(2799, 'storage/documentos/memorandum/A6V6KyRXon_UFD memo-679-2025 se informa renovación de encargo de despacho.pdf', 'A6V6KyRXon_UFD memo-679-2025 se informa renovación de encargo de despacho.pdf', 2, '2025-07-07 15:32:43', '2025-07-07 15:32:43'),
	(2800, 'storage/documentos/memorandum/cHMryUHj0z_UFD memo-680-2025 se solciita alta de personal Cuarto.pdf', 'cHMryUHj0z_UFD memo-680-2025 se solciita alta de personal Cuarto.pdf', 2, '2025-07-07 15:34:14', '2025-07-07 15:34:14'),
	(2801, 'storage/documentos/memorandum/pDf1NnUeFn_UFD memo-681-2025 se remite calificación de examen Cuarto.pdf', 'pDf1NnUeFn_UFD memo-681-2025 se remite calificación de examen Cuarto.pdf', 2, '2025-07-07 15:35:58', '2025-07-07 15:35:58'),
	(2802, 'storage/documentos/escrito/2KN8idd1TH_CECILIA SANTOS VAZQUEZ designación de enlaces para el SIMIDE Ale-Emir -Eder.pdf', '2KN8idd1TH_CECILIA SANTOS VAZQUEZ designación de enlaces para el SIMIDE Ale-Emir -Eder.pdf', 5, '2025-07-09 15:04:45', '2025-07-09 15:04:45'),
	(2803, 'storage/documentos/memorandum/Q9UrbnDXis_PRERROGATIVAS memo-0495-2025 se remite presupuesto 2026.pdf', 'Q9UrbnDXis_PRERROGATIVAS memo-0495-2025 se remite presupuesto 2026.pdf', 2, '2025-07-09 15:05:57', '2025-07-09 15:05:57'),
	(2804, 'storage/documentos/requisicion/loFhFd6waf_REQUISICIÓN No.pdf', 'loFhFd6waf_REQUISICIÓN No.pdf', 1, '2025-07-09 15:06:46', '2025-07-09 15:06:46'),
	(2805, 'storage/documentos/requisicion/qjRTs8zY7A_REQUISICIÓN No.pdf', 'qjRTs8zY7A_REQUISICIÓN No.pdf', 1, '2025-07-09 15:08:14', '2025-07-09 15:08:14'),
	(2806, 'storage/documentos/requisicion/3HESxVNFRP_REQUISICIÓN No.pdf', '3HESxVNFRP_REQUISICIÓN No.pdf', 1, '2025-07-09 15:09:02', '2025-07-09 15:09:02'),
	(2807, 'storage/documentos/requisicion/eciFQfECwG_REQUISICIÓN No.pdf', 'eciFQfECwG_REQUISICIÓN No.pdf', 1, '2025-07-09 15:21:13', '2025-07-09 15:21:13'),
	(2808, 'storage/documentos/requisicion/pzsQkThiig_REQUISICIÓN No.pdf', 'pzsQkThiig_REQUISICIÓN No.pdf', 1, '2025-07-09 15:43:36', '2025-07-09 15:43:36'),
	(2809, 'storage/documentos/memorandum/WVnaXAMkdU_UFD memo-690-2025 reporte de incidencias Cuarto.pdf', 'WVnaXAMkdU_UFD memo-690-2025 reporte de incidencias Cuarto.pdf', 2, '2025-07-09 15:47:33', '2025-07-09 15:47:33'),
	(2810, 'storage/documentos/memorandum/hJOMjvO2sm_UFD memo-692-2025 se remite incapacidad médica Cuarto.pdf', 'hJOMjvO2sm_UFD memo-692-2025 se remite incapacidad médica Cuarto.pdf', 2, '2025-07-09 16:02:21', '2025-07-09 16:02:21'),
	(2811, 'storage/documentos/memorandum/jhitjxXsux_UFD memo-694-2025 descuentos de personal Cuarto.pdf', 'jhitjxXsux_UFD memo-694-2025 descuentos de personal Cuarto.pdf', 2, '2025-07-09 16:06:57', '2025-07-09 16:06:57'),
	(2812, 'storage/documentos/requisicion/ebSXlQ5ttJ_REQUISICIÓN No.pdf', 'ebSXlQ5ttJ_REQUISICIÓN No.pdf', 1, '2025-07-09 16:09:00', '2025-07-09 16:09:00'),
	(2813, 'storage/documentos/memorandum/aAvqcxpf0m_ARCHIVOS memo-208-2025 se remite formato programático de presupuesto 2026 Emir.pdf', 'aAvqcxpf0m_ARCHIVOS memo-208-2025 se remite formato programático de presupuesto 2026 Emir.pdf', 2, '2025-07-15 14:27:34', '2025-07-15 14:27:34'),
	(2814, 'storage/documentos/memorandum/XptQPu4ULn_ARCHIVOS memo-211-2025 se remite formato presupuestal 2026 Emir-Eder.pdf', 'XptQPu4ULn_ARCHIVOS memo-211-2025 se remite formato presupuestal 2026 Emir-Eder.pdf', 2, '2025-07-15 14:30:41', '2025-07-15 14:30:41'),
	(2815, 'storage/documentos/memorandum/uqp3xnJzpU_CAPACITACIÓN memo-139-2025 Emir-Eder se remite proyecto de presupuesto 2026 Emir-Eder.pdf', 'uqp3xnJzpU_CAPACITACIÓN memo-139-2025 Emir-Eder se remite proyecto de presupuesto 2026 Emir-Eder.pdf', 2, '2025-07-15 14:34:30', '2025-07-15 14:34:30'),
	(2816, 'storage/documentos/memorandum/P3g8jNwBip_CAPACITACIÓN memo-142-2025 proyecto de presupuesto 2026 Emir.pdf', 'P3g8jNwBip_CAPACITACIÓN memo-142-2025 proyecto de presupuesto 2026 Emir.pdf', 2, '2025-07-15 14:38:24', '2025-07-15 14:38:24'),
	(2817, 'storage/documentos/memorandum/ThseDiMsWQ_COMUNICACIÓN memo-137-2025  se remiten formatos presupuestales 2026 Eder-Emir.pdf', 'ThseDiMsWQ_COMUNICACIÓN memo-137-2025  se remiten formatos presupuestales 2026 Eder-Emir.pdf', 2, '2025-07-15 14:39:47', '2025-07-15 14:39:47'),
	(2818, 'storage/documentos/memorandum/hkFaPv2lZ6_COMUNICACIÓN memo-137-2025 criterios generales para la programación de presupuestación Eder-Emir.pdf', 'hkFaPv2lZ6_COMUNICACIÓN memo-137-2025 criterios generales para la programación de presupuestación Eder-Emir.pdf', 2, '2025-07-15 14:41:06', '2025-07-15 14:41:06'),
	(2819, 'storage/documentos/memorandum/24rvDM7HxG_COMUNICACIÓN memo-140-2025 boletín 40.pdf', '24rvDM7HxG_COMUNICACIÓN memo-140-2025 boletín 40.pdf', 2, '2025-07-15 14:42:31', '2025-07-15 14:42:31'),
	(2820, 'storage/documentos/memorandum/ZUSN8Ii9uZ_CONSEJERA EVA memo-pre-copead-009-2025 se convoca a sesión ordinaria de copead 14-07-2025 trece treinta Normatividad.pdf', 'ZUSN8Ii9uZ_CONSEJERA EVA memo-pre-copead-009-2025 se convoca a sesión ordinaria de copead 14-07-2025 trece treinta Normatividad.pdf', 2, '2025-07-15 14:44:51', '2025-07-15 14:44:51'),
	(2821, 'storage/documentos/memorandum/TYCGKEFCuI_CONSEJERA EVANGELINA memo-pre-copead-009-2025 se convoca a sesión ordinaria de copead Normatividad-Eder.pdf', 'TYCGKEFCuI_CONSEJERA EVANGELINA memo-pre-copead-009-2025 se convoca a sesión ordinaria de copead Normatividad-Eder.pdf', 2, '2025-07-15 14:48:04', '2025-07-15 14:48:04'),
	(2822, 'storage/documentos/memorandum/wQnPAKJ5HW_CONTRALORÍA memo-344-2025 anteproyecto de presupuesto 2026 Emir-Eder.pdf', 'wQnPAKJ5HW_CONTRALORÍA memo-344-2025 anteproyecto de presupuesto 2026 Emir-Eder.pdf', 2, '2025-07-15 14:49:56', '2025-07-15 14:49:56'),
	(2823, 'storage/documentos/escrito/vIV1vIcR93_CUORE DI SERENATA factura Saúl.pdf', 'vIV1vIcR93_CUORE DI SERENATA factura Saúl.pdf', 5, '2025-07-15 14:50:57', '2025-07-15 14:50:57'),
	(2824, 'storage/documentos/memorandum/Z8fSYlm4Az_DA memo-0793-2025 se remite para firma Normatividad.pdf', 'Z8fSYlm4Az_DA memo-0793-2025 se remite para firma Normatividad.pdf', 2, '2025-07-15 14:52:44', '2025-07-15 14:52:44'),
	(2825, 'storage/documentos/memorandum/0sQ48yOFNH_DOE memo-377-2025 se remiten proyectos de presupuesto 2026 Eder-Emir.pdf', '0sQ48yOFNH_DOE memo-377-2025 se remiten proyectos de presupuesto 2026 Eder-Emir.pdf', 2, '2025-07-15 14:54:51', '2025-07-15 14:54:51'),
	(2826, 'storage/documentos/memorandum/S9qR3GOUxJ_DTS memo-1026-2025 se remite formato de presupuesto impreso y en forma digital Emir-Eder.pdf', 'S9qR3GOUxJ_DTS memo-1026-2025 se remite formato de presupuesto impreso y en forma digital Emir-Eder.pdf', 2, '2025-07-15 14:56:49', '2025-07-15 14:56:49'),
	(2827, 'storage/documentos/memorandum/VeLR5MBXVo_FISCALIZACIÓN memo-0120-25 se remite en ledio magnético e impreso proyectos de pres.pdf', 'VeLR5MBXVo_FISCALIZACIÓN memo-0120-25 se remite en ledio magnético e impreso proyectos de pres.pdf', 2, '2025-07-15 14:58:25', '2025-07-15 14:58:25'),
	(2828, 'storage/documentos/memorandum/KQfwoHIq30_IGUALDAD memo-172-2025 se remite renuncia Cuarto.pdf', 'KQfwoHIq30_IGUALDAD memo-172-2025 se remite renuncia Cuarto.pdf', 2, '2025-07-15 15:00:17', '2025-07-15 15:00:17'),
	(2829, 'storage/documentos/memorandum/JAbUa8qHKX_IGUALDAD memo-173-2025 se remiten formatos de presupuesto 2026 Emir-Eder (2).pdf', 'JAbUa8qHKX_IGUALDAD memo-173-2025 se remiten formatos de presupuesto 2026 Emir-Eder (2).pdf', 2, '2025-07-15 15:02:00', '2025-07-15 15:02:00'),
	(2830, 'storage/documentos/escrito/DiV2Lqy5i1_JURÍDICO emily castellanos correo referente a memo dj-1323-2025 Emir-Eder.pdf', 'DiV2Lqy5i1_JURÍDICO emily castellanos correo referente a memo dj-1323-2025 Emir-Eder.pdf', 5, '2025-07-15 15:03:11', '2025-07-15 15:03:11'),
	(2831, 'storage/documentos/memorandum/CZZbUtVwkR_JURÍDICO memo-1213-2025 se remite Contrato para su revisión on site destructión  Normatividad-Eder.pdf', 'CZZbUtVwkR_JURÍDICO memo-1213-2025 se remite Contrato para su revisión on site destructión  Normatividad-Eder.pdf', 2, '2025-07-15 15:08:56', '2025-07-15 15:08:56'),
	(2832, 'storage/documentos/memorandum/GLY7umAUFd_JURÍDICO memo-1323-2025 se remite formato presupuestal 2026 Emir-Eder.pdf', 'GLY7umAUFd_JURÍDICO memo-1323-2025 se remite formato presupuestal 2026 Emir-Eder.pdf', 2, '2025-07-15 15:10:22', '2025-07-15 15:10:22'),
	(2833, 'storage/documentos/memorandum/xMUt8GNGpA_JURÍDICO memo-1345-2025 se remite contrato para su revisión c.pdf', 'xMUt8GNGpA_JURÍDICO memo-1345-2025 se remite contrato para su revisión c.pdf', 2, '2025-07-15 15:11:30', '2025-07-15 15:11:30'),
	(2834, 'storage/documentos/memorandum/2g859nbtxf_JURÍDICO memo-1347-2025 se remite contrato para su resguardo Normatividad Eder.pdf', '2g859nbtxf_JURÍDICO memo-1347-2025 se remite contrato para su resguardo Normatividad Eder.pdf', 2, '2025-07-15 15:14:59', '2025-07-15 15:14:59'),
	(2835, 'storage/documentos/escrito/QAiY4KlNk7_OFICIALIA DE PARTES 17 sobres deudores Eder-Caro.pdf', 'QAiY4KlNk7_OFICIALIA DE PARTES 17 sobres deudores Eder-Caro.pdf', 5, '2025-07-15 15:16:57', '2025-07-15 15:16:57'),
	(2836, 'storage/documentos/oficio/FxUGx2EK2u_OFICIALÍA DE PARTES sfa remite oficio spfa-ssa-drmsg-0540-2025 FOLIO 2574 se solicita pago de foto multa Eder-Daniel.pdf', 'FxUGx2EK2u_OFICIALÍA DE PARTES sfa remite oficio spfa-ssa-drmsg-0540-2025 FOLIO 2574 se solicita pago de foto multa Eder-Daniel.pdf', 3, '2025-07-15 15:19:34', '2025-07-15 15:19:34'),
	(2837, 'storage/documentos/escrito/ltLwbulTYo_PLANEACIÓN correo formatos presupuestales 2026 Emir.pdf', 'ltLwbulTYo_PLANEACIÓN correo formatos presupuestales 2026 Emir.pdf', 5, '2025-07-15 15:21:03', '2025-07-15 15:21:03'),
	(2838, 'storage/documentos/memorandum/HUfM6Bnrd3_PLANEACIÓN memo-052-2025  proyecto presupuesto ejercicio fiscal 2026 EmirEmir.pdf', 'HUfM6Bnrd3_PLANEACIÓN memo-052-2025  proyecto presupuesto ejercicio fiscal 2026 EmirEmir.pdf', 2, '2025-07-15 15:22:48', '2025-07-15 15:22:48'),
	(2839, 'storage/documentos/memorandum/AqJFpxuTbt_PRERROGATIVAS memo-0498-2025 presupuesto partido político 2026Emir.pdf', 'AqJFpxuTbt_PRERROGATIVAS memo-0498-2025 presupuesto partido político 2026Emir.pdf', 2, '2025-07-15 15:24:54', '2025-07-15 15:24:54'),
	(2840, 'storage/documentos/memorandum/UaSDJ8sErr_PRERROGATIVAS memo-0506-2025 proyecto de presupuesto 2026 Emir.pdf', 'UaSDJ8sErr_PRERROGATIVAS memo-0506-2025 proyecto de presupuesto 2026 Emir.pdf', 2, '2025-07-15 15:27:42', '2025-07-15 15:27:42'),
	(2841, 'storage/documentos/requisicion/qscyOQs9wT_REQUISICIÓN No.pdf', 'qscyOQs9wT_REQUISICIÓN No.pdf', 1, '2025-07-15 15:33:24', '2025-07-15 15:33:24'),
	(2842, 'storage/documentos/requisicion/sX57ERTkqM_REQUISICIÓN No.pdf', 'sX57ERTkqM_REQUISICIÓN No.pdf', 1, '2025-07-15 15:34:14', '2025-07-15 15:34:14'),
	(2843, 'storage/documentos/requisicion/3NIryn2Azs_REQUISICIÓN No.pdf', '3NIryn2Azs_REQUISICIÓN No.pdf', 1, '2025-07-15 15:36:22', '2025-07-15 15:36:22'),
	(2844, 'storage/documentos/requisicion/RVedINWRb1_REQUISICIÓN No.pdf', 'RVedINWRb1_REQUISICIÓN No.pdf', 1, '2025-07-15 15:37:33', '2025-07-15 15:37:33'),
	(2845, 'storage/documentos/requisicion/rGGxHrgKay_REQUISICIÓN No.pdf', 'rGGxHrgKay_REQUISICIÓN No.pdf', 1, '2025-07-15 15:38:29', '2025-07-15 15:38:29'),
	(2846, 'storage/documentos/requisicion/twJQ5Q74r9_REQUISICIÓN No.pdf', 'twJQ5Q74r9_REQUISICIÓN No.pdf', 1, '2025-07-15 15:39:48', '2025-07-15 15:39:48'),
	(2847, 'storage/documentos/requisicion/C9cxxQwLoM_REQUISICIÓN No.pdf', 'C9cxxQwLoM_REQUISICIÓN No.pdf', 1, '2025-07-15 16:16:27', '2025-07-15 16:16:27'),
	(2848, 'storage/documentos/requisicion/TisumNmrqW_REQUISICIÓN No.pdf', 'TisumNmrqW_REQUISICIÓN No.pdf', 1, '2025-07-15 16:17:46', '2025-07-15 16:17:46'),
	(2849, 'storage/documentos/requisicion/FZMqhawbnC_REQUISICIÓN No.pdf', 'FZMqhawbnC_REQUISICIÓN No.pdf', 1, '2025-07-15 16:18:33', '2025-07-15 16:18:33'),
	(2850, 'storage/documentos/escrito/CqR7RXdbfU_SAJID correo invitación a presentación proceso de programación y presupuestación 2026 Emir-Ale-Eder.pdf', 'CqR7RXdbfU_SAJID correo invitación a presentación proceso de programación y presupuestación 2026 Emir-Ale-Eder.pdf', 5, '2025-07-15 20:18:49', '2025-07-15 20:18:49'),
	(2851, 'storage/documentos/circular/d2dLGUXI84_SECRETARÍA circular-084-2025 designación de enlaces sivople Emir-Eder.pdf', 'd2dLGUXI84_SECRETARÍA circular-084-2025 designación de enlaces sivople Emir-Eder.pdf', 4, '2025-07-15 20:20:01', '2025-07-15 20:20:01'),
	(2852, 'storage/documentos/escrito/T65UJYUUyK_SECRETARÍA DE EDUCACIÓN PUBLICA oficio sede tequesquihuacac-dt-01359-2025 acta de entrega recep Normatividad-Eder.pdf', 'T65UJYUUyK_SECRETARÍA DE EDUCACIÓN PUBLICA oficio sede tequesquihuacac-dt-01359-2025 acta de entrega recep Normatividad-Eder.pdf', 5, '2025-07-15 20:21:59', '2025-07-15 20:21:59'),
	(2853, 'storage/documentos/tarjeta/yPedtZHAOb_SECRETARÍA DE EDUCACIÓN PÚBLICA respuesta a oficio iee-da-0091-2025 Normatividad-Eder-Saúl.pdf', 'yPedtZHAOb_SECRETARÍA DE EDUCACIÓN PÚBLICA respuesta a oficio iee-da-0091-2025 Normatividad-Eder-Saúl.pdf', 6, '2025-07-15 20:31:45', '2025-07-15 20:31:45'),
	(2854, 'storage/documentos/oficio/nliPvc7z7n_SECRETARÍA DE PLANEACIÓN, FINANZAS Y ADMINISTRACIÓN oficio-spfya-ssa-dgrmsgyp-drmsg-0536-2025 renovación contratos comodato vehículos oficiales Normat-Eder-Daniel-Ángel.pdf', 'nliPvc7z7n_SECRETARÍA DE PLANEACIÓN, FINANZAS Y ADMINISTRACIÓN oficio-spfya-ssa-dgrmsgyp-drmsg-0536-2025 renovación contratos comodato vehículos oficiales Normat-Eder-Daniel-Ángel.pdf', 3, '2025-07-15 20:34:37', '2025-07-15 20:34:37'),
	(2855, 'storage/documentos/memorandum/DQtOJbntgK_SECRETARÍA memo-2040-2025 se autoriza certificación Eder-Poblano.pdf', 'DQtOJbntgK_SECRETARÍA memo-2040-2025 se autoriza certificación Eder-Poblano.pdf', 2, '2025-07-15 20:36:57', '2025-07-15 20:36:57'),
	(2856, 'storage/documentos/memorandum/hYliEwE2rz_SECRETARÍA memo-2043-2025 remite oficio circular spfya-upp-04-2025  capacitación presupuesto 2026 Jefe-Emir-Eder.pdf', 'hYliEwE2rz_SECRETARÍA memo-2043-2025 remite oficio circular spfya-upp-04-2025  capacitación presupuesto 2026 Jefe-Emir-Eder.pdf', 2, '2025-07-15 20:39:55', '2025-07-15 20:39:55'),
	(2857, 'storage/documentos/memorandum/z1bhqM8xBr_SECRETARÍA memo-2045-2025 se remite escrito fempa solicita lista detallada de  facturas relativa material electoral Eder-Normatividad.pdf', 'z1bhqM8xBr_SECRETARÍA memo-2045-2025 se remite escrito fempa solicita lista detallada de  facturas relativa material electoral Eder-Normatividad.pdf', 2, '2025-07-15 20:53:02', '2025-07-15 20:53:02'),
	(2858, 'storage/documentos/escrito/5AofXASl2P_SISTEMA AUTORIZADO DE GESTIÓN Y ARCHIVO (SAGA) Ale-Berny.pdf', '5AofXASl2P_SISTEMA AUTORIZADO DE GESTIÓN Y ARCHIVO (SAGA) Ale-Berny.pdf', 5, '2025-07-16 14:32:49', '2025-07-16 14:32:49'),
	(2859, 'storage/documentos/memorandum/K5hGIBqJ2I_TRANSPARENCIA memo-416-2025 presentaformulariospresupuestales 2026 Emir-Eder.pdf', 'K5hGIBqJ2I_TRANSPARENCIA memo-416-2025 presentaformulariospresupuestales 2026 Emir-Eder.pdf', 2, '2025-07-16 14:34:23', '2025-07-16 14:34:23'),
	(2860, 'storage/documentos/memorandum/V6h5JlmEKU_TRANSPARENCIA memo-ut-sol-055-2025 se solicita información Eder-Poblano.pdf', 'V6h5JlmEKU_TRANSPARENCIA memo-ut-sol-055-2025 se solicita información Eder-Poblano.pdf', 2, '2025-07-16 14:37:28', '2025-07-16 14:37:28'),
	(2861, 'storage/documentos/memorandum/my2FXllA3X_UFD memo-698-2025 se remite información presupuestación fiscal 2026 Emir-Eder.pdf', 'my2FXllA3X_UFD memo-698-2025 se remite información presupuestación fiscal 2026 Emir-Eder.pdf', 2, '2025-07-16 14:39:48', '2025-07-16 14:39:48'),
	(2862, 'storage/documentos/memorandum/4hzAPj13yc_UFD memo-702-2025 se remite calificación de examen Cuarto.pdf', '4hzAPj13yc_UFD memo-702-2025 se remite calificación de examen Cuarto.pdf', 2, '2025-07-16 14:41:19', '2025-07-16 14:41:19'),
	(2863, 'storage/documentos/memorandum/TSMrl0xOdI_UFD memo-707-2025 se solicita alta de personal Cuarto.pdf', 'TSMrl0xOdI_UFD memo-707-2025 se solicita alta de personal Cuarto.pdf', 2, '2025-07-16 14:45:22', '2025-07-16 14:45:22'),
	(2864, 'storage/documentos/memorandum/GJYVtiKaUE_UFD memo-708-2025 se remite información presupuesto 2026 Emir-Eder.pdf', 'GJYVtiKaUE_UFD memo-708-2025 se remite información presupuesto 2026 Emir-Eder.pdf', 2, '2025-07-16 14:47:23', '2025-07-16 14:47:23'),
	(2865, 'storage/documentos/memorandum/i8xQlfuMfN_UFD memo-708-2025 se remiten formatos presupuestales Eder-Emir.pdf', 'i8xQlfuMfN_UFD memo-708-2025 se remiten formatos presupuestales Eder-Emir.pdf', 2, '2025-07-16 14:48:47', '2025-07-16 14:48:47'),
	(2866, 'storage/documentos/memorandum/TyfHMcyCib_UFD memo-714-2025 se solicita desincorporación de personal Cuarto.pdf', 'TyfHMcyCib_UFD memo-714-2025 se solicita desincorporación de personal Cuarto.pdf', 2, '2025-07-16 15:00:59', '2025-07-16 15:00:59'),
	(2867, 'storage/documentos/memorandum/TTP9YPjX1u_UFD memo-715-2025 seremiteincapacidad médica Cuarto.pdf', 'TTP9YPjX1u_UFD memo-715-2025 seremiteincapacidad médica Cuarto.pdf', 2, '2025-07-16 15:02:19', '2025-07-16 15:02:19'),
	(2868, 'storage/documentos/memorandum/ifN7OWKriX_UFD memo-716-2025 descuentos de personal Cuarto.pdf', 'ifN7OWKriX_UFD memo-716-2025 descuentos de personal Cuarto.pdf', 2, '2025-07-16 15:03:15', '2025-07-16 15:03:15');

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

-- Volcando datos para la tabla admin.fotos_personal: ~3 rows (aproximadamente)
/*DELETE FROM `fotos_personal`;*/
INSERT INTO `fotos_personal` (`id`, `user`, `ruta`, `created_by`, `created_at`, `updated_by`, `updated_at`) VALUES
	(1, 2, 'storage/users/2/2_Foto_Usuario.jpg', 2, '2024-09-19 22:25:16', 2, '2024-12-10 19:33:28'),
	(2, 6, 'storage/users/6/6_Foto_Usuario.jpg', 6, '2024-09-24 16:29:13', 2, '2024-09-24 16:38:21'),
	(6, 1, 'storage/users/1/1_Foto_Usuario.jpg', 1, '2024-09-24 21:35:05', NULL, NULL);

-- Volcando estructura para tabla admin.interfaz
CREATE TABLE IF NOT EXISTS `interfaz` (
  `nombre` varchar(50) DEFAULT NULL,
  `status` enum('A','I') DEFAULT 'I'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla admin.interfaz: ~1 rows (aproximadamente)
/*DELETE FROM `interfaz`;*/
INSERT INTO `interfaz` (`nombre`, `status`) VALUES
	('Simulacro', 'I');

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

-- Volcando estructura para tabla admin.personal
CREATE TABLE IF NOT EXISTS `personal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `apellidop` varchar(100) DEFAULT NULL,
  `apellidom` varchar(100) DEFAULT NULL,
  `dpto` int DEFAULT '1',
  `status` enum('A','I','D') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'A',
  PRIMARY KEY (`id`),
  KEY `FK_personal_adscripcion` (`dpto`),
  CONSTRAINT `FK_personal_adscripcion` FOREIGN KEY (`dpto`) REFERENCES `cat_adscripcion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla admin.personal: ~1 rows (aproximadamente)
/*DELETE FROM `personal`;*/
INSERT INTO `personal` (`id`, `nombre`, `apellidop`, `apellidom`, `dpto`, `status`) VALUES
	(1, 'BRAYAN JOSHUA', 'RIVERA', 'LUNA', 18, 'A');

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

-- Volcando estructura para tabla admin.solicitudes
CREATE TABLE IF NOT EXISTS `solicitudes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numeroConsecutivo` int NOT NULL,
  `numeroSolicitud` int NOT NULL,
  `fechaRecibido` date DEFAULT NULL,
  `remitente` int NOT NULL,
  `otroRemitente` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cargo` int NOT NULL,
  `otroCargo` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `asunto` varchar(1000) NOT NULL,
  `termino` int NOT NULL,
  `fechaTermino` date DEFAULT NULL,
  `diasTermino` int NOT NULL,
  `respuesta` int NOT NULL,
  `seguimiento` int NOT NULL,
  `areaAsignada` int NOT NULL,
  `tipo` int NOT NULL,
  `fechaAsignacion` date DEFAULT NULL,
  `estatus` int NOT NULL,
  `idArchivo` int DEFAULT NULL,
  `observaciones` varchar(2500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `idArchivoContestacion` int DEFAULT NULL,
  `supervisa` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla admin.solicitudes: ~7 rows (aproximadamente)
/*DELETE FROM `solicitudes`;*/
INSERT INTO `solicitudes` (`id`, `numeroConsecutivo`, `numeroSolicitud`, `fechaRecibido`, `remitente`, `otroRemitente`, `cargo`, `otroCargo`, `asunto`, `termino`, `fechaTermino`, `diasTermino`, `respuesta`, `seguimiento`, `areaAsignada`, `tipo`, `fechaAsignacion`, `estatus`, `idArchivo`, `observaciones`, `idArchivoContestacion`, `supervisa`) VALUES
	(1, 1, 2, '2024-09-17', 2, NULL, 2, NULL, 'correo', 1, '2024-09-20', 2, 1, 2, 18, 1, '2024-09-18', 4, 1, '', 2, NULL),
	(4, 1, 1, '2024-09-18', 3, NULL, 4, NULL, 'prueba', 0, NULL, 0, 0, 0, 0, 3, NULL, 4, 3, '', NULL, NULL),
	(5, 3, 4, '2024-09-24', 3, NULL, 2, NULL, 'viaticos', 1, '2024-09-27', 3, 1, 1, 18, 1, '2024-09-24', 4, 5, '', 6, NULL),
	(6, 6, 6, '2024-09-24', 1, 'nombre de la persona', 1, 'nuevo argo', 'tramite', 1, '2024-10-04', 5, 1, 2, 1, 1, '2024-09-24', 1, 7, '', NULL, NULL),
	(7, 1, 1, '2024-09-25', 3, NULL, 2, NULL, 'as546546', 2, NULL, 0, 1, 1, 1, 1, '2024-09-25', 1, NULL, 'asdasdas', NULL, 1),
	(8, 2, 2, '2024-09-25', 2, NULL, 2, NULL, 'asdasda', 2, NULL, 0, 1, 1, 1, 1, '2024-09-25', 1, 9, '', NULL, 1),
	(9, 2, 2, '2024-09-25', 2, NULL, 2, NULL, 'asdasda', 2, NULL, 0, 1, 1, 18, 1, '2024-09-25', 1, 10, '', NULL, 1);

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

-- Volcando estructura para tabla admin.view_cat_anios
CREATE TABLE IF NOT EXISTS `view_cat_anios` (
  `totalReg` bigint NOT NULL,
  `anio` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla admin.view_cat_anios: 0 rows
/*DELETE FROM `view_cat_anios`;*/
/*!40000 ALTER TABLE `view_cat_anios` DISABLE KEYS */;
/*!40000 ALTER TABLE `view_cat_anios` ENABLE KEYS */;


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

-- partidos politicos sin representación --

CREATE TABLE IF NOT EXISTS `cat_partido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siglas` varchar(10) DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tipo` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla src2025.cat_partido: ~19 rows (aproximadamente)
INSERT INTO `cat_partido` (`id`, `siglas`, `nombre`, `tipo`) VALUES
	(1, 'PSI', 'PACTO SOCIAL DE INTEGRACIÓN, PARTIDO POLÍTICO', 'PP'),
	(2, 'NAP', 'NUEVA ALIANZA PUEBLA', 'PP'),
	(3, 'FXMP', 'FUERZA POR MÉXICO PUEBLA', 'PP');
    
    
CREATE TABLE IF NOT EXISTS `cat_partido_conRepresentacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `siglas` varchar(10) DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tipo` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Volcando datos para la tabla src2025.cat_partido: ~19 rows (aproximadamente)
INSERT INTO `cat_partido_conRepresentacion` (`id`, `siglas`, `nombre`, `tipo`) VALUES
	(1, 'PAN', 'PARTIDO ACCIÓN NACIONAL', 'PP'),
	(2, 'PRI', 'PARTIDO REVOLUCIONARIO INSTITUCIONAL', 'PP'),
	(3, 'PT', 'PARTIDO DEL TRABAJO', 'PP'),
	(4, 'PVEM', 'PARTIDO VERDE ECOLOGISTA DE MÉXICO', 'PP'),
	(5, 'MC', 'MOVIMIENTO CIUDADANO', 'PP'),
	(6, 'PSI', 'PACTO SOCIAL DE INTEGRACIÓN, PARTIDO POLÍTICO', 'PP'),
	(7, 'MORENA', 'MORENA', 'PP'),
	(8, 'NAP', 'NUEVA ALIANZA PUEBLA', 'PP'),
	(9, 'FXMP', 'FUERZA POR MÉXICO PUEBLA', 'PP');


-- Volcando datos para la tabla admin.view_cat_anios: 0 rows
/*DELETE FROM `view_cat_anios`;*/
/*!40000 ALTER TABLE `anios_fiscales` DISABLE KEYS */;
/*!40000 ALTER TABLE `anios_fiscales` ENABLE KEYS */;

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
		SELECT * FROM cat_partido;
ELSEIF tipo = 10   THEN
		SELECT * FROM cat_partido_conRepresentacion;
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

drop procedure sp_ConsultarDatos;

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

-- Volcando estructura para procedimiento admin.sp_Solicitud_setRegistrarCircular
DELIMITER //
CREATE PROCEDURE `sp_Solicitud_setRegistrarCircular`(
	IN `nTipo` INT,
	IN `fRecibido` DATE,
	IN `hRecibido` TIME,
	IN `nAreaEmite` INT,
	IN `cAsunto` VARCHAR(55),
	IN `nIdArchivo` INT,
	IN `jsonSeguimiento` JSON,
	IN `nIdAuth` INT,
	IN `fAccion` TIMESTAMP
)
BEGIN
	INSERT INTO cap_solicitud (
		tipo,
		fechaRecibido,
		horaRecibido,
		areaEmite,
		asunto,
		idArchivo,
		seguimiento,
		created_by,
		created_at
	)
	VALUES(
		nTipo,
		fRecibido,
		hRecibido,
		nAreaEmite,
		cAsunto,
		nIdArchivo,
		jsonSeguimiento,
		nIdAuth,
		fAccion
	);
	
	SELECT LAST_INSERT_ID() AS `idSOLICITUD`;
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

-- Volcando estructura para disparador admin.trigger_insert_solicitud
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trigger_insert_solicitud` AFTER INSERT ON `cap_solicitud` FOR EACH ROW BEGIN
	INSERT INTO cap_solicitud_history (
		idSolicitud,
		tipo,
		idArchivo,
		areaSolicita,
		areaAsignar,
		areaEmite,
		numOficio,
		asunto,
		cargo,
		remitente,
		numFolio,
		numMemo,
		capitulo,
		termino,
		respuesta,
		fechaRecibido,
		horaRecibido,
		fechaTermino,
		seguimiento,
		created_at,
		updated_at,
		created_by,
		updated_by,
		idStatus,
		recordatorio,
		sysNotify,
		accion,
		motivoCambio
	) VALUES (
		NEW.id,
		NEW.tipo,
		NEW.idArchivo,
		NEW.areaSolicita,
		NEW.areaAsignar,
		NEW.areaEmite,
		NEW.numOficio,
		NEW.asunto,
		NEW.cargo,
		NEW.remitente,
		NEW.numFolio,
		NEW.numMemo,
		NEW.capitulo,
		NEW.termino,
		NEW.respuesta,
		NEW.fechaRecibido,
		NEW.horaRecibido,
		NEW.fechaTermino,
		NEW.seguimiento,
		NEW.created_at,
		NEW.updated_at,
		NEW.created_by,
		NEW.updated_by,
		NEW.idStatus,
		NEW.recordatorio,
		NEW.sysNotify,		
		'INSERT',
		'Nueva solicitud registrada'
	);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador admin.trigger_update_solicitud
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `trigger_update_solicitud` AFTER UPDATE ON `cap_solicitud` FOR EACH ROW BEGIN
	-- NULL no se puede comparar usando los operadores '=' o '!=', se debe usar 'IS'
	IF (
			(
				 OLD.updated_at IS NULL OR 
				 OLD.updated_by IS NULL OR
				 OLD.updated_at != NEW.updated_at OR
				 OLD.updated_by != NEW.updated_by
		 	) AND NEW.motivoCambio IS NOT NULL
		) THEN
		INSERT INTO cap_solicitud_history (
			idSolicitud,
			tipo,
			idArchivo,
			areaSolicita,
			areaAsignar,
			areaEmite,
			numOficio,
			asunto,
			cargo,
			remitente,
			numFolio,
			numMemo,
			capitulo,
			termino,
			respuesta,
			fechaRecibido,
			horaRecibido,
			fechaTermino,
			seguimiento,
			created_at,
			updated_at,
			created_by,
			updated_by,
			idStatus,
			recordatorio,
			sysNotify,
			accion,
			motivoCambio
		) VALUES (
			OLD.id,
			OLD.tipo,
			OLD.idArchivo,
			OLD.areaSolicita,
			OLD.areaAsignar,
			OLD.areaEmite,
			OLD.numOficio,
			OLD.asunto,
			OLD.cargo,
			OLD.remitente,
			OLD.numFolio,
			OLD.numMemo,
			OLD.capitulo,
			OLD.termino,
			OLD.respuesta,
			OLD.fechaRecibido,
			OLD.horaRecibido,
			OLD.fechaTermino,
			OLD.seguimiento,
			OLD.created_at,
			OLD.updated_at,
			OLD.created_by,
			OLD.updated_by,
			OLD.idStatus,
			OLD.recordatorio,
			OLD.sysNotify,		
			'UPDATE',
			NEW.motivoCambio
		);		
	END IF;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;


-- EMPIEZAN LOS NUEVOS QUERYS -> CREACION DE TABLAS

USE `admin`;

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
	(1, 'PSI', 'PACTO SOCIAL DE INTEGRACIÓN, PARTIDO POLÍTICO', 'PP','PSI.webp'),
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

-- Actualizamos la consulta de los catálogos
USE `admin`;

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
*/
CREATE PROCEDURE sp_get_calculo_completo(IN p_id_calculo INT UNSIGNED)
BEGIN
	-- Variables locales
	DECLARE strQ2 VARCHAR(25);
	-- Variable de usuario para la consulta
    SET @strQuery = "SELECT id_calculo AS 'id', anio_ejercicio AS 'anioFiscal', DATE_FORMAT(fecha_publicacion, '%d/%m/%Y') AS 'fecha_pub', uma, uma_65, personas_padron, financiamiento_aop, 
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


-- ALTER TABLE -- En caso de no querer crear las tablas nuevamente 
/*

USE admin;

ALTER TABLE calculo_partido_con_repr ADD COLUMN porcentaje_votacion DECIMAL(30,15) NULL DEFAULT 0.00 COMMENT '% de votación por cada partido político en elección inmediata anterior de diputaciones';
	-- AFTER id_partido;
 ALTER TABLE calculo_partido_con_repr ADD COLUMN A_30_por_ciento DECIMAL(30,15) NULL DEFAULT 0.00 COMMENT 'A. 30% en forma igualitaria';
	-- AFTER porcentaje_votacion;
ALTER TABLE calculo_partido_con_repr ADD COLUMN B_70_por_ciento DECIMAL(30,15) NULL DEFAULT 0.00 COMMENT 'B. 70% conforme al % de votación';
ALTER TABLE calculo_partido_con_repr ADD COLUMN ajuste DECIMAL(30,15) NOT NULL DEFAULT 0.00 COMMENT 'Ajuste decimas de centavos';
-- ALTER TABLE calculo_partido_con_repr MODIFY COLUMN ajuste DECIMAL(30,15) NOT NULL DEFAULT 0.00 COMMENT 'Ajuste decimas de centavos';
ALTER TABLE calculo_partido_con_repr ADD COLUMN B_Ajuste_70_por_ciento DECIMAL(30,15) NULL DEFAULT 0.00 COMMENT 'Total de B. 70% conforme al % de votación después del ajuste';
ALTER TABLE calculo_partido_con_repr ADD COLUMN C_fpaop DECIMAL(30,15) NULL DEFAULT 0.00 COMMENT 'Financiamiento público para actividades ordinarias permanentes (A+B)';
ALTER TABLE calculo_partido_con_repr ADD COLUMN D_fpatov DECIMAL(30,15) NULL DEFAULT 0.00 COMMENT 'Financiamiento público para actividades tendientes a la obtención del voto';

ALTER TABLE calculo_partido_sin_repr ADD COLUMN D_monto_2_por_ciento DECIMAL(30,15) NOT NULL COMMENT 'Distribución -> monto_2_por_ciento * Factor de cálculo';

*/

