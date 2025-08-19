
USE admin;

/*
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

USE admin;
UPDATE cat_partido_sin_repr SET logo = 'PSI_Small.webp' WHERE id = 1;