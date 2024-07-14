-- Exportar el nombre del producto y el precio de la tabla de productos:
set serveroutput on
declare
  fich utl_file.file_type;
  nombre tbproductos.nombre%TYPE;
  precio tbproductos.preciounidad%TYPE;
  linea varchar2(80);
begin
  -- Abrir el fichero para escritura:
  fich := utl_file.fopen('MI_DIR', 'productos.csv', 'w');
  
  -- Definir el cursor y escribir en el fichero:
  linea := 'nombre_producto;precio';
   utl_file.put_line(fich, linea);
  
  for c1 in (select nombre, preciounidad from tbproductos) loop
    linea := c1.nombre || ';' || c1.preciounidad;
    
    -- Grabar en el fichero:
    utl_file.put_line(fich, linea);
  end loop;
  
  -- Cerrar el fichero:
  utl_file.fclose(fich);
end;
/