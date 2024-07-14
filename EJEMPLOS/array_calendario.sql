set serveroutput on
Declare
Type calendario is varray(366) of date;
-- Declaración e inicialización de la colección (sólo del primer elemento).
Año calendario := calendario(to_date('01/01/2003','DD/MM/YYYY'));
Begin
-- Modificamos el primer elemento:
Año(1):=to_date('02/02/2003', 'DD/MM/YYYY');
 dbms_output.put_line(Año(1));
End;
/