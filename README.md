##### Notas:

Comandos para limpiar la cache y la vista
```bash
php artisan cache:clear
php artisan view:clear
```


### Ministraciones

Se actualizan los partidos políticos con y sin representación

###### Tablas que se actualizan
* calculo_partido_con_repr
* calculo_partido_sin_repr

###### Tablas que se agregan
* ministraciones_dppp

```sql
-- Ejecutar ALTER TABLE si no se va a cargar las tablas de los partidos políticos
ALTER TABLE calculo_partido_con_repr ADD COLUMN mintr_diciembre DECIMAL(30,15) NULL COMMENT 'Ministraciones - <<diciembre>> campo de ajuste de décimas de centavo';
ALTER TABLE calculo_partido_sin_repr ADD COLUMN mintr_diciembre DECIMAL(30,15) NULL COMMENT 'Ministraciones - <<diciembre>> campo de ajuste de décimas de centavo';
```
###### Store Procedure que se actualizan
* sp_get_Partidos_Calculo_porId

###### Store Procedure que se agregan
*   sp_Mintr_Get_Insert_Update_ministraciones_dppp
*   sp_Mintr_Update_Partidos


### Financiamiento Privado

Se actualizan los partidos políticos con y sin representación
###### Tablas que se actualizan
* calculo_partido_con_repr
* calculo_partido_sin_repr

```sql
-- Ejecutar ALTER TABLE si no se va a cargar las tablas de los partidos políticos
ALTER TABLE calculo_partido_con_repr ADD COLUMN finpriv_limite_finPrivado DECIMAL(30,15) NULL COMMENT '1. El límite de financiamiento privado de los institutos políticos';
ALTER TABLE calculo_partido_con_repr ADD COLUMN finpriv_aportaciones_simpPres DECIMAL(30,15) NULL COMMENT '3. Las aportaciones de personas simpatizantes, elección Presidencial';
ALTER TABLE calculo_partido_con_repr ADD COLUMN finpriv_aportaciones_simpGuber DECIMAL(30,15) NULL COMMENT '4. Las aportaciones de personas simpatizantes, elección a la Gubernatura';
ALTER TABLE calculo_partido_con_repr ADD COLUMN finpriv_rendimientos DECIMAL(30,15) NULL COMMENT '5. El financiamiento por rendimientos financieros de los partidos políticos';

ALTER TABLE calculo_partido_sin_repr ADD COLUMN finpriv_limite_finPrivado DECIMAL(30,15) NULL COMMENT '1. El límite de financiamiento privado de los institutos políticos';
ALTER TABLE calculo_partido_sin_repr ADD COLUMN finpriv_aportaciones_simpPres DECIMAL(30,15) NULL COMMENT '3. Las aportaciones de personas simpatizantes, elección Presidencial';
ALTER TABLE calculo_partido_sin_repr ADD COLUMN finpriv_aportaciones_simpGuber DECIMAL(30,15) NULL COMMENT '4. Las aportaciones de personas simpatizantes, elección a la Gubernatura';
ALTER TABLE calculo_partido_sin_repr ADD COLUMN finpriv_rendimientos DECIMAL(30,15) NULL COMMENT '5. El financiamiento por rendimientos financieros de los partidos políticos';
```
