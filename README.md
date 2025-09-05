##### Notas:

Comandos para limpiar la cache y la vista
```bash
php artisan cache:clear
php artisan view:clear
```


### Ministraciones

Se actualizan los partidos políticos con y sin representación
```sql
-- # Tablas que se actualizan
-- calculo_partido_con_repr
-- calculo_partido_sin_repr
-- # Tablas que se agregan
-- ministraciones_dppp

-- Ejecutar ALTER TABLE si no se va a cargar las tablas de los partidos políticos
ALTER TABLE calculo_partido_con_repr ADD COLUMN mintr_diciembre DECIMAL(30,15) NULL COMMENT 'Ministraciones - <<diciembre>> campo de ajuste de décimas de centavo';
ALTER TABLE calculo_partido_sin_repr ADD COLUMN mintr_diciembre DECIMAL(30,15) NULL COMMENT 'Ministraciones - <<diciembre>> campo de ajuste de décimas de centavo';

-- # Store Procedure que se agregan
-- sp_Mintr_Get_Insert_Update_ministraciones_dppp
-- sp_Mintr_Update_Partidos

```
