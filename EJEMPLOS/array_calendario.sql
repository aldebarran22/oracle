set serveroutput on
Declare
Type calendario is varray(366) of date;
-- Declaraci�n e inicializaci�n de la colecci�n (s�lo del primer elemento).
A�o calendario := calendario(to_date('01/01/2003','DD/MM/YYYY'));
Begin
-- Modificamos el primer elemento:
A�o(1):=to_date('02/02/2003', 'DD/MM/YYYY');
 dbms_output.put_line(A�o(1));
End;
/