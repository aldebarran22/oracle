/* Bloque anónimo de PL/SQL para grabar los datos de una categoria */

set serveroutput on;

declare
    
    -- Recuperar toda la información de un empleado:
    reg_cat tbcategorias%rowtype;
        

begin

    --select max(id)+1 into reg_cat.id from tbcategorias;
    reg_cat.id := seq_categorias.nextval;
    reg_cat.nombre := 'programacion';
    reg_cat.test := 0;
    
    insert into tbcategorias values(reg_cat.id, reg_cat.nombre, reg_cat.test);
    dbms_output.put_line('Registros grabados: ' || SQL%ROWCOUNT);
    commit;  
   
end;
/