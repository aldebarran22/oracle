-- Crear las tablas de la BD empresa:

CREATE TABLE tbcategorias ( 
  id number primary key,
  nombre varchar2(50)  
) ; 
commit;

INSERT INTO tbcategorias VALUES (1,'Bebidas');
INSERT INTO tbcategorias VALUES(2,'Condimentos');
INSERT INTO tbcategorias VALUES(3,'Reposteria');
INSERT INTO tbcategorias values(4,'Lacteos');
INSERT INTO tbcategorias values(5,'Granos/Cereales');
INSERT INTO tbcategorias values(6,'Carnes');
INSERT INTO tbcategorias values(7,'Frutas/Verduras');
INSERT INTO tbcategorias values(8,'Pescado/Marisco');
commit;

--drop table tbcategorias;