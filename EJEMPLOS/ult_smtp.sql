set serveroutput on
DECLARE
  v_FromAddr VARCHAR2(50) := 'Oracle';
  v_ToAddr VARCHAR2(50) := 'formacion@ingenieria-informatica.es';
  v_Message VARCHAR2(200);
  
  v_MailHost VARCHAR2(50) := 'localhost';
  v_MailConnection UTL_SMTP.Connection;
BEGIN
  v_Message := 
    'From: ' || v_FromAddr || CHR(10) ||
    'Subject: Hello from PL/SQL!' || CHR(10) ||
    'message.';

  v_MailConnection := UTL_SMTP.OPEN_CONNECTION(v_MailHost);
  
  UTL_SMTP.HELO(v_MailConnection, v_MailHost);
  UTL_SMTP.MAIL(v_MailConnection, v_FromAddr);
  UTL_SMTP.RCPT(v_MailConnection, v_ToAddr);
  UTL_SMTP.DATA(v_MailConnection, v_Message);
  
  UTL_SMTP.QUIT(v_MailConnection);
EXCEPTION
  when OTHERS THEN
    dbms_output.put_line('ERROR: ' || SQLERRM);
END;
/
