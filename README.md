# 📊 SQL Sales – Análisis de ventas en MySQL con Docker

> Ejercicio de creación de una base de datos MySQL en Docker, con scripts SQL para consultar y agregar datos de ventas de la tabla `sales`.

---

## 📋 Descripción

El objetivo de este proyecto es aprender a trabajar con una base de datos MySQL alojada en un contenedor Docker, escribiendo consultas SQL que respondan preguntas concretas sobre un dataset de ventas.

Los requisitos principales son:

1. **Crear una base de datos MySQL en Docker.**
2. **Crear la tabla `sales`** con el script proporcionado por el profesor.
3. **Escribir un script** para obtener todos los datos de `food_category` y `food_subcategory`.
4. **Escribir un script** para obtener solo las subcategorías que empiezan por la letra "C".
5. **Escribir un script** para obtener la cantidad total de unidades vendidas.
6. **Escribir un script** para obtener las unidades totales del continente americano.

---

## 📋 Pasos realizados

1. **Base de datos MySQL en Docker.** Se reutiliza el contenedor `test-mysql` (imagen `mysql:8.0-debian`), creado en un ejercicio anterior de Docker, y se crea dentro una nueva base de datos independiente:

   ```sql
   CREATE DATABASE sales_db;
   ```

2. **Creación de la tabla y carga de datos**, con el script proporcionado por el profesor (20 registros de ventas de distintos países y continentes).

3. **Escritura y verificación de las 4 consultas SQL** (ver [`sql/queries/`](sql/queries/)), ejecutadas y comprobadas una a una en DBeaver.

---

## 🧱 Scripts SQL

### Configuración de la base de datos ([`sql/setup/`](sql/setup/))

**01_create_sales_db.sql** — Creación de la base de datos:

```sql
CREATE DATABASE sales_db;
```

**02_create_table_and_insert_data.sql** — Creación de la tabla y carga de los 20 registros:

```sql
CREATE TABLE sales_db.sales (
    date DATE,
    food_category VARCHAR(50),
    food_subcategory VARCHAR(50),
    country VARCHAR(50),
    country_code CHAR(2),
    continent VARCHAR(20),
    city VARCHAR(50),
    unit_sales INT
);

INSERT INTO sales_db.sales (
    date, food_category, food_subcategory, country, country_code, continent, city, unit_sales
) VALUES
('2024-01-05', 'Fruits', 'Apples', 'Spain', 'ES', 'Europe', 'Madrid', 120),
('2024-01-06', 'Fruits', 'Bananas', 'Spain', 'ES', 'Europe', 'Barcelona', 95),
('2024-01-07', 'Vegetables', 'Carrots', 'France', 'FR', 'Europe', 'Paris', 140),
('2024-01-08', 'Vegetables', 'Tomatoes', 'France', 'FR', 'Europe', 'Lyon', 110),
('2024-01-09', 'Dairy', 'Milk', 'Germany', 'DE', 'Europe', 'Berlin', 200),
('2024-01-10', 'Dairy', 'Cheese', 'Germany', 'DE', 'Europe', 'Munich', 160),
('2024-01-11', 'Bakery', 'Bread', 'Italy', 'IT', 'Europe', 'Rome', 180),
('2024-01-12', 'Bakery', 'Croissants', 'Italy', 'IT', 'Europe', 'Milan', 150),
('2024-01-13', 'Meat', 'Chicken', 'United States', 'US', 'North America', 'New York', 220),
('2024-01-14', 'Meat', 'Beef', 'United States', 'US', 'North America', 'Chicago', 210),
('2024-01-15', 'Seafood', 'Salmon', 'Canada', 'CA', 'North America', 'Toronto', 130),
('2024-01-16', 'Seafood', 'Shrimp', 'Canada', 'CA', 'North America', 'Vancouver', 145),
('2024-01-17', 'Snacks', 'Chips', 'Mexico', 'MX', 'North America', 'Mexico City', 300),
('2024-01-18', 'Snacks', 'Chocolate', 'Mexico', 'MX', 'North America', 'Guadalajara', 280),
('2024-01-19', 'Beverages', 'Soda', 'Brazil', 'BR', 'South America', 'São Paulo', 260),
('2024-01-20', 'Beverages', 'Juice', 'Brazil', 'BR', 'South America', 'Rio de Janeiro', 240),
('2024-01-21', 'Grains', 'Rice', 'Japan', 'JP', 'Asia', 'Tokyo', 320),
('2024-01-22', 'Grains', 'Pasta', 'Japan', 'JP', 'Asia', 'Osaka', 290),
('2024-01-23', 'Frozen', 'Ice Cream', 'Australia', 'AU', 'Oceania', 'Sydney', 170),
('2024-01-24', 'Frozen', 'Frozen Pizza', 'Australia', 'AU', 'Oceania', 'Melbourne', 165);
```

### Consultas de análisis ([`sql/queries/`](sql/queries/))

**select_category_and_subcategory.sql** — Todos los datos de categoría y subcategoría:

```sql
SELECT food_category, food_subcategory FROM sales_db.sales;
```

**select_subcategories_starting_with_c.sql** — Subcategorías que empiezan por "C":

```sql
SELECT food_subcategory FROM sales_db.sales WHERE food_subcategory LIKE 'C%';
```

**total_unit_sales.sql** — Cantidad total de unidades vendidas:

```sql
SELECT SUM(unit_sales) AS total_unit_sales FROM sales_db.sales;
```

**total_units_american_continent.sql** — Unidades totales del continente americano (Norte + Sur):

```sql
SELECT SUM(unit_sales) AS total_american_units FROM sales_db.sales WHERE continent LIKE '%America';
```

---

## 👩‍💻 Autora

**[Jenny Sánchez Requejo](https://github.com/Jennydev-25)**
