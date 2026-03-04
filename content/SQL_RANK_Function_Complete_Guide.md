# SQL RANK() Function -- Complete Guide

The `RANK()` function is a **window function** used to assign ranking
numbers to rows based on a specified order.

It is commonly used for:

-   Leaderboards\
-   Salary ranking\
-   Top-N queries\
-   Department-wise ranking\
-   Analytical reporting

------------------------------------------------------------------------

## Syntax

``` sql
RANK() OVER (
    PARTITION BY column_name   -- Optional
    ORDER BY column_name       -- Required
)
```

### Components

-   `OVER()` → Defines the window\
-   `PARTITION BY` → Divides rows into groups (does NOT collapse rows
    like GROUP BY)\
-   `ORDER BY` → Defines ranking order

------------------------------------------------------------------------

# 1️⃣ Basic Example (Without PARTITION)

## Sample Table: employees

  id   name   salary
  ---- ------ --------
  1    A      5000
  2    B      7000
  3    C      7000
  4    D      4000

## Query

``` sql
SELECT 
    name,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employees;
```

## Result

  name   salary   salary_rank
  ------ -------- -------------
  B      7000     1
  C      7000     1
  A      5000     3
  D      4000     4

### Key Observation

-   Same values → Same rank\
-   Next rank is skipped

Example: - Rank 1 appears twice\
- Rank 2 is skipped\
- Next rank is 3

------------------------------------------------------------------------

# 2️⃣ RANK vs DENSE_RANK vs ROW_NUMBER

  Function         Handles Ties   Skips Rank?
  ---------------- -------------- -------------
  `RANK()`         Yes            Yes
  `DENSE_RANK()`   Yes            No
  `ROW_NUMBER()`   No             No

## Comparison Example

``` sql
SELECT 
    name,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS rnk,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rnk,
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employees;
```

  name   salary   rnk   dense_rnk   row_num
  ------ -------- ----- ----------- ---------
  B      7000     1     1           1
  C      7000     1     1           2
  A      5000     3     2           3
  D      4000     4     3           4

------------------------------------------------------------------------

# 3️⃣ Using PARTITION BY (Group-wise Ranking)

## Scenario: Rank employees within each department

``` sql
SELECT 
    name,
    dept,
    salary,
    RANK() OVER (
        PARTITION BY dept
        ORDER BY salary DESC
    ) AS dept_rank
FROM employees;
```

### What Happens?

-   Ranking restarts for each department\
-   Each department has its own independent ranking

------------------------------------------------------------------------

# 4️⃣ Top N Per Group (Common Interview Question)

## Get Top 2 Salaries Per Department

``` sql
SELECT *
FROM (
    SELECT 
        name,
        dept,
        salary,
        RANK() OVER (
            PARTITION BY dept
            ORDER BY salary DESC
        ) AS dept_rank
    FROM employees
) t
WHERE dept_rank <= 2;
```

------------------------------------------------------------------------

# 5️⃣ Find 2nd Highest Salary

``` sql
SELECT *
FROM (
    SELECT 
        salary,
        RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM employees
) t
WHERE rnk = 2;
```

------------------------------------------------------------------------

# 6️⃣ Important Rules

## ❌ You Cannot Use RANK() Directly in WHERE

``` sql
-- WRONG
SELECT name, RANK() OVER (ORDER BY salary DESC)
FROM employees
WHERE RANK() OVER (ORDER BY salary DESC) <= 3;
```

## ✅ Correct Approach (Using CTE)

``` sql
WITH ranked_data AS (
    SELECT 
        name,
        salary,
        RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM employees
)
SELECT *
FROM ranked_data
WHERE rnk <= 3;
```

------------------------------------------------------------------------

# 7️⃣ Execution Order (Important Concept)

SQL logical processing order:

FROM → WHERE → GROUP BY → HAVING → WINDOW → SELECT → ORDER BY

Window functions execute **after WHERE and GROUP BY**, so filtering must
be done outside.

------------------------------------------------------------------------

# 8️⃣ Performance Considerations

-   `RANK()` requires sorting → expensive for large datasets\
-   Index on `ORDER BY` column improves performance\
-   Use partitioning carefully on large tables\
-   Avoid unnecessary window computations

------------------------------------------------------------------------

# 9️⃣ When To Use What?

  Scenario                      Recommended Function
  ----------------------------- ----------------------
  Strict sequential numbering   `ROW_NUMBER()`
  Ranking with gaps allowed     `RANK()`
  Ranking without gaps          `DENSE_RANK()`

------------------------------------------------------------------------

# 🔥 Summary

-   `RANK()` assigns ranking based on order\
-   Same values share same rank\
-   Rank numbers may skip\
-   `PARTITION BY` enables group-wise ranking\
-   Use subqueries/CTEs to filter ranked results

------------------------------------------------------------------------

**End of Document**
