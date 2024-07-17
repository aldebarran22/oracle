-- Generar una tabla de pedidos por cada pais. Copiando los registros a cada país
-- Utilizar un cursor estático con un bucle for para extraer los nombres de los paises
-- Y generar una cadena dinámica para crear cada tabla


set serveroutput on;
 
declare
   cadenaSQL varchar2(120);

begin

  -- Bucle for, se encarga de abrir, cerrar y leer los datos del cursor:
  for c1 in (select distinct paisdestinatario from tbpedidos) loop
    --dbms_output.put_line('pais: ' || c1.paisdestinatario);
    
    cadenaSQL := 'create table tb_pedidos_' || replace(c1.paisdestinatario, ' ','_') || 
    ' as (select * from tbpedidos where paisdestinatario = ' || 
    chr(39) || c1.paisdestinatario || chr(39) || ')';
    dbms_output.put_line('SQL: ' || cadenaSQL);
    execute immediate cadenasql;
    
  end loop;
   
exception
    when others then
         dbms_output.put_line('Error: ' || sqlcode || ' ' || sqlerrm);
end;
/