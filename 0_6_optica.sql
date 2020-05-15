-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-05-2020 a las 11:44:10
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `0.6_optica`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE `client` (
  `id_client` int(9) NOT NULL,
  `correu` varchar(50) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `adreça` varchar(20) NOT NULL,
  `telefon` int(9) NOT NULL,
  `dataRegistre` date NOT NULL,
  `recomanador` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `client`
--

INSERT INTO `client` (`id_client`, `correu`, `nom`, `adreça`, `telefon`, `dataRegistre`, `recomanador`) VALUES
(1, 'client1@correu.cat', 'Joan Gomez', 'Avinguda Diagonal', 666666666, '2020-04-01', 0),
(2, 'client2@correu.cat', 'Maria Rodriguez', 'Gran Via ', 777777777, '2020-04-02', NULL),
(3, 'client3@correu.cat', 'Marc Gonzalez', 'Carrer Indústria', 888888888, '2020-04-13', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveidor`
--

CREATE TABLE `proveidor` (
  `nif` varchar(9) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `telefon` int(9) NOT NULL,
  `fax` int(9) DEFAULT NULL,
  `carrer` varchar(20) NOT NULL,
  `numero` int(9) NOT NULL,
  `pis` int(3) DEFAULT NULL,
  `porta` varchar(3) DEFAULT NULL,
  `ciutat` varchar(20) NOT NULL,
  `codiPostal` int(5) NOT NULL,
  `pais` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveidor`
--

INSERT INTO `proveidor` (`nif`, `nom`, `telefon`, `fax`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `codiPostal`, `pais`) VALUES
('44444444W', 'Proveïdor 1', 666666666, 999999999, 'Carrer Major', 1, 2, 'B', 'Barcelona', 8014, 'Espanya');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ulleres`
--

CREATE TABLE `ulleres` (
  `id_ulleres` int(9) NOT NULL,
  `marca` varchar(20) NOT NULL,
  `gradVidreDret` float(4,2) NOT NULL,
  `gradVidreEsq` float(4,2) NOT NULL,
  `tipusMuntura` set('flotant','pasta','metàl·lica') NOT NULL,
  `colorMuntura` varchar(20) NOT NULL,
  `colorVidreDret` varchar(20) NOT NULL,
  `colorVidreEsq` varchar(20) NOT NULL,
  `preu` float(7,2) NOT NULL,
  `proveidor` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ulleres`
--

INSERT INTO `ulleres` (`id_ulleres`, `marca`, `gradVidreDret`, `gradVidreEsq`, `tipusMuntura`, `colorMuntura`, `colorVidreDret`, `colorVidreEsq`, `preu`, `proveidor`) VALUES
(123456789, 'Gucchi', 2.50, 0.50, 'pasta', 'verd', 'blau', 'groc', 1500.35, '44444444W');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venda`
--

CREATE TABLE `venda` (
  `ulleres` int(9) NOT NULL,
  `client` int(9) NOT NULL,
  `id_empleat` int(9) NOT NULL,
  `numFactura` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `venda`
--

INSERT INTO `venda` (`ulleres`, `client`, `id_empleat`, `numFactura`) VALUES
(123456789, 1, 666666661, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Indices de la tabla `proveidor`
--
ALTER TABLE `proveidor`
  ADD PRIMARY KEY (`nif`);

--
-- Indices de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`id_ulleres`,`proveidor`),
  ADD KEY `proveidor` (`proveidor`);

--
-- Indices de la tabla `venda`
--
ALTER TABLE `venda`
  ADD PRIMARY KEY (`ulleres`,`client`,`numFactura`),
  ADD KEY `client` (`client`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD CONSTRAINT `ulleres_ibfk_1` FOREIGN KEY (`proveidor`) REFERENCES `proveidor` (`nif`);

--
-- Filtros para la tabla `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`ulleres`) REFERENCES `ulleres` (`id_ulleres`),
  ADD CONSTRAINT `venda_ibfk_2` FOREIGN KEY (`client`) REFERENCES `client` (`id_client`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
