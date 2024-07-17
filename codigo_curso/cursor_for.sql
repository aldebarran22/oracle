/* Definir un cursor para recorrer los datos de una tabla con un bucle for */

set serveroutput on;
 
begin

  -- Bucle for, se encarga de abrir, cerrar y leer los datos del cursor:
  for c1 in (select paisdestinatario, sum(cargo) as total from tbpedidos group by paisdestinatario order by 2 desc) loop
    dbms_output.put_line('pais: ' || c1.paisdestinatario || ' total: ' || c1.total);
  end loop;
   
exception
    when others then
         dbms_output.put_line('Error: ' || sqlcode || ' ' || sqlerrm);
end;
/