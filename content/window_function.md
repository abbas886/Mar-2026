# SQL Window Functions – Complete End-to-End Guide

Window functions perform calculations across a set of rows related to the current row **without collapsing the result set**.

Unlike `GROUP BY`, window functions:
- Do NOT reduce the number of rows
- Preserve row-level detail
- Allow aggregate + row-level data together
- Are heavily used in analytics, reporting, and data engineering

---

# 1️⃣ General Syntax

```sql
function_name() OVER (
    PARTITION BY column_name     -- Optional
    ORDER BY column_name         -- Optional (Required for ranking functions)
    ROWS | RANGE frame_clause    -- Optional
)
```

## Components

- `OVER()` → Defines the window
- `PARTITION BY` → Divides rows into groups
- `ORDER BY` → Defines logical ordering
- `ROWS / RANGE` → Defines frame boundaries

---

# 2️⃣ Types of Window Functions

## A. Ranking Functions
- `RANK()`
- `DENSE_RANK()`
- `ROW_NUMBER()`
- `NTILE(n)`

## B. Aggregate Window Functions
- `SUM()`
- `AVG()`
- `COUNT()`
- `MIN()`
- `MAX()`

## C. Value (Analytic) Functions
- `LAG()`
- `LEAD()`
- `FIRST_VALUE()`
- `LAST_VALUE()`

---

# 3️⃣ Ranking Functions

## 3.1 RANK()

Assigns rank with gaps for ties.

```sql
SELECT 
    name,
    salary,
    RANK() OVER (ORDER BY salary DESC) AS rnk
FROM employees;
```

If two rows tie:
- Same rank assigned
- Next rank skipped

Example:

| salary | rnk |
|--------|-----|
| 7000   | 1   |
| 7000   | 1   |
| 5000   | 3   |

---

## 3.2 DENSE_RANK()

No gaps in ranking.

```sql
SELECT 
    name,
    salary,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rnk
FROM employees;
```

Example:

| salary | dense_rnk |
|--------|-----------|
| 7000   | 1         |
| 7000   | 1         |
| 5000   | 2         |

---

## 3.3 ROW_NUMBER()

Always unique sequential numbering.

```sql
SELECT 
    name,
    salary,
    ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employees;
```

Used for:
- Pagination
- Deduplication
- Top N queries

---

## 3.4 NTILE(n)

Divides rows into equal buckets.

```sql
SELECT 
    name,
    salary,
    NTILE(4) OVER (ORDER BY salary DESC) AS quartile
FROM employees;
```

Used for:
- Percentile grouping
- Data segmentation
- Banding

---

# 4️⃣ Aggregate Window Functions

## 4.1 Running Total

```sql
SELECT
    id,
    salary,
    SUM(salary) OVER (ORDER BY id) AS running_total
FROM employees;
```

---

## 4.2 Partitioned Aggregate

```sql
SELECT
    dept,
    name,
    salary,
    AVG(salary) OVER (PARTITION BY dept) AS dept_avg
FROM employees;
```

Each row shows:
- Individual salary
- Department average

---

## 4.3 Cumulative Count

```sql
SELECT
    id,
    COUNT(*) OVER (ORDER BY id) AS cumulative_count
FROM employees;
```

---

# 5️⃣ Value Functions

## 5.1 LAG()

Returns previous row value.

```sql
SELECT
    id,
    salary,
    LAG(salary) OVER (ORDER BY id) AS previous_salary
FROM employees;
```

Use Cases:
- Growth calculation
- Month-over-month comparison
- Trend analysis

---

## 5.2 LEAD()

Returns next row value.

```sql
SELECT
    id,
    salary,
    LEAD(salary) OVER (ORDER BY id) AS next_salary
FROM employees;
```

---

## 5.3 FIRST_VALUE()

```sql
SELECT
    name,
    salary,
    FIRST_VALUE(salary) OVER (ORDER BY salary DESC) AS highest_salary
FROM employees;
```

---

## 5.4 LAST_VALUE()

Requires explicit frame definition.

```sql
SELECT
    name,
    salary,
    LAST_VALUE(salary) OVER (
        ORDER BY salary
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS lowest_salary
FROM employees;
```

---

# 6️⃣ Window Frame Clause

Defines which rows are included in calculation.

## Default Frame (when ORDER BY exists)

```
RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
```

---

## Moving Average (Last 3 Rows)

```sql
SELECT
    id,
    salary,
    AVG(salary) OVER (
        ORDER BY id
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_avg
FROM employees;
```

---

# 7️⃣ Execution Order

SQL logical processing order:

```
FROM
WHERE
GROUP BY
HAVING
WINDOW
SELECT
ORDER BY
```

Window functions execute after:
- WHERE
- GROUP BY
- HAVING

They cannot be used directly inside WHERE.

---

# 8️⃣ Filtering Window Results

## ❌ Incorrect

```sql
SELECT *
FROM employees
WHERE RANK() OVER (ORDER BY salary DESC) <= 3;
```

## ✅ Correct (Using CTE)

```sql
WITH ranked AS (
    SELECT *,
           RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM employees
)
SELECT *
FROM ranked
WHERE rnk <= 3;
```

---

# 9️⃣ Top N Per Group Pattern

```sql
WITH ranked AS (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY dept
               ORDER BY salary DESC
           ) AS rn
    FROM employees
)
SELECT *
FROM ranked
WHERE rn <= 3;
```

---

# 🔟 ROWS vs RANGE

| Feature | ROWS | RANGE |
|----------|------|--------|
| Physical row-based | Yes | No |
| Logical value-based | No | Yes |
| Safer for moving calculations | Yes | Sometimes ambiguous |

Example difference:
- `ROWS BETWEEN 2 PRECEDING` → Exactly 2 rows
- `RANGE BETWEEN 100 PRECEDING` → Based on value range

---

# 1️⃣1️⃣ Real-World Use Cases

- Leaderboards
- Salary gap analysis
- Fraud ranking
- Revenue growth tracking
- Time-series analysis
- Cohort analysis
- Customer churn analysis
- Financial running balances
- Analytics dashboards

---

# 1️⃣2️⃣ Performance Considerations (Architect-Level)

- Requires sorting → expensive on large datasets
- Index on ORDER BY column improves performance
- Partitioning increases memory usage
- Large partitions may spill to disk
- Avoid unnecessary multiple window computations
- Use selective filters before window execution

For very large datasets:
- Pre-aggregate where possible
- Use partition pruning
- Consider materialized views

---

# 1️⃣3️⃣ Interview-Oriented Questions

1. Difference between RANK() and DENSE_RANK()?
2. Why can't window functions be used in WHERE?
3. How to find Top 3 per department?
4. Difference between ROWS and RANGE?
5. How to calculate moving average?
6. How to remove duplicates using ROW_NUMBER()?
7. Performance impact of window functions?
8. When would you prefer GROUP BY instead?

---

# 🔥 Final Summary

Window Functions:

- Work across related rows
- Do NOT collapse result set
- Support ranking, aggregation, and row comparison
- Enable advanced analytics in SQL
- Are foundational for Data Engineering and Reporting systems

They are essential for:
- Enterprise reporting
- BI dashboards
- Analytical queries
- Data warehouse transformations
- Financial calculations
- Time-series processing

---

**End of Document**