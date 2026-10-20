# Base de Datos Relacional «RentACar» (SQL / MySQL)

Diseño físico, consultas relacionales, control de transacciones ACID y administración de permisos desarrollados en **MySQL** para la gestión integral de una empresa de alquiler de vehículos.

## 🚀 Características Técnicas

- **Modelado Físico DDL (`sql/01_esquema_ddl.sql`):** Creación de la base de datos `rentacar` (`utf8mb4_spanish_ci`) y definición de las tablas `cliente`, `vehiculo` y `alquiler` con integridad referencial (`FOREIGN KEY` con `ON DELETE RESTRICT` y `ON UPDATE CASCADE`), restricciones de dominio (`CHECK (precio_dia > 0)`), unicidad (`UNIQUE` en DNI) y valores por defecto (`DEFAULT`).
- **Consultas Relacionales DQL (`sql/02_consultas_join_dql.sql`):** Extracción de información mediante `INNER JOIN`, `LEFT JOIN`, agrupaciones estadísticas con `GROUP BY` / `COUNT(*)`, subconsultas `IN` y volcado selectivo `INSERT INTO ... SELECT`.
- **Transacciones ACID y Permisos DCL (`sql/03_transacciones_y_permisos.sql`):** Operaciones seguras mediante `START TRANSACTION`, `COMMIT` y `ROLLBACK`, bloqueo pesimista de registros con `SELECT ... FOR UPDATE` y creación de usuarios por rol (`lector`, `editor`, `admin`) mediante `GRANT`.

## 📂 Estructura del Repositorio

```text
├── sql/
│   ├── 01_esquema_ddl.sql                # Creación de tablas, claves foráneas y datos iniciales
│   ├── 02_consultas_join_dql.sql         # Consultas INNER/LEFT JOIN, GROUP BY y subconsultas
│   └── 03_transacciones_y_permisos.sql   # Transacciones ACID, bloqueos y roles DCL
└── README.md
```

---
Desarrollado por **Hugo Marín Sedeño** — [LinkedIn](https://www.linkedin.com/in/hugo-mar%C3%ADn-sede%C3%B1o-79bb27302) | [GitHub](https://github.com/hugomsedeno)
