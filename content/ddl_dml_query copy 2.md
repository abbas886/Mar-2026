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

# 3️⃣ SQL Query Structure

Basic SELECT syntax:

```sql
SELECT column1, column2
FROM table_name
WHERE condition
GROUP BY column
HAVING condition
ORDER BY column;
```

---

# 4️⃣ SQL Clauses

## 1. WHERE
Filters rows before grouping.

```sql
SELECT * FROM employees
WHERE salary > 50000;
```

## 2. ORDER BY
Sorts result.

```sql
SELECT * FROM employees
ORDER BY salary DESC;
```

## 3. DISTINCT
Removes duplicates.

```sql
SELECT DISTINCT dept FROM employees;
```

## 4. LIMIT (MySQL/Postgres)

```sql
SELECT * FROM employees
LIMIT 5;
```

---

# 5️⃣ Aggregate Functions

Used to perform calculations on multiple rows.

| Function | Description |
|----------|-------------|
| COUNT() | Number of rows |
| SUM() | Total value |
| AVG() | Average value |
| MIN() | Minimum value |
| MAX() | Maximum value |

## Examples

```sql
SELECT COUNT(*) FROM employees;
```

```sql
SELECT SUM(salary) FROM employees;
```

```sql
SELECT AVG(salary) FROM employees;
```

---

# 6️⃣ GROUP BY

Used to group rows with same values.

## Example

```sql
SELECT dept, COUNT(*) AS total_employees
FROM employees
GROUP BY dept;
```

This groups employees department-wise.

---

# 7️⃣ HAVING

Filters grouped data (after GROUP BY).

Difference:

- WHERE → Filters before grouping
- HAVING → Filters after grouping

## Example

```sql
SELECT dept, COUNT(*) AS total_employees
FROM employees
GROUP BY dept
HAVING COUNT(*) > 5;
```

---

# 8️⃣ WHERE vs HAVING

| Feature | WHERE | HAVING |
|----------|--------|--------|
| Works On | Rows | Groups |
| Used With Aggregate | No | Yes |
| Executes Before | GROUP BY | After GROUP BY |

---

# 9️⃣ String Functions

Used to manipulate text data.

| Function | Description |
|----------|-------------|
| UPPER() | Converts to uppercase |
| LOWER() | Converts to lowercase |
| LENGTH() | Returns string length |
| CONCAT() | Joins strings |
| SUBSTRING() | Extracts part of string |
| TRIM() | Removes spaces |

## Examples

```sql
SELECT UPPER(name) FROM employees;
```

```sql
SELECT CONCAT(name, ' - ', dept) FROM employees;
```

```sql
SELECT SUBSTRING(name, 1, 3) FROM employees;
```

---

# 🔟 Common SQL Operations

## 1. BETWEEN

```sql
SELECT * FROM employees
WHERE salary BETWEEN 40000 AND 80000;
```

## 2. IN

```sql
SELECT * FROM employees
WHERE dept IN ('IT', 'HR');
```

## 3. LIKE

```sql
SELECT * FROM employees
WHERE name LIKE 'A%';
```

## 4. IS NULL

```sql
SELECT * FROM employees
WHERE email IS NULL;
```

---

# 1️⃣1️⃣ Execution Order of SQL Query

Logical processing order:

```
FROM
WHERE
GROUP BY
HAVING
SELECT
ORDER BY
LIMIT
```

Understanding this is critical for interviews.

---

# 1️⃣2️⃣ Combined Example

```sql
SELECT dept,
       COUNT(*) AS total,
       AVG(salary) AS avg_salary
FROM employees
WHERE salary > 40000
GROUP BY dept
HAVING AVG(salary) > 50000
ORDER BY avg_salary DESC;
```

This query:
- Filters employees with salary > 40000
- Groups by department
- Filters departments with avg salary > 50000
- Sorts by average salary

---

# 🔥 Summary

## DDL
Defines structure (CREATE, ALTER, DROP)

## DML
Manipulates data (INSERT, UPDATE, DELETE, SELECT)

## Clauses
WHERE, GROUP BY, HAVING, ORDER BY

## Aggregate Functions
COUNT, SUM, AVG, MIN, MAX

## String Functions
UPPER, LOWER, CONCAT, SUBSTRING, LENGTH

Understanding these concepts forms the foundation of SQL mastery.

---

**End of Document**