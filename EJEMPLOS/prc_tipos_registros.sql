set serveroutput on
declare
  type tasig is record (cod number, nombre varchar2(40), precio number);
  
  asig1 tasig;
  asig2 tasig;
  
  begin
    asig1.cod := 9;
    asig1.nombre := 'AJAX';
    asig1.precio := 35;
    
    -- Copiar un reg en otro:
    asig2 := asig1;
    
    -- Imprimir el registro:
    dbms_output.put_line('cod: ' || asig2.cod || ' nombre: ' || asig2.nombre ||  ' precio: ' || asig2.precio);
    
    -- Insertar el registro a partir de una variable de tipo registro:
    insert into ac_asignaturas values asig2;
    
    -- Capturar el nuevo registro en una variable:
    select * into asig1 from ac_asignaturas where codasig = 9;
     dbms_output.put_line('cod: ' || asig1.cod || ' nombre: ' || asig1.nombre ||  ' precio: ' || asig1.precio);
  end;
  /