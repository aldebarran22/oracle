CREATE or replace PROCEDURE borrar_pedido
(id_pedido IN NUMBER) AS
BEGIN
  -- Primero borramos en la tabla dependiente:
  delete from tbdetallespedidos where idpedido = id_pedido;
  
  --Borramos de la tabla de pedidos:
  delete from tbpedidos where id = id_pedido;
  
  --Confirmar trasaccion
  commit;
  
exception
  -- Si falla algo, se tira abajo la transaccion:
  when others then
    rollback;
  
END borrar_pedido;
/

-- Llamada al procedure:
begin
  borrar_pedido(11077);
end;
/

