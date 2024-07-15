-- Operadores relacionales:

-- mayor que: obtener los productos superiores a la media:
select nombre, preciounidad from tbproductos where
preciounidad > (select round(avg(preciounidad),2) as media from tbproductos);

-- menor que: obtener los productos superiores a la media:
select nombre, preciounidad from tbproductos where
preciounidad < (select round(avg(preciounidad),2) as media from tbproductos);

-- Productos que tienen el mimo precio que "Queso de Cabra"
select nombre, preciounidad from tbproductos
where preciounidad = any(select preciounidad from tbproductos where nombre = 'Queso de cabra');