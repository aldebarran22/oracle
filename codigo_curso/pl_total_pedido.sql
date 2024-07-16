/* Bloque anónimo de PL/SQL para recuperar el total de un pedido */

set serveroutput on;

declare
 total float;
 id_pedido number;

begin
    id_pedido := &id_pedido_a_buscar;
    select sum(preciounidad * cantidad * (1-descuento/100)) into total
    from tbdetallespedidos 
    where idpedido = id_pedido
    group by idpedido;
    
    dbms_output.put_line('El id del pedido: ' || id_pedido || ' = ' || total);
end;
/