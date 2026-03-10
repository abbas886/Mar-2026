# PL/SQL Cursors

## Cursors and Types of Cursors (Implicit and Explicit)

A **cursor** in PL/SQL is a pointer to a **result set returned by a SQL query**. It allows PL/SQL to **process query results row by row**.

Oracle automatically allocates memory for the query result and the cursor helps navigate through those records.

### Types of Cursors

| Cursor Type | Description |
|--------------|-------------|
| Implicit Cursor | Automatically created by Oracle for SQL statements like INSERT, UPDATE, DELETE, SELECT INTO |
| Explicit Cursor | Created by the programmer to handle queries returning multiple rows |

---

# Implicit Cursor

An **implicit cursor** is automatically created by Oracle when a SQL statement is executed.

Used with:

- INSERT
- UPDATE
- DELETE
- SELECT INTO

### Example

```
DECLARE
   emp_name VARCHAR2(50);
BEGIN
   SELECT first_name
   INTO emp_name
   FROM employees
   WHERE employee_id = 101;

   DBMS_OUTPUT.PUT_LINE(emp_name);
END;
/
```

Oracle internally manages the cursor for this query.

---

# Explicit Cursors

An **explicit cursor** is defined by the programmer for queries that return **multiple rows**.

It allows row-by-row processing.

### Steps to Create an Explicit Cursor

1. Declare the cursor  
2. Open the cursor  
3. Fetch records from the cursor  
4. Close the cursor  

---

### Example

```
DECLARE
   CURSOR emp_cursor IS
      SELECT employee_id, first_name
      FROM employees;

   v_id employees.employee_id%TYPE;
   v_name employees.first_name%TYPE;

BEGIN
   OPEN emp_cursor;

   LOOP
      FETCH emp_cursor INTO v_id, v_name;
      EXIT WHEN emp_cursor%NOTFOUND;

      DBMS_OUTPUT.PUT_LINE(v_id || ' ' || v_name);
   END LOOP;

   CLOSE emp_cursor;
END;
/
```

---

# Cursor Attributes

Cursor attributes provide information about the status of a cursor.

| Attribute | Description |
|-----------|-------------|
| %FOUND | TRUE if the last fetch returned a row |
| %NOTFOUND | TRUE if no row was returned |
| %ROWCOUNT | Number of rows fetched |
| %ISOPEN | TRUE if cursor is open |

### Example

```
EXIT WHEN emp_cursor%NOTFOUND;
```

---

# Cursor With Attributes and Without Attributes

### Without Attributes

```
FETCH emp_cursor INTO v_id, v_name;
```

But this may cause errors if no rows exist.

---

### With Attributes

```
FETCH emp_cursor INTO v_id, v_name;

EXIT WHEN emp_cursor%NOTFOUND;
```

This safely exits the loop when no more rows exist.

---

# Cursor with Parameters

Parameterized cursors allow passing values to the cursor at runtime.

### Syntax

```
CURSOR cursor_name(parameter datatype) IS
SELECT statement;
```

### Example

```
DECLARE
   CURSOR emp_cursor(dept_id NUMBER) IS
   SELECT first_name
   FROM employees
   WHERE department_id = dept_id;

   v_name employees.first_name%TYPE;

BEGIN
   OPEN emp_cursor(10);

   LOOP
      FETCH emp_cursor INTO v_name;
      EXIT WHEN emp_cursor%NOTFOUND;

      DBMS_OUTPUT.PUT_LINE(v_name);
   END LOOP;

   CLOSE emp_cursor;
END;
/
```

---

# Cursor without Parameters

This is the normal cursor without runtime input.

### Example

```
DECLARE
   CURSOR emp_cursor IS
   SELECT first_name FROM employees;

   v_name employees.first_name%TYPE;

BEGIN
   OPEN emp_cursor;

   LOOP
      FETCH emp_cursor INTO v_name;
      EXIT WHEN emp_cursor%NOTFOUND;

      DBMS_OUTPUT.PUT_LINE(v_name);
   END LOOP;

   CLOSE emp_cursor;
END;
/
```

---

# Cursor Iteration – FOR..IN LOOP

PL/SQL provides a simpler way to iterate through cursor records using **FOR LOOP**.

In this method:

- OPEN
- FETCH
- CLOSE

are handled automatically.

### Example

```
DECLARE
   CURSOR emp_cursor IS
   SELECT employee_id, first_name
   FROM employees;

BEGIN
   FOR emp_record IN emp_cursor
   LOOP
      DBMS_OUTPUT.PUT_LINE(emp_record.employee_id || ' ' || emp_record.first_name);
   END LOOP;
END;
/
```

Advantages:

- Cleaner code
- No manual OPEN/FETCH/CLOSE
- Less error-prone

---

# FOR UPDATE & WHERE CURRENT OF Clause

The `FOR UPDATE` clause locks selected rows for update.

The `WHERE CURRENT OF` clause updates the **current row fetched by the cursor**.

### Example

```
DECLARE
   CURSOR emp_cursor IS
   SELECT employee_id, salary
   FROM employees
   FOR UPDATE;

BEGIN
   FOR emp_record IN emp_cursor
   LOOP
      UPDATE employees
      SET salary = salary + 1000
      WHERE CURRENT OF emp_cursor;
   END LOOP;
END;
/
```

This ensures:

- Each row is locked
- Safe updates in concurrent environments

---

# REF Cursor

A **REF CURSOR** is a **cursor variable** that allows dynamic query execution and passing result sets between procedures.

It is widely used in **APIs, stored procedures, and applications**.

### Syntax

```
TYPE cursor_type IS REF CURSOR;
```

---

### Example

```
DECLARE
   TYPE emp_cursor_type IS REF CURSOR;
   emp_cursor emp_cursor_type;

   v_name employees.first_name%TYPE;

BEGIN
   OPEN emp_cursor FOR
      SELECT first_name FROM employees;

   LOOP
      FETCH emp_cursor INTO v_name;
      EXIT WHEN emp_cursor%NOTFOUND;

      DBMS_OUTPUT.PUT_LINE(v_name);
   END LOOP;

   CLOSE emp_cursor;
END;
/
```

---

### REF Cursor in Stored Procedure

```
CREATE OR REPLACE PROCEDURE get_employees(
   emp_cursor OUT SYS_REFCURSOR
)
IS
BEGIN
   OPEN emp_cursor FOR
   SELECT * FROM employees;
END;
/
```

Usage:

```
DECLARE
   c SYS_REFCURSOR;
   v_name employees.first_name%TYPE;
BEGIN
   get_employees(c);

   LOOP
      FETCH c INTO v_name;
      EXIT WHEN c%NOTFOUND;

      DBMS_OUTPUT.PUT_LINE(v_name);
   END LOOP;

   CLOSE c;
END;
/
```

---

# Summary

This section covered **PL/SQL Cursors**, including:

- What cursors are
- Types of cursors (Implicit and Explicit)
- Steps to create explicit cursors
- Cursor attributes (%FOUND, %NOTFOUND, %ROWCOUNT, %ISOPEN)
- Cursor with and without parameters
- Cursor iteration using FOR..IN LOOP
- Using FOR UPDATE and WHERE CURRENT OF
- REF Cursor for dynamic queries and result set passing

Cursors are essential for **processing multi-row query results and building advanced database applications**.
```