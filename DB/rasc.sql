-- Estructura de la tabla `avistador`
CREATE TABLE `avistador` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(200) DEFAULT NULL,
  `ficha` INT(7) DEFAULT NULL,
  `correo` VARCHAR(200) DEFAULT NULL,
  `conteo` INT(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Estructura de la tabla `mapa`
CREATE TABLE `mapa` (
  `cordenada` FLOAT NOT NULL,
  `nombre` VARCHAR(200) DEFAULT NULL,
  `color` VARCHAR(200) DEFAULT NULL,
  `veneno` ENUM('si','no') DEFAULT NULL,
  `info` TEXT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Estructura de la tabla `p_siga`
CREATE TABLE `p_siga` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(200) DEFAULT NULL,
  `correo` VARCHAR(200) DEFAULT NULL,
  `contraseña` CHAR(200) DEFAULT NULL,
  `funcion` VARCHAR(200) DEFAULT NULL,
  `activo` TINYINT(1) DEFAULT 1,
  `u_asignado` VARCHAR(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Estructura de la tabla `reptiles`
CREATE TABLE `reptiles` (
  `numero` INT auto_increment,
  `nombre_cientifico` VARCHAR(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nombre` VARCHAR(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `venenosa` VARCHAR(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `imagen` LONGBLOB,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Estructura de la tabla `registro_reptiles` (sin `fecha_registro` ni `detalles`)
CREATE TABLE `registro_reptiles` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `id_reptil` INT(11) DEFAULT NULL,
  `id_p_siga` INT(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_reptil`) REFERENCES `reptiles`(`numero`) ON DELETE SET NULL,
  FOREIGN KEY (`id_p_siga`) REFERENCES `p_siga`(`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Estructura de la tabla `reporte`
CREATE TABLE `reporte` (
  `numero` INT(11) NOT NULL AUTO_INCREMENT,
  `zona` VARCHAR(100) DEFAULT NULL,
  `hora` VARCHAR(8) DEFAULT NULL,  -- Cambiado a VARCHAR para almacenar la hora en formato AM/PM
  `especie_imagen` VARCHAR(100) DEFAULT NULL,
  `ataco` ENUM('si','no') DEFAULT NULL,
  `imagen` LONGBLOB DEFAULT NULL,
  `observaciones` TEXT DEFAULT NULL,
  `id_avistador` INT(11) DEFAULT NULL,
  `id_reptil` INT(11) DEFAULT NULL,
  PRIMARY KEY (`numero`),
  FOREIGN KEY (`id_avistador`) REFERENCES `avistador`(`id`) ON DELETE SET NULL,
  FOREIGN KEY (`id_reptil`) REFERENCES `reptiles`(`numero`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
ALTER TABLE reptiles CHANGE venenosa veneno VARCHAR(255);
ALTER TABLE reptiles ADD UNIQUE (nombre_cientifico);
ALTER TABLE reporte MODIFY especie_imagen LONGBLOB;
ALTER TABLE reporte MODIFY imagen LONGBLOB;
INSERT INTO p_siga (nombre, contraseña) VALUES ('admin', '123456789');
truncate table p_siga;







