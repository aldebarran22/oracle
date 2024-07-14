-- Creación del plano de la red de metro:
-- Utilizar prefijo MET para las tablas:

create table MET_lineas(
  id number not null primary key,
  linea varchar(50) not null,
  color integer
);

create table MET_estaciones(
  id number not null primary key,
  estacion varchar2(50) not null,
  num_entradas integer default 1
);

create table MET_estaciones_lineas(
  id_estacion number not null,
  id_linea number not null,
  constraint pk_est_lin primary key(id_estacion, id_linea),
  constraint fk_estaciones foreign key(id_estacion) references MET_estaciones(id),
  constraint fk_lineas foreign key(id_linea) references MET_lineas(id)
  );
  
 -- drop table MET_lineas;
 -- drop table MET_estaciones;
 -- drop table MET_estaciones_lineas;
  
  

