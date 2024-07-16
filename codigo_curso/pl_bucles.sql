-- Bucles en pl/sql

set serveroutput on;

declare

contador number := 1;

begin

loop
    dbms_output.put_line('Contador: ' || contador);
    contador := contador + 1;
    exit when contador > 10;

end loop;

contador := 1;
loop
    dbms_output.put_line('Contador: ' || contador);
    contador := contador + 1;
    if contador > 10 then
        exit;
    end if;

end loop;
end;
/