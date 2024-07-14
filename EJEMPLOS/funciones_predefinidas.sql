-- Funciones matemáticas:
select ceil(123.55), floor(123.55), round(123.665, 2), trunc(123.557878,3) from dual;
select sign(-8), sign(88) from dual;
select power(2,10), mod(10,3) from dual;

-- Funciones Fecha / Hora:
select add_months(sysdate, 3) from dual;
select current_date, current_timestamp from dual;

select last_day(sysdate) from dual;

-- Funciones de texto:
select ltrim('     hola     '), rtrim('   hola    ') from dual;
select lpad('hola', 20, '*'), rpad('hola', 20, '*') from dual;

-- Funciones de Fechas:
select to_char(sysdate, 'DDD MONTH') from dual;

-- Otras funciones:
select greatest(9,77,55,44,0,3) from dual;
select least(9,77,55,44,0,-3) from dual;

select nvl(telefono, 'no hay telefono') from ac_alumnos;
select nvl2(telefono, telefono, 'no hay telefono') from ac_alumnos;






