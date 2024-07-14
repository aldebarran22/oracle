set serveroutput on
declare
  prov number;
  nombre VARCHAR2(30);
  
begin
  prov := 28;
  
  case prov
    when 30 then nombre:='Galicia';
    when 31 then nombre:='Andalucia';
    else nombre:='otro valor';
  end case;
  
  dbms_output.put_line('nombre: ' || nombre);
end;
/