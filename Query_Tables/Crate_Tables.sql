
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


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

