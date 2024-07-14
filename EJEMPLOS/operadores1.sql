-- Prueba con operadores:
-- Activar el buffer de escritura:
set serveroutput on
declare
  num1 number; 
  num2 NUMBER;
  resul NUMBER;
  
begin
  num1:= 10;
  num2:= 2;
  
  resul := num1 ** num2;
  
  dbms_output.put_line('El resultado es: ' || resul);

end;
/