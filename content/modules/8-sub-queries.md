# Understanding Subqueries  
# Theory and Hands-on with Case Study  

---

# 1️⃣ Introduction to Subqueries

## 📘 What is a Subquery?

A subquery is a query written inside another SQL query.

It is enclosed in parentheses () and executed before the main query.

Also called:
- Inner Query
- Nested Query

---

## Basic Syntax

```sql
SELECT column_name
FROM table_name
WHERE column_name = (SELECT column_name FROM table_name);
```

Execution:
1. Inner query runs first
2. Outer query uses result

---

# 2️⃣ Advantages of Subqueries

- Break complex problems into smaller parts
- Improve readability
- Avoid temporary tables
- Useful for dynamic filtering
- Used inside SELECT, INSERT, UPDATE, DELETE

---

# 3️⃣ Rules of Subqueries

- Must be enclosed in parentheses
- Subquery executes before main query
- Must return compatible data type
- Single-row subquery → Use single-row operators (=, >, <)
- Multi-row subquery → Use IN, ANY, ALL
- ORDER BY not allowed unless used with TOP / FETCH

---

# 4️⃣ Sample Tables for Practice

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
(104, 'Karan', 80000, 3);
```

---

# 5️⃣ Using Subqueries with SELECT

## Example: Employees with Salary > Average Salary

```sql
SELECT name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary) FROM employees
);
```

---

# 6️⃣ Using Subqueries with INSERT

## Example: Insert IT Employees into Another Table

```sql
INSERT INTO it_employees
SELECT *
FROM employees
WHERE dept_id = (
    SELECT dept_id
    FROM departments
    WHERE dept_name = 'IT'
);
```

---

# 7️⃣ Using Subqueries with UPDATE

## Example: Increase Salary of IT Employees

```sql
UPDATE employees
SET salary = salary + 5000
WHERE dept_id = (
    SELECT dept_id
    FROM departments
    WHERE dept_name = 'IT'
);
```

---

# 8️⃣ Using Subqueries with DELETE

## Example: Delete Employees Below Average Salary

```sql
DELETE FROM employees
WHERE salary < (
    SELECT AVG(salary) FROM employees
);
```

---

# 9️⃣ Types of Subqueries

1. Scalar Subquery  
2. Single Row Subquery  
3. Multiple Row Subquery  
4. Correlated Subquery  

---

# 🔟 Scalar Subquery

## 📘 Theory

- Returns exactly one value
- Can be used in SELECT clause

## 🛠 Example

```sql
SELECT name,
       (SELECT AVG(salary) FROM employees) AS avg_salary
FROM employees;
```

---

# 1️⃣1️⃣ Single Row Subquery

## 📘 Theory

- Returns only one row
- Use operators: =, >, <, >=, <=

## 🛠 Example

```sql
SELECT name
FROM employees
WHERE salary = (
    SELECT MAX(salary) FROM employees
);
```

---

# 1️⃣2️⃣ Multiple Row Subquery

## 📘 Theory

- Returns multiple rows
- Use: IN, NOT IN, ANY, ALL, SOME

---

## Usage of IN

```sql
SELECT name
FROM employees
WHERE dept_id IN (
    SELECT dept_id FROM departments
);
```

---

## Usage of NOT IN

```sql
SELECT name
FROM employees
WHERE dept_id NOT IN (
    SELECT dept_id FROM departments
);
```

⚠ Important: NOT IN fails if subquery returns NULL.

---

## Usage of ANY

Means: Compare with any value returned.

```sql
SELECT name
FROM employees
WHERE salary > ANY (
    SELECT salary FROM employees WHERE dept_id = 1
);
```

---

## Usage of ALL

Means: Compare with all values returned.

```sql
SELECT name
FROM employees
WHERE salary > ALL (
    SELECT salary FROM employees WHERE dept_id = 2
);
```

---

## SOME

SOME is same as ANY.

```sql
SELECT name
FROM employees
WHERE salary > SOME (
    SELECT salary FROM employees WHERE dept_id = 1
);
```

---

# 1️⃣3️⃣ Correlated Subqueries

## 📘 Theory

- Subquery depends on outer query
- Executes once for each row of outer query
- Slower than normal subquery

---

## 🛠 Example

Employees earning more than department average:

```sql
SELECT e1.name, e1.salary
FROM employees e1
WHERE salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e1.dept_id = e2.dept_id
);
```

Here:
- Inner query uses outer query column

---

# 1️⃣4️⃣ EXISTS and NOT EXISTS

---

## EXISTS

### 📘 Theory
- Returns TRUE if subquery returns at least one row
- Efficient for checking existence

### 🛠 Example

```sql
SELECT dept_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.dept_id = d.dept_id
);
```

Returns departments having employees.

---

## NOT EXISTS

### 📘 Theory
- Returns TRUE if subquery returns no rows

### 🛠 Example

```sql
SELECT dept_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.dept_id = d.dept_id
);
```

Returns departments with no employees.

---

# 1️⃣5️⃣ Correlated vs Non-Correlated Subquery

| Feature | Correlated | Non-Correlated |
|----------|------------|---------------|
| Dependency | Depends on outer query | Independent |
| Execution | Runs for each row | Runs once |
| Performance | Slower | Faster |
| Example | Uses outer table column | Does not use outer column |

---

# 1️⃣6️⃣ Case Study – Corporate Salary Analysis

## Scenario

Company wants to:

- Find employees earning above average
- Find highest paid employee
- Find employees in IT department
- Find departments without employees
- Compare salary across departments

---

## Step 1: Employees Above Company Average

```sql
SELECT name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary) FROM employees
);
```

---

## Step 2: Highest Paid Employee

```sql
SELECT name
FROM employees
WHERE salary = (
    SELECT MAX(salary) FROM employees
);
```

---

## Step 3: Employees in IT Department

```sql
SELECT name
FROM employees
WHERE dept_id = (
    SELECT dept_id FROM departments
    WHERE dept_name = 'IT'
);
```

---

## Step 4: Departments Without Employees

```sql
SELECT dept_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.dept_id = d.dept_id
);
```

---

## Step 5: Employees Earning Above Their Department Average

```sql
SELECT e1.name, e1.salary
FROM employees e1
WHERE salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e1.dept_id = e2.dept_id
);
```

---

# 🔥 Final Summary

- Subqueries are queries inside queries
- Can be used with SELECT, INSERT, UPDATE, DELETE
- Types: Scalar, Single Row, Multiple Row, Correlated
- Use IN for multiple values
- Use EXISTS for checking existence
- Correlated subqueries execute row-by-row

---

# 🎯 Key Interview Points

- Subquery runs before main query
- NOT IN fails with NULL values
- EXISTS is usually faster than IN
- Correlated subqueries can impact performance
- ALL compares against every value
- ANY/SOME compares against at least one value

---

# 🚀 Conclusion

Subqueries are powerful for:

- Complex filtering
- Dynamic comparisons
- Hierarchical queries
- Data validation
- Business logic implementation

Mastering subqueries is essential for advanced SQL querying.

---

**End of Document**