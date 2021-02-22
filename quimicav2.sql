-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-02-2021 a las 00:39:46
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `quimica`
--
CREATE DATABASE IF NOT EXISTS `quimica` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `quimica`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_articulos`
--

DROP TABLE IF EXISTS `t_articulos`;
CREATE TABLE `t_articulos` (
  `nombre_articulo` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `autor` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `año` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_compuestos`
--

DROP TABLE IF EXISTS `t_compuestos`;
CREATE TABLE `t_compuestos` (
  `id_compuesto` int(11) NOT NULL,
  `nombre_compuesto` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `nombrecientif` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_compuesto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_insectos`
--

DROP TABLE IF EXISTS `t_insectos`;
CREATE TABLE `t_insectos` (
  `id_insecto` int(11) NOT NULL,
  `nombre_insecto` varchar(150) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_insectoscompuestos`
--

DROP TABLE IF EXISTS `t_insectoscompuestos`;
CREATE TABLE `t_insectoscompuestos` (
  `id_insecto` int(11) NOT NULL,
  `id_compuesto` int(11) NOT NULL,
  `perioprotec` int(11) DEFAULT NULL,
  `porcerepele` float DEFAULT NULL,
  `porcentlanding` float DEFAULT NULL,
  `porcentbiting` float DEFAULT NULL,
  `porceconcetracion` float DEFAULT NULL,
  `tiempotest` float DEFAULT NULL,
  `logp` float DEFAULT NULL,
  `logs` float DEFAULT NULL,
  `nombre_articulo` varchar(500) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_tipocompuesto`
--

DROP TABLE IF EXISTS `t_tipocompuesto`;
CREATE TABLE `t_tipocompuesto` (
  `id_tipo` int(11) NOT NULL,
  `tipo` varchar(150) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `t_articulos`
--
ALTER TABLE `t_articulos`
  ADD PRIMARY KEY (`nombre_articulo`);

--
-- Indices de la tabla `t_compuestos`
--
ALTER TABLE `t_compuestos`
  ADD PRIMARY KEY (`id_compuesto`),
  ADD KEY `tipo_compuesto` (`tipo_compuesto`);

--
-- Indices de la tabla `t_insectos`
--
ALTER TABLE `t_insectos`
  ADD PRIMARY KEY (`id_insecto`);

--
-- Indices de la tabla `t_insectoscompuestos`
--
ALTER TABLE `t_insectoscompuestos`
  ADD PRIMARY KEY (`id_insecto`,`id_compuesto`,`nombre_articulo`),
  ADD KEY `id_insecto` (`id_insecto`),
  ADD KEY `id_compuesto` (`id_compuesto`),
  ADD KEY `articulo_ref` (`nombre_articulo`);

--
-- Indices de la tabla `t_tipocompuesto`
--
ALTER TABLE `t_tipocompuesto`
  ADD PRIMARY KEY (`id_tipo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `t_compuestos`
--
ALTER TABLE `t_compuestos`
  MODIFY `id_compuesto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_insectos`
--
ALTER TABLE `t_insectos`
  MODIFY `id_insecto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `t_tipocompuesto`
--
ALTER TABLE `t_tipocompuesto`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `t_compuestos`
--
ALTER TABLE `t_compuestos`
  ADD CONSTRAINT `t_compuestos_ibfk_1` FOREIGN KEY (`tipo_compuesto`) REFERENCES `t_tipocompuesto` (`id_tipo`);

--
-- Filtros para la tabla `t_insectoscompuestos`
--
ALTER TABLE `t_insectoscompuestos`
  ADD CONSTRAINT `t_insectoscompuestos_ibfk_1` FOREIGN KEY (`id_insecto`) REFERENCES `t_insectos` (`id_insecto`),
  ADD CONSTRAINT `t_insectoscompuestos_ibfk_2` FOREIGN KEY (`id_compuesto`) REFERENCES `t_compuestos` (`id_compuesto`),
  ADD CONSTRAINT `t_insectoscompuestos_ibfk_3` FOREIGN KEY (`nombre_articulo`) REFERENCES `t_articulos` (`nombre_articulo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
