--Funciones varias:

select greatest(33,6) from dual;
select least(88,9) from dual;

select nvl(null, 'hola') from dual;
select user from dual;


select decode(3,1,'rojo',2,'verde',3,'azul') from dual;
select coalesce(null,null,5,6,7) from dual;  

select nvl2(4, 'hola','adios') from dual;
select width_bucket(11,10,50,5) from dual;