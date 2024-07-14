-- Funciones predefinidas.
-- Obtener nom, ape1, y ape2 desde un nombre completo:

set serveroutput on;
declare
  nombre_completo varchar2(80):='Antonio Espin Herranz';
  nombre varchar2(30):='';
  ape1 varchar2(30):='';
  ape2 varchar2(30):='';
  pos integer;
  pos2 integer;
  
begin
  pos:=instr(nombre_completo, ' ', 1);
  
  if pos > 0 then
    nombre:= substr(nombre_completo, 1, pos-1);   
    pos2:=instr(nombre_completo, ' ', (pos+1));
    
    if pos2 > 0 then
      ape2:= substr(nombre_completo, (pos2+1));
      ape1:= substr(nombre_completo, (pos+1), pos2-pos-1);
    end if;
  end if;
  
  -- Imprimir el resultado:
  dbms_output.put_line('Nombre: ' || nombre);
  dbms_output.put_line('Apellido1: ' || ape1);
  dbms_output.put_line('Apellido2: ' || ape2);
end;
/