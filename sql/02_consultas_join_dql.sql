USE rentacar;

-- 1. Consulta con INNER JOIN: Qué cliente ha alquilado qué vehículo
SELECT c.nombre AS cliente, v.marca, v.modelo, a.fecha_inicio, a.fecha_fin
FROM alquiler a
INNER JOIN cliente c ON a.id_cliente = c.id_cliente
INNER JOIN vehiculo v ON a.id_vehiculo = v.id_vehiculo;

-- 2. Consulta con LEFT JOIN: Mostrar todos los vehículos estén o no alquilados
SELECT v.marca, v.modelo, a.id_alquiler
FROM vehiculo v
LEFT JOIN alquiler a ON v.id_vehiculo = a.id_vehiculo;

-- 3. Consulta de agregación (GROUP BY): Total de vehículos por marca
SELECT marca, COUNT(*) AS total_vehiculos
FROM vehiculo
GROUP BY marca;

-- 4. Subconsulta: Clientes que han realizado al menos un alquiler
SELECT nombre, dni
FROM cliente
WHERE id_cliente IN (
    SELECT id_cliente FROM alquiler
);

-- 5. Creación de tabla resumen a partir de consulta (INSERT INTO ... SELECT)
CREATE TABLE IF NOT EXISTS clientes_activos (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100)
);

INSERT INTO clientes_activos (id_cliente, nombre)
SELECT id_cliente, nombre FROM cliente;
