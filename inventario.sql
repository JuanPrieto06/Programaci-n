-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-05-2025 a las 05:26:49
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inventario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ajusteinventario`
--

CREATE TABLE `ajusteinventario` (
  `id_Ajuste` int(20) NOT NULL,
  `id_Producto` int(20) NOT NULL,
  `cantidad_ajustada` int(20) NOT NULL,
  `Motivo` varchar(30) NOT NULL,
  `Fecha` date NOT NULL,
  `id_Usuario` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriaproducto`
--

CREATE TABLE `categoriaproducto` (
  `id_Categoria` int(20) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historialprecio`
--

CREATE TABLE `historialprecio` (
  `id_Historial` int(20) NOT NULL,
  `Precio_Anterior` decimal(30,0) NOT NULL,
  `Precio_Nuevo` decimal(30,0) NOT NULL,
  `Fecha_Cambio` date NOT NULL,
  `Comentario` text NOT NULL,
  `id_Producto` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientoinventario`
--

CREATE TABLE `movimientoinventario` (
  `id_Movimiento` int(20) NOT NULL,
  `id_Producto` int(20) NOT NULL,
  `Tipo` varchar(20) NOT NULL,
  `Cantidad` int(100) NOT NULL,
  `Fecha_Movimiento` date NOT NULL,
  `Observaciones` text NOT NULL,
  `id_Usuario` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_producto` int(20) NOT NULL,
  `Nombre` text NOT NULL,
  `Referencia` int(20) NOT NULL,
  `Descripción` varchar(100) NOT NULL,
  `Precio_Unitario` decimal(30,0) NOT NULL,
  `id_Categoria` int(20) NOT NULL,
  `id_Proveedor` int(20) NOT NULL,
  `Fecha_Registro` date NOT NULL,
  `Estado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productoubicacion`
--

CREATE TABLE `productoubicacion` (
  `id_Producto` int(20) NOT NULL,
  `id_Ubicacion` int(20) NOT NULL,
  `cantidad_en_ubicacion` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `id_Proveedor` int(20) NOT NULL,
  `Nombre_Empresa` varchar(30) NOT NULL,
  `Nombre_Contacto` varchar(30) NOT NULL,
  `Telefono` int(20) NOT NULL,
  `Correo` varchar(30) NOT NULL,
  `Direccion` varchar(30) NOT NULL,
  `Ciudad` varchar(20) NOT NULL,
  `Pais` varchar(20) NOT NULL,
  `Estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ubicacion`
--

CREATE TABLE `ubicacion` (
  `id_Ubicacion` int(20) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_Usuario` int(20) NOT NULL,
  `Nombre` varchar(30) NOT NULL,
  `Usuario` varchar(20) NOT NULL,
  `Contraseña` varchar(30) NOT NULL,
  `Rol` varchar(20) NOT NULL,
  `Fecha_Creacion` varchar(8) NOT NULL,
  `Activo(Si, No)` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ajusteinventario`
--
ALTER TABLE `ajusteinventario`
  ADD PRIMARY KEY (`id_Ajuste`),
  ADD KEY `id_Producto` (`id_Producto`),
  ADD KEY `id_Usuario` (`id_Usuario`);

--
-- Indices de la tabla `categoriaproducto`
--
ALTER TABLE `categoriaproducto`
  ADD PRIMARY KEY (`id_Categoria`);

--
-- Indices de la tabla `historialprecio`
--
ALTER TABLE `historialprecio`
  ADD PRIMARY KEY (`id_Historial`),
  ADD KEY `id_Producto` (`id_Producto`);

--
-- Indices de la tabla `movimientoinventario`
--
ALTER TABLE `movimientoinventario`
  ADD PRIMARY KEY (`id_Movimiento`),
  ADD KEY `id_Producto` (`id_Producto`),
  ADD KEY `id_Usuario` (`id_Usuario`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_Categoria` (`id_Categoria`),
  ADD KEY `id_Proveedor` (`id_Proveedor`);

--
-- Indices de la tabla `productoubicacion`
--
ALTER TABLE `productoubicacion`
  ADD KEY `id_Producto` (`id_Producto`),
  ADD KEY `id_Ubicacion` (`id_Ubicacion`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_Proveedor`);

--
-- Indices de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  ADD PRIMARY KEY (`id_Ubicacion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_Usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ajusteinventario`
--
ALTER TABLE `ajusteinventario`
  MODIFY `id_Ajuste` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoriaproducto`
--
ALTER TABLE `categoriaproducto`
  MODIFY `id_Categoria` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historialprecio`
--
ALTER TABLE `historialprecio`
  MODIFY `id_Historial` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `movimientoinventario`
--
ALTER TABLE `movimientoinventario`
  MODIFY `id_Movimiento` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_Proveedor` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ubicacion`
--
ALTER TABLE `ubicacion`
  MODIFY `id_Ubicacion` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_Usuario` int(20) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ajusteinventario`
--
ALTER TABLE `ajusteinventario`
  ADD CONSTRAINT `ajusteinventario_ibfk_1` FOREIGN KEY (`id_Usuario`) REFERENCES `usuario` (`id_Usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ajusteinventario_ibfk_2` FOREIGN KEY (`id_Producto`) REFERENCES `producto` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `historialprecio`
--
ALTER TABLE `historialprecio`
  ADD CONSTRAINT `historialprecio_ibfk_1` FOREIGN KEY (`id_Producto`) REFERENCES `producto` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `movimientoinventario`
--
ALTER TABLE `movimientoinventario`
  ADD CONSTRAINT `movimientoinventario_ibfk_1` FOREIGN KEY (`id_Producto`) REFERENCES `producto` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movimientoinventario_ibfk_2` FOREIGN KEY (`id_Usuario`) REFERENCES `usuario` (`id_Usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_Proveedor`) REFERENCES `proveedor` (`id_Proveedor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`id_Categoria`) REFERENCES `categoriaproducto` (`id_Categoria`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productoubicacion`
--
ALTER TABLE `productoubicacion`
  ADD CONSTRAINT `productoubicacion_ibfk_1` FOREIGN KEY (`id_Producto`) REFERENCES `producto` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `productoubicacion_ibfk_2` FOREIGN KEY (`id_Ubicacion`) REFERENCES `ubicacion` (`id_Ubicacion`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
