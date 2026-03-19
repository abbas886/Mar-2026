# Oracle SQL Indexes – Complete Guide

## 🔹 What is an Index?
An **index** in Oracle is a database object that **improves the speed of data retrieval** by creating a fast lookup structure on one or more columns.

👉 Similar to an index in a book – helps find data quickly without scanning the entire table.

---

## 🔹 Why Use Indexes?
- Faster query performance
- Reduces full table scans
- Improves search, join, and sorting operations

---

## 🔹 Syntax

### Create Index
CREATE INDEX idx_emp_salary
ON employee(salary);

---

### Create Composite Index (Multiple Columns)
CREATE INDEX idx_emp_dept_salary
ON employee(dept_id, salary);

---

### Drop Index
DROP INDEX idx_emp_salary;

---

## 🔹 Types of Indexes in Oracle

### 1. Single Column Index
- Index on one column

CREATE INDEX idx_emp_name
ON employee(emp_name);

---

### 2. Composite Index
- Index on multiple columns

CREATE INDEX idx_emp_multi
ON employee(dept_id, salary);

---

### 3. Unique Index
- Ensures column values are unique

CREATE UNIQUE INDEX idx_emp_email
ON employee(email);

---

### 4. Bitmap Index
- Suitable for low-cardinality columns (few distinct values)

CREATE BITMAP INDEX idx_emp_gender
ON employee(gender);

---

### 5. Function-Based Index
- Index on expressions or functions

CREATE INDEX idx_upper_name
ON employee(UPPER(emp_name));

---

## 🔹 How Index Works
- Oracle creates a **B-Tree structure (default)**
- Stores column values + row pointers
- Speeds up data access

---

## 🔹 When to Use Indexes
- Columns used in:
  - WHERE clause
  - JOIN conditions
  - ORDER BY / GROUP BY
- Frequently queried columns
- High selectivity columns (many unique values)

---

## 🔹 When NOT to Use Indexes
- Small tables (full scan is faster)
- Columns frequently updated
- Low-cardinality columns (use bitmap instead)
- Columns not used in queries

---

## 🔹 Example Queries Using Index

SELECT * FROM employee
WHERE salary > 70000;

👉 Uses index on salary (if exists)

---

## 🔹 Check Indexes on Table

SELECT index_name, table_name
FROM user_indexes
WHERE table_name = 'EMPLOYEE';

---

## 🔹 Performance Tips

- Avoid too many indexes → slows INSERT/UPDATE/DELETE
- Use composite index wisely (order matters)
- Rebuild fragmented indexes if needed

---

## 🔹 Real-Time Use Cases

1. **Search Optimization**
   - Fast employee lookup by emp_id

2. **Join Optimization**
   - Improve join between employee and dept tables

3. **Sorting & Grouping**
   - Speed up ORDER BY and GROUP BY queries

4. **Reporting Systems**
   - Faster analytics queries

---

## 🧠 Architect-Level Insight

| Aspect | Insight |
|-------|--------|
| Default Index | B-Tree |
| Best for | OLTP systems |  (Online Transaction Processing (OLTP) )
| Bitmap Index | Best for data warehouse |
| Trade-off | Read performance ↑, Write performance ↓ |

👉 **Golden Rule**:
- Use indexes to optimize **reads**, but balance against **write overhead**