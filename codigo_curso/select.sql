-- Select en los campos
-- calculos
select sum(cargo) as total from tbpedidos;
select sum(cargo) as total from tbpedidos where paisdestinatario = '&Dame_pais';

-- Facturación por país:
select paisdestinatario, 
sum(cargo) as total 
from tbpedidos
group by paisdestinatario order by 2 desc;

-- Calcular el porcentaje de facturación de un país:
select paisdestinatario, 
round(sum(cargo)/(select sum(cargo) from tbpedidos)*100, 2) as total 
from tbpedidos
group by paisdestinatario order by 2 desc;




-- Select en el from 
select id, nombre, preciounidad from tbproductos
where rownum <= 10;

-- Los 10 productos mas caros: MAL primero coge los 10 primeros y luego ordena
select id, nombre, preciounidad from tbproductos
where ROWNUM <= 10 order by 3 desc;

-- 1) ordenar y luego coger los 10 primeros:
select nombre, preciounidad from (select id, nombre, preciounidad from tbproductos order by 3 desc)
where rownum <= 10;

-- Con With:
with productos_ord as (select id, nombre, preciounidad from tbproductos order by 3 desc)
select nombre, preciounidad from productos_ord where rownum <= 10;

-- Consultas con parámetros:
select * from tbpedidos where paisdestinatario = '&Dame_un_pais';
select * from tbpedidos where cargo between &cargo_min and &cargo_max;

create table tbpedidos_francia as (select * from tbpedidos where paisdestinatario='&Dame_un_pais');




-- Select en el Where  (subconsultas). El nombre del producto más caro:
SELECT Nombre, PRECIOUNIDAD FROM TBPRODUCTOS WHERE PRECIOUNIDAD = (SELECT MAX(PRECIOUNIDAD) FROM TBPRODUCTOS);