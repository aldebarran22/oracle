select nombre  from tbempleados where id=1;

select *  from tbempleados where id=1;

select e.nombre, count(p.id) 
    from TBCOMPAÑIASENVIOS e inner join tbpedidos p on e.id = p.idcompanya
    where e.id=1
    group by e.nombre;