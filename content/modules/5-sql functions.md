# Oracle SQL Functions Classification  
# Theory and Hands-on with Case Study  

---

# 1️⃣ Introduction to SQL Functions in Oracle

SQL functions are built-in methods used to:

- Manipulate data
- Perform calculations
- Handle NULL values
- Format output
- Aggregate data

Oracle classifies functions in multiple ways.

---

# 2️⃣ Deterministic and Nondeterministic Functions

## 🔹 Deterministic Functions

### 📘 Theory
A deterministic function:
- Always returns the same result
- Given the same input values
- No side effects

Example:
- UPPER()
- LOWER()
- ROUND()
- LENGTH()

### 🛠 Practical

```sql
SELECT UPPER('oracle') FROM dual;
```

Output:
ORACLE

```sql
SELECT ROUND(15.678, 2) FROM dual;
```

Output:
15.68

---

## 🔹 Nondeterministic Functions

### 📘 Theory
A nondeterministic function:
- May return different results
- Even with same input
- Depends on system state or time

Examples:
- SYSDATE
- SYSTIMESTAMP
- DBMS_RANDOM.VALUE

### 🛠 Practical

```sql
SELECT SYSDATE FROM dual;
```

```sql
SELECT DBMS_RANDOM.VALUE FROM dual;
```

Each execution returns different value.

---

# 3️⃣ Aggregate Functions and Scalar Functions

---

# 🔹 Scalar Functions

## 📘 Theory
- Operate on single row
- Return single value per row

Examples:
- UPPER()
- ROUND()
- LENGTH()
- NVL()

### 🛠 Example

```sql
SELECT name, LENGTH(name)
FROM employees;
```

```sql
SELECT name, NVL(commission, 0) AS adjusted_commission
FROM employees;
```
---

# 🔹 Aggregate Functions

## 📘 Theory
- Operate on multiple rows
- Return single result

Examples:
- COUNT()
- SUM()
- AVG()
- MIN()
- MAX()

### 🛠 Example

```sql
SELECT COUNT(*) FROM employees;
```

```sql
SELECT AVG(salary) FROM employees;
```

---

# 4️⃣ String Functions

## 📘 Common String Functions in Oracle

| Function | Description |
|-----------|-------------|
| UPPER | Convert to uppercase |
| LOWER | Convert to lowercase |
| INITCAP | Capitalize first letter |
| LENGTH | Length of string |
| SUBSTR | Extract substring |
| INSTR | Find position |
| TRIM | Remove spaces |
| REPLACE | Replace text |
| CONCAT | Join strings |

---

## 🛠 Practical Examples

```sql
SELECT UPPER(name) FROM employees;
```

```sql
SELECT SUBSTR(name, 1, 3) FROM employees;
```

```sql
SELECT INSTR(name, 'a') FROM employees;
```

```sql
SELECT TRIM('  Oracle  ') FROM dual;
```

---

# 5️⃣ Mathematical Functions

## 📘 Common Math Functions

| Function | Description |
|-----------|-------------|
| ROUND | Round number |
| TRUNC | Truncate number |
| MOD | Remainder |
| POWER | Exponent |
| SQRT | Square root |
| ABS | Absolute value |
| CEIL | Next highest integer |
| FLOOR | Next lowest integer |

---

## 🛠 Practical Examples

```sql
SELECT ROUND(123.456, 2) FROM dual;
```

```sql
SELECT TRUNC(123.456, 2) FROM dual;
```

```sql
SELECT MOD(10, 3) FROM dual;
```

```sql
SELECT POWER(2, 3) FROM dual;
```

---

# 6️⃣ Miscellaneous Functions

---

# 🔹 COALESCE

## 📘 Theory
Returns first non-NULL expression.

### 🛠 Example

```sql
SELECT COALESCE(NULL, NULL, 'Oracle') FROM dual;
```

Output:
Oracle

---

# 🔹 NULLIF

