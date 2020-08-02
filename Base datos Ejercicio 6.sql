-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.13-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para cul d'ampolla
CREATE DATABASE IF NOT EXISTS `cul d'ampolla` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `cul d'ampolla`;

-- Volcando estructura para tabla cul d'ampolla.clientes
CREATE TABLE IF NOT EXISTS `clientes` (
  `cliente_id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_nombre` varchar(100) DEFAULT NULL,
  `cliente_apellido` varchar(100) DEFAULT NULL,
  `cliente_direccion` varchar(250) DEFAULT NULL,
  `cliente_teléfono` varchar(45) DEFAULT NULL,
  `cliente_email` varchar(100) DEFAULT NULL,
  `cliente_fecha_registro` datetime DEFAULT current_timestamp(),
  `cliente_recomendado_por` int(11) NOT NULL,
  PRIMARY KEY (`cliente_id`),
  KEY `cliente_recomendado_por` (`cliente_recomendado_por`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla cul d'ampolla.dirección
CREATE TABLE IF NOT EXISTS `dirección` (
  `dirección_id` int(11) NOT NULL AUTO_INCREMENT,
  `dirección_calle` varchar(100) DEFAULT NULL,
  `dirección_numero` int(11) DEFAULT NULL,
  `dirección_piso` int(11) NOT NULL,
  `dirección_puerta` int(11) NOT NULL,
  `dirección_cuidad` varchar(45) DEFAULT NULL,
  `dirección_cp` int(11) DEFAULT NULL,
  `dirección_país` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`dirección_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla cul d'ampolla.empleados
CREATE TABLE IF NOT EXISTS `empleados` (
  `empleado_id` int(11) NOT NULL AUTO_INCREMENT,
  `empleado_nombre` varchar(45) DEFAULT NULL,
  `empleado_apellido` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`empleado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla cul d'ampolla.gafas
CREATE TABLE IF NOT EXISTS `gafas` (
  `gafa_id` int(11) NOT NULL AUTO_INCREMENT,
  `gafa_marca` int(11) DEFAULT NULL,
  `gafa_graduación_der` varchar(45) DEFAULT NULL,
  `gafa_graduación_izq` varchar(45) DEFAULT NULL,
  `gafa_montura` varchar(45) DEFAULT NULL,
  `gafa_color` varchar(45) DEFAULT NULL,
  `gafa_colorVidrio_der` varchar(45) DEFAULT NULL,
  `gafa_colorVidrio_izq` varchar(45) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  PRIMARY KEY (`gafa_id`),
  KEY `gafa_marca` (`gafa_marca`),
  CONSTRAINT `gafas_marca_id` FOREIGN KEY (`gafa_marca`) REFERENCES `marcas` (`marca_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla cul d'ampolla.marcas
CREATE TABLE IF NOT EXISTS `marcas` (
  `marca_id` int(11) NOT NULL AUTO_INCREMENT,
  `marca_nombre` varchar(100) DEFAULT NULL,
  `marca_proveedor` int(11) DEFAULT NULL,
  PRIMARY KEY (`marca_id`),
  KEY `marca_proveedor` (`marca_proveedor`),
  CONSTRAINT `marcas_proveedor_id` FOREIGN KEY (`marca_proveedor`) REFERENCES `proveedores` (`proveedor_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla cul d'ampolla.proveedores
CREATE TABLE IF NOT EXISTS `proveedores` (
  `proveedor_id` int(11) NOT NULL AUTO_INCREMENT,
  `proveedor_nombre` varchar(100) DEFAULT NULL,
  `proveedor_dirección` int(11) DEFAULT NULL,
  `proveedor_teléfono` varchar(45) DEFAULT NULL,
  `proveedor_fax` varchar(45) DEFAULT NULL,
  `proveedor_nif` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`proveedor_id`),
  KEY `proveedor_dirección` (`proveedor_dirección`),
  CONSTRAINT `proveedores_dirección_id` FOREIGN KEY (`proveedor_dirección`) REFERENCES `dirección` (`dirección_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla cul d'ampolla.ventas
CREATE TABLE IF NOT EXISTS `ventas` (
  `venta_id` int(11) NOT NULL AUTO_INCREMENT,
  `venta_gafas` int(11) DEFAULT NULL,
  `venta_empleado` int(11) DEFAULT NULL,
  PRIMARY KEY (`venta_id`),
  KEY `venta_gafas` (`venta_gafas`),
  KEY `venta_empleado` (`venta_empleado`),
  CONSTRAINT `ventas_empleado` FOREIGN KEY (`venta_empleado`) REFERENCES `empleados` (`empleado_id`),
  CONSTRAINT `ventas_gafa_id` FOREIGN KEY (`venta_gafas`) REFERENCES `gafas` (`gafa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- La exportación de datos fue deseleccionada.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
