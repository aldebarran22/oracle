set serveroutput on

declare
  precio number;
  valor number:=0;
  
begin
  -- Capturar el precio de un producto:
  select preciounidad into precio from tbproductos where id=6;
  dbms_output.put_line('El precio es ' || precio);
  
  select preciounidad into precio from tbproductos where id = 4;
  dbms_output.put_line('El precio es ' || precio);
   
  -- Producir una división por cero:
  precio := precio / valor;
  
exception

  when no_data_found then
    -- No hay datos:
    dbms_output.put_line('Error: no hay datos');
  
  when too_many_rows then
    dbms_output.put_line('Error: se devuelven demasiadas filas');
    
  when zero_divide then
    dbms_output.put_line('Codigo: ' || SQLCODE || ' mensaje: ' || SQLERRM);
    
end;
/
