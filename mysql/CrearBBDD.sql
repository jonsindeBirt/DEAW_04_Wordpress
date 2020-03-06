CREATE DATABASE `deaw-db`;

CREATE TABLE `deaw-db`.`tienda` (
`cod` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`nombre` VARCHAR( 100 ) NOT NULL ,
`tlf` VARCHAR( 13 ) NULL
) ENGINE = INNODB;

CREATE TABLE `deaw-db`.`producto` (
`cod` VARCHAR( 12 ) NOT NULL ,
`nombre` VARCHAR( 200 ) NULL ,
`nombre_corto` VARCHAR( 50 ) NOT NULL ,
`descripcion` TEXT NULL ,
`PVP` DECIMAL( 10, 2 ) NOT NULL ,
`familia` VARCHAR( 6 ) NOT NULL ,
PRIMARY KEY ( `cod` ) ,
INDEX ( `familia` ) ,
UNIQUE ( `nombre_corto` )
) ENGINE = INNODB;

CREATE TABLE `deaw-db`.`familia` (
`cod` VARCHAR( 6 ) NOT NULL ,
`nombre` VARCHAR( 200 ) NOT NULL ,
PRIMARY KEY ( `cod` )
) ENGINE = INNODB;

CREATE TABLE `deaw-db`.`stock` (
`producto` VARCHAR( 12 ) NOT NULL ,
`tienda` INT NOT NULL ,
`unidades` INT NOT NULL ,
PRIMARY KEY ( `producto` , `tienda` )
) ENGINE = INNODB;

-- Creamos las claves foráneas
ALTER TABLE `deaw-db`.`producto`
ADD CONSTRAINT `producto_ibfk_1`
FOREIGN KEY (`familia`) REFERENCES `familia` (`cod`)
ON UPDATE CASCADE;

ALTER TABLE `deaw-db`.`stock`
ADD CONSTRAINT `stock_ibfk_2` 
FOREIGN KEY (`tienda`) REFERENCES `tienda` (`cod`)
ON UPDATE CASCADE,
ADD CONSTRAINT `stock_ibfk_1` 
FOREIGN KEY (`producto`) REFERENCES `producto` (`cod`)
ON UPDATE CASCADE;


-- GRANT ALL ON `deaw-db`.*
-- TO `user`;