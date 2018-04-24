-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 24-04-2018 a las 17:18:55
-- Versión del servidor: 5.7.22-0ubuntu0.16.04.1
-- Versión de PHP: 7.0.28-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `food`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `details`
--

CREATE TABLE `details` (
  `order_id` int(11) NOT NULL,
  `food_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `subtotal` decimal(10,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `details`
--

INSERT INTO `details` (`order_id`, `food_id`, `quantity`, `subtotal`) VALUES
(1, 1, 3, '60'),
(1, 2, 1, '15'),
(1, 5, 1, '19'),
(2, 2, 1, '15'),
(2, 5, 1, '19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `food`
--

CREATE TABLE `food` (
  `id` int(11) NOT NULL,
  `name` varchar(30) COLLATE utf8_spanish2_ci NOT NULL,
  `price` decimal(10,0) NOT NULL,
  `description` varchar(70) COLLATE utf8_spanish2_ci NOT NULL,
  `img` varchar(150) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `food`
--

INSERT INTO `food` (`id`, `name`, `price`, `description`, `img`) VALUES
(1, 'Arroz con Pato', '20', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Facere, hic!', 'https://cde.peru.com//ima/0/1/6/7/3/1673254/611x458/gastronomia.jpg'),
(2, 'Arroz con Pollo', '15', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Facere, hic!', 'https://cde.peru.com//ima/0/1/6/7/3/1673254/611x458/gastronomia.jpg'),
(3, 'Arroz Chaufa', '11', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Facere, hic!', 'https://cde.peru.com//ima/0/1/6/7/3/1673254/611x458/gastronomia.jpg'),
(4, 'Ají de Gallina', '10', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Facere, hic!', 'https://cde.peru.com//ima/0/1/6/7/3/1673254/611x458/gastronomia.jpg'),
(5, 'Causa Ferreñafana', '19', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Facere, hic!', 'https://cde.peru.com//ima/0/1/6/7/3/1673254/611x458/gastronomia.jpg'),
(6, 'Tallarines Rojos', '8', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Facere, hic!', 'https://cde.peru.com//ima/0/1/6/7/3/1673254/611x458/gastronomia.jpg'),
(7, 'Pollo a la brasa', '38', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Facere, hic!', 'https://cde.peru.com//ima/0/1/6/7/3/1673254/611x458/gastronomia.jpg'),
(8, 'Cabrito a la Norteña', '20', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Facere, hic!', 'https://cde.peru.com//ima/0/1/6/7/3/1673254/611x458/gastronomia.jpg'),
(9, 'Arroz a la Cubana', '10', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Facere, hic!', 'https://cde.peru.com//ima/0/1/6/7/3/1673254/611x458/gastronomia.jpg'),
(10, 'Pizza Americana', '19', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Facere, hic!', 'https://cde.peru.com//ima/0/1/6/7/3/1673254/611x458/gastronomia.jpg'),
(11, 'Pizza Hawaina', '22', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Facere, hic!', 'https://cde.peru.com//ima/0/1/6/7/3/1673254/611x458/gastronomia.jpg'),
(12, 'Pizza Royal', '24', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Facere, hic!', 'https://cde.peru.com//ima/0/1/6/7/3/1673254/611x458/gastronomia.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `table` int(11) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(15) COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `order`
--

INSERT INTO `order` (`id`, `table`, `total`, `user_id`, `status`) VALUES
(1, 3, '94', 1, 'completado'),
(2, 5, '34', 1, 'eliminado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `password` varchar(15) COLLATE utf8_spanish2_ci NOT NULL,
  `type` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `name`, `password`, `type`) VALUES
(1, 'admin', '12345', 0),
(2, 'user', '12345', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`order_id`,`food_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `food_id` (`food_id`);

--
-- Indices de la tabla `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `food`
--
ALTER TABLE `food`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `details`
--
ALTER TABLE `details`
  ADD CONSTRAINT `details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `details_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`);

--
-- Filtros para la tabla `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
