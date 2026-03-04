# Understanding Constraints and Data Integrity  
# Theory and Practicals with Case Study  

---

# 1️⃣ Understanding Constraints

## What are Constraints?

Constraints are rules applied to table columns to enforce **data accuracy, validity, and consistency**.

They ensure:
- No invalid data is inserted
- Relationships remain consistent
- Business rules are maintained

Constraints are part of **data integrity mechanisms** in relational databases.

---

# 2️⃣ Data Integrity

Data integrity ensures data is:

- Accurate
- Consistent
- Reliable
- Valid

Types of Data Integrity:

1. Entity Integrity  
2. Referential Integrity  
3. Domain Integrity  
4. User-Defined Integrity  

---

# 3️⃣ Integrity Constraints

Integrity constraints are rules enforced on data columns.

They include:

- PRIMARY KEY
- FOREIGN KEY
- NOT NULL
- UNIQUE
- CHECK
- DEFAULT
- Custom rules (User-defined)

---

# 4️⃣ Entity Integrity

## Theory

Entity integrity ensures:

- Each row in a table is unique
- Primary key cannot be NULL
- No duplicate primary key values allowed

It guarantees each record is uniquely identifiable.

---

# PRIMARY KEY Constraint

## Theory

- Uniquely identifies each record
- Cannot contain NULL
- Automatically creates unique index

---

## Practical Example

```sql
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10,2)
);
```

Attempt to insert duplicate:

```sql
INSERT INTO employees VALUES (1, 'Rahul', 60000);
INSERT INTO employees VALUES (1, 'Anita', 50000);  -- ❌ Error
```

---

# 5️⃣ Sequence Generators

## Theory

Sequence generators are used to auto-generate numeric values (commonly for primary keys).

Used in:
- Oracle
- PostgreSQL
- SQL Server (Identity)
- MySQL (AUTO_INCREMENT)

---

## Practical (Oracle/PostgreSQL Style)

```sql
CREATE SEQUENCE emp_seq
START WITH 1
INCREMENT BY 1;
```

Use sequence:

```sql
INSERT INTO employees (emp_id, name, salary)
VALUES (emp_seq.NEXTVAL, 'Karan', 70000);
```

---

## MySQL Version

```sql
CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    salary DECIMAL(10,2)
);
```

---

# 6️⃣ Referential Integrity

## Theory

Referential integrity ensures:

- Foreign key value must exist in parent table
- Maintains relationship consistency
- Prevents orphan records

---

# FOREIGN KEY Constraint

## Theory

- Links child table to parent table
- Ensures valid references
- Can define ON DELETE / ON UPDATE rules

---

## Practical Example

Parent Table:

```sql
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
```

Child Table:

```sql
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id)
        REFERENCES departments(dept_id)
);
```

Invalid insert:

```sql
INSERT INTO employees VALUES (1, 'Rahul', 10);  -- ❌ If dept 10 does not exist
```

---

## ON DELETE CASCADE Example

```sql
FOREIGN KEY (dept_id)
REFERENCES departments(dept_id)
ON DELETE CASCADE;
```

If department is deleted → employees automatically deleted.

---

# 7️⃣ Domain Integrity

## Theory

Domain integrity ensures:

- Column values must be valid
- Follow specific data type
- Follow allowed range or format

Enforced using:
- NOT NULL
- CHECK
- DEFAULT
- Data types

---

# NOT NULL Constraint

## Theory

Prevents NULL values in column.

## Practical

```sql
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);
```

---

# UNIQUE KEY Constraint

## Theory

- Ensures no duplicate values
- Allows one NULL (in most DBs)
- Can be applied to multiple columns

## Practical

```sql
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE
);
```

Composite unique:

```sql
UNIQUE (first_name, last_name)
```

---

# CHECK Constraint

## Theory

Ensures values satisfy a condition.

## Practical

```sql
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    salary DECIMAL(10,2) CHECK (salary > 0)
);
```

Multiple condition:

```sql
CHECK (age >= 18 AND age <= 60)
```

---

# 8️⃣ User Defined Integrity

## Theory

Custom business rules not covered by standard constraints.

Implemented using:
- CHECK constraints
- Triggers
- Stored procedures

Example business rule:
- Salary must not exceed 200000

```sql
CHECK (salary <= 200000)
```

Advanced rule using trigger:

```sql
CREATE TRIGGER salary_limit
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN
    IF NEW.salary > 200000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary exceeds limit';
    END IF;
END;
```

---

# 9️⃣ Enabling and Disabling Constraints

Used during:
- Bulk data loading
- Maintenance operations

---

## Disable Constraint (Oracle Example)

```sql
ALTER TABLE employees
DISABLE CONSTRAINT employees_pk;
```

## Enable Constraint

```sql
ALTER TABLE employees
ENABLE CONSTRAINT employees_pk;
```

---

## SQL Server Example

```sql
ALTER TABLE employees
NOCHECK CONSTRAINT ALL;
```

Enable:

```sql
ALTER TABLE employees
CHECK CONSTRAINT ALL;
```

---

# 🔟 Case Study – University Database

## Scenario

A university wants to:

- Maintain unique student records
- Ensure valid department assignment
- Prevent invalid age
- Prevent duplicate emails

---

## Step 1: Create Department Table

```sql
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) UNIQUE NOT NULL
);
```

---

## Step 2: Create Student Table with Constraints

```sql
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    age INT CHECK (age >= 17),
    dept_id INT,
    FOREIGN KEY (dept_id)
        REFERENCES departments(dept_id)
);
```

---

## Step 3: Insert Valid Data

```sql
INSERT INTO departments VALUES (1, 'Computer Science');

INSERT INTO students
VALUES (101, 'Amit', 'amit@gmail.com', 20, 1);
```

---

## Step 4: Invalid Examples

Duplicate email:

```sql
INSERT INTO students
VALUES (102, 'Rahul', 'amit@gmail.com', 21, 1);  -- ❌ Error
```

Invalid age:

```sql
INSERT INTO students
VALUES (103, 'Neha', 'neha@gmail.com', 15, 1);  -- ❌ Error
```

Invalid department:

```sql
INSERT INTO students
VALUES (104, 'Karan', 'karan@gmail.com', 22, 5);  -- ❌ Error
```

---

# 🔥 Final Summary

| Constraint | Ensures |
|------------|----------|
| PRIMARY KEY | Unique + Not NULL |
| FOREIGN KEY | Valid reference |
| NOT NULL | No NULL values |
| UNIQUE | No duplicate values |
| CHECK | Valid condition |
| DEFAULT | Default value |
| Sequence | Auto-generated values |

---

# 🎯 Key Interview Points

- Primary key enforces entity integrity
- Foreign key enforces referential integrity
- CHECK enforces domain integrity
- Constraints improve performance and reliability
- Disabling constraints should be done carefully

---

# 🚀 Conclusion

Constraints are essential for:

- Maintaining data integrity
- Preventing invalid data
- Enforcing business rules
- Ensuring reliable database systems

Strong constraint design = Strong database foundation.

---

**End of Document**