## 📘 Theory
Returns NULL if two expressions are equal, otherwise returns first expression.

It is commonly used to prevent errors like division by zero or to convert specific placeholder values into NULL for accurate analysis and reporting

### 🛠 Example

```sql
SELECT NULLIF(10, 10) FROM dual;

```

Output:
NULL

```sql
SELECT NULLIF(10, 5) FROM dual;
```

Output:
10
```sql
SELECT
    student,
    -- If course_count is 0, NULLIF makes it NULL, and the AVG calculation ignores it.
    AVG(NULLIF(course_count, 0)) AS average_courses
```
---

# 7️⃣ Nesting of Functions

## 📘 Theory

Functions can be placed inside another function.

Execution:
- Inner function executes first
- Outer function uses result

---

## 🛠 Example

```sql
SELECT UPPER(SUBSTR(name, 1, 3))
FROM employees;
```

Explanation:
- SUBSTR extracts first 3 characters
- UPPER converts them to uppercase

---

## Nested Mathematical Example

```sql
SELECT ROUND(AVG(salary), 2)
FROM employees;
```

AVG runs first → ROUND formats result.

---

# 8️⃣ SQL Expressions

## 📘 What is SQL Expression?

An SQL expression is:

- Combination of columns
- Operators
- Functions
- Constants

Used in:
- SELECT
- WHERE
- HAVING
- ORDER BY

---

## 🛠 Examples

Arithmetic expression:

```sql
SELECT salary * 12 AS annual_salary
FROM employees;
```

Conditional expression:

```sql
SELECT name
FROM employees
WHERE salary > AVG(salary);
```

---

# 9️⃣ Case Study – HR Management System

## Scenario

HR wants to:

- Format employee names
- Calculate yearly salary
- Replace NULL bonuses
- Generate performance report
- Round average salary

---

## Step 1: Create Table

```sql
CREATE TABLE employees (
    emp_id NUMBER PRIMARY KEY,
    name VARCHAR2(50),
    salary NUMBER,
    bonus NUMBER
);
```

---

## Step 2: Insert Data

```sql
INSERT INTO employees VALUES (1, 'amit', 50000, NULL);
INSERT INTO employees VALUES (2, 'neha', 60000, 5000);
INSERT INTO employees VALUES (3, 'rahul', 70000, NULL);
```

---

## Step 3: Format Names

```sql
SELECT INITCAP(name) FROM employees;
```

---

## Step 4: Replace NULL Bonus

```sql
SELECT name, COALESCE(bonus, 0) AS bonus_amount
FROM employees;
```

---

## Step 5: Calculate Total Salary

```sql
SELECT name,
       salary + COALESCE(bonus, 0) AS total_salary
FROM employees;
```

---

## Step 6: Calculate Rounded Average Salary

```sql
SELECT ROUND(AVG(salary), 2) AS avg_salary
FROM employees;
```

---

## Step 7: Nested Function Example

```sql
SELECT UPPER(SUBSTR(name, 1, 2)) AS short_code
FROM employees;
```

---

# 🔥 Final Summary

| Category | Examples |
|----------|----------|
| Deterministic | UPPER, ROUND |
| Nondeterministic | SYSDATE, DBMS_RANDOM |
| Scalar | LENGTH, SUBSTR |
| Aggregate | SUM, AVG, COUNT |
| String | TRIM, REPLACE |
| Math | POWER, MOD |
| Misc | COALESCE, NULLIF |

---

# 🎯 Key Interview Points

- Deterministic → Same input, same output
- Aggregate functions cannot be used in WHERE
- COALESCE returns first non-null value
- NULLIF prevents divide-by-zero errors
- Functions can be nested
- Expressions combine operators and functions

---

# 🚀 Conclusion

Oracle SQL functions are essential for:

- Data transformation
- Reporting
- Cleaning data
- Calculations
- Handling NULL values

Mastering function classification improves query writing efficiency and performance.

---

**End of Document**