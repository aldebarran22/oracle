create or replace
PACKAGE PRUEBAS AS
    function contar_cli return integer;
END PRUEBAS;

create or replace
PACKAGE BODY PRUEBAS AS

  function contar_cli return integer AS
  num integer;
  BEGIN
    select count(*) into num from tbclientes;
    RETURN num;
  END contar_cli;

END PRUEBAS;

-- Uso del paquete:
set serveroutput on;
declare
  numero integer;
begin

  numero:=PRUEBAS.contar_cli();
  dbms_output.put_line('Numero de clientes:' || numero);
end;
/