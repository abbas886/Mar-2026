# Theory and Hands-on of Views and Indexes  
# Database Objects  

---

# 1️⃣ Database Objects Overview

Database Objects are logical structures used to store, manage, and manipulate data.

Common Database Objects:
- Tables
- Views
- Indexes
- Sequences
- Synonyms
- Procedures
- Functions
- Triggers

In this module, we focus on:
- Views
- Indexes

---

# 2️⃣ What is a View?

## 📘 Theory

A View is a virtual table based on the result of a SQL query.

- It does not store data physically
- It stores the SQL query definition
- Data is fetched dynamically from base tables

---

## 📌 Syntax

```sql
CREATE VIEW view_name AS
SELECT column1, column2
FROM table_name
WHERE condition;
```

---

# 3️⃣ Creating Sample Table for Practice

```sql
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10,2),
    dept VARCHAR(50)
);
```

```sql
INSERT INTO employees VALUES
(101, 'Amit', 60000, 'IT'),
(102, 'Neha', 50000, 'HR'),
(103, 'Rahul', 70000, 'IT'),
(104, 'Karan', 80000, 'Finance');
```

---

# 4️⃣ Creating a View

## Example: IT Employees View

```sql
CREATE VIEW it_employees AS
SELECT emp_id, name, salary
FROM employees
WHERE dept = 'IT';
```

---

## Using the View

```sql
SELECT * FROM it_employees;
```

---

# 5️⃣ Advantages of View

- Improves security (hide sensitive columns)
- Simplifies complex queries
- Provides data abstraction
- Restricts user access
- Reusable query logic
- Maintains consistency

---

# 6️⃣ Updating Data Through View

If view is simple (based on single table without GROUP BY), it allows DML:

```sql
UPDATE it_employees
SET salary = salary + 5000
WHERE emp_id = 101;
```

---

# 7️⃣ Dropping a View

```sql
DROP VIEW it_employees;
```

---

# 8️⃣ Inline View

## 📘 Theory

An Inline View is a subquery written inside the FROM clause.

It acts like a temporary view.

---

## Example

```sql
SELECT *
FROM (
    SELECT name, salary
    FROM employees
    WHERE dept = 'IT'
) temp
WHERE salary > 60000;
```

Inline view exists only during execution.

---

# 9️⃣ What is an Index?

## 📘 Theory

An Index is a database object that improves the speed of data retrieval.

- Works like a book index
- Created on one or more columns
- Improves SELECT performance
- Slightly slows INSERT/UPDATE/DELETE

---

## Syntax

```sql
CREATE INDEX index_name
ON table_name (column_name);
```

---

# 🔟 Why Use Index?

Without index:
- Database performs Full Table Scan

With index:
- Database uses faster search technique

---

# 1️⃣1️⃣ Index Architecture

There are two main types:

1. Clustered Index  
2. Non-Clustered Index  

---

# 1️⃣2️⃣ Clustered Index

## 📘 Theory

- Data is physically stored in order of index
- Only ONE clustered index per table
- Usually created on Primary Key

---

## Example

```sql
CREATE CLUSTERED INDEX idx_empid
ON employees(emp_id);
```

In many databases, PRIMARY KEY automatically creates clustered index.

---

# 1️⃣3️⃣ Non-Clustered Index

## 📘 Theory

- Does not change physical order of table
- Creates separate structure
- Can create multiple non-clustered indexes

---

## Example

```sql
CREATE INDEX idx_salary
ON employees(salary);
```

---

# 1️⃣4️⃣ Unique Index

## 📘 Theory

- Prevents duplicate values
- Automatically created for PRIMARY KEY and UNIQUE constraint

---

## Example

```sql
CREATE UNIQUE INDEX idx_unique_name
ON employees(name);
```

Now duplicate names are not allowed.

---

# 1️⃣5️⃣ Viewing Indexes

```sql
SELECT * 
FROM information_schema.statistics
WHERE table_name = 'employees';
```

(For MySQL)

---

# 1️⃣6️⃣ Dropping an Index

```sql
DROP INDEX idx_salary ON employees;
```

(SQL Server / MySQL syntax may vary)

---

# 1️⃣7️⃣ Case Study – Employee Management System

## Scenario

Company wants to:
- Restrict salary visibility
- Improve search performance
- Provide filtered employee access

---

## Step 1: Create Secure View (Hide Salary)

```sql
CREATE VIEW emp_basic_info AS
SELECT emp_id, name, dept
FROM employees;
```

Users can access:

```sql
SELECT * FROM emp_basic_info;
```

Salary remains hidden.

---

## Step 2: Create Index on Salary

```sql
CREATE INDEX idx_emp_salary
ON employees(salary);
```

Improves:

```sql
SELECT * FROM employees WHERE salary > 60000;
```

---

## Step 3: Create Unique Index on Name

```sql
CREATE UNIQUE INDEX idx_emp_name
ON employees(name);
```

Prevents duplicate employee names.

---

# 1️⃣8️⃣ Performance Comparison Concept

Without Index:
- Full table scan
- Slower for large data

With Index:
- Faster search
- Better performance for WHERE clause

---

# 🔥 Final Summary

## Views
- Virtual tables
- Improve security
- Simplify queries
- Can restrict columns
- Inline view = subquery in FROM

## Indexes
- Improve query performance
- Two types: Clustered & Non-clustered
- Unique index prevents duplicates
- Slightly slows DML operations

---

# 🎯 Interview Points

- View does not store data physically
- Clustered index defines physical order
- Only one clustered index per table
- Primary key usually creates clustered index
- Index improves SELECT but slows INSERT/UPDATE/DELETE
- Inline view exists temporarily

---

# 🚀 Conclusion

Views help in:
- Security
- Abstraction
- Simplicity

Indexes help in:
- Performance optimization
- Faster searching
- Efficient large-scale querying

Both are essential database objects for real-world applications.

---

**End of Document**