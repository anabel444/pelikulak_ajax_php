-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-10-2019 a las 20:13:28
-- Versión del servidor: 10.1.19-MariaDB
-- Versión de PHP: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `2aw3_peli`
--
CREATE DATABASE IF NOT EXISTS `2aw3_peli` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `2aw3_peli`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `spAllActores`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spAllActores` ()  NO SQL
SELECT *
FROM actores$$

DROP PROCEDURE IF EXISTS `spAllDirectores`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spAllDirectores` ()  NO SQL
SELECT * 
FROM directores$$

DROP PROCEDURE IF EXISTS `spAllFilms`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spAllFilms` ()  NO SQL
SELECT *
FROM peliculas$$

DROP PROCEDURE IF EXISTS `spAllPeliActores`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spAllPeliActores` ()  NO SQL
select * from peliculas_actores$$

DROP PROCEDURE IF EXISTS `spDeletePelicula`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeletePelicula` (IN `pId` INT)  NO SQL
delete  from peliculas
where peliculas.idPelicula=pId$$

DROP PROCEDURE IF EXISTS `spFindIdActor`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindIdActor` (IN `pIdActor` INT)  NO SQL
select * from actores 
where actores.idActor=pIdActor$$

DROP PROCEDURE IF EXISTS `spFindIdPelicula`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindIdPelicula` (IN `pIdPelicula` INT)  NO SQL
select *
from peliculas
where peliculas.idPelicula=pIdPelicula$$

DROP PROCEDURE IF EXISTS `spInsertPelicula`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertPelicula` (IN `titulo` VARCHAR(50), IN `anio` INT, IN `director` INT, IN `cartel` VARCHAR(100))  NO SQL
insert into peliculas 
(peliculas.TituloPelicula,peliculas.Anio,peliculas.Director,peliculas.cartel)
                       
values(titulo,anio,director,cartel)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actores`
--

DROP TABLE IF EXISTS `actores`;
CREATE TABLE `actores` (
  `idActor` int(11) NOT NULL,
  `NombreActor` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `actores`
--

INSERT INTO `actores` (`idActor`, `NombreActor`) VALUES
(1, 'Leonardo Di Caprio'),
(2, 'Robert de Niro'),
(3, 'Marlon Brando'),
(4, 'Kate Winslet'),
(5, 'Morgan Freeman'),
(6, 'Hilary Swank'),
(7, 'Gloria Stuart'),
(8, 'Clint Eastwood'),
(9, 'Al Pacino'),
(10, 'Jennifer Lawrence'),
(11, 'Javier Cámara'),
(12, 'Jude Law');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `directores`
--

DROP TABLE IF EXISTS `directores`;
CREATE TABLE `directores` (
  `idDirector` int(11) NOT NULL,
  `NombreDirector` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `directores`
--

INSERT INTO `directores` (`idDirector`, `NombreDirector`) VALUES
(1, 'Clint Eastwood'),
(2, 'James Cameron'),
(3, 'Francis Ford Coppola'),
(4, 'John Lasseter'),
(5, 'Ken Loach'),
(6, 'Alejandro Amenabar');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas`
--

DROP TABLE IF EXISTS `peliculas`;
CREATE TABLE `peliculas` (
  `idPelicula` int(11) NOT NULL,
  `TituloPelicula` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Anio` int(11) NOT NULL,
  `Director` int(11) NOT NULL,
  `cartel` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `peliculas`
--

INSERT INTO `peliculas` (`idPelicula`, `TituloPelicula`, `Anio`, `Director`, `cartel`) VALUES
(1, 'Titanic', 1997, 2, 'http://ddt27jcyr70k6.cloudfront.net/2012/03/titanic-cart-b.jpg'),
(3, 'Million dollar baby', 2004, 1, 'http://bit.ly/2jEfidz'),
(4, 'Toy Story', 1995, 4, 'http://bit.ly/2ia4J1C'),
(6, 'El padrino III', 1977, 3, 'https://i.pinimg.com/originals/15/d8/a4/15d8a4999916d1d45b41dbeb564a5f97.jpg'),
(10, 'I, Daniel Blake', 2016, 5, 'http://bit.ly/2AqVr9C'),
(11, 'Sin Perdon', 1992, 1, 'https://images-na.ssl-images-amazon.com/images/I/A1YeNn08QmL._SY445_.jpg'),
(12, 'INTERESTELAR', 2005, 1, 'https://www.explicacion.net/wp-content/uploads/2018/05/interestelar-pelicula-explicacion.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas_actores`
--

DROP TABLE IF EXISTS `peliculas_actores`;
CREATE TABLE `peliculas_actores` (
  `idPelicula` int(11) NOT NULL,
  `idActor` int(11) NOT NULL,
  `Protagonista` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `peliculas_actores`
--

INSERT INTO `peliculas_actores` (`idPelicula`, `idActor`, `Protagonista`) VALUES
(1, 1, 0),
(1, 2, 0),
(1, 5, 0),
(3, 5, 0),
(3, 6, 1),
(3, 8, 1),
(6, 5, 0),
(6, 7, 1),
(10, 7, 0),
(10, 8, 0),
(11, 9, 0),
(11, 10, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `actores`
--
ALTER TABLE `actores`
  ADD PRIMARY KEY (`idActor`);

--
-- Indices de la tabla `directores`
--
ALTER TABLE `directores`
  ADD PRIMARY KEY (`idDirector`);

--
-- Indices de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD PRIMARY KEY (`idPelicula`),
  ADD KEY `Director` (`Director`);

--
-- Indices de la tabla `peliculas_actores`
--
ALTER TABLE `peliculas_actores`
  ADD PRIMARY KEY (`idPelicula`,`idActor`),
  ADD KEY `idActor` (`idActor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `actores`
--
ALTER TABLE `actores`
  MODIFY `idActor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `directores`
--
ALTER TABLE `directores`
  MODIFY `idDirector` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `peliculas`
--
ALTER TABLE `peliculas`
  MODIFY `idPelicula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `peliculas`
--
ALTER TABLE `peliculas`
  ADD CONSTRAINT `peliculas_ibfk_1` FOREIGN KEY (`Director`) REFERENCES `directores` (`idDirector`);

--
-- Filtros para la tabla `peliculas_actores`
--
ALTER TABLE `peliculas_actores`
  ADD CONSTRAINT `peliculas_actores_ibfk_1` FOREIGN KEY (`idPelicula`) REFERENCES `peliculas` (`idPelicula`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `peliculas_actores_ibfk_2` FOREIGN KEY (`idActor`) REFERENCES `actores` (`idActor`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
