--10 productos mas caros, INCORRECTA
select nombre, preciounidad from tbproductos
where rownum <= 10
order by 2 desc;

SELECT * from (select nombre, preciounidad from tbproductos order by 2 desc)
where rownum <= 10;