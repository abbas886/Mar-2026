# SQL Operators and Their Types  
# Theory and Practicals with Case Study  

---

# 1️⃣ Introduction to SQL Operators

## What are SQL Operators?

SQL operators are special symbols or keywords used to:

- Perform calculations
- Compare values
- Combine conditions
- Combine result sets

Operators are mainly used inside:
- SELECT
- WHERE
- HAVING
- JOIN conditions

---

# 2️⃣ Types of SQL Operators

1. Arithmetic Operators  
2. Comparison Operators  
3. Logical Operators  
4. Set Operators  

---

# 3️⃣ Arithmetic Operators

## 📘 Theory

Arithmetic operators are used to perform mathematical calculations on numeric data.

---

## 🔢 Types of Arithmetic Operators

| Operator | Description | Example |
|----------|------------|----------|
| + | Addition | salary + 1000 |
| - | Subtraction | salary - 500 |
| * | Multiplication | salary * 12 |
| / | Division | salary / 2 |
| % | Modulus | salary % 10 |

---

## 🛠 Practical Examples

### Sample Table

```sql
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10,2)
);
```

### Insert Data

```sql
INSERT INTO employees VALUES
(1, 'Amit', 50000),
(2, 'Neha', 60000);
```

---

### Example 1: Salary Increment

```sql
SELECT name, salary, salary + 5000 AS incremented_salary
FROM employees;
```

---

### Example 2: Annual Salary

```sql
SELECT name, salary * 12 AS annual_salary
FROM employees;
```

---

# 4️⃣ Comparison Operators

## 📘 Theory

Comparison operators are used to compare two values.

They return:
- TRUE
- FALSE
- UNKNOWN (if NULL involved)

---

## 🔎 Types of Comparison Operators

| Operator | Meaning |
|----------|----------|
| = | Equal |
| != or <> | Not equal |
| > | Greater than |
| < | Less than |
| >= | Greater than or equal |
| <= | Less than or equal |
| BETWEEN | Between range |
| IN | Matches any value in list |
| LIKE | Pattern matching |
| IS NULL | Checks NULL |

---

## 🛠 Practical Examples

### Example 1: Greater Than

```sql
SELECT * FROM employees
WHERE salary > 55000;
```

---

### Example 2: BETWEEN

```sql
SELECT * FROM employees
WHERE salary BETWEEN 40000 AND 60000;
```

---

### Example 3: IN

```sql
SELECT * FROM employees
WHERE name IN ('Amit', 'Neha');
```

---

### Example 4: LIKE

```sql
SELECT * FROM employees
WHERE name LIKE 'A%';
```

---

### Example 5: IS NULL

```sql
SELECT * FROM employees
WHERE salary IS NULL;
```

---

# 5️⃣ Logical Operators

## 📘 Theory

Logical operators combine multiple conditions.

---

## 🔗 Types of Logical Operators

| Operator | Meaning |
|----------|----------|
| AND | Both conditions must be TRUE |
| OR | At least one TRUE |
| NOT | Reverses condition |

---

## 🛠 Practical Examples

### Example 1: AND

```sql
SELECT * FROM employees
WHERE salary > 40000 AND salary < 60000;
```

---

### Example 2: OR

```sql
SELECT * FROM employees
WHERE salary < 40000 OR salary > 70000;
```

---

### Example 3: NOT

```sql
SELECT * FROM employees
WHERE NOT salary = 50000;
```

---

# 6️⃣ Set Operators

## 📘 Theory

Set operators combine results of two SELECT queries.

Rules:
- Number of columns must match
- Data types must be compatible
- Order of columns must match

---

## 📚 Types of Set Operators

| Operator | Description |
|----------|-------------|
| UNION | Combines results (removes duplicates) |
| UNION ALL | Combines results (keeps duplicates) |
| INTERSECT | Returns common rows |
| EXCEPT / MINUS | Returns rows from first query not in second |

---

## 🛠 Practical Examples

### Sample Tables

```sql
CREATE TABLE dept1 (
    name VARCHAR(50)
);

CREATE TABLE dept2 (
    name VARCHAR(50)
);
```

Insert Data:

```sql
INSERT INTO dept1 VALUES ('Amit'), ('Neha'), ('Rahul');
INSERT INTO dept2 VALUES ('Neha'), ('Karan');
```

---

### UNION

```sql
SELECT name FROM dept1
UNION
SELECT name FROM dept2;
```

(Removes duplicates)

---

### UNION ALL

```sql
SELECT name FROM dept1
UNION ALL
SELECT name FROM dept2;
```

(Keeps duplicates)

---

### INTERSECT

```sql
SELECT name FROM dept1
INTERSECT
SELECT name FROM dept2;
```

(Common names only)

---

### EXCEPT / MINUS

```sql
SELECT name FROM dept1
EXCEPT
SELECT name FROM dept2;
```

(Returns names only in dept1)

---

# 7️⃣ Operator Precedence (Important)

Execution order:

1. Arithmetic operators
2. Comparison operators
3. NOT
4. AND
5. OR

Use parentheses to control execution:

```sql
SELECT * FROM employees
WHERE (salary > 40000 AND salary < 70000)
OR name = 'Amit';
```

---

# 8️⃣ Case Study – Company Payroll System

## Scenario

A company wants to:

- Calculate yearly salary
- Filter employees by salary range
- Identify employees working in multiple projects
- Combine employee lists from two branches

---

## Step 1: Create Table

```sql
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10,2),
    department VARCHAR(50)
);
```

---

## Step 2: Insert Data

```sql
INSERT INTO employees VALUES
(1, 'Amit', 50000, 'IT'),
(2, 'Neha', 70000, 'HR'),
(3, 'Rahul', 60000, 'Finance');
```

---

## Step 3: Arithmetic Operation

Calculate annual salary:

```sql
SELECT name, salary * 12 AS annual_salary
FROM employees;
```

---

## Step 4: Comparison & Logical Operators

Find high earners in IT:

```sql
SELECT * FROM employees
WHERE department = 'IT'
AND salary > 45000;
```

---

## Step 5: Set Operator Example

Branch A employees:

```sql
SELECT name FROM branch_a
UNION
SELECT name FROM branch_b;
```

---

# 🔥 Final Summary

| Operator Type | Purpose |
|---------------|----------|
| Arithmetic | Mathematical calculations |
| Comparison | Compare values |
| Logical | Combine conditions |
| Set | Combine result sets |

---

# 🎯 Key Interview Points

- Arithmetic operators work on numeric columns
- Comparison operators return boolean result
- AND has higher precedence than OR
- UNION removes duplicates
- UNION ALL keeps duplicates
- INTERSECT returns common rows
- EXCEPT/MINUS returns difference

---

# 🚀 Conclusion

SQL operators are fundamental for:

- Data filtering
- Data calculations
- Business logic implementation
- Data comparison
- Combining query results

Mastering SQL operators makes query writing efficient and powerful.

---

**End of Document**