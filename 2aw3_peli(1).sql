-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-10-2021 a las 13:03:20
-- Versión del servidor: 10.4.21-MariaDB
-- Versión de PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `spAllActores` ()  NO SQL
SELECT *
FROM actores$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spAllDirectors` ()  NO SQL
SELECT * 
FROM directores$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spAllFilms` ()  NO SQL
SELECT *
FROM peliculas$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spAllPeliActores` ()  NO SQL
select * from peliculas_actores$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeletePelicula` (IN `pId` INT)  NO SQL
delete  from peliculas
where peliculas.idPelicula=pId$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindIdActor` (IN `pIdActor` INT)  NO SQL
select * from actores 
where actores.idActor=pIdActor$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindIdDirector` (IN `pIdDirector` INT)  NO SQL
select * from directores 
where directores.idDirector=pIdDirector$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindIdPelicula` (IN `pIdPelicula` INT)  NO SQL
select *
from peliculas
where peliculas.idPelicula=pIdPelicula$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindUser` (IN `pName` VARCHAR(15), IN `pPassword` VARCHAR(10))  NO SQL
select * from users where users.name=pName
and users.password=pPassword$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindUserByUsername` (IN `pUser` VARCHAR(100))  NO SQL
BEGIN
SELECT users.*  FROM users WHERE users.name=pUser;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertPelicula` (IN `titulo` VARCHAR(50), IN `anio` INT, IN `director` INT, IN `cartel` VARCHAR(100))  NO SQL
insert into peliculas 
(peliculas.TituloPelicula,peliculas.Anio,peliculas.Director,peliculas.cartel)
                       
values(titulo,anio,director,cartel)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdatePelicula` (IN `pIdPelicula` INT, IN `pTituloPelicula` VARCHAR(200), IN `pAnio` INT, IN `pDirector` INT, IN `pCartel` VARCHAR(200))  NO SQL
update peliculas
set TituloPelicula=pTituloPelicula,
Anio=pAnio,
Director=pDirector,
cartel=pCartel
where idPelicula=pIdPelicula$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `actores`
--

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

CREATE TABLE `peliculas` (
  `idPelicula` int(11) NOT NULL,
  `TituloPelicula` varchar(30) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Anio` int(11) DEFAULT NULL,
  `Director` int(11) DEFAULT NULL,
  `cartel` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `peliculas`
--

INSERT INTO `peliculas` (`idPelicula`, `TituloPelicula`, `Anio`, `Director`, `cartel`) VALUES
(1, 'Titanic', 1997, 2, 'http://ddt27jcyr70k6.cloudfront.net/2012/03/titanic-cart-b.jpg'),
(6, 'El padrino III', 1977, 6, 'https://i.pinimg.com/originals/15/d8/a4/15d8a4999916d1d45b41dbeb564a5f97.jpg'),
(10, 'I, Daniel Blake', 2016, 5, 'http://bit.ly/2AqVr9C'),
(18, 'dsads', 444, 2, 'view/img/default.png'),
(23, 'dfs', 444, 2, 'view/img/default.png'),
(24, 'dsads', 333333, 2, 'view/img/default.png'),
(26, 'c', 333, 5, 'view/img/default.png'),
(35, 'dsads', 555, 2, 'view/img/default.png'),
(36, '', 444, 2, 'view/img/default.png'),
(37, '', 444, 2, ''),
(38, 'dsd', 443333, 2, 'view/img/default.png'),
(39, 'rtert', 44, 2, ''),
(44, 'gdfg', 22, 2, ' bbbb  '),
(45, 'gdfg', 22, 2, ' bbbb  '),
(46, 'gdfg', 6666, 2, ' bbbb  '),
(55, 'nmbv', 3, 3, ''),
(56, 'rer', 2, 2, ''),
(57, 'hgh', 2, 1, ''),
(58, 'tret', 2, 2, ''),
(59, 'dfds', 2, 3, ''),
(60, 'hbvv', 2, 2, ''),
(61, 'dfds', 3, 2, ''),
(62, 'dsa', 2, 3, ''),
(63, 'sdads', 22, 2, 'view/img/default.png'),
(65, '', 22, 2, ''),
(66, '', 333, 2, ''),
(67, 'rwerew', 444, 5, 'view/img/default.png'),
(69, 'fgdgfdg', 66, 1, ''),
(70, 'ascvcxv', 55, 1, ''),
(71, 'aaaa', 11, 2, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `peliculas_actores`
--

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
(6, 5, 0),
(6, 7, 1),
(10, 7, 0),
(10, 8, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `idUser` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`idUser`, `name`, `password`, `type`) VALUES
(1, 'admin', '1234', 1),
(2, 'leire', '1234', 2);

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
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`idUser`);

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
  MODIFY `idPelicula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
