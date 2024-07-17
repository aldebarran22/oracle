/* Bloque anónimo de PL/SQL para recuperar los datos de un empleado */

set serveroutput on;

declare
    -- Definir una variable del mismo tipo que la columna nombre:
    nombre_emp tbempleados.nombre%type; 
    
    -- Recuperar toda la información de un empleado:
    reg_emp tbempleados%rowtype;    
    error_id_emp exception;
begin

    select nombre into nombre_emp from tbempleados  where id=1;
    dbms_output.put_line('El nombre del empleado: ' || nombre_emp);    
    select * into reg_emp from tbempleados where id=1;
    dbms_output.put_line('El empleado: ' || reg_emp.nombre || ' ' || reg_emp.cargo);
    if reg_emp.id = 1 then
        -- Lanzar una excepcion:
        raise error_id_emp;
    end if;    
    dbms_output.put_line('Fin de codigo');
    
exception
    when NO_DATA_FOUND then
        dbms_output.put_line('No se han encontrado datos para el empleado');    
    when error_id_emp then
        dbms_output.put_line('Se ha producido un error en el id del empleado');    
    --when TOO_MANY_ROWS then
    --    dbms_output.put_line('Se han recuperado demasiados resultados');
    
    when others then
        dbms_output.put_line('Se ha producido otro error: ' || sqlcode || ' ' || sqlerrm);
        if sqlcode = -1422 then
            dbms_output.put_line('Se han recuperado demasiados resultados');
        end if;
   
end;
/