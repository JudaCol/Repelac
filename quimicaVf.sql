-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-02-2021 a las 12:31:42
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

CREATE TABLE `t_articulos` (
  `nombre_articulo` varchar(500) COLLATE utf8_spanish_ci NOT NULL,
  `autor` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `año` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `t_articulos`
--

INSERT INTO `t_articulos` (`nombre_articulo`, `autor`, `año`) VALUES
('Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes', 'Abdelkrim Amer', 2006);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_compuestos`
--

CREATE TABLE `t_compuestos` (
  `id_compuesto` int(11) NOT NULL,
  `nombre_compuesto` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `nombrecientif` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `tipo_compuesto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `t_compuestos`
--

INSERT INTO `t_compuestos` (`id_compuesto`, `nombre_compuesto`, `nombrecientif`, `tipo_compuesto`) VALUES
(1, 'Citronella', 'Cymbopogon winterianus', 1),
(2, 'Rosewood', 'Aniba rosaeodora', 1),
(3, 'Lavender', 'Lavandula angustifolia', 1),
(4, 'Camphor', 'Cinnamomum camphora', 1),
(5, 'Catnip', 'Nepeta cataria', 1),
(6, 'Geranium', 'Pelargonium graveolens', 1),
(7, 'Thyme', 'Thymus serpyllum', 1),
(8, 'Eucalyptus', 'Eucalyptus globulus', 1),
(9, 'Jasmine', 'Jasminum grandiflorum', 1),
(10, 'Broad-leaved eucalyptus', 'Eucalyptus dives', 1),
(11, 'Lemongrass', 'Cymbopogon citratus', 1),
(12, 'Lemon-scented eucalyptus', 'Eucalyptus citriodora', 1),
(13, 'Fichtennadel', 'Picea excelsa', 1),
(14, 'Amyris', 'Amyris balsamifera', 1),
(15, 'Lemon', 'Citrus limon', 1),
(16, 'Narrow-leaved eucalyptus', 'Eucalyptus radiata', 1),
(17, 'Carotin oil', 'Glycina soja', 1),
(18, 'Cedarwood', 'Juniperus virginiana', 1),
(19, 'Frankincense', 'Boswellia carteri', 1),
(20, 'Dill', 'Anethum graveolens', 1),
(21, 'Myrtle', 'Myrtus communis', 1),
(22, 'Chamomile', 'Anthemis nobilis', 1),
(23, 'Cinnamon', 'Cinnamomum zeylanicum', 1),
(24, 'Juniper', 'Juniperus communis', 1),
(25, 'Sage', 'Salvia sclarea', 1),
(26, 'Peppermint', 'Mentha piperita', 1),
(27, 'Basil', 'Ocimum basilicum', 1),
(28, 'Cajeput', 'Melaleuca leucadendron', 1),
(29, 'Soya bean', 'Glycina max', 1),
(30, 'Rosemary', 'Rosmarinus officinalis', 1),
(31, 'Niaouli', 'Melaleuca quinquenervia', 1),
(32, 'Olive', 'Olea europaea', 1),
(33, 'Black pepper', 'Piper nigrum', 1),
(34, 'Verbena', 'Lippia citriodora', 1),
(35, 'Tagetes', 'Tagetes minuta', 1),
(36, 'Violet', 'Viola odorata', 1),
(37, 'Sandalwood', 'Santalum album', 1),
(38, 'Litsea', 'Litsea cubeba', 1),
(39, 'Helichrysum', 'Helichrysum italicum', 1),
(40, 'Galbanum', 'Ferula galbaniflua', 1),
(41, 'Chamomile', 'Chamaemelum nobile', 1),
(42, 'Bayrepe I 20% in complex solvent', '', 1),
(43, 'DEET 20% in complex solvent', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_insectos`
--

CREATE TABLE `t_insectos` (
  `id_insecto` int(11) NOT NULL,
  `nombre_insecto` varchar(150) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `t_insectos`
--

INSERT INTO `t_insectos` (`id_insecto`, `nombre_insecto`) VALUES
(1, 'Aedes'),
(2, 'Anopheles'),
(3, 'Culex');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_insectoscompuestos`
--

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

CREATE TABLE `t_tipocompuesto` (
  `id_tipo` int(11) NOT NULL,
  `tipo` varchar(150) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `t_tipocompuesto`
--

INSERT INTO `t_tipocompuesto` (`id_tipo`, `tipo`) VALUES
(1, 'Aceite Escencial'),
(2, 'Molecula');

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
  MODIFY `id_compuesto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `t_insectos`
--
ALTER TABLE `t_insectos`
  MODIFY `id_insecto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `t_tipocompuesto`
--
ALTER TABLE `t_tipocompuesto`
  MODIFY `id_tipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
