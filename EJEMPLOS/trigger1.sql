CREATE OR REPLACE
TRIGGER TRIGGER1
AFTER INSERT ON TBDETALLESPEDIDOS
for each row
declare
  nuevo_idproducto NUMBER;
  nueva_cantidad number;
BEGIN
  nuevo_idproducto:=:new.idproducto;
  nueva_cantidad:=:new.cantidad;
  
  update tbproductos 
  set unidadesenexistencia = unidadesenexistencia - nueva_cantidad
  where id = nuevo_idproducto;
END;
/

-- Prueba Trigger:
select * from tbproductos;
select * from tbdetallespedidos where idpedido=10248;
insert into tbdetallespedidos values (10248,2,20,7,0);

