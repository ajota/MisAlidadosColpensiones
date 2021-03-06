-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-08-2019 a las 00:02:11
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

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_independientes` ()  BEGIN

	SELECT
		IdIndependientes,
		dm.NombreDato TipoDocumento,
		NumeroDocumento,
		Nombres,
		Apellidos,
		FechaNacimiento,
		Oficio,
		IngresosMensualesAproximados,
		dm1.NombreDato TipoTelefono,
		Telefono,
		Correo,
		dm2.NombreDato Sexo,
		Aprobado
	FROM msa_independientes mi
	JOIN msa_datos_maestros dm  on dm.IdDatoMaestro = mi.TipoDocumento
	JOIN msa_datos_maestros dm1 on dm1.IdDatoMaestro = mi.TipoTelefono
	JOIN msa_datos_maestros dm2 on dm2.IdDatoMaestro = mi.Sexo;

END$$

DELIMITER ;

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
(1, 5, '1128406999', 'Anderson Jovanny', 'Velez Alvarez', '0000-00-00', 'Desarrollador', '2000000', 1, '3186555658', 'ajota06@yopmail.com', 3, b'1', '0000-00-00 00:00:00'),
(2, 5, 'jhgfgfhgf', 'jhgfjhgffjhg', 'jhgfhjfhgf', '2019-07-25', 'jhgfhgf', '5464564', 1, '321564', 'jhjgf@jhgfjhgf.com', 3, b'0', '0000-00-00 00:00:00'),
(3, 5, '123456789', 'Ander', 'Velez', '2019-08-18', 'Test Labor', '800000', 1, '3126545787', 'sadsa@hdasd.com', 3, b'0', '0000-00-00 00:00:00'),
(4, 5, '123456789', 'Ander', 'Velez', '2019-08-18', 'Test Labor', '800000', 1, '3126545787', 'sadsa@hdasd.com', 3, b'0', '0000-00-00 00:00:00'),
(5, 5, '564464', 'iuhgjhg', 'jhgjhgjhg', '2019-08-12', 'khgjhgjhg', '11456', 1, '5445645643251321', 'jhgfgfjf@kjahk.com', 3, b'0', '0000-00-00 00:00:00'),
(6, 5, '56454564', 'gjhgfhgf', 'jhgfhjgfhg', '2019-08-12', 'kjhgkjhgjhg', '514564564', 1, '5613213214', 'jhfjhgfhgf', 3, b'0', '0000-00-00 00:00:00'),
(7, 5, '454454', 'jhggjhg', 'jhgkjhg', '2019-08-05', 'nbvccnbvc', '564564564', 1, '56454', 'jgfjhgfhgf', 3, b'0', '0000-00-00 00:00:00'),
(8, 5, '45645454', 'khgfhgfhg', 'jhgfhgf', '2019-08-19', 'lkhggkjhg', '145456464', 2, '564564564', 'mnvvnbvmnbvmbv', 3, b'0', '0000-00-00 00:00:00'),
(9, 6, 'hvhgfhhfhgfhgf', 'lkjhggjh', 'jhgjhg', '2019-08-10', 'gjhgjkg', '464564', 1, '564564654654', 'kjggkjghgjkghg', 3, b'0', '0000-00-00 00:00:00'),
(10, 5, '321321', 'jhgffj', 'hgfjhgfhgf', '2019-08-24', 'hfhjfhgf', '4545564654', 1, '31514564564', 'jhgghgvkjhghg', 3, b'0', '0000-00-00 00:00:00'),
(11, 5, '564564564', 'kjhgjhgfkjhg', 'kjhghgk', '2019-08-10', 'hgfjhgfhgfj', '5645641561', 1, '1345644', 'jhghgfhgfjgf', 3, b'0', '0000-00-00 00:00:00'),
(12, 5, '564564', 'khgfhfjhgf', 'jhgfjhfh', '2019-08-11', 'jhkgfgkjhg', '54564564', 1, '45646512156', 'lkhkjhlkjhlkj', 3, b'0', '0000-00-00 00:00:00'),
(13, 5, '56454165', 'jhgkjhgjhg', 'kjhgkjhg', '2019-08-10', 'hgfdshfdhgfd', '5414564', 1, '544646', 'kjgfjhgfhgf', 4, b'0', '0000-00-00 00:00:00'),
(14, 5, '+6144564', 'hgfdhgfdhgfd', 'hgfdghdg', '2019-08-10', 'jhgfjhgfjhgf', '544564564', 1, '5445656116564', 'hgfjhfhgfjhg', 3, b'0', '0000-00-00 00:00:00'),
(15, 5, '5456454564', 'kjhkjhlkjh', 'lkjhkjlh', '2019-08-04', 'uygkjhgjhkg', '3245433511', 1, '5486415149', 'fjhfhgfhgf', 3, b'0', '0000-00-00 00:00:00'),
(16, 5, '654654564564', 'jkhgkgjhg', 'kjhgjhg', '2019-08-14', 'hgfhgfdhgfd', '65644654654', 1, '5645664564', 'lkmnglgljhgjhg', 3, b'0', '0000-00-00 00:00:00');

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
  ADD KEY `Sexo_idx` (`Sexo`);

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
  MODIFY `IdIndependientes` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
