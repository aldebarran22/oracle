--Producto cartesiano:
select cl.nombre as ncli, e.nombre as nemp from tbclientes cl, tbempleados e;

select cat.nombre, p.nombre from tbcategorias cat
inner  join tbproductos p on cat.id = p.idcategoria
order by cat.nombre;

select cat.nombre, pro.nombre from tbcategorias cat, tbproductos pro
where pro.idcategoria(+)= cat.id order by 1;

insert into tbcategorias values(9, 'otros 2');
select * from tbcategorias;

select nombre, preciounidad from tbproductos where preciounidad not between 20 and 40;

select nombre from tbempleados
union all
select nombre from tbclientes;

select preciounidad as precio from tbproductos order by precio;
select nombre, preciounidad from tbproductos where preciounidad >= all(select preciounidad from tbproductos);

select * from user_tables;

create table clientes_a as select * from tbclientes where nombre like 'A%';
select * from clientes_a;
drop table clientes_a;
