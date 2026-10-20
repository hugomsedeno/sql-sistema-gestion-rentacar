-- ============================================================
-- 1. CREACIÓN DE LA BASE DE DATOS Y TABLAS (DDL)
-- ============================================================
CREATE DATABASE IF NOT EXISTS rentacar
CHARACTER SET utf8mb4
COLLATE utf8mb4_spanish_ci;

USE rentacar;

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    dni VARCHAR(9) NOT NULL UNIQUE,
    telefono VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE vehiculo (
    id_vehiculo INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    precio_dia DECIMAL(6,2) NOT NULL CHECK (precio_dia > 0),
    disponible CHAR(1) DEFAULT 'S'
);

CREATE TABLE alquiler (
    id_alquiler INT AUTO_INCREMENT PRIMARY KEY,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    id_cliente INT NOT NULL,
    id_vehiculo INT NOT NULL,
    CONSTRAINT fk_cliente FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,
    CONSTRAINT fk_vehiculo FOREIGN KEY (id_vehiculo)
        REFERENCES vehiculo(id_vehiculo)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- ============================================================
-- 2. INSERCIÓN DE DATOS INICIALES (DML)
-- ============================================================
INSERT INTO cliente (nombre, dni, telefono, email) VALUES
('Ana López', '12345678A', '600111222', 'ana.lopez@email.com'),
('Luis Pérez', '87654321B', '600333444', 'luis.perez@email.com'),
('Marta Ruiz', '11223344C', '600555666', 'marta.ruiz@email.com');

INSERT INTO vehiculo (marca, modelo, precio_dia, disponible) VALUES
('Seat', 'Ibiza', 35.00, 'S'),
('Toyota', 'Corolla', 45.00, 'S'),
('Renault', 'Clio', 30.00, 'S');

INSERT INTO alquiler (fecha_inicio, fecha_fin, id_cliente, id_vehiculo) VALUES
('2025-03-01', '2025-03-05', 1, 1),
('2025-03-10', '2025-03-12', 2, 2),
('2025-03-15', '2025-03-18', 3, 3);
