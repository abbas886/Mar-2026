# Understanding SQL  
# SQL Data Types  

---

# 1️⃣ Understanding SQL

## What is SQL?

SQL (Structured Query Language) is a standard programming language used to:

- Create databases
- Create and modify tables
- Insert, update, and delete data
- Retrieve data from databases
- Manage users and permissions

It is primarily used with **Relational Database Management Systems (RDBMS)** such as MySQL, PostgreSQL, Oracle, and SQL Server.

---

## Why SQL is Important?

- Industry standard for relational databases
- Easy to learn and readable
- Powerful querying capabilities
- Supports complex joins and aggregations
- Ensures data integrity with constraints

---

## Basic SQL Query Example

```sql
SELECT name, salary
FROM employees
WHERE salary > 50000;
```

This query:
- Selects name and salary columns
- From employees table
- Filters employees earning more than 50,000

---

# 2️⃣ SQL Language Categories

## 1. DDL (Data Definition Language)
Used to define database structure.

- CREATE
- ALTER
- DROP
- TRUNCATE

## 2. DML (Data Manipulation Language)
Used to manage data.

- INSERT
- UPDATE
- DELETE
- SELECT

## 3. DCL (Data Control Language)
Used for permissions.

- GRANT
- REVOKE

## 4. TCL (Transaction Control Language)
Used for transactions.

- COMMIT
- ROLLBACK
- SAVEPOINT

---

# 3️⃣ SQL Data Types

Data types define what kind of data can be stored in a column.

---

# 🔢 1. Numeric Data Types

Used to store numbers.

| Data Type | Description |
|------------|------------|
| INT | Whole numbers |
| SMALLINT | Smaller integer |
| BIGINT | Large integer |
| DECIMAL(p,s) | Fixed-point number |
| NUMERIC(p,s) | Exact numeric |
| FLOAT | Approximate decimal |
| DOUBLE | Double precision float |

### Example

```sql
CREATE TABLE products (
    id INT,
    price DECIMAL(10,2),
    quantity INT
);
```

---

# 🔤 2. Character/String Data Types

Used to store text.

| Data Type | Description |
|------------|------------|
| CHAR(n) | Fixed-length string |
| VARCHAR(n) | Variable-length string |
| TEXT | Large text data |

### Example

```sql
CREATE TABLE users (
    name VARCHAR(50),
    address TEXT
);
```

Difference:
- CHAR(10) always stores 10 characters
- VARCHAR(10) stores up to 10 characters

---

# 📅 3. Date and Time Data Types

Used to store date and time values.

| Data Type | Description |
|------------|------------|
| DATE | Stores date (YYYY-MM-DD) |
| TIME | Stores time (HH:MM:SS) |
| DATETIME | Date and time |
| TIMESTAMP | Date and time with timezone |
| YEAR | Stores year |

### Example

```sql
CREATE TABLE orders (
    order_date DATE,
    order_time TIME,
    created_at TIMESTAMP
);
```

---

# 🟢 4. Boolean Data Type

Stores TRUE or FALSE values.

| Data Type | Description |
|------------|------------|
| BOOLEAN | True/False |

Example:

```sql
CREATE TABLE tasks (
    is_completed BOOLEAN
);
```

---

# 📦 5. Binary Data Types

Used to store binary data (images, files).

| Data Type | Description |
|------------|------------|
| BLOB | Binary Large Object |
| VARBINARY | Variable-length binary |

---

# 🏗 Constraints in SQL

Constraints enforce rules on columns.

| Constraint | Description |
|------------|------------|
| PRIMARY KEY | Unique + Not Null |
| FOREIGN KEY | Links tables |
| UNIQUE | No duplicate values |
| NOT NULL | Cannot store NULL |
| CHECK | Validates condition |
| DEFAULT | Sets default value |

### Example

```sql
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) CHECK (salary > 0),
    dept VARCHAR(50) DEFAULT 'General'
);
```

---

# 🧠 Choosing the Right Data Type

Guidelines:

- Use INT for IDs
- Use VARCHAR for names
- Use DECIMAL for money
- Use DATE for birthdates
- Use BOOLEAN for flags
- Avoid using TEXT unless necessary

Choosing correct data types:
- Improves performance
- Reduces storage usage
- Ensures data integrity

---

# 🔁 NULL in SQL

NULL means:
- No value
- Unknown value
- Missing value

Example:

```sql
SELECT * FROM employees
WHERE email IS NULL;
```

Important:
- NULL is NOT equal to 0
- NULL is NOT equal to empty string

---

# ⚙️ Example Combined Table

```sql
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10,2),
    hire_date DATE,
    is_active BOOLEAN DEFAULT TRUE
);
```

---

# 🚀 Summary

## Understanding SQL
- Used to manage relational databases
- Divided into DDL, DML, DCL, TCL
- Powerful querying language

## SQL Data Types
- Numeric (INT, DECIMAL, FLOAT)
- String (CHAR, VARCHAR, TEXT)
- Date/Time (DATE, TIME, TIMESTAMP)
- Boolean (TRUE/FALSE)
- Binary (BLOB)

Correct use of SQL data types ensures:
- Efficient storage
- Faster queries
- Data consistency
- Better database design

---

**End of Document**