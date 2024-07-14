CREATE VIEW VISTA_GANANCIA_TOTAL 
AS 
SELECT sum(preciounidad * cantidad * (1- descuento)) as total
from tbdetallespedidos;

select * from vista_ganancia_total;

-- Ganancia por cliente:
CREATE VIEW VISTA_PORCENTAJE_CLIENTE 
AS 
select pe.idcliente, sum((dt.preciounidad * dt.cantidad * (1- dt.descuento))) as total_cliente, 
((sum((dt.preciounidad * dt.cantidad * (1- dt.descuento)))) / (select total from vista_ganancia_total) * 100) as porcentaje
from tbpedidos pe 
left join tbdetallespedidos dt
on pe.id = dt.idpedido
group by pe.idcliente
order by pe.idcliente;