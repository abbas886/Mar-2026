# COALESCE Function in SQL  
# Theory and Hands-on with Examples  

---

# 1️⃣ What is COALESCE?

## 📘 Definition

COALESCE is a SQL function that returns the first non-NULL value from a list of expressions.

It is used to handle NULL values effectively.

---

# 2️⃣ Syntax

```sql
COALESCE(expression1, expression2, ..., expressionN)
```

- Evaluates expressions from left to right
- Returns the first non-NULL value
- If all values are NULL → returns NULL

---

# 3️⃣ Why Use COALESCE?

- Replace NULL with default value
- Prevent NULL in calculations
- Improve report readability
- Handle optional data fields

---

# 4️⃣ Sample Table for Practice

```sql
CREATE TABLE employees (
    emp_id INT,
    name VARCHAR(50),
    bonus DECIMAL(10,2),
    commission DECIMAL(10,2)
);
```

Insert Data:

```sql
INSERT INTO employees VALUES
(101, 'Amit', NULL, 5000),
(102, 'Neha', 3000, NULL),
(103, 'Rahul', NULL, NULL);
```

---

# 5️⃣ Basic Example

## Replace NULL Bonus with 0

```sql
SELECT name,
       COALESCE(bonus, 0) AS bonus_amount
FROM employees;
```

Output:
- If bonus is NULL → 0
- Otherwise → actual bonus

---

# 6️⃣ Multiple Arguments Example

```sql
SELECT name,
       COALESCE(bonus, commission, 0) AS incentive
FROM employees;
```

Explanation:
- If bonus exists → return bonus
- Else if commission exists → return commission
- Else → return 0

---

# 7️⃣ COALESCE in Calculations

Without COALESCE:

```sql
SELECT name,
       bonus + commission AS total_incentive
FROM employees;
```

If one value is NULL → result becomes NULL

Correct way:

```sql
SELECT name,
       COALESCE(bonus,0) + COALESCE(commission,0) AS total_incentive
FROM employees;
```

---

# 8️⃣ COALESCE with Aggregate Functions

```sql
SELECT COALESCE(SUM(bonus), 0) AS total_bonus
FROM employees;
```

If no rows exist → SUM returns NULL  
COALESCE ensures result is 0

---

# 9️⃣ COALESCE vs ISNULL vs NVL

| Function | Database       | Behavior |
|----------|----------------|----------|
| COALESCE | Standard SQL   | Multiple arguments |
| ISNULL   | SQL Server     | Two arguments only |
| NVL      | Oracle         | Two arguments only |

Example:

```sql
-- SQL Server
SELECT ISNULL(bonus, 0) FROM employees;

-- Oracle
SELECT NVL(bonus, 0) FROM employees;
```

COALESCE is portable across databases.

---

# 🔟 Real-World Use Cases

- Replacing missing salary values
- Displaying "Not Available"
- Defaulting NULL numeric values to 0
- Preventing calculation errors
- Handling optional columns

---

# 1️⃣1️⃣ Case Study – Employee Incentive Report

## Scenario

Company wants:
- Incentive = bonus if available
- Else commission
- Else 0
- No NULL values in report

### Solution:

```sql
SELECT emp_id,
       name,
       COALESCE(bonus, commission, 0) AS incentive
FROM employees;
```

---

## Total Incentive for Company

```sql
SELECT SUM(
       COALESCE(bonus,0) + COALESCE(commission,0)
       ) AS total_company_incentive
FROM employees;
```

---

# 1️⃣2️⃣ Important Notes

- All expressions must be compatible data types
- Evaluates left to right
- Stops at first non-NULL
- Slightly slower than ISNULL (in some databases)
- Best for portable SQL code

---

# 🔥 Interview Points

- COALESCE is ANSI SQL standard
- Can take multiple arguments
- Used to handle NULL values
- Often used in SELECT and calculations
- Prevents NULL propagation in arithmetic

---

# 🚀 Conclusion

COALESCE is a powerful and essential SQL function for:

- Handling NULL values
- Writing safe calculations
- Improving data presentation
- Making SQL code database-independent

Mastering COALESCE helps avoid common NULL-related bugs in SQL applications.

---

**End of Document**