-- Entgrega proyecto final proyecto a_tu_medida

-- ############################################
-- Creacion de la base de datos:          

CREATE DATABASE IF NOT EXISTS a_tu_medida;

-- ############################################
-- Creacion de las tablas, indices y claves

USE a_tu_medida;

CREATE TABLE clientes (
    ID int NOT NULL,
    nombre varchar(50) NOT NULL,
    apellido varchar(50),
    mail varchar(50),
    PRIMARY KEY (ID)
);
CREATE TABLE estilos (
    ID int NOT NULL,
    nombre varchar(50) NOT NULL,
    PRIMARY KEY (ID)
);
CREATE TABLE indumentarias (
    ID int NOT NULL,
    nombre varchar(50) NOT NULL,
    PRIMARY KEY (ID)
);
CREATE TABLE tipos_diseñador (
    ID int NOT NULL,
    tipo_diseñador varchar(50) NOT NULL,
    PRIMARY KEY (ID)
);
CREATE TABLE diseñadores (
    ID int NOT NULL,
    nombre varchar(50) NOT NULL,
    apellido varchar(50),
    mail varchar(50),
    id_tipo_diseñador int NOT NULL,
    id_estilo int NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (id_tipo_diseñador) REFERENCES tipos_diseñador(ID),
    FOREIGN KEY (id_estilo) REFERENCES estilos(ID)
    
);
CREATE TABLE pedidos (
    ID int NOT NULL,
    fecha datetime,
    id_cliente int NOT NULL,
    id_diseñador int NOT NULL,
    id_estilo int NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (id_cliente) REFERENCES clientes(ID),
    FOREIGN KEY (id_diseñador) REFERENCES diseñadores(ID),
    FOREIGN KEY (id_estilo) REFERENCES estilos(ID)
    
);
CREATE TABLE diseños (
    ID int NOT NULL,
	nombre varchar(50) NOT NULL,
    precio decimal(10,2) NOT NULL,
    id_estilo int NOT NULL,
    id_pedido int NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (id_estilo) REFERENCES estilos(ID),
	FOREIGN KEY (id_pedido) REFERENCES pedidos(ID)
    
);
CREATE TABLE detalles_diseños (
    ID int NOT NULL,
    id_diseño int NOT NULL,
    id_indumentaria int NOT NULL,
    cantidad int NOT NULL,
    PRIMARY KEY (ID),
    FOREIGN KEY (id_diseño) REFERENCES diseños(ID),
	FOREIGN KEY (id_indumentaria) REFERENCES indumentarias(ID)
    
);
CREATE TABLE pedidos_diseños (
  id_pedido int NOT NULL,
  id_diseño int NOT NULL,
  PRIMARY KEY (id_pedido, id_diseño),
  FOREIGN KEY (id_pedido) REFERENCES pedidos(ID),
  FOREIGN KEY (id_diseño) REFERENCES diseños(ID)

);
CREATE TABLE clientes_pedidos (
  id_cliente int NOT NULL,
  id_pedido int NOT NULL,
  PRIMARY KEY (id_cliente, id_pedido),
  FOREIGN KEY (id_cliente) REFERENCES clientes(ID),
  FOREIGN KEY (id_pedido) REFERENCES pedidos(ID)

);
CREATE INDEX idx_cliente ON clientes(ID);

-- ############################################
-- insercion de datos

INSERT INTO `a_tu_medida`.`clientes` (`ID`, `nombre`, `apellido`, `mail`) VALUES (1,'Bulma','rojas','Bulma .rojas@gmail.com');
INSERT INTO `a_tu_medida`.`clientes` (`ID`, `nombre`, `apellido`, `mail`) VALUES (2,'Benito ','pavón','Benito .pavón@gmail.com');
INSERT INTO `a_tu_medida`.`clientes` (`ID`, `nombre`, `apellido`, `mail`) VALUES (3,'lulú','benitez','lulú.benitez@gmail.com');
INSERT INTO `a_tu_medida`.`clientes` (`ID`, `nombre`, `apellido`, `mail`) VALUES (4,'juana','rodriguez','juana.rodriguez@gmail.com');
INSERT INTO `a_tu_medida`.`clientes` (`ID`, `nombre`, `apellido`, `mail`) VALUES (5,'Marta','fernandez','Marta.fernandez@gmail.com');
INSERT INTO `a_tu_medida`.`clientes` (`ID`, `nombre`, `apellido`, `mail`) VALUES (6,'angel','chaparro','angel.chaparro@gmail.com');
INSERT INTO `a_tu_medida`.`clientes` (`ID`, `nombre`, `apellido`, `mail`) VALUES (7,'ricardo','lopez','ricardo.lopez@gmail.com');
INSERT INTO `a_tu_medida`.`clientes` (`ID`, `nombre`, `apellido`, `mail`) VALUES (8,'sofia','garcia','sofia.garcia@gmail.com');
INSERT INTO `a_tu_medida`.`clientes` (`ID`, `nombre`, `apellido`, `mail`) VALUES (9,'wendy','novelli','wendy.novelli@gmail.com');
INSERT INTO `a_tu_medida`.`clientes` (`ID`, `nombre`, `apellido`, `mail`) VALUES (10,'azul','sosa','azul.sosa@gmail.com');

INSERT INTO `a_tu_medida`.`estilos` (`ID`, `nombre`) VALUES (1,'alta costura');
INSERT INTO `a_tu_medida`.`estilos` (`ID`, `nombre`) VALUES (2,'sport');
INSERT INTO `a_tu_medida`.`estilos` (`ID`, `nombre`) VALUES (3,'casual');
INSERT INTO `a_tu_medida`.`estilos` (`ID`, `nombre`) VALUES (4,'disfraces');
INSERT INTO `a_tu_medida`.`estilos` (`ID`, `nombre`) VALUES (5,'urbano');

INSERT INTO `a_tu_medida`.`tipos_diseñador` (`ID`, `tipo_diseñador`) VALUES (1,'general');
INSERT INTO `a_tu_medida`.`tipos_diseñador` (`ID`, `tipo_diseñador`) VALUES (2,'Vip');

INSERT INTO `a_tu_medida`.`indumentarias` (`ID`, `nombre`) VALUES (1,'camisas');
INSERT INTO `a_tu_medida`.`indumentarias` (`ID`, `nombre`) VALUES (2,'jeans');
INSERT INTO `a_tu_medida`.`indumentarias` (`ID`, `nombre`) VALUES (3,'camperas');
INSERT INTO `a_tu_medida`.`indumentarias` (`ID`, `nombre`) VALUES (4,'faldas');
INSERT INTO `a_tu_medida`.`indumentarias` (`ID`, `nombre`) VALUES (5,'vestidos');
INSERT INTO `a_tu_medida`.`indumentarias` (`ID`, `nombre`) VALUES (6,'calzas');
INSERT INTO `a_tu_medida`.`indumentarias` (`ID`, `nombre`) VALUES (7,'camisetas');
INSERT INTO `a_tu_medida`.`indumentarias` (`ID`, `nombre`) VALUES (8,'sweaters');
INSERT INTO `a_tu_medida`.`indumentarias` (`ID`, `nombre`) VALUES (9,'buzos');
INSERT INTO `a_tu_medida`.`indumentarias` (`ID`, `nombre`) VALUES (10,'sombreros');
INSERT INTO `a_tu_medida`.`indumentarias` (`ID`, `nombre`) VALUES (11,'disfraces');

INSERT INTO `a_tu_medida`.`diseñadores` (`ID`, `nombre`, `apellido`, `mail`, `id_tipo_diseñador`, `id_estilo`) VALUES (1,'Tina','turner','Tina.turner@gmail.com',1,4);
INSERT INTO `a_tu_medida`.`diseñadores` (`ID`, `nombre`, `apellido`, `mail`, `id_tipo_diseñador`, `id_estilo`) VALUES (2,'brad','pitt','brad.pitt@gmail.com',1,2);
INSERT INTO `a_tu_medida`.`diseñadores` (`ID`, `nombre`, `apellido`, `mail`, `id_tipo_diseñador`, `id_estilo`) VALUES (3,'danny','devito','danny.devito@gmail.com',1,3);
INSERT INTO `a_tu_medida`.`diseñadores` (`ID`, `nombre`, `apellido`, `mail`, `id_tipo_diseñador`, `id_estilo`) VALUES (4,'benito','fernandez','benito.fernandez@gmail.com',2,2);
INSERT INTO `a_tu_medida`.`diseñadores` (`ID`, `nombre`, `apellido`, `mail`, `id_tipo_diseñador`, `id_estilo`) VALUES (5,'pancho','ibanez','pancho.ibanez@gmail.com',1,4);
INSERT INTO `a_tu_medida`.`diseñadores` (`ID`, `nombre`, `apellido`, `mail`, `id_tipo_diseñador`, `id_estilo`) VALUES (6,'sebastian','estebanez','sebastian.estebanez@gmail.com',2,1);
INSERT INTO `a_tu_medida`.`diseñadores` (`ID`, `nombre`, `apellido`, `mail`, `id_tipo_diseñador`, `id_estilo`) VALUES (7,'ricardo ','ford','ricardo .ford@gmail.com',2,3);
INSERT INTO `a_tu_medida`.`diseñadores` (`ID`, `nombre`, `apellido`, `mail`, `id_tipo_diseñador`, `id_estilo`) VALUES (8,'susana','flores','susana.flores@gmail.com',1,3);
INSERT INTO `a_tu_medida`.`diseñadores` (`ID`, `nombre`, `apellido`, `mail`, `id_tipo_diseñador`, `id_estilo`) VALUES (9,'veronica','perez','veronica.perez@gmail.com',2,1);
INSERT INTO `a_tu_medida`.`diseñadores` (`ID`, `nombre`, `apellido`, `mail`, `id_tipo_diseñador`, `id_estilo`) VALUES (10,'ana','solis','ana.solis@gmail.com',2,2);

INSERT INTO `a_tu_medida`.`pedidos` (`ID`, `fecha`, `id_cliente`, `id_diseñador`,`id_estilo`) VALUES (1,'2023-05-29 12:36:00','1','4',1);
INSERT INTO `a_tu_medida`.`pedidos` (`ID`, `fecha`, `id_cliente`, `id_diseñador`,`id_estilo`) VALUES (2,'2023-04-15 17:36:00','10','2',1);
INSERT INTO `a_tu_medida`.`pedidos` (`ID`, `fecha`, `id_cliente`, `id_diseñador`,`id_estilo`) VALUES (3,'2023-03-29 16:36:00','2','6',5);
INSERT INTO `a_tu_medida`.`pedidos` (`ID`, `fecha`, `id_cliente`, `id_diseñador`,`id_estilo`) VALUES (4,'2023-02-28 15:36:00','6','1',2);
INSERT INTO `a_tu_medida`.`pedidos` (`ID`, `fecha`, `id_cliente`, `id_diseñador`,`id_estilo`) VALUES (5,'2023-01-30 14:36:00','2','8',3);
INSERT INTO `a_tu_medida`.`pedidos` (`ID`, `fecha`, `id_cliente`, `id_diseñador`,`id_estilo`) VALUES (6,'2022-12-12 02:36:00','8','9',4);

INSERT INTO `a_tu_medida`.`diseños` (`ID`, `nombre`, `precio`, `id_estilo`, `id_pedido`) VALUES (1,'vestido russel',8600,1,4);
INSERT INTO `a_tu_medida`.`diseños` (`ID`, `nombre`, `precio`, `id_estilo`, `id_pedido`) VALUES (2,'falda caracol',5500,1,3);
INSERT INTO `a_tu_medida`.`diseños` (`ID`, `nombre`, `precio`, `id_estilo`, `id_pedido`) VALUES (3,'kimono lis',4300,3,3);
INSERT INTO `a_tu_medida`.`diseños` (`ID`, `nombre`, `precio`, `id_estilo`, `id_pedido`) VALUES (4,'Jeans Chipre',15300,3,1);
INSERT INTO `a_tu_medida`.`diseños` (`ID`, `nombre`, `precio`, `id_estilo`, `id_pedido`) VALUES (5,'camisa con bolados',8000,3,2);
INSERT INTO `a_tu_medida`.`diseños` (`ID`, `nombre`, `precio`, `id_estilo`, `id_pedido`) VALUES (6,'vestido de novia romantico',89000,1,5);
INSERT INTO `a_tu_medida`.`diseños` (`ID`, `nombre`, `precio`, `id_estilo`, `id_pedido`) VALUES (7,'calzas termicas ',5000,2,1);
INSERT INTO `a_tu_medida`.`diseños` (`ID`, `nombre`, `precio`, `id_estilo`, `id_pedido`) VALUES (8,'buzo space',10700,3,1);
INSERT INTO `a_tu_medida`.`diseños` (`ID`, `nombre`, `precio`, `id_estilo`, `id_pedido`) VALUES (9,'gorro borbotones',3400,5,4);
INSERT INTO `a_tu_medida`.`diseños` (`ID`, `nombre`, `precio`, `id_estilo`, `id_pedido`) VALUES (10,'disfraz de ALF',22600,4,6);

