# SQL Clauses – Theory and Hands-on  
# GROUP BY, HAVING, ORDER BY  
# Order of Execution in SELECT Statement  
# Case Study  

---

# 1️⃣ GROUP BY Clause

## 📘 Theory

The GROUP BY clause is used to:

- Group rows that have the same values
- Perform aggregate calculations on each group
- Work with aggregate functions like:
  - COUNT()
  - SUM()
  - AVG()
  - MIN()
  - MAX()

### Important Rules

- Every column in SELECT must either:
  - Be in GROUP BY  
  - Or be inside an aggregate function
- WHERE filters rows before grouping
- HAVING filters after grouping

---

## 🛠 Practical Example

### Create Sample Table

```sql
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);
```

### Insert Data

```sql
INSERT INTO employees VALUES
(1, 'Amit', 'IT', 60000),
(2, 'Neha', 'HR', 50000),
(3, 'Rahul', 'IT', 70000),
(4, 'Karan', 'Finance', 80000),
(5, 'Priya', 'HR', 55000);
```

---

## Example 1: Count Employees per Department

```sql
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department;
```

---

## Example 2: Average Salary per Department

```sql
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;
```

---

# 2️⃣ HAVING Clause

## 📘 Theory

The HAVING clause is used to:

- Filter grouped data
- Apply conditions on aggregate functions
- Work only after GROUP BY

Difference:

| WHERE | HAVING |
|--------|---------|
| Filters rows | Filters groups |
| Cannot use aggregate functions | Can use aggregate functions |
| Executes before GROUP BY | Executes after GROUP BY |

---

## 🛠 Practical Examples

### Example 1: Departments with More Than 1 Employee

```sql
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department
HAVING COUNT(*) > 1;
```

---

### Example 2: Departments with Avg Salary > 60000

```sql
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 60000;
```

---

# 3️⃣ ORDER BY Clause

## 📘 Theory

ORDER BY is used to:

- Sort result set
- Sort ascending (ASC) – default
- Sort descending (DESC)

It executes last in query processing.

---

## 🛠 Practical Examples

### Example 1: Sort by Salary (Ascending)

```sql
SELECT * FROM employees
ORDER BY salary;
```

---

### Example 2: Sort by Salary (Descending)

```sql
SELECT * FROM employees
ORDER BY salary DESC;
```

---

### Example 3: Sort by Multiple Columns

```sql
SELECT * FROM employees
ORDER BY department ASC, salary DESC;
```

---

# 4️⃣ Order of Execution of SELECT Statement

## 📘 Logical Processing Order

Even though we write SELECT first, SQL executes in this order:

```
1. FROM
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. ORDER BY
7. LIMIT / FETCH
```

---

## 🔎 Explanation

1. FROM → Select table  
2. WHERE → Filter rows  
3. GROUP BY → Create groups  
4. HAVING → Filter groups  
5. SELECT → Choose columns  
6. ORDER BY → Sort result  
7. LIMIT → Restrict rows  

---

## Example to Understand Execution

```sql
SELECT department, AVG(salary)
FROM employees
WHERE salary > 50000
GROUP BY department
HAVING AVG(salary) > 60000
ORDER BY AVG(salary) DESC;
```

Execution:

- Filter salary > 50000
- Group by department
- Calculate AVG(salary)
- Filter groups where avg > 60000
- Sort descending

---

# 5️⃣ Case Study – Retail Store Analytics

## Scenario

A retail company wants to:

- Count total employees per department
- Identify high-paying departments
- Sort departments by average salary
- Display only departments with strong performance

---

## Step 1: Create Table

```sql
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);
```

---

## Step 2: Insert Data

```sql
INSERT INTO employees VALUES
(1, 'Amit', 'Sales', 40000),
(2, 'Neha', 'Sales', 45000),
(3, 'Rahul', 'IT', 70000),
(4, 'Karan', 'IT', 80000),
(5, 'Priya', 'HR', 50000),
(6, 'Anita', 'HR', 52000);
```

---

## Step 3: Department-wise Employee Count

```sql
SELECT department, COUNT(*) AS total_emp
FROM employees
GROUP BY department;
```

---

## Step 4: Departments with Avg Salary > 50000

```sql
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;
```

---

## Step 5: Sort Departments by Average Salary

```sql
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC;
```

---

## Step 6: Complete Analytical Query

```sql
SELECT department,
       COUNT(*) AS total_employees,
       AVG(salary) AS avg_salary
FROM employees
WHERE salary > 40000
GROUP BY department
HAVING COUNT(*) >= 2
ORDER BY avg_salary DESC;
```

---

# 🔥 Final Summary

| Clause | Purpose |
|--------|----------|
| GROUP BY | Groups rows |
| HAVING | Filters grouped data |
| ORDER BY | Sorts result |
| WHERE | Filters rows before grouping |

---

# 🎯 Key Interview Points

- GROUP BY is used with aggregate functions
- HAVING filters aggregate results
- WHERE cannot use aggregate functions
- ORDER BY runs last
- SELECT runs after GROUP BY
- Logical execution order is different from written order

---

# 🚀 Conclusion

GROUP BY, HAVING, and ORDER BY are essential for:

- Data analysis
- Reporting
- Business intelligence
- Performance metrics

Understanding execution order is critical for writing correct and optimized queries.

---

**End of Document**