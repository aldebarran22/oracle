-- Pruebas de integridad referencial:
insert into z_tabla1(id, descripcion) values(4,'dddd');


select * from z_tabla1;
select * from z_tabla2;

insert into z_tabla2 values(1,1,'11111');
insert into z_tabla2 values(2,1,'22222');

delete from z_tabla1 where id=1;