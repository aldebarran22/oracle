create or replace FUNCTION EXISTE_TABLA 
(
  NOMBRE_TABLA IN CHAR
) RETURN INTEGER AS
cuenta INTEGER;
BEGIN
  select count(table_name) into cuenta from all_tables where table_name=upper(nombre_tabla); 
  RETURN cuenta;
END EXISTE_TABLA;