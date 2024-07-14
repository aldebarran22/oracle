set serveroutput on
Declare
Type CliCurType is ref cursor;
Ccli CliCurType;
VNombreProducto  tbproductos.nombre%type;
VCategoria tbcategorias.nombre%type;
comandoSQL VARCHAR2(200);

Begin
VCategoria:='&introduzca_categoria';

comandoSQL:='select p.nombre from tbproductos p inner join tbcategorias c on p.idcategoria=c.id where c.nombre= :v';
Open ccli for comandoSQL using Vcategoria;

Loop
  Fetch ccli into VNombreProducto; -- Extraer la fila;
  dbms_output.put_line(VNombreProducto);
  Exit when ccli%notfound; -- Salir si no hay datos;
End loop;

close ccli;
End;
/