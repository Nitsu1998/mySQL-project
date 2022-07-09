CREATE DATABASE sql_proyect;
USE sql_proyect;

-- Tabla de estaciones que frenan los trenes
CREATE TABLE sql_proyect.estacion (
id_estacion int auto_increment,
nombre varchar(20),
ubicacion varchar(30),
primary key (id_estacion)
);

-- Tabla del boleto que pagan los usuarios que usan el tren
CREATE TABLE sql_proyect.boleto (
id_boleto int auto_increment,
fecha datetime,
valor int,
estacion_origen varchar(20),
estacion_destino varchar(20),
primary key (id_boleto)
);

-- Tabla de las lineas de subte
CREATE TABLE sql_proyect.linea (
id_linea int auto_increment,
letra_linea varchar(1),
color varchar(10),
viaje_km int,
pasajeros_anual int,
viaje_duracion int,
primary key (id_linea),
foreign key (id_linea) references sql_proyect.estacion (id_estacion),
foreign key (id_linea) references sql_proyect.boleto (id_boleto)
);

-- Tabla de los trenes que viajan por las lineas
CREATE TABLE sql_proyect.tren (
id_tren int auto_increment,
vagones int,
primary key (id_tren),
foreign key (id_tren) references sql_proyect.linea (id_linea)
);

-- Tabla de conductores que manejan los trenes
CREATE TABLE sql_proyect.conductor (
dni int,
nombre varchar(15),
apellido varchar(20),
celular int,
primary key (dni),
foreign key (dni) references sql_proyect.tren (id_tren)
);
