set serveroutput on
declare
  TYPE tArray IS VARRAY(5) OF number;
  vector tArray:=tArray(1,2,3);
  
begin
  dbms_output.put_line(vector(2));
  vector(2):=100;
  dbms_output.put_line(vector(2));
  
  --vector(4):=tArray(120);
  
  for i in 1..3 loop
      dbms_output.put_line(vector(i));
  end loop;
end;
/