create or replace directory dir_temp as 'c:\temp';

declare
  f utl_file.file_type;
begin
  f := utl_file.fopen('DIR_TEMP', 'something.txt', 'w');
  utl_file.put_line(f, 'line one: some text');
  utl_file.put_line(f, 'line two: more text');
  utl_file.fclose(f);
end;
/