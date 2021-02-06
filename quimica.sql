-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-02-2021 a las 23:16:39
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
  `nombrecientif` varchar(150) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `t_compuestos`
--

INSERT INTO `t_compuestos` (`id_compuesto`, `nombre_compuesto`, `nombrecientif`) VALUES
(1, 'Citronella', 'Cymbopogon winterianus'),
(2, 'Rosewood', 'Aniba rosaeodora'),
(3, 'Lavender', 'Lavandula angustifolia'),
(4, 'Camphor', 'Cinnamomum camphora'),
(5, 'Catnip', 'Nepeta cataria'),
(6, 'Geranium', 'Pelargonium graveolens'),
(7, 'Thyme', 'Thymus serpyllum'),
(8, 'Eucalyptus', 'Eucalyptus globulus'),
(9, 'Jasmine', 'Jasminum grandiflorum'),
(10, 'Broad-leaved eucalyptus', 'Eucalyptus dives'),
(11, 'Lemongrass', 'Cymbopogon citratus'),
(12, 'Lemon-scented eucalyptus', 'Eucalyptus citriodora'),
(13, 'Fichtennadel', 'Picea excelsa'),
(14, 'Amyris', 'Amyris balsamifera'),
(15, 'Lemon', 'Citrus limon'),
(16, 'Narrow-leaved eucalyptus', 'Eucalyptus radiata'),
(17, 'Carotin oil', 'Glycina soja'),
(18, 'Cedarwood', 'Juniperus virginiana'),
(19, 'Frankincense', 'Boswellia carteri'),
(20, 'Dill', 'Anethum graveolens'),
(21, 'Myrtle', 'Myrtus communis'),
(22, 'Chamomile', 'Anthemis nobilis'),
(23, 'Cinnamon', 'Cinnamomum zeylanicum'),
(24, 'Juniper', 'Juniperus communis'),
(25, 'Sage', 'Salvia sclarea'),
(26, 'Peppermint', 'Mentha piperita'),
(27, 'Basil', 'Ocimum basilicum'),
(28, 'Cajeput', 'Melaleuca leucadendron'),
(29, 'Soya bean', 'Glycina max'),
(30, 'Rosemary', 'Rosmarinus officinalis'),
(31, 'Niaouli', 'Melaleuca quinquenervia'),
(32, 'Olive', 'Olea europaea'),
(33, 'Black pepper', 'Piper nigrum'),
(34, 'Verbena', 'Lippia citriodora'),
(35, 'Tagetes', 'Tagetes minuta'),
(36, 'Violet', 'Viola odorata'),
(37, 'Sandalwood', 'Santalum album'),
(38, 'Litsea', 'Litsea cubeba'),
(39, 'Helichrysum', 'Helichrysum italicum'),
(40, 'Galbanum', 'Ferula galbaniflua'),
(41, 'Chamomile', 'Chamaemelum nobile'),
(42, 'Bayrepe I 20% in complex solvent', ''),
(43, 'DEET 20% in complex solvent', '');

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
  `perioprotec` int(11) NOT NULL,
  `porcerepele` float NOT NULL,
  `porcentlanding` float NOT NULL,
  `porcentbiting` float NOT NULL,
  `nombre_articulo` varchar(500) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `t_insectoscompuestos`
--

INSERT INTO `t_insectoscompuestos` (`id_insecto`, `id_compuesto`, `perioprotec`, `porcerepele`, `porcentlanding`, `porcentbiting`, `nombre_articulo`) VALUES
(1, 1, 120, 75.7, 2.4, 1.2, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(1, 2, 90, 89.2, 0.8, 0.8, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(1, 3, 180, 24.3, 10.4, 0.8, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(1, 4, 150, 32.4, 8.8, 1.2, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(1, 5, 480, 83.8, 2, 0.4, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(1, 6, 150, 78.4, 2.4, 0.8, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(1, 7, 150, 56.7, 4.8, 1.6, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(1, 8, 60, 56.7, 5.2, 1.2, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(1, 9, 270, 13.5, 12, 0.8, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(1, 10, 210, 18.9, 11.2, 0.8, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(1, 11, 180, 70.3, 3.2, 1.2, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(1, 12, 150, 59.4, 5.2, 0.8, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(1, 13, 120, 21.6, 10.4, 1.2, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(1, 14, 240, 29.7, 9.6, 0.8, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(1, 15, 90, 67.6, 3.6, 1.2, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(1, 16, 150, 64.9, 4.4, 0.8, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(1, 17, 180, 16.2, 10.8, 1.6, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(1, 42, 360, 45.9, 9.6, 0.8, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(1, 43, 50, 50, 50, 50, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(2, 1, 480, 52.4, 3.6, 0.4, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(2, 2, 390, 4.8, 6.4, 1.6, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(2, 3, 480, 80.9, 1.6, 0, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(2, 4, 480, 42.8, 4.4, 0.4, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(2, 5, 480, 100, 0, 0, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(2, 6, 480, 61.9, 0, 0, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(2, 7, 450, 33.3, 4.4, 1.2, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(2, 8, 330, 28.6, 4.8, 1.2, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(2, 9, 480, 100, 0, 0, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(2, 10, 480, 38.1, 4.8, 0.4, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(2, 11, 480, 100, 0, 0, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(2, 12, 480, 52.4, 4, 0, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(2, 13, 0, 19, 6, 0.8, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(2, 14, 480, 100, 0, 0, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(2, 15, 420, 9.5, 6.8, 0.8, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(2, 16, 480, 100, 0, 0, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(2, 17, 480, 9.5, 0, 0, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(3, 1, 480, 100, 0, 0, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(3, 2, 480, 85.7, 0.4, 0, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(3, 3, 480, 85.7, 0.4, 0, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(3, 4, 480, 57.1, 1.2, 0, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(3, 5, 480, 100, 0, 0, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(3, 6, 480, 100, 0, 0, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(3, 7, 480, 100, 0, 0, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(3, 8, 480, 100, 0, 0, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(3, 9, 480, 100, 0, 0, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(3, 10, 480, 100, 0, 0, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(3, 11, 480, 100, 0, 0, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(3, 12, 480, 100, 0, 0, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(3, 13, 480, 85.7, 0.4, 0, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(3, 14, 480, 100, 0, 0, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(3, 15, 480, 100, 0, 0, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes'),
(3, 16, 480, 100, 0, 0, 'Repellency effect of forty-one essential oils against Aedes, Anopheles, and Culex mosquitoes');

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
  ADD PRIMARY KEY (`id_compuesto`);

--
-- Indices de la tabla `t_insectos`
--
ALTER TABLE `t_insectos`
  ADD PRIMARY KEY (`id_insecto`);

--
-- Indices de la tabla `t_insectoscompuestos`
--
ALTER TABLE `t_insectoscompuestos`
  ADD PRIMARY KEY (`id_insecto`,`id_compuesto`),
  ADD KEY `id_insecto` (`id_insecto`),
  ADD KEY `id_compuesto` (`id_compuesto`),
  ADD KEY `articulo_ref` (`nombre_articulo`);

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
-- Restricciones para tablas volcadas
--

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
