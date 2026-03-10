# SQL Complete Guide  
# Theory and Hands-on Practice  

---

# 1️⃣ Data Definition Language (DDL)

DDL is used to define and modify database structure (schema).

Commands:
- CREATE
- ALTER
- RENAME
- DROP
- TRUNCATE

---

## 🔹 1. CREATE

Used to create database objects (tables, databases, views).

### Theory
- Defines structure
- Specifies columns and data types
- Can define constraints

### Hands-on

```sql
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    salary DECIMAL(10,2),
    hire_date DATE
);
```

---

## 🔹 2. ALTER

Used to modify existing table structure.

### Theory
- Add column
- Modify column
- Drop column
- Add constraints

### Hands-on

Add a column:

```sql
ALTER TABLE employees
ADD email VARCHAR(100);
```

Modify a column:

```sql
ALTER TABLE employees
MODIFY salary DECIMAL(12,2);
```

Drop a column:

```sql
ALTER TABLE employees
DROP COLUMN email;
```

---

## 🔹 3. RENAME

Used to rename table or column.

### Hands-on

Rename table:

```sql
ALTER TABLE employees
RENAME TO staff;
```

Rename column:

```sql
ALTER TABLE staff
RENAME COLUMN name TO full_name;
```

---

## 🔹 4. DROP

Deletes entire object permanently.

### Theory
- Removes structure and data
- Cannot be rolled back in many systems

### Hands-on

```sql
DROP TABLE staff;
```

---

## 🔹 5. TRUNCATE

Removes all rows but keeps structure.

### Theory
- Faster than DELETE
- Cannot use WHERE
- Resets auto-increment (in many DBs)

### Hands-on

```sql
TRUNCATE TABLE employees;
```

---

# 2️⃣ Data Manipulation Language (DML)

Used to manipulate data inside tables.

Commands:
- INSERT
- UPDATE
- DELETE

---

## 🔹 1. INSERT

### Theory
Adds new records into table.

### Hands-on

```sql
INSERT INTO employees (id, name, department, salary, hire_date)
VALUES (1, 'Rahul', 'IT', 60000, '2023-01-10');
```

Insert multiple rows:

```sql
INSERT INTO employees VALUES
(2, 'Anita', 'HR', 50000, '2022-06-15'),
(3, 'Karan', 'Finance', 70000, '2021-03-20');
```

---

## 🔹 2. UPDATE

### Theory
Modifies existing records.

### Hands-on

```sql
UPDATE employees
SET salary = 65000
WHERE id = 1;
```

---

## 🔹 3. DELETE

### Theory
Removes specific records.

### Hands-on

```sql
DELETE FROM employees
WHERE department = 'HR';
```

---

# 3️⃣ Data Query Language (DQL)

Used to retrieve data.

Commands:
- SELECT
- FETCH FIRST

---

## 🔹 1. SELECT

### Theory
Retrieves data from one or more tables.

### Hands-on

```sql
SELECT * FROM employees;
```

Select specific columns:

```sql
SELECT name, salary
FROM employees
WHERE salary > 60000
ORDER BY salary DESC;
```

---

## 🔹 2. FETCH FIRST

Used to limit number of rows (standard SQL).

### Hands-on

```sql
SELECT * FROM employees
ORDER BY salary DESC
FETCH FIRST 3 ROWS ONLY;
```

Equivalent in MySQL:

```sql
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 3;
```

---

# 4️⃣ Data Control Language (DCL)

Used to control user access and permissions.

Commands:
- GRANT
- REVOKE

---

## 🔹 1. GRANT

### Theory
Gives privileges to users.

### Hands-on

```sql
GRANT SELECT, INSERT
ON employees
TO user1;
```

---

## 🔹 2. REVOKE

### Theory
Removes privileges from users.

### Hands-on

```sql
REVOKE INSERT
ON employees
FROM user1;
```

---

# 5️⃣ Transaction Control Language (TCL)

Used to manage transactions.

Commands:
- COMMIT
- SAVEPOINT
- ROLLBACK

---

## 🔹 1. COMMIT

### Theory
Saves all changes permanently.

```sql
COMMIT;
```

---

## 🔹 2. SAVEPOINT

### Theory
Creates a checkpoint inside transaction.

```sql
SAVEPOINT sp1;
```

---

## 🔹 3. ROLLBACK

### Theory
Reverts changes.

Rollback entire transaction:

```sql
ROLLBACK;
```

Rollback to savepoint:

```sql
ROLLBACK TO sp1;
```

---

# 6️⃣ Case Study – Employee Management System

## Scenario

A company wants to:
- Create employee table
- Insert employees
- Update salaries
- Delete resigned employees
- Grant access to HR
- Use transactions safely

---

## Step 1: Create Table

```sql
CREATE TABLE employee (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);
```

---

## Step 2: Insert Data

```sql
INSERT INTO employees VALUES
(1, 'Amit', 'IT', 60000),
(2, 'Neha', 'HR', 50000),
(3, 'Ravi', 'Finance', 70000);
```

---

## Step 3: Start Transaction

```sql
SAVEPOINT before_update;
```

---

## Step 4: Update Salary

```sql
UPDATE employees
SET salary = salary + 5000
WHERE department = 'IT';
```

---

## Step 5: Delete Resigned Employee

```sql
DELETE FROM employees
WHERE id = 2;
```

---

## Step 6: Commit Changes

```sql
COMMIT;
```

If mistake occurs:

```sql
ROLLBACK TO before_update;
```

---

# 🔥 Final Summary

| Language | Purpose | Commands |
|----------|----------|----------|
| DDL | Structure | CREATE, ALTER, RENAME, DROP, TRUNCATE |
| DML | Data | INSERT, UPDATE, DELETE |
| DQL | Query | SELECT, FETCH FIRST |
| DCL | Security | GRANT, REVOKE |
| TCL | Transactions | COMMIT, SAVEPOINT, ROLLBACK |

---

# 🎯 Key Interview Points

- TRUNCATE is faster than DELETE
- DROP removes structure, DELETE removes rows
- COMMIT makes changes permanent
- ROLLBACK undoes changes
- GRANT gives permission, REVOKE removes permission

---

**End of Document**