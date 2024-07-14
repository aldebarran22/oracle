set serveroutput on

declare
  type tcategorias is table of varchar2(50) index by binary_integer;
  cat tcategorias;
  i binary_integer:=1;
  
  
  
begin
  for cur1 in (select nombre from tbcategorias) loop
    
    cat(i):=cur1.nombre;
    i:=i+1;
  end loop;
   
    dbms_output.put_line('Numero de cat cargadas: ' || cat.count);
end;
/