select * from ac2_grupo1;

select * from ac2_grupo2;

select g1.nombre, g2.nombre 
from ac2_grupo1 g1 full outer join ac2_grupo2 g2 on
g1.nombre = g2.nombre;