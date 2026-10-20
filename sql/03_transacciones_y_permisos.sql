USE rentacar;

-- ============================================================
-- 1. TRANSACCIONES ACID (COMMIT & ROLLBACK)
-- ============================================================
START TRANSACTION;

UPDATE vehiculo
SET disponible = 'N'
WHERE id_vehiculo = 2;

INSERT INTO alquiler (fecha_inicio, fecha_fin, id_cliente, id_vehiculo)
VALUES ('2025-04-10', '2025-04-15', 1, 2);

COMMIT;

-- Ejemplo de transacción revertida con ROLLBACK y bloqueo FOR UPDATE
START TRANSACTION;

SELECT * FROM cliente
WHERE id_cliente = 1
FOR UPDATE;

UPDATE cliente
SET nombre = 'Cambio Temporal'
WHERE id_cliente = 1;

ROLLBACK;

-- ============================================================
-- 2. ADMINISTRACIÓN DE USUARIOS Y PRIVILEGIOS (DCL)
-- ============================================================
CREATE USER IF NOT EXISTS 'lector'@'localhost' IDENTIFIED BY '1234';
GRANT SELECT ON rentacar.* TO 'lector'@'localhost';

CREATE USER IF NOT EXISTS 'editor'@'localhost' IDENTIFIED BY '1234';
GRANT SELECT, INSERT, UPDATE ON rentacar.* TO 'editor'@'localhost';

CREATE USER IF NOT EXISTS 'admin'@'localhost' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON rentacar.* TO 'admin'@'localhost';

FLUSH PRIVILEGES;
