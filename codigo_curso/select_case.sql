-- Ejemplo de uso  de CASE en una consulta de SQL:

-- Número de pedidos por empresa de envío:
select e.nombre, count(p.id) as cuenta
from TBCOMPAÑIASENVIOS e inner join tbpedidos p on e.id = p.idcompanya
group by e.nombre
having count(p.id) > 300;

/*
Empresa, case: Una sentencia SQL para obtener el número de pedidos que realiza cada compañía de envío y añadir una columna calculada que nos indique lo siguiente:
150 a 250 ? Simple, 
250 a 300 ? Normal, 
300 a 350 ? Super

*/
select e.nombre, count(p.id) as cuenta,
case
    when count(p.id) between 150 and 250 then 'Simple'
    when count(p.id) between 251 and 300 then 'Normal'
    else 'Super'
end as tipo
from TBCOMPAÑIASENVIOS e inner join tbpedidos p on e.id = p.idcompanya
group by e.nombre;


select e.nombre, count(p.id) as cuenta,
case count(p.id)
    when 254 then 'Simple'
    when 248 then 'Normal'
    else 'Super'
end as tipo
from TBCOMPAÑIASENVIOS e inner join tbpedidos p on e.id = p.idcompanya
group by e.nombre;

/*
select e.nombre, count(p.id) as cuenta,
case cuenta
    when 1 then 'Simple'
    when 2 then 'Normal'
    else 'Super'
end as tipo
from TBCOMPAÑIASENVIOS e inner join tbpedidos p on e.id = p.idcompanya
group by e.nombre;
*/


-- Ejemplo de CASE evaluación por valor:
select id, 
case id
    when 1 then 'uno'
    when 2 then 'dos'
    when 3 then 'tres'
    else 'otro'
end as texto 
from "TBCOMPAÑIASENVIOS";



-- Ejemplo de CASE evaluación por condición: