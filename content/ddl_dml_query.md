# SQL Complete Guide  
# DDL, DML, Queries & Operations, Clauses, Aggregate Functions, String Functions, GROUP BY, HAVING

---

# 1️⃣ DDL (Data Definition Language)

DDL is used to define and manage database structure.

## Common DDL Commands

### 1. CREATE
Creates database objects like tables.

```sql
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10,2),
    dept VARCHAR(50)
);
```

### 2. ALTER
Modifies existing table structure.

```sql
ALTER TABLE employees
ADD email VARCHAR(100);
```

### 3. DROP
Deletes entire object permanently.

```sql
DROP TABLE employees;
```

### 4. TRUNCATE
Removes all rows but keeps table structure.

```sql
TRUNCATE TABLE employees;
```

---

# 2️⃣ DML (Data Manipulation Language)

Used to manage data inside tables.

## 1. INSERT

```sql
INSERT INTO employees (id, name, salary, dept)
VALUES (1, 'Abbas', 60000, 'IT');
```

## 2. SELECT

```sql
SELECT * FROM employees;
```

## 3. UPDATE

```sql
UPDATE employees
SET salary = 65000
WHERE id = 1;
```

## 4. DELETE

```sql
DELETE FROM employees
WHERE id = 1;
```

---

