# SQL JOINs and JOIN Styles  
# Theory and Hands-on with Case Study  

---

# 1️⃣ Introduction to JOIN

## 📘 What is a JOIN?

A JOIN is used to:

- Combine rows from two or more tables
- Based on related columns between them
- Retrieve relational data

JOIN is fundamental in relational databases.

---

# 2️⃣ Sample Tables for Practice

```sql
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
```

```sql
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10,2),
    dept_id INT
);
```

Insert Data:

```sql
INSERT INTO departments VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance');
```

```sql
INSERT INTO employees VALUES
(101, 'Amit', 60000, 1),
(102, 'Neha', 50000, 2),
(103, 'Rahul', 70000, 1),
(104, 'Karan', 80000, NULL);
```

---

# 3️⃣ JOIN Styles

There are two main styles:

1. Theta Style (Old Style)
2. Oracle/ANSI Style (Modern JOIN syntax)

---

# 4️⃣ Theta Style JOIN (Old Style)

## 📘 Theory

- Uses WHERE clause for join condition
- Older syntax
- Harder to maintain

## 🛠 Example

```sql
SELECT e.name, d.dept_name
FROM employees e, departments d
WHERE e.dept_id = d.dept_id;
```

---

# 5️⃣ Oracle Style (ANSI JOIN)

## 🔹 JOIN ... ON

### 📘 Theory
- Explicit join condition
- Cleaner and readable
- Recommended style

### 🛠 Example

```sql
SELECT e.name, d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;
```

---

## 🔹 JOIN ... USING

### 📘 Theory
- Used when column names are same in both tables
- Avoids repeating column name

### 🛠 Example

```sql
SELECT name, dept_name
FROM employees
JOIN departments
USING (dept_id);
```

---

# 6️⃣ CROSS JOIN

## 📘 Theory

- Returns Cartesian product
- Every row from table A × every row from table B
- No condition required

## 🛠 Example

```sql
SELECT e.name, d.dept_name
FROM employees e
CROSS JOIN departments d;
```

If:
- Employees = 4 rows
- Departments = 3 rows

Result = 12 rows

---

# 7️⃣ INNER JOIN

## 📘 Theory

- Returns only matching rows
- Most commonly used join

## 🛠 Example

```sql
SELECT e.name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;
```

Only employees with valid department are returned.

---

# 8️⃣ EQUI-JOIN

## 📘 Theory

- Join condition uses "=" operator
- Most common join type
- Subtype of INNER JOIN

## 🛠 Example

```sql
SELECT e.name, d.dept_name
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;
```

This is an equi-join because "=" is used.

---

# 9️⃣ NATURAL JOIN

## 📘 Theory

- Automatically joins on columns with same name
- No ON clause required
- Risky if multiple matching column names exist

## 🛠 Example

```sql
SELECT name, dept_name
FROM employees
NATURAL JOIN departments;
```

Automatically joins on dept_id.

---

# 🔟 OUTER JOIN

## 📘 Theory

- Returns matching rows + non-matching rows
- Fills missing values with NULL

Types:
- LEFT OUTER JOIN
- RIGHT OUTER JOIN
- FULL OUTER JOIN

---

# 1️⃣1️⃣ LEFT OUTER JOIN

## 📘 Theory

- Returns all rows from left table
- Matching rows from right table
- Non-matching → NULL

## 🛠 Example

```sql
SELECT e.name, d.dept_name
FROM employees e
LEFT OUTER JOIN departments d
ON e.dept_id = d.dept_id;
```

Includes Karan (NULL department).

---

# 1️⃣2️⃣ RIGHT OUTER JOIN

## 📘 Theory

- Returns all rows from right table
- Matching rows from left table

## 🛠 Example

```sql
SELECT e.name, d.dept_name
FROM employees e
RIGHT OUTER JOIN departments d
ON e.dept_id = d.dept_id;
```

Includes departments with no employees.

---

# 1️⃣3️⃣ FULL OUTER JOIN

## 📘 Theory

- Returns all rows from both tables
- Matching where possible
- NULL where no match

## 🛠 Example

```sql
SELECT e.name, d.dept_name
FROM employees e
FULL OUTER JOIN departments d
ON e.dept_id = d.dept_id;
```

---

# 1️⃣4️⃣ SELF JOIN

## 📘 Theory

- Table joined with itself
- Used for hierarchical data

---

## Example Table

```sql
CREATE TABLE staff (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT
);
```

Insert:

```sql
INSERT INTO staff VALUES
(1, 'Amit', NULL),
(2, 'Neha', 1),
(3, 'Rahul', 1);
```

---

## 🛠 Self Join Query

```sql
SELECT e.name AS employee,
       m.name AS manager
FROM staff e
LEFT JOIN staff m
ON e.manager_id = m.emp_id;
```

---

# 1️⃣5️⃣ Comparison of JOIN Types

| JOIN Type | Returns |
|------------|---------|
| INNER JOIN | Only matching rows |
| LEFT JOIN | All left + matching right |
| RIGHT JOIN | All right + matching left |
| FULL JOIN | All rows from both |
| CROSS JOIN | Cartesian product |
| SELF JOIN | Table joined with itself |

---

# 1️⃣6️⃣ Case Study – Corporate Management System

## Scenario

Company wants to:

- List employees with department names
- Show employees without department
- Show departments without employees
- Show employee-manager relationship

---

## Step 1: Employee with Department

```sql
SELECT e.name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;
```

---

## Step 2: Include Employees Without Department

```sql
SELECT e.name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;
```

---

## Step 3: Include Departments Without Employees

```sql
SELECT e.name, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;
```

---

## Step 4: Complete Data Overview

```sql
SELECT e.name, d.dept_name
FROM employees e
FULL OUTER JOIN departments d
ON e.dept_id = d.dept_id;
```

---

## Step 5: Manager Report (Self Join)

```sql
SELECT e.name AS employee,
       m.name AS manager
FROM staff e
LEFT JOIN staff m
ON e.manager_id = m.emp_id;
```

---

# 🔥 Final Summary

- JOIN combines related tables
- INNER JOIN → Matching rows only
- OUTER JOIN → Includes non-matching rows
- CROSS JOIN → Cartesian product
- SELF JOIN → Hierarchical queries
- ANSI JOIN is preferred over Theta style
- USING simplifies join when column names match

---

# 🎯 Key Interview Points

- Always prefer JOIN ... ON over old WHERE join
- NATURAL JOIN can be risky
- LEFT JOIN is most commonly used outer join
- FULL OUTER JOIN not supported in some DBs (use UNION workaround)
- Self join uses table aliases

---

# 🚀 Conclusion

JOINs are essential for:

- Relational data retrieval
- Reporting systems
- Business analytics
- Master-detail relationships

Mastering JOINs is mandatory for advanced SQL proficiency.

---

**End of Document**