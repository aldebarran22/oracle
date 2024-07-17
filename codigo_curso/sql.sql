
select idcliente, cargo from tbpedidos where idcliente like 'H%';

select paisdestinatario, cargo from tbpedidos;

create table tbpedidos_suiza as
select * from tbpedidos where paisdestinatario = 'Suiza';

select distinct paisdestinatario from tbpedidos order by 1;

describe all_tables;

select table_name from all_tables 
where table_name like 'TBPEDIDOS%';

select chr(39) from dual;