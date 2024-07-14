set serveroutput on
DECLARE 

TYPE t_categoria IS TABLE OF tbcategorias.nombre%TYPE; 
v_categoria t_categoria; 

BEGIN 
SELECT nombre BULK COLLECT INTO v_categoria FROM tbcategorias;

FOR i IN v_categoria.FIRST..v_categoria.LAST LOOP 
  dbms_output.put_line(v_categoria(i)); 
END LOOP;

dbms_output.put_line('Elementos de la tabla: ' || v_categoria.count);

END; 
/