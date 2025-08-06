
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


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
  IN p_pp_sin_repr VARCHAR(255),
  IN p_pp_con_repr VARCHAR(255),
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
	-- id_calculo, Autoincrement
	anio_ejercicio,	fecha_publicacion, uma,	uma_65, personas_padron, financiamiento_aop, pp_sin_repr, pp_con_repr
	-- num_pp_con_repr,
	-- total_fp_sin_repr,
	-- monto_total_efectivo,
	-- monto_30_por_ciento,
	-- monto_70_por_ciento,
	-- comprobacion_monto
  ) VALUES (
    p_anio, p_fecha_publicacion, p_uma, v_uma65, p_personas_padron, v_fin_aop, p_pp_sin_repr, p_pp_con_repr
    -- temporalmente monto_total_efectivo antes del descuento
    -- v_monto_total_efectivo,
    -- v_monto30,
    -- v_monto70,
    -- 0,  -- total de FP partidos sin representación aún no se calcula
    -- 0, -- num partidos con representación
    -- v_uma65 * p_personas_padron  -- comprobación inicial
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
		  monto_total_efectivo = v_monto_total_efectivo, -- financiamiento_aop - v_total_sin_repr,
		  monto_30_por_ciento = v_monto30, -- (financiamiento_aop - v_total_sin_repr) * 0.3,
		  monto_70_por_ciento = v_monto70, -- (financiamiento_aop - v_total_sin_repr) * 0.7,
		  comprobacion_monto = (v_monto30 + v_monto70 + v_total_fp_sin_repr) -- ((financiamiento_aop - v_total_sin_repr) * 0.3) +
							  -- ((financiamiento_aop - v_total_sin_repr) * 0.7) +
							   -- v_total_sin_repr
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
    SET @strQuery = "SELECT id_calculo AS 'id', anio_ejercicio AS 'anioFiscal', DATE_FORMAT(fecha_publicacion, '%d/%m/%Y') AS 'fecha_pub', uma, uma_65, personas_padron, financiamiento_aop, pp_sin_repr, pp_con_repr, num_pp_sin_repr, num_pp_con_repr,
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
* 	y poder llamarse en el Frontend para agregarlos a una columna y darles formato
* @param id_calculo
* @example
* CALL sp_get_PartidosporIdCalculo(2);
*/
CREATE PROCEDURE sp_get_Partidos_Calculo_porId(IN id_calculo INT UNSIGNED)
BEGIN
	-- Retornamos los partidos sin representación
	SELECT cat_psr.siglas, cat_psr.nombre, psr.monto_2_por_ciento
		FROM calculo_partido_sin_repr psr 
        INNER JOIN cat_partido_sin_repr cat_psr ON psr.id_partido = cat_psr.id 
        WHERE psr.id_calculo = id_calculo;
	-- Retornamos los partidos con representación
	SELECT cat_pcr.siglas, cat_pcr.nombre
		FROM calculo_partido_con_repr pcr
		INNER JOIN cat_partido_con_repr cat_pcr ON pcr.id_partido = cat_pcr.id 
		WHERE pcr.id_calculo = id_calculo;
END;
//DELIMITER ;
