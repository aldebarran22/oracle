-- Bucles en pl/sql

set serveroutput on;

declare

contador number := 1;
importe integer;

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

-- Bucle loop para validar valores múltiplos de 10:
-- El bucle termina cuando tecleamos un valor correcto

importe := &introducir_importe;
if mod(importe, 10)=0 then
    dbms_output.put_line('Valor correcto: ' || importe);
else
    dbms_output.put_line('Introduzca un valor múltiplo de 10');
end if;

end;
/