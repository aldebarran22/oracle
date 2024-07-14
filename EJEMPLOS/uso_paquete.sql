set serveroutput on;
declare
  numero integer;
begin

  numero:=PRUEBAS.contar_cli();
  dbms_output.put_line('Numero de clientes:' || numero);
end;
/