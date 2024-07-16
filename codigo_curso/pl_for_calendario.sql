/* Generar un calendario que se genera a partir de un mes/año */


set serveroutput on;

declare

yy integer := 2024;
mm integer := 2;
fecha_texto varchar2(20);
ultimo_dia integer;
ultima_fecha date;
fecha date;

begin
    -- Localizar el ultimo dia mes:
    fecha_texto := '1/' || to_char(mm) || '/' || to_char(yy);
    dbms_output.put_line(fecha_texto);

    ultima_fecha := to_date(fecha_texto, 'dd/mm/yyyy');
    dbms_output.put_line('Ultima fecha: ' || ultima_fecha);
    ultimo_dia := extract(day from last_day(ultima_fecha));
    
    dbms_output.put_line('Ultimo dia: ' || ultimo_dia);
    for i in 1..ultimo_dia loop
        fecha := to_date(i || '/' || mm || '/' || yy, 'dd/mm/yyyy');
        dbms_output.put_line(fecha);
    end loop;
    
end;
/