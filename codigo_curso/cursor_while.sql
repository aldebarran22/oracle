/* Definir un cursor para recorrer los datos de una tabla */

set serveroutput on;

declare
  -- Definicion del cursor
  cursor c1 is select paisdestinatario, sum(cargo) as total from tbpedidos
                group by paisdestinatario order by 2 desc;
                
  -- Definición de una variable para almacenar los datos cada registro
  registro c1%rowtype;
  
  error_interno exception;
begin

  -- Abrir el cursor:
  open c1;
  fetch c1 into registro;
  
  while c1%found loop
    dbms_output.put_line('pais: ' || registro.paisdestinatario || ' total: ' || registro.total);
    fetch c1 into registro;  
    raise error_interno; --lanza la excepcion y el cursor no lo va a cerrar!
  end loop;
  close c1;
  
exception
    when others then
         dbms_output.put_line('Error: ' || sqlcode || ' ' || sqlerrm);
         
         if c1%isopen then
            dbms_output.put_line('El cursor está abierto');
            close c1;
         else 
            dbms_output.put_line('El cursor está cerrado');
         end if;
         
          if c1%isopen then
            dbms_output.put_line('El cursor está abierto: ');
          else 
          dbms_output.put_line('El cursor está cerrado');
          end if;
    
end;
/