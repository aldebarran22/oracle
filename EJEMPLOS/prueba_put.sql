set serveroutput on

begin
for i in 20..25 loop
    for j in 1..10 loop
      dbms_output.put('prueba');
    end loop;
    
  dbms_output.put_line('prueba 2');
end loop;
end;
/