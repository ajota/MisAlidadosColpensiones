-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-07-2019 a las 00:08:13
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.2.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `msa_misaliados`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `msa_datos_maestros`
--

CREATE TABLE `msa_datos_maestros` (
  `IdDatoMaestro` int(11) NOT NULL,
  `IdMaestro` int(11) NOT NULL,
  `NombreDato` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `msa_datos_maestros`
--

INSERT INTO `msa_datos_maestros` (`IdDatoMaestro`, `IdMaestro`, `NombreDato`) VALUES
(1, 1, 'Celular'),
(2, 1, 'Fijo'),
(3, 2, 'Masculino'),
(4, 2, 'Femenino'),
(5, 3, 'Cedula de ciudadania'),
(6, 3, 'Cedula de extranjeria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `msa_independientes`
--

CREATE TABLE `msa_independientes` (
  `IdIndependientes` int(11) NOT NULL,
  `TipoDocumento` int(11) NOT NULL,
  `NumeroDocumento` varchar(15) NOT NULL,
  `Nombres` tinytext NOT NULL,
  `Apellidos` tinytext NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `Oficio` tinytext NOT NULL,
  `IngresosMensualesAproximados` varchar(45) NOT NULL,
  `TipoTelefono` int(11) NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Correo` tinytext NOT NULL,
  `Sexo` int(11) NOT NULL,
  `Aprobado` bit(1) NOT NULL,
  `UltimaActualizacion` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `msa_independientes`
--

INSERT INTO `msa_independientes` (`IdIndependientes`, `TipoDocumento`, `NumeroDocumento`, `Nombres`, `Apellidos`, `FechaNacimiento`, `Oficio`, `IngresosMensualesAproximados`, `TipoTelefono`, `Telefono`, `Correo`, `Sexo`, `Aprobado`, `UltimaActualizacion`) VALUES
(1, 1, '1128406999', 'Anderson Jovanny', 'Velez Alvarez', '0000-00-00', 'Desarrollador', '2000000', 2, '3186555658', 'ajota06@yopmail.com', 1, b'0', '0000-00-00 00:00:00');

--
-- Disparadores `msa_independientes`
--
DELIMITER $$
CREATE TRIGGER `msa_independientes_AFTER_UPDATE` AFTER UPDATE ON `msa_independientes` FOR EACH ROW BEGIN

 UPDATE `msa_misaliados`.`msa_independientes` SET UltimaActualizacion = NOW() WHERE IdIndependiente = last_insert_id();
 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `msa_maestros`
--

CREATE TABLE `msa_maestros` (
  `IdMaestro` int(11) NOT NULL,
  `Nombre` tinytext,
  `Estado` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `msa_maestros`
--

INSERT INTO `msa_maestros` (`IdMaestro`, `Nombre`, `Estado`) VALUES
(1, 'TiposTelefono', b'1'),
(2, 'Sexos', b'1'),
(3, 'TiposDocumento', b'1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `msa_datos_maestros`
--
ALTER TABLE `msa_datos_maestros`
  ADD PRIMARY KEY (`IdDatoMaestro`),
  ADD UNIQUE KEY `IdDatoMaestro_UNIQUE` (`IdDatoMaestro`),
  ADD KEY `IdMaestro_idx` (`IdMaestro`);

--
-- Indices de la tabla `msa_independientes`
--
ALTER TABLE `msa_independientes`
  ADD PRIMARY KEY (`IdIndependientes`),
  ADD UNIQUE KEY `IdIndependientes_UNIQUE` (`IdIndependientes`),
  ADD KEY `TipoTelefono_idx` (`TipoTelefono`),
  ADD KEY `TipoDocumento` (`TipoDocumento`);

--
-- Indices de la tabla `msa_maestros`
--
ALTER TABLE `msa_maestros`
  ADD PRIMARY KEY (`IdMaestro`),
  ADD UNIQUE KEY `IdMaestro_UNIQUE` (`IdMaestro`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `msa_datos_maestros`
--
ALTER TABLE `msa_datos_maestros`
  MODIFY `IdDatoMaestro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `msa_independientes`
--
ALTER TABLE `msa_independientes`
  MODIFY `IdIndependientes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `msa_maestros`
--
ALTER TABLE `msa_maestros`
  MODIFY `IdMaestro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `msa_datos_maestros`
--
ALTER TABLE `msa_datos_maestros`
  ADD CONSTRAINT `IdMaestro` FOREIGN KEY (`IdMaestro`) REFERENCES `msa_maestros` (`IdMaestro`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `msa_independientes`
--
ALTER TABLE `msa_independientes`
  ADD CONSTRAINT `TipoDocumento` FOREIGN KEY (`TipoDocumento`) REFERENCES `msa_datos_maestros` (`IdDatoMaestro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `TipoTelefono` FOREIGN KEY (`TipoTelefono`) REFERENCES `msa_datos_maestros` (`IdDatoMaestro`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
