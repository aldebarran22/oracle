-- Practica exportar Tabla:
set serveroutput on
declare 
  fichero utl_file.file_type; 
  linea varchar2(120);
  
begin 
  fichero := utl_file.fopen('DIR_TEMP', 'clientes.txt', 'w');
  
  for c_cli in (select * from tbclientes) loop
    linea:=c_cli.id || ';' || c_cli.nombre || ';' || c_cli.descripcion;
    utl_file.put_line(fichero, linea); 
  end loop;
  
  utl_file.fclose(fichero); 
exception
  when others then
  dbms_output.put_line('ERROR: ' || SQLERRM);
end; 
/