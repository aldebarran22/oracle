set serveroutput on
declare
  contador number;
  importe float;
  valor_inicial NUMBER;
  
begin

  select max(id) into valor_inicial from importes;
  if valor_inicial is null then
    valor_inicial := 1;
  else
    valor_inicial := valor_inicial+1;
  end if;
  
  contador:= valor_inicial;
  
  loop
    if contador > (valor_inicial+20) then
      exit;
    end if;
    
    
    -- Otra forma de salir:
    --exit when contador=10;
    
    -- Sentencias del bucle:
    importe:= trunc(dbms_random.value(1,100));
    insert into importes(id, importe) values(contador, importe);
    contador:=contador+1;
  end loop;
end;
/