INSERT INTO `a_tu_medida`.`detalles_diseños` (`ID`, `id_diseño`, `id_indumentaria`,`cantidad`) VALUES (1,1,5,1);
INSERT INTO `a_tu_medida`.`detalles_diseños` (`ID`, `id_diseño`, `id_indumentaria`,`cantidad`) VALUES (2,2,4,1);
INSERT INTO `a_tu_medida`.`detalles_diseños` (`ID`, `id_diseño`, `id_indumentaria`,`cantidad`) VALUES (3,3,3,2);
INSERT INTO `a_tu_medida`.`detalles_diseños` (`ID`, `id_diseño`, `id_indumentaria`,`cantidad`) VALUES (4,4,2,1);
INSERT INTO `a_tu_medida`.`detalles_diseños` (`ID`, `id_diseño`, `id_indumentaria`,`cantidad`) VALUES (5,5,1,3);
INSERT INTO `a_tu_medida`.`detalles_diseños` (`ID`, `id_diseño`, `id_indumentaria`,`cantidad`) VALUES (6,6,5,1);
INSERT INTO `a_tu_medida`.`detalles_diseños` (`ID`, `id_diseño`, `id_indumentaria`,`cantidad`) VALUES (7,7,6,4);
INSERT INTO `a_tu_medida`.`detalles_diseños` (`ID`, `id_diseño`, `id_indumentaria`,`cantidad`) VALUES (8,8,9,7);
INSERT INTO `a_tu_medida`.`detalles_diseños` (`ID`, `id_diseño`, `id_indumentaria`,`cantidad`) VALUES (9,9,10,2);
INSERT INTO `a_tu_medida`.`detalles_diseños` (`ID`, `id_diseño`, `id_indumentaria`,`cantidad`) VALUES (10,10,11,1);

INSERT INTO `a_tu_medida`.`pedidos_diseños` (`id_pedido`, `id_diseño`) VALUES (1,6);
INSERT INTO `a_tu_medida`.`pedidos_diseños` (`id_pedido`, `id_diseño`) VALUES (2,1);
INSERT INTO `a_tu_medida`.`pedidos_diseños` (`id_pedido`, `id_diseño`) VALUES (3,9);
INSERT INTO `a_tu_medida`.`pedidos_diseños` (`id_pedido`, `id_diseño`) VALUES (4,7);
INSERT INTO `a_tu_medida`.`pedidos_diseños` (`id_pedido`, `id_diseño`) VALUES (5,3);
INSERT INTO `a_tu_medida`.`pedidos_diseños` (`id_pedido`, `id_diseño`) VALUES (6,10);

INSERT INTO `a_tu_medida`.`clientes_pedidos` (`id_cliente`, `id_pedido`) VALUES (1,1);
INSERT INTO `a_tu_medida`.`clientes_pedidos` (`id_cliente`, `id_pedido`) VALUES (10,2);
INSERT INTO `a_tu_medida`.`clientes_pedidos` (`id_cliente`, `id_pedido`) VALUES (2,3);
INSERT INTO `a_tu_medida`.`clientes_pedidos` (`id_cliente`, `id_pedido`) VALUES (6,4);
INSERT INTO `a_tu_medida`.`clientes_pedidos` (`id_cliente`, `id_pedido`) VALUES (2,5);
INSERT INTO `a_tu_medida`.`clientes_pedidos` (`id_cliente`, `id_pedido`) VALUES (8,6);

-- ############################################
-- creacion de vistas

CREATE VIEW detalle_clientes_pedidos AS 
select cp.id_pedido, c.nombre as nombre_cliente , c.apellido as apellido_cliente , c.mail as mail_cliente
from clientes_pedidos as cp
inner join clientes as c on cp.id_cliente = c.id;

CREATE VIEW detalle_diseños_pedidos AS SELECT
d.id_pedido, p.fecha, d.nombre as nombre_diseño, d.precio as precio_diseño 
FROM diseños as d 
INNER JOIN pedidos as p on d.id_pedido = p.id;

CREATE VIEW diseños_diseñadores AS SELECT
pd.id_diseño, d.nombre as nombre_diseñador, d.apellido as apellid_diseñador
from pedidos_diseños as pd
inner join pedidos as p on pd.id_diseño = p.id
inner join diseñadores as d on p.id_diseñador = d.id;

CREATE VIEW diseños_indumentarias AS SELECT
d.nombre as nombre_diseño, i.nombre as tipo_indumentaria
from detalles_diseños as dd
inner join indumentarias as i on i.id = dd.id_indumentaria
inner join diseños as d on dd.id_diseño = d.id;

CREATE VIEW diseñadores_tipos_diseñador AS SELECT
d.id as id_diseñador, d.nombre as nombre_diseñador, d.apellido as apellido_diseñador, td.tipo_diseñador as tipo_diseñador
from diseñadores as d
inner join tipos_diseñador as td on d.id_tipo_diseñador = td.id;

-- ############################################

-- creacion de funciones

-- funcion 1
DELIMITER $$
CREATE FUNCTION `cantidad_pedidos`(cliente INT) 
RETURNS INT
READS SQL DATA

BEGIN
DECLARE cantidad_pedidos INT;
SET cantidad_pedidos = (select count(id_pedido) from a_tu_medida.clientes_pedidos where id_cliente = cliente);
RETURN cantidad_pedidos;
END $$

-- funcion 2
DELIMITER $$
CREATE FUNCTION `sumar_productos`(pedido INT) 
RETURNS INT
READS SQL DATA

BEGIN
DECLARE suma_productos INT;
SET suma_productos = (SELECT sum(precio) FROM a_tu_medida.diseños WHERE id_pedido = pedido);
RETURN suma_productos;
END $$

-- ############################################

-- Creacion de stored procedures

-- Stored procedure 1: hay que pasarle entre commilas simples el nombre del campo y el tipo de ordenamiento (asc o desc)
-- ejemplo para probarlo: CALL `a_tu_medida`.`ordenamiento_tabla_pedidos`('ID', 'desc');
DELIMITER $$
CREATE PROCEDURE `ordenamiento_tabla_pedidos`(IN campo varchar(20) , IN ordenamiento varchar(5))
BEGIN

SET @productos = 'SELECT * FROM pedidos ORDER BY ';
SET @campo = concat(@productos, campo);

IF upper(ordenamiento) = 'DESC' THEN
	SET @query = concat(@campo, ' DESC');
ELSEIF upper(ordenamiento) = 'ASC' THEN
	SET @query = concat(@campo, ' ASC');
ELSE 
	SET @query = '';
END IF;

PREPARE runSQL FROM @query;
EXECUTE runSQL;
DEALLOCATE PREPARE runSQL;
END $$


-- ----------------------------------------------------------------------------

-- Stored Procedure 2: hay que pasarle un id que no se haya usado antes en la tabla de indumentarias
-- insertar un nuevo tipo de indumentaria 
-- ejemplo para probarlo: CALL `a_tu_medida`.`insertar_indumentaria`(12, 'campera pesada');
DELIMITER $$
CREATE PROCEDURE `insertar_indumentaria`(IN id INT, IN nombre VARCHAR(50))
BEGIN

SET @insert = 'INSERT INTO indumentarias (ID,nombre) VALUES (';
SET @query = concat(@insert, id,',', "'",nombre, "'",');');

PREPARE runSQL FROM @query;
EXECUTE runSQL;
DEALLOCATE PREPARE runSQL;

END $$

-- Creacion de triggers

-- Trigger 1 inserta registro en tabla de log cuando se inserta un nuevo registro en la tabla de pedidos
DELIMITER $$
CREATE TABLE log_creacion_pedidos
(

id INT PRIMARY KEY auto_increment,
db_user varchar(50) NOT NULL,
modificacion varchar(100) NOT NULL,
fecha_insert date NOT NULL,
hora_insert time NOT NULL

); $$
DELIMITER $$
CREATE TRIGGER `log_pedidos_insertados`
AFTER INSERT ON `pedidos`
FOR EACH ROW
INSERT INTO `log_creacion_pedidos`(db_user, modificacion, fecha_insert, hora_insert) 
VALUES (USER(), 'insert', CURRENT_DATE(), CURRENT_TIME()); $$

-- para probar 
-- INSERT INTO `a_tu_medida`.`pedidos`(`ID`,`fecha`,`id_cliente`,`id_diseñador`,`id_estilo`) VALUES (8,now(),2,2,1);

-- --------------------------------------------------------------------------------------------------------------

-- Trigger 2 inserta un registro en la tabla de log cuando se elimina un registro de la tabla de clientes
DELIMITER $$
CREATE TABLE log_eliminacion_clientes
(
id INT PRIMARY KEY auto_increment,
db_user varchar(50) NOT NULL,
modificacion varchar(100) NOT NULL,
fecha_eliminacion date NOT NULL,
hora_eliminacion time NOT NULL,
mail_cliente varchar(100) NOT NULL

); $$
DELIMITER $$
CREATE TRIGGER `log_clientes_eliminados`
BEFORE DELETE ON `clientes`
FOR EACH ROW
INSERT INTO `log_eliminacion_clientes`(db_user, modificacion, fecha_eliminacion, hora_eliminacion, mail_cliente) 
VALUES (USER(), 'delete', CURRENT_DATE(), CURRENT_TIME(), OLD.mail);
$$
-- para probar se eliminaron unas foreign keys porque no era posible eliminar el registro de la tabla de clientes por las fk
-- como la consigna era eliminar registros se probo con este script:

ALTER TABLE clientes_pedidos DROP FOREIGN KEY `clientes_pedidos_ibfk_1`;
ALTER TABLE pedidos DROP FOREIGN KEY `pedidos_ibfk_2`;
ALTER TABLE pedidos DROP FOREIGN KEY `pedidos_ibfk_1`;
-- delete from clientes where id = 9

-- ############################################

-- Creacion de transacciones:

-- Entrega Sublenguaje TCL 

-- Tabla 1: elimino un registro de la tabla de clientes

-- en caso de no poder eliminar algun registro por las FK usar el siguiente codigo para eliminarlas

-- ALTER TABLE clientes_pedidos DROP FOREIGN KEY `clientes_pedidos_ibfk_1`;
-- ALTER TABLE pedidos DROP FOREIGN KEY `pedidos_ibfk_2`;
-- ALTER TABLE pedidos DROP FOREIGN KEY `pedidos_ibfk_1`;

-- si no se eliminan es porque ya se eliminaron anteriormente, en ese caso se puede continuar con la eliminacion


START TRANSACTION;

DELETE FROM a_tu_medida.clientes WHERE ID = 9;

-- ROLLBACK;

 COMMIT;


-- Tabla 2: agrego registros a la tabla de estilos

-- se insertan los ids subsiguientes a los que se insertaron con los scripts de insercion de datos

START TRANSACTION;

INSERT INTO `a_tu_medida`.`estilos` (`ID`, `nombre`) VALUES (6,'seis');
INSERT INTO `a_tu_medida`.`estilos` (`ID`, `nombre`) VALUES (7,'siete');
INSERT INTO `a_tu_medida`.`estilos` (`ID`, `nombre`) VALUES (8,'ocho');
INSERT INTO `a_tu_medida`.`estilos` (`ID`, `nombre`) VALUES (9,'nueve');

savepoint parte_1;

INSERT INTO `a_tu_medida`.`estilos` (`ID`, `nombre`) VALUES (10,'diez');
INSERT INTO `a_tu_medida`.`estilos` (`ID`, `nombre`) VALUES (11,'once');
INSERT INTO `a_tu_medida`.`estilos` (`ID`, `nombre`) VALUES (12,'doce');
INSERT INTO `a_tu_medida`.`estilos` (`ID`, `nombre`) VALUES (13,'trece');

savepoint parte_2;


-- RELEASE SAVEPOINT parte_1;

COMMIT;

-- ------------------------------------------