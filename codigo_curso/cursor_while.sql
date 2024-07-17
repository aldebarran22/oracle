/* Definir un cursor para recorrer los datos de una tabla */

set serveroutput on;

declare
  -- Definicion del cursor
  cursor c1 is select paisdestinatario, sum(cargo) as total from tbpedidos
                group by paisdestinatario order by 2 desc;
                
  -- Definición de una variable para almacenar los datos cada registro
  registro c1%rowtype;
  
begin

  -- Abrir el cursor:
  open c1;
  fetch c1 into registro;
  
  while c1%found loop
    dbms_output.put_line('pais: ' || registro.paisdestinatario || ' total: ' || registro.total);
    fetch c1 into registro;  
  end loop;
  close c1;
  
exception
    when others then
         dbms_output.put_line('Error: ' || sqlcode || ' ' || sqlerrm);
    
end;
/