/* Sobre la tabla de pedidos, incrementar en un 5% 
los pedidos de los clientes cuyo idcliente empiece por H. */

set serveroutput on;

declare
  -- Definicion del cursor
  cursor c1 is select idcliente, cargo from tbpedidos where idcliente like 'H%'
    for update of cargo;                
                
  -- Definición de una variable para almacenar los datos cada registro
  registro c1%rowtype;
  
begin
    open c1;
    fetch c1 into registro;    
    while c1%found loop
        dbms_output.put_line('Se actualiza: ' || registro.idcliente || ' ' || registro.cargo || ' Actualizado: ' || registro.cargo * 1.05);
        update tbpedidos set cargo = registro.cargo * 1.05
        where current of c1;
        fetch c1 into registro;
    end loop;
    commit;    
    close c1;    

exception
    when others then
          dbms_output.put_line('Error: ' || sqlcode || ' ' || sqlerrm);

end;
/