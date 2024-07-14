-- Generar fechas
set serveroutput on
declare 
  mes number:=2;
  anyo number:=2008;
  fecha date;
  dia integer:=1;
  ultimo_dia number;
  cadena_fecha varchar2(15);
begin
  
  cadena_fecha:= dia || '-' || mes || '-' || anyo;
  fecha:=to_date(cadena_fecha, 'dd/mm/yyyy');
  ultimo_dia := extract(DAY from last_day(fecha)); 
  dbms_output.put_line('ultimo dia: ' || ultimo_dia);
 
  while dia <= ultimo_dia loop
    cadena_fecha:= dia || '-' || mes || '-' || anyo;
    fecha:=to_date(cadena_fecha, 'dd/mm/yyyy');
    dbms_output.put_line(to_char(fecha, 'dd/mm/yyyy'));
    dia:=dia+1;
  end loop;
end;
/