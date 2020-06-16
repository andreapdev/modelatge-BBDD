-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-06-2020 a las 13:15:14
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
-- Estructura de tabla para la tabla `brand`
--

CREATE TABLE `brand` (
  `id_brand` int(9) NOT NULL,
  `name` varchar(20) NOT NULL,
  `supplier` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `brand`
--

INSERT INTO `brand` (`id_brand`, `name`, `supplier`) VALUES
(111, 'Marca1', '000000001'),
(222, 'Marca2', '000000001'),
(333, 'Marca3', '000000002'),
(444, 'Marca4', '000000002');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE `client` (
  `id_client` int(9) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(20) NOT NULL,
  `address` varchar(20) NOT NULL,
  `phoneNumber` int(9) NOT NULL,
  `registrationDate` date NOT NULL,
  `recommender` int(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `client`
--

INSERT INTO `client` (`id_client`, `email`, `name`, `address`, `phoneNumber`, `registrationDate`, `recommender`) VALUES
(100000000, 'marta@mail.com', 'Marta', 'Travessera de les Co', 888888888, '2020-06-16', NULL),
(200000000, 'pedro@mail.com', 'Pedro', 'Calle Mayor', 999999999, '2020-06-17', 100000000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employee`
--

CREATE TABLE `employee` (
  `id_employee` int(9) NOT NULL,
  `name` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `employee`
--

INSERT INTO `employee` (`id_employee`, `name`, `lastName`) VALUES
(123456789, 'Paula', 'Sanz'),
(789456123, 'Nuria', 'Egidos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eyeglasses`
--

CREATE TABLE `eyeglasses` (
  `id_model` int(9) NOT NULL,
  `brand` int(9) NOT NULL,
  `prescpriptionRight` float(4,2) NOT NULL,
  `prescriptionLeft` float(4,2) NOT NULL,
  `frameType` set('flotant','pasta','metàl·lica') NOT NULL,
  `frameCol` varchar(20) NOT NULL,
  `colorRight` varchar(20) NOT NULL,
  `colorLeft` varchar(20) NOT NULL,
  `price` float(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `eyeglasses`
--

INSERT INTO `eyeglasses` (`id_model`, `brand`, `prescpriptionRight`, `prescriptionLeft`, `frameType`, `frameCol`, `colorRight`, `colorLeft`, `price`) VALUES
(555555555, 111, 0.65, 0.20, 'pasta', 'azul', 'amarillo', 'azul', 300.00),
(888888888, 333, 0.32, 0.90, 'metàl·lica', 'dorado', 'verde', 'verde', 500.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoice`
--

CREATE TABLE `invoice` (
  `client` int(9) NOT NULL,
  `employee` int(9) NOT NULL,
  `id_invoice` int(9) NOT NULL,
  `total` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `invoice`
--

INSERT INTO `invoice` (`client`, `employee`, `id_invoice`, `total`) VALUES
(100000000, 789456123, 100000000, 300),
(200000000, 123456789, 200000000, 800);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invoicedetail`
--

CREATE TABLE `invoicedetail` (
  `id_invoice` int(9) NOT NULL,
  `line` int(9) NOT NULL,
  `item` int(9) NOT NULL,
  `itemNumber` int(9) NOT NULL,
  `subtotal` int(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `invoicedetail`
--

INSERT INTO `invoicedetail` (`id_invoice`, `line`, `item`, `itemNumber`, `subtotal`) VALUES
(100000000, 1, 555555555, 1, 300),
(200000000, 1, 555555555, 1, 300),
(200000000, 2, 888888888, 1, 500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` varchar(9) NOT NULL,
  `name` varchar(20) NOT NULL,
  `phoneNumber` int(9) NOT NULL,
  `fax` int(9) DEFAULT NULL,
  `streetAddress` varchar(20) NOT NULL,
  `numberAddress` int(9) NOT NULL,
  `floorAddress` int(3) DEFAULT NULL,
  `doorAddress` varchar(3) DEFAULT NULL,
  `cityAddress` varchar(20) NOT NULL,
  `postCodeAddress` int(5) NOT NULL,
  `countryAddress` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `name`, `phoneNumber`, `fax`, `streetAddress`, `numberAddress`, `floorAddress`, `doorAddress`, `cityAddress`, `postCodeAddress`, `countryAddress`) VALUES
('000000001', 'Proveedor1', 666666666, NULL, 'Gran Via', 20, NULL, NULL, 'Barcelona', 8014, 'España'),
('000000002', 'Proveedor2', 777777777, NULL, 'Plaza Cataluña', 5, NULL, NULL, 'Barcelona', 8001, 'España');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id_brand`),
  ADD KEY `FK_supplier` (`supplier`);

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`),
  ADD KEY `FK_recommender` (`recommender`);

--
-- Indices de la tabla `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id_employee`);

--
-- Indices de la tabla `eyeglasses`
--
ALTER TABLE `eyeglasses`
  ADD PRIMARY KEY (`id_model`) USING BTREE,
  ADD KEY `FK_brand` (`brand`) USING BTREE;

--
-- Indices de la tabla `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id_invoice`) USING BTREE,
  ADD KEY `FK_client` (`client`) USING BTREE,
  ADD KEY `FK_employee` (`employee`) USING BTREE;

--
-- Indices de la tabla `invoicedetail`
--
ALTER TABLE `invoicedetail`
  ADD PRIMARY KEY (`id_invoice`,`line`),
  ADD KEY `FK_id_invoice` (`id_invoice`),
  ADD KEY `FK_item` (`item`) USING BTREE;

--
-- Indices de la tabla `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `brand`
--
ALTER TABLE `brand`
  ADD CONSTRAINT `brand_ibfk_1` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`id_supplier`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `eyeglasses`
--
ALTER TABLE `eyeglasses`
  ADD CONSTRAINT `eyeglasses_ibfk_1` FOREIGN KEY (`brand`) REFERENCES `brand` (`id_brand`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`client`) REFERENCES `client` (`id_client`),
  ADD CONSTRAINT `invoice_ibfk_2` FOREIGN KEY (`employee`) REFERENCES `employee` (`id_employee`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `invoicedetail`
--
ALTER TABLE `invoicedetail`
  ADD CONSTRAINT `invoicedetail_ibfk_1` FOREIGN KEY (`id_invoice`) REFERENCES `invoice` (`id_invoice`),
  ADD CONSTRAINT `invoicedetail_ibfk_2` FOREIGN KEY (`item`) REFERENCES `eyeglasses` (`id_model`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
