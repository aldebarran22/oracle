set serveroutput on
declare
  num float;
  
begin
  select importe into num from importes where id = 3;
  dbms_output.put_line('importe:'||num);
  
  if SQL%FOUND then
    dbms_output.put_line('se recuperaron datos');
  end if;

  if SQL%ISOPEN then
    dbms_output.put_line('El cursor esta abierto');
  else
    dbms_output.put_line('El cursor NO esta abierto');
  end if;
  
  delete from importes where id>3;
  dbms_output.put_line('Numero de registros afectados: ' || SQL%ROWCOUNT);
end;
/