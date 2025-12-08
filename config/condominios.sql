-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-12-2025 a las 22:32:14
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `condominios`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estacionamientos`
--

CREATE TABLE `estacionamientos` (
  `id_estacionamiento` int(11) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `estado` enum('libre','ocupado','reservado') NOT NULL DEFAULT 'libre',
  `id_residente` int(11) DEFAULT NULL,
  `id_visita` int(11) DEFAULT NULL,
  `fecha_reserva` datetime DEFAULT NULL,
  `fecha_liberacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estacionamientos`
--

INSERT INTO `estacionamientos` (`id_estacionamiento`, `codigo`, `estado`, `id_residente`, `id_visita`, `fecha_reserva`, `fecha_liberacion`) VALUES
(1, '1-01', 'libre', NULL, NULL, NULL, NULL),
(2, '1-02', 'libre', NULL, NULL, NULL, NULL),
(3, '1-03', 'libre', NULL, NULL, NULL, NULL),
(4, '1-04', 'libre', NULL, NULL, NULL, NULL),
(5, '1-05', 'libre', NULL, NULL, NULL, NULL),
(6, '1-06', 'libre', NULL, NULL, NULL, NULL),
(7, '1-07', 'libre', NULL, NULL, NULL, NULL),
(8, '1-08', 'libre', NULL, NULL, NULL, NULL),
(9, '2-01', 'libre', NULL, NULL, NULL, NULL),
(10, '2-02', 'libre', NULL, NULL, NULL, NULL),
(11, '2-03', 'libre', NULL, NULL, NULL, NULL),
(12, '2-04', 'libre', NULL, NULL, NULL, NULL),
(13, '2-05', 'libre', NULL, NULL, NULL, NULL),
(14, '2-06', 'libre', NULL, NULL, NULL, NULL),
(15, '2-07', 'libre', NULL, NULL, NULL, NULL),
(16, '2-08', 'libre', NULL, NULL, NULL, NULL),
(17, '3-01', 'libre', NULL, NULL, NULL, NULL),
(18, '3-02', 'libre', NULL, NULL, NULL, NULL),
(19, '3-03', 'libre', NULL, NULL, NULL, NULL),
(20, '3-04', 'libre', NULL, NULL, NULL, NULL),
(21, '3-05', 'libre', NULL, NULL, NULL, NULL),
(22, '3-06', 'libre', NULL, NULL, NULL, NULL),
(23, '3-07', 'libre', NULL, NULL, NULL, NULL),
(24, '3-08', 'libre', NULL, NULL, NULL, NULL),
(25, '4-01', 'libre', NULL, NULL, NULL, NULL),
(26, '4-02', 'libre', NULL, NULL, NULL, NULL),
(27, '4-03', 'libre', NULL, NULL, NULL, NULL),
(28, '4-04', 'libre', NULL, NULL, NULL, NULL),
(29, '4-05', 'libre', NULL, NULL, NULL, NULL),
(30, '4-06', 'libre', NULL, NULL, NULL, NULL),
(31, '4-07', 'libre', NULL, NULL, NULL, NULL),
(32, '4-08', 'libre', NULL, NULL, NULL, NULL),
(33, '5-01', 'libre', NULL, NULL, NULL, NULL),
(34, '5-02', 'libre', NULL, NULL, NULL, NULL),
(35, '5-03', 'libre', NULL, NULL, NULL, NULL),
(36, '5-04', 'libre', NULL, NULL, NULL, NULL),
(37, '5-05', 'libre', NULL, NULL, NULL, NULL),
(38, '5-06', 'libre', NULL, NULL, NULL, NULL),
(39, '5-07', 'libre', NULL, NULL, NULL, NULL),
(40, '5-08', 'libre', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `residentes`
--

CREATE TABLE `residentes` (
  `id_residente` int(11) NOT NULL,
  `rut` varchar(12) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(120) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `torre` varchar(20) DEFAULT NULL,
  `depto` varchar(20) NOT NULL,
  `estado` enum('activo','inactivo') NOT NULL DEFAULT 'activo',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `residentes`
--

INSERT INTO `residentes` (`id_residente`, `rut`, `nombre`, `email`, `telefono`, `torre`, `depto`, `estado`, `created_at`) VALUES
(1, '12.111.222-3', 'Juan Morales', 'juan.morales@ejemplo.cl', '+56911112222', 'A', '301', 'activo', '2025-12-07 01:17:45'),
(2, '17.345.678-9', 'Carla Rivas', 'carla.rivas@ejemplo.cl', '+56922223333', 'B', '14', 'activo', '2025-12-07 01:17:45'),
(3, '16.789.234-5', 'Andrés González', 'andres.gonzalez@ejemplo.cl', '+56933334444', 'A', '1202', 'activo', '2025-12-07 01:17:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` enum('admin','residente') NOT NULL DEFAULT 'residente',
  `id_residente` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `usuario`, `email`, `password`, `rol`, `id_residente`) VALUES
(1, 'admin', 'admin@condominio.cl', '1234', 'admin', NULL),
(2, 'usuario1', 'user1@gmail.com', '1234', 'residente', NULL),
(3, 'usuario2', 'user2@gmail.com', '1234', 'residente', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visita`
--

CREATE TABLE `visita` (
  `id_visita` int(11) NOT NULL,
  `rut` varchar(20) DEFAULT NULL,
  `nombres` varchar(100) DEFAULT NULL,
  `destino` varchar(500) DEFAULT NULL,
  `asunto` varchar(500) DEFAULT NULL,
  `patente` varchar(100) DEFAULT NULL,
  `estacionamiento` varchar(100) DEFAULT NULL,
  `phono` varchar(20) DEFAULT NULL,
  `horaInicio` datetime DEFAULT NULL,
  `horaFin` datetime DEFAULT NULL,
  `fechaIngreso` datetime DEFAULT NULL,
  `estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `visita`
--

INSERT INTO `visita` (`id_visita`, `rut`, `nombres`, `destino`, `asunto`, `patente`, `estacionamiento`, `phono`, `horaInicio`, `horaFin`, `fechaIngreso`, `estado`) VALUES
(1, '12.111.222-3', 'Juan Morales', 'Depto 301', 'Entrega de documentos', 'ABCD-12', 'E01', '+56911112222', '2025-02-10 09:15:00', '2025-02-10 09:45:00', '2025-02-10 09:15:00', 1),
(2, '17.345.678-9', 'Carla Rivas', 'Casa 14', 'Visita familiar', 'FTGH-89', 'E05', '+56922223333', '2025-02-10 10:30:00', '2025-02-10 12:00:00', '2025-02-10 10:30:00', 1),
(3, '16.789.234-5', 'Andrés González', 'Depto 1202', 'Reparación técnica', 'BGTR-45', 'E12', '+56933334444', '2025-02-10 11:00:00', '2025-02-10 11:40:00', '2025-02-10 11:00:00', 1),
(4, '15.567.890-2', 'Marcela Pinto', 'Casa 7', 'Entrega encomienda', 'RTYU-56', 'E03', '+56944445555', '2025-02-11 08:50:00', '2025-02-11 09:10:00', '2025-02-11 08:50:00', 1),
(5, '19.765.432-1', 'Daniel Castro', 'Depto 404', 'Reunión personal', 'PLMN-23', 'E09', '+56955556666', '2025-02-11 15:20:00', '2025-02-11 16:30:00', '2025-02-11 15:20:00', 1),
(6, '14.234.678-3', 'Sofía Alarcón', 'Casa 20', 'Visita médica', 'QWER-98', 'E10', '+56966667777', '2025-02-12 09:00:00', '2025-02-12 10:00:00', '2025-02-12 09:00:00', 1),
(7, '13.907.654-8', 'Tomás Vergara', 'Depto 702', 'Trabajo de mantención', 'ZXCV-34', 'E06', '+56977778888', '2025-02-12 14:00:00', '2025-02-12 15:30:00', '2025-02-12 14:00:00', 1),
(8, '18.456.789-4', 'Valentina Ruiz', 'Casa 5', 'Reunión social', 'JKLO-55', 'E02', '+56988889999', '2025-02-13 18:00:00', '2025-02-13 21:00:00', '2025-02-13 18:00:00', 1),
(9, '11.234.987-6', 'Rodrigo Soto', 'Depto 1101', 'Visita rápida', 'HGFJ-71', 'E07', '+56999990000', '2025-02-13 12:15:00', '2025-02-13 12:40:00', '2025-02-13 12:15:00', 1),
(10, '10.876.543-2', 'Camila Herrera', 'Casa 2', 'Consulta personal', 'MNBC-22', 'E08', '+56910101010', '2025-02-14 16:00:00', '2025-02-14 17:00:00', '2025-02-14 16:00:00', 1),
(11, '12.345.678-9', 'Catalina Caceres', 'Depto 444', 'Visita técnica', 'ABCD-12', 'E02', '+56912345678', '2025-02-20 10:00:00', '2025-02-20 11:00:00', '2025-02-20 09:55:00', 1),
(12, '23.555.666-7', 'María Pérez', 'Depto 502', 'Revisión de mantenimiento', 'EFGH-34', 'E05', '+56922223333', '2025-12-07 14:00:00', '2025-12-07 14:30:00', '2025-12-07 20:12:26', 0),
(13, '12345678-9', 'ivan', 'depto 303', 'medico', 'DFDF-45', 'E30', '+56912345678', '2025-12-08 17:50:00', '2025-12-08 18:00:00', '2025-12-08 16:00:00', 1),
(14, '12.111.222-3', 'Juan Morales', 'Depto 301', 'Entrega de documentos', 'ABCD-12', 'E01', '+56911112222', '2025-02-10 09:15:00', '2025-02-10 09:45:00', '2025-02-10 09:15:00', 1),
(15, '17.345.678-9', 'Carla Rivas', 'Casa 14', 'Visita familiar', 'FTGH-89', 'E05', '+56922223333', '2025-02-10 10:30:00', '2025-02-10 12:00:00', '2025-02-10 10:30:00', 1),
(16, '16.789.234-5', 'Andrés González', 'Depto 1202', 'Reparación técnica', 'BGTR-45', 'E12', '+56933334444', '2025-02-10 11:00:00', '2025-02-10 11:40:00', '2025-02-10 11:00:00', 1),
(17, '15.567.890-2', 'Marcela Pinto', 'Casa 7', 'Entrega encomienda', 'RTYU-56', 'E03', '+56944445555', '2025-02-11 08:50:00', '2025-02-11 09:10:00', '2025-02-11 08:50:00', 1),
(18, '19.765.432-1', 'Daniel Castro', 'Depto 404', 'Reunión personal', 'PLMN-23', 'E09', '+56955556666', '2025-02-11 15:20:00', '2025-02-11 16:30:00', '2025-02-11 15:20:00', 1),
(19, '14.234.678-3', 'Sofía Alarcón', 'Casa 20', 'Visita médica', 'QWER-98', 'E10', '+56966667777', '2025-02-12 09:00:00', '2025-02-12 10:00:00', '2025-02-12 09:00:00', 1),
(20, '13.907.654-8', 'Tomás Vergara', 'Depto 702', 'Trabajo de mantención', 'ZXCV-34', 'E06', '+56977778888', '2025-02-12 14:00:00', '2025-02-12 15:30:00', '2025-02-12 14:00:00', 1),
(21, '18.456.789-4', 'Valentina Ruiz', 'Casa 5', 'Reunión social', 'JKLO-55', 'E02', '+56988889999', '2025-02-13 18:00:00', '2025-02-13 21:00:00', '2025-02-13 18:00:00', 1),
(22, '11.234.987-6', 'Rodrigo Soto', 'Depto 1101', 'Visita rápida', 'HGFJ-71', 'E07', '+56999990000', '2025-02-13 12:15:00', '2025-02-13 12:40:00', '2025-02-13 12:15:00', 1),
(23, '10.876.543-2', 'Camila Herrera', 'Casa 2', 'Consulta personal', 'MNBC-22', 'E08', '+56910101010', '2025-02-14 16:00:00', '2025-02-14 17:00:00', '2025-02-14 16:00:00', 1),
(24, '12.345.678-9', 'Catalina Caceres', 'Depto 444', 'Visita técnica', 'ABCD-12', 'E02', '+56912345678', '2025-02-20 10:00:00', '2025-02-20 11:00:00', '2025-02-20 09:55:00', 1),
(25, '12.345.678-0', 'Fernanda Caceres', 'Depto 444', 'Visita técnica', 'ABCD-13', 'E02', '+56912345679', '2025-02-20 10:00:00', '2025-02-20 11:00:00', '2025-02-20 09:55:00', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `estacionamientos`
--
ALTER TABLE `estacionamientos`
  ADD PRIMARY KEY (`id_estacionamiento`),
  ADD UNIQUE KEY `codigo` (`codigo`),
  ADD KEY `fk_est_residente` (`id_residente`),
  ADD KEY `fk_est_visita` (`id_visita`);

--
-- Indices de la tabla `residentes`
--
ALTER TABLE `residentes`
  ADD PRIMARY KEY (`id_residente`),
  ADD UNIQUE KEY `rut` (`rut`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_residentes_depto` (`depto`),
  ADD KEY `idx_residentes_nombre` (`nombre`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `visita`
--
ALTER TABLE `visita`
  ADD PRIMARY KEY (`id_visita`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `estacionamientos`
--
ALTER TABLE `estacionamientos`
  MODIFY `id_estacionamiento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `residentes`
--
ALTER TABLE `residentes`
  MODIFY `id_residente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `visita`
--
ALTER TABLE `visita`
  MODIFY `id_visita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estacionamientos`
--
ALTER TABLE `estacionamientos`
  ADD CONSTRAINT `fk_est_residente` FOREIGN KEY (`id_residente`) REFERENCES `residentes` (`id_residente`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_est_visita` FOREIGN KEY (`id_visita`) REFERENCES `visita` (`id_visita`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
