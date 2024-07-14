--Ejemplos

/*
Prueba de expresiones regulares.
*/

select * from tbproductos where  regexp_like(cantidadporunidad,'*frascos*');

select * from tbproductos where  regexp_like(cantidadporunidad,'\d{2}*');


