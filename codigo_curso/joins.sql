-- Obtener un listado de pedidos con el nombre del cliente, empleado y empresa

select p.id, c.nombre as nombreCli, emp.nombre as nombreEmp, e.nombre as empresa
from tbpedidos p 
inner join tbclientes c on p.idcliente = c.id
inner join tbempleados emp on p.idempleado = emp.id 
inner join TBCOMPAÑIASENVIOS e on e.id = p.idcompanya;

-- Clientes que no nos han comprado:
select c.nombre from tbclientes c
left join tbpedidos p on c.id = p.idcliente
where p.idcliente is null;

-- Con una subconsulta
select id, nombre from tbclientes
where id not in (select distinct idcliente from tbpedidos);


select c.nombre from tbclientes c
left join tbpedidos p on c.id = p.idcliente
group by c.nombre
having count(p.id)=0;

-- Con operaciones a nivel de conjunto:
select id from tbclientes
minus
select distinct idcliente from tbpedidos;

select c.nombre, count(p.id) as cuenta
from tbclientes c, tbpedidos p
where c.id(+) = p.idcliente 
group by c.nombre
order by 2;

-- Dos conjuntos de personas:
select nombre from ac2_grupo1;

select nombre from ac2_grupo2;

-- Quienes coinciden en ambos grupos:
-- inner join
-- in
select nombre from ac2_grupo1
intersect
select nombre from ac2_grupo2;

select nombre from ac2_grupo1
union all
select nombre from ac2_grupo2;

-- Personas que solo se apuntan a un grupo:

-- Opcion1: con conjuntos
(select nombre from ac2_grupo1
union 
select nombre from ac2_grupo2)
minus
(select nombre from ac2_grupo1
intersect 
select nombre from ac2_grupo2);

-- Opcion2: full outer join
select nvl(g1.nombre, g2.nombre) as nombre
from ac2_grupo1 g1 
full outer join
ac2_grupo2 g2
on g1.nombre = g2.nombre
where g1.nombre is null or g2.nombre is null;

select nombre from ac2_grupo1 where nombre not in (select nombre from ac2_grupo2)
union
select nombre from ac2_grupo2 where nombre not in (select nombre from ac2_grupo1);

select nvl(null, 200) as valor from dual;



-- Producto cartesiano
select count(*) from tbcategorias;
select count(*) from tbproductos;

select 15*77 from dual;

select count(*) from tbcategorias c, tbproductos p;









