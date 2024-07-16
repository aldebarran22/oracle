/* Bloque anónimo de PL/SQL para recuperar los datos de un empleado */

set serveroutput on;

declare
    -- Definir una variable del mismo tipo que la columna nombre:
    nombre_emp tbempleados.nombre%type; 
    
    -- Recuperar toda la información de un empleado:
    reg_emp tbempleados%rowtype;

begin

    select nombre into nombre_emp from tbempleados  where id=1;
    dbms_output.put_line('El nombre del empleado: ' || nombre_emp);
    
    select * into reg_emp from tbempleados where id=1;
    dbms_output.put_line('El empleado: ' || reg_emp.nombre || ' ' || reg_emp.cargo);
   
end;
/