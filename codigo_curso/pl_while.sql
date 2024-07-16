set serveroutput on;

declare
    contador integer;
    bloque integer;

begin
    contador := 1;
    bloque := 1000;
    
    while contador <= 10000 loop
        if mod(contador, bloque)=0 then
            dbms_output.put_line(contador || ' Generar commit ...');            
        end if;
        
        contador := contador + 1;        
    end loop;
end;
/