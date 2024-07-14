CREATE OR REPLACE PROCEDURE HELLOFLE IS
      v_MyFileHandle UTL_FILE.FILE_TYPE;
 BEGIN
      v_MyFileHandle := UTL_FILE.FOPEN('MI_DIR','HELLO.TXT','w');
      UTL_FILE.PUT_LINE(v_MyFileHandle,'Hello World! ' || TO_CHAR(SYSDATE,'MM-DD-YY HH:MI:SS AM'));

     UTL_FILE.FCLOSE(v_MyFileHandle);
EXCEPTION
      WHEN OTHERS THEN
           DBMS_OUTPUT.PUT_LINE('ERROR ' || TO_CHAR(SQLCODE) || SQLERRM);
           NULL;
END;
/

create or replace directory mi_dir as 'C:\pruebas sql';
 
set serveroutput on;
begin
   hellofle;
end;
/
  