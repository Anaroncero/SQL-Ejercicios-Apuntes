-- --------------------------------------------------------
-- Host:                         bbdd.dlsi.ua.es
-- Versión del servidor:         5.1.66-0+squeeze1 - (Debian)
-- SO del servidor:              debian-linux-gnu
-- HeidiSQL Versión:             7.0.0.4320
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para profesores
DROP DATABASE IF EXISTS `profesores`;
CREATE DATABASE IF NOT EXISTS `profesores` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `profesores`;


-- Volcando estructura para tabla profesores.asignaturas
DROP TABLE IF EXISTS `asignaturas`;
CREATE TABLE IF NOT EXISTS `asignaturas` (
  `codigo` char(5) NOT NULL DEFAULT '',
  `descripcion` varchar(35) DEFAULT NULL,
  `creditos` decimal(3,1) DEFAULT NULL,
  `creditosp` decimal(3,1) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla profesores.asignaturas: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `asignaturas` DISABLE KEYS */;
INSERT INTO `asignaturas` (`codigo`, `descripcion`, `creditos`, `creditosp`) VALUES
	('DGBD', 'DISEÑO Y GESTION DE BASES DE DATOS', 6.0, 3.0),
	('FBD', 'FUNDAMENTOS DE LAS BASES DE DATOS', 6.0, 1.5),
	('FP', 'FUNDAMENTOS DE LA PROGRAMACION', 9.0, 4.5),
	('HI', 'HISTORIA DE LA INFORMATICA', 4.5, NULL),
	('PC', 'PROGRAMACION CONCURRENTE', 6.0, 1.5);
/*!40000 ALTER TABLE `asignaturas` ENABLE KEYS */;


-- Volcando estructura para tabla profesores.coordinadores
DROP TABLE IF EXISTS `coordinadores`;
CREATE TABLE IF NOT EXISTS `coordinadores` (
  `dni` varchar(10) NOT NULL DEFAULT '',
  `nombre` varchar(40) DEFAULT NULL,
  `dpto` char(4) DEFAULT NULL,
  `asig` char(5) DEFAULT NULL,
  PRIMARY KEY (`dni`),
  KEY `fk_coor_asig` (`asig`),
  CONSTRAINT `fk_coor_asig` FOREIGN KEY (`asig`) REFERENCES `asignaturas` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla profesores.coordinadores: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `coordinadores` DISABLE KEYS */;
INSERT INTO `coordinadores` (`dni`, `nombre`, `dpto`, `asig`) VALUES
	('55777666', 'AGAPITO CIFUENTES', 'DLSI', 'FP'),
	('66555444', 'ROMUALDO GOMEZ', 'DLSI', 'HI'),
	('99222111', 'CATURLO PEREZ', 'DLSI', NULL);
/*!40000 ALTER TABLE `coordinadores` ENABLE KEYS */;


-- Volcando estructura para tabla profesores.imparte
DROP TABLE IF EXISTS `imparte`;
CREATE TABLE IF NOT EXISTS `imparte` (
  `dni` varchar(10) NOT NULL DEFAULT '',
  `asignatura` char(5) NOT NULL DEFAULT '',
  PRIMARY KEY (`dni`,`asignatura`),
  KEY `imparte_fk_2asignatura` (`asignatura`),
  CONSTRAINT `imparte_fk_2asignatura` FOREIGN KEY (`asignatura`) REFERENCES `asignaturas` (`codigo`),
  CONSTRAINT `imparte_fk_2profesores` FOREIGN KEY (`dni`) REFERENCES `profesores` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla profesores.imparte: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `imparte` DISABLE KEYS */;
INSERT INTO `imparte` (`dni`, `asignatura`) VALUES
	('21111222', 'DGBD'),
	('21111222', 'FBD'),
	('21333444', 'PC');
/*!40000 ALTER TABLE `imparte` ENABLE KEYS */;


-- Volcando estructura para tabla profesores.prepara
DROP TABLE IF EXISTS `prepara`;
CREATE TABLE IF NOT EXISTS `prepara` (
  `dni` varchar(10) NOT NULL DEFAULT '',
  `asignatura` char(5) NOT NULL DEFAULT '',
  PRIMARY KEY (`dni`,`asignatura`),
  KEY `prepara_fk_2asignatura` (`asignatura`),
  CONSTRAINT `prepara_fk_2asignatura` FOREIGN KEY (`asignatura`) REFERENCES `asignaturas` (`codigo`),
  CONSTRAINT `prepara_fk_2profesores` FOREIGN KEY (`dni`) REFERENCES `profesores` (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla profesores.prepara: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `prepara` DISABLE KEYS */;
INSERT INTO `prepara` (`dni`, `asignatura`) VALUES
	('21111222', 'DGBD'),
	('21333444', 'DGBD'),
	('21333444', 'FBD'),
	('21111222', 'FP'),
	('21333444', 'FP'),
	('21333444', 'HI'),
	('21333444', 'PC');
/*!40000 ALTER TABLE `prepara` ENABLE KEYS */;


-- Volcando estructura para tabla profesores.profesores
DROP TABLE IF EXISTS `profesores`;
CREATE TABLE IF NOT EXISTS `profesores` (
  `dni` varchar(10) NOT NULL DEFAULT '',
  `nombre` varchar(40) DEFAULT NULL,
  `categoria` char(4) DEFAULT NULL,
  `ingreso` date DEFAULT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla profesores.profesores: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `profesores` DISABLE KEYS */;
INSERT INTO `profesores` (`dni`, `nombre`, `categoria`, `ingreso`) VALUES
	('21111222', 'EVA GOMEZ', 'TEU', '1993-10-01'),
	('21222333', 'MANUEL PALOMAR', 'TEU', '1989-06-16'),
	('21333444', 'RAFAEL ROMERO', 'ASO6', '1992-06-16');
/*!40000 ALTER TABLE `profesores` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
