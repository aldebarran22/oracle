set serveroutput on

begin
  dbms_output.put_line('Char 65: ' || chr(65));
  dbms_output.put_line(to_char(1, '000'));

end;
/