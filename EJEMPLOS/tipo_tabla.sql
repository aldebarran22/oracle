-- Definir una tabla con los nombres e ids de los clientes;
set serveroutput on
declare
  type t_reg_cliente is record (
      id varchar2(10),
      nombre varchar2(60)
  );
  
  type t_tb_cliente is Table of t_reg_cliente 
  INDEX BY BINARY_INTEGER;
  
   tabla_clientes t_tb_cliente;
  
  
  function getTablaClientes return t_tb_cliente as
  -- Definir variables:
  reg_cliente t_reg_cliente;
  tb_cliente t_tb_cliente;
  i binary_integer:=1;
  begin
   -- Recorrer la tabla de clientes mediante un cursor:
    for c1 in (select id, nombre from tbclientes) loop
        -- Cargar los datos al registro:
        reg_cliente.id := c1.id;
        reg_cliente.nombre := c1.nombre;
        
        -- Cargar el registro en la tabla:
        tb_cliente(i) := reg_cliente;
        
        i:=i+1;
    end loop;
    return tb_cliente;
  end;
  
    
begin
    tabla_clientes := getTablaClientes; 
    dbms_output.put_line('Numero de clientes: ' || tabla_clientes.count);
    
    -- Borrar el último elemento de la Tabla:
    tabla_clientes.delete(tabla_clientes.last);
    dbms_output.put_line('Numero de clientes: ' || tabla_clientes.count);
    -- Imprimir el nombre del primer cliente:
     dbms_output.put_line(tabla_clientes(tabla_clientes.first).nombre);
     
     -- Borra clientes del 1 al 4:
     tabla_clientes.delete(tabla_clientes.first, tabla_clientes.prior(5));
     dbms_output.put_line('Numero de clientes: ' || tabla_clientes.count);
end;
/


