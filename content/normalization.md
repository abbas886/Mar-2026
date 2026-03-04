# Database Normalization – Complete Guide

Normalization is the process of organizing data in a database to:

- Reduce redundancy (duplicate data)
- Eliminate data anomalies
- Improve data integrity
- Ensure logical data dependency

Normalization is achieved by dividing large tables into smaller related tables and defining relationships between them.

---

# Why Normalization?

Without normalization, databases suffer from:

## 1️⃣ Insertion Anomaly
Cannot insert data without other dependent data.

## 2️⃣ Update Anomaly
Updating data in one place but missing other duplicates.

## 3️⃣ Deletion Anomaly
Deleting one row unintentionally removes important data.

---

# Types of Normal Forms

- 1NF – First Normal Form
- 2NF – Second Normal Form
- 3NF – Third Normal Form
- BCNF – Boyce-Codd Normal Form
- 4NF – Fourth Normal Form
- 5NF – Fifth Normal Form

Most real-world systems stop at **3NF or BCNF**.

---

# 1️⃣ First Normal Form (1NF)

## Rule:
- No repeating groups
- No multi-valued attributes
- Atomic (single) values only
- Each row uniquely identifiable (Primary Key)

## Not in 1NF

| student_id | name  | subjects        |
|------------|--------|----------------|
| 1          | Abbas  | Math, Physics  |

Problem:
- `subjects` contains multiple values

## Convert to 1NF

| student_id | name  | subject  |
|------------|--------|----------|
| 1          | Abbas  | Math     |
| 1          | Abbas  | Physics  |

Now:
- Each column contains atomic values

---

# 2️⃣ Second Normal Form (2NF)

## Rule:
- Must be in 1NF
- No Partial Dependency
- Non-key attributes must depend on the entire primary key

Applies only when:
- Composite primary key exists

## Example (Not in 2NF)

| order_id | product_id | product_name | quantity |
|----------|------------|--------------|----------|

Primary Key: (order_id, product_id)

Problem:
- `product_name` depends only on `product_id`
- Not on full composite key

## Convert to 2NF

### Orders Table

| order_id | product_id | quantity |

### Products Table

| product_id | product_name |

Now:
- All non-key attributes depend fully on primary key

---

# 3️⃣ Third Normal Form (3NF)

## Rule:
- Must be in 2NF
- No Transitive Dependency
- Non-key attributes must depend only on primary key

## Example (Not in 3NF)

| emp_id | emp_name | dept_id | dept_name |
|--------|----------|----------|------------|

Problem:
- `dept_name` depends on `dept_id`
- `dept_id` depends on `emp_id`
- Transitive dependency exists

## Convert to 3NF

### Employees Table

| emp_id | emp_name | dept_id |

### Departments Table

| dept_id | dept_name |

Now:
- No transitive dependency

---

# 4️⃣ Boyce-Codd Normal Form (BCNF)

Stronger version of 3NF.

## Rule:
For every functional dependency:
- Left side must be a super key

Used when:
- Complex functional dependencies exist

Most OLTP systems aim for BCNF.

---

# 5️⃣ Fourth Normal Form (4NF)

## Rule:
- No multi-valued dependency

If one entity has:
- Multiple independent multi-valued attributes

Split them into separate tables.

Rare in typical business systems.

---

# 6️⃣ Fifth Normal Form (5NF)

## Rule:
- No join dependency
- Cannot be further decomposed without losing data

Very rare in practical systems.

---

# Functional Dependency (Core Concept)

If A → B

It means:
If two rows have same A,
They must have same B.

Example:

product_id → product_name

Understanding functional dependency is critical for normalization.

---

# Summary of Normal Forms

| Normal Form | Eliminates |
|-------------|------------|
| 1NF | Repeating groups |
| 2NF | Partial dependency |
| 3NF | Transitive dependency |
| BCNF | Non-superkey dependency |
| 4NF | Multi-valued dependency |
| 5NF | Join dependency |

---

# Normalization vs Denormalization

## Normalization
- Reduces redundancy
- Improves integrity
- More joins required
- Best for OLTP systems

## Denormalization
- Improves read performance
- Reduces joins
- Introduces redundancy
- Common in Data Warehouses

---

# Real-World Application

## OLTP Systems
- Banking
- E-commerce
- ERP
- CRM
→ Use 3NF or BCNF

## Data Warehousing
- Reporting systems
- Analytics dashboards
→ Often denormalized (Star schema)

---

# When To Stop Normalizing?

In practice:
- Most systems stop at 3NF
- BCNF for strict integrity
- Over-normalization can hurt performance

Balance:
✔ Data integrity  
✔ Performance  
✔ Query simplicity  

---

# Interview Questions

1. Difference between 2NF and 3NF?
2. What is transitive dependency?
3. Why does normalization reduce anomalies?
4. Difference between 3NF and BCNF?
5. When would you denormalize?
6. Is normalization always good?

---

# Final Takeaway

Normalization is about:

- Logical data design
- Eliminating redundancy
- Maintaining integrity
- Designing scalable OLTP systems

A strong database design foundation requires deep understanding of:
- Functional dependencies
- Primary keys
- Candidate keys
- Anomalies
- Normal forms

---

**End of Document**