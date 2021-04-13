
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


--
-- Base de datos: `meli_api_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alert`
--

CREATE TABLE `alert` (
  `id` int NOT NULL,
  `server_id` int NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;

--
-- Volcado de datos para la tabla `alert`
--

INSERT INTO `alert` (`id`, `server_id`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'err1', '2021-03-28 23:19:03', '2021-03-28 23:19:03'),
(2, 2, 'err2', '2021-03-28 23:19:03', '2021-03-28 23:19:03'),
(3, 1, 'err2', '2021-04-11 18:34:18', '2021-04-11 18:34:18'),
(4, 2, 'err3', '2021-04-11 18:34:18', '2021-04-11 18:34:18'),
(5, 1, 'err3', '2021-04-11 18:35:02', '2021-04-11 18:35:02'),
(6, 2, 'err4', '2021-04-11 18:35:02', '2021-04-11 18:35:02'),
(7, 1, 'err4', '2021-04-11 18:38:39', '2021-04-11 18:38:39'),
(8, 2, 'err5', '2021-04-11 18:38:39', '2021-04-11 18:38:39'),
(9, 1, 'err5', '2021-04-11 18:39:07', '2021-04-11 18:39:07'),
(10, 2, 'err6', '2021-04-11 18:39:07', '2021-04-11 18:39:07'),
(11, 3, 'err2', '2021-04-11 18:34:18', '2021-04-11 18:34:18'),
(12, 3, 'err3', '2021-04-11 18:34:18', '2021-04-11 18:34:18'),
(13, 3, 'err3', '2021-04-11 18:35:02', '2021-04-11 18:35:02'),
(14, 3, 'err4', '2021-04-11 18:35:02', '2021-04-11 18:35:02'),
(15, 3, 'err4', '2021-04-11 18:38:39', '2021-04-11 18:38:39'),
(16, 3, 'err5', '2021-04-11 18:38:39', '2021-04-11 18:38:39'),
(17, 3, 'err5', '2021-04-11 18:39:07', '2021-04-11 18:39:07'),
(18, 3, 'err6', '2021-04-11 18:39:07', '2021-04-11 18:39:07'),
(19, 4, 'err2', '2021-04-11 18:34:18', '2021-04-11 18:34:18'),
(20, 3, 'err3', '2021-04-11 18:34:18', '2021-04-11 18:34:18'),
(21, 4, 'err3', '2021-04-11 18:35:02', '2021-04-11 18:35:02'),
(22, 4, 'err4', '2021-04-11 18:35:02', '2021-04-11 18:35:02'),
(23, 3, 'err4', '2021-04-11 18:38:39', '2021-04-11 18:38:39'),
(24, 4, 'err5', '2021-04-11 18:38:39', '2021-04-11 18:38:39'),
(25, 3, 'err5', '2021-04-11 18:39:07', '2021-04-11 18:39:07'),
(26, 3, 'err6', '2021-04-11 18:39:07', '2021-04-11 18:39:07'),
(27, 4, 'err2', '2021-04-11 18:34:18', '2021-04-11 18:34:18'),
(28, 1, 'err3', '2021-04-11 18:34:18', '2021-04-11 18:34:18'),
(29, 1, 'err3', '2021-04-11 18:35:02', '2021-04-11 18:35:02'),
(30, 1, 'err4', '2021-04-11 18:35:02', '2021-04-11 18:35:02'),
(31, 1, 'err4', '2021-04-11 18:38:39', '2021-04-11 18:38:39'),
(32, 4, 'err5', '2021-04-11 18:38:39', '2021-04-11 18:38:39'),
(33, 1, 'err5', '2021-04-11 18:39:07', '2021-04-11 18:39:07'),
(34, 3, 'err6', '2021-04-11 18:39:07', '2021-04-11 18:39:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `server`
--

CREATE TABLE `server` (
  `id` int NOT NULL,
  `server` varchar(100) NOT NULL,
  `server_type` int NOT NULL,
  `enabled` int NOT NULL DEFAULT '1',
  `deleted` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;

--
-- Volcado de datos para la tabla `server`
--

INSERT INTO `server` (`id`, `server`, `server_type`, `enabled`, `deleted`) VALUES
(1, 'Server1', 1, 1, 0),
(2, 'Server2', 2, 1, 0),
(3, 'Server3', 1, 1, 0),
(4, 'Server4', 1, 1, 0),
(5, 'Server5', 1, 1, 0),
(6, 'Server6', 1, 1, 0),
(7, 'Server7', 1, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `server_type`
--

CREATE TABLE `server_type` (
  `id` int NOT NULL,
  `type` varchar(100) CHARACTER SET utf8 NOT NULL,
  `enabled` int NOT NULL,
  `deleted` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;

--
-- Volcado de datos para la tabla `server_type`
--

INSERT INTO `server_type` (`id`, `type`, `enabled`, `deleted`) VALUES
(1, 'onprem', 1, 0),
(2, 'virtual', 1, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alert`
--
ALTER TABLE `alert`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `server`
--
ALTER TABLE `server`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `server_type`
--
ALTER TABLE `server_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alert`
--
ALTER TABLE `alert`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `server`
--
ALTER TABLE `server`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `server_type`
--
ALTER TABLE `server_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

