# PL/SQL Composite Datatypes and Dynamic SQL

## Introduction to Composite Datatypes

A **composite datatype** in PL/SQL is a datatype that can store **multiple values in a single variable**. Unlike scalar types (NUMBER, VARCHAR2), composite types can store **groups of related data**.

Composite datatypes are useful when working with **rows of tables, multiple records, or collections of values**.

Common composite datatypes in PL/SQL:

- Records
- Collections

Benefits:
- Better representation of structured data
- Efficient data handling
- Useful in bulk processing and complex queries

---

# Table Based Records

A **table-based record** allows a variable to represent an entire row of a table using the `%ROWTYPE` attribute.

This ensures the record structure automatically matches the table structure.

### Syntax

```
record_variable table_name%ROWTYPE;
```

---

### Example

```
DECLARE
   emp_record employees%ROWTYPE;
BEGIN
   SELECT *
   INTO emp_record
   FROM employees
   WHERE employee_id = 101;

   DBMS_OUTPUT.PUT_LINE(emp_record.first_name || ' ' || emp_record.salary);
END;
/
```

---

# Hands-on Practice on Table Based Records

```
DECLARE
   dept_record departments%ROWTYPE;
BEGIN
   SELECT *
   INTO dept_record
   FROM departments
   WHERE department_id = 10;

   DBMS_OUTPUT.PUT_LINE(dept_record.department_name);
END;
/
```

Advantages:
- Automatically adapts if table structure changes
- Simplifies coding

---

# Custom Records

A **custom record** is a user-defined structure composed of multiple fields.

Used when data comes from **different tables or custom structures**.

### Syntax

```
TYPE record_name IS RECORD
(
   field1 datatype,
   field2 datatype
);
```

---

### Example

```
DECLARE
   TYPE emp_type IS RECORD
   (
      emp_id NUMBER,
      emp_name VARCHAR2(50),
      salary NUMBER
   );

   emp_record emp_type;
BEGIN
   emp_record.emp_id := 101;
   emp_record.emp_name := 'John';
   emp_record.salary := 50000;

   DBMS_OUTPUT.PUT_LINE(emp_record.emp_name);
END;
/
```

---

# Hands-on Practice on Custom Records

```
DECLARE
   TYPE student_record IS RECORD
   (
      student_id NUMBER,
      student_name VARCHAR2(50),
      marks NUMBER
   );

   s student_record;
BEGIN
   s.student_id := 1;
   s.student_name := 'Rahul';
   s.marks := 85;

   DBMS_OUTPUT.PUT_LINE(s.student_name || ' ' || s.marks);
END;
/
```

---

# Cursor Based Record

A **cursor-based record** automatically takes the structure of the cursor query.

### Syntax

```
cursor_variable cursor_name%ROWTYPE;
```

---

### Example

```
DECLARE
   CURSOR emp_cursor IS
   SELECT employee_id, first_name, salary
   FROM employees;

   emp_record emp_cursor%ROWTYPE;

BEGIN
   OPEN emp_cursor;

   LOOP
      FETCH emp_cursor INTO emp_record;
      EXIT WHEN emp_cursor%NOTFOUND;

      DBMS_OUTPUT.PUT_LINE(emp_record.first_name);
   END LOOP;

   CLOSE emp_cursor;
END;
/
```

---

# Hands-on Practice on Cursor Based Record

```
DECLARE
   CURSOR dept_cursor IS
   SELECT department_id, department_name
   FROM departments;

   dept_record dept_cursor%ROWTYPE;

BEGIN
   FOR dept_record IN dept_cursor
   LOOP
      DBMS_OUTPUT.PUT_LINE(dept_record.department_name);
   END LOOP;
END;
/
```

---

# Collections

A **collection** is a group of elements of the same datatype.

Collections are similar to **arrays in programming languages**.

Types of collections:

1. Associative Arrays (Index-by tables)
2. VARRAYS
3. Nested Tables

---

# Associative Arrays (Index By Tables)

Associative arrays store key-value pairs where elements are accessed using an index.

### Syntax

```
TYPE array_type IS TABLE OF datatype
INDEX BY PLS_INTEGER;
```

---

### Example

```
DECLARE
   TYPE name_array IS TABLE OF VARCHAR2(50)
   INDEX BY PLS_INTEGER;

   names name_array;
BEGIN
   names(1) := 'John';
   names(2) := 'David';
   names(3) := 'Sara';

   DBMS_OUTPUT.PUT_LINE(names(2));
END;
/
```

Characteristics:

- Dynamic size
- Stored in memory
- Fast lookup

---

# VARRAYS

A **VARRAY (Variable Array)** is a collection with a **fixed maximum size**.

### Syntax

```
TYPE varray_type IS VARRAY(size)
OF datatype;
```

---

### Example

```
DECLARE
   TYPE marks_array IS VARRAY(5) OF NUMBER;

   marks marks_array := marks_array(80,85,90,75,88);
BEGIN
   DBMS_OUTPUT.PUT_LINE(marks(3));
END;
/
```

Characteristics:

- Fixed size
- Stored sequentially
- Good for small datasets

---

# Nested Tables

Nested tables are similar to arrays but **do not have a fixed size**.

They can grow dynamically.

### Syntax

```
TYPE table_type IS TABLE OF datatype;
```

---

### Example

```
DECLARE
   TYPE number_table IS TABLE OF NUMBER;

   nums number_table := number_table(10,20,30);
BEGIN
   DBMS_OUTPUT.PUT_LINE(nums(1));
END;
/
```

Characteristics:

- Dynamic size
- Can be stored in database tables
- Flexible structure

---

# Comparison of Associative Array, VARRAY, and Nested Table

| Feature | Associative Array | VARRAY | Nested Table |
|-------|------------------|--------|--------------|
| Storage | Memory only | Database / Memory | Database / Memory |
| Size | Dynamic | Fixed | Dynamic |
| Index type | Numeric or string | Numeric only | Numeric |
| Performance | Very fast | Good | Good |
| Use case | Lookup tables | Small fixed collections | Large collections |

---

# BULK COLLECT

`BULK COLLECT` retrieves multiple rows from SQL queries into collections **in a single operation**.

This improves performance by reducing context switches between SQL and PL/SQL.

### Example

```
DECLARE
   TYPE emp_table IS TABLE OF employees.first_name%TYPE;

   names emp_table;
BEGIN
   SELECT first_name
   BULK COLLECT INTO names
   FROM employees;

   FOR i IN names.FIRST..names.LAST LOOP
      DBMS_OUTPUT.PUT_LINE(names(i));
   END LOOP;
END;
/
```

---

# LIMIT Clause

The `LIMIT` clause is used with `BULK COLLECT` to **fetch rows in batches**.

This avoids memory overflow.

### Example

```
FETCH emp_cursor BULK COLLECT INTO emp_list LIMIT 100;
```

This fetches **100 rows at a time**.

---

# FORALL Statement

`FORALL` is used to perform **bulk INSERT, UPDATE, or DELETE operations**.

It improves performance by reducing context switches.

### Example

```
DECLARE
   TYPE num_table IS TABLE OF NUMBER;

   ids num_table := num_table(101,102,103);
BEGIN
   FORALL i IN 1..ids.COUNT
      DELETE FROM employees
      WHERE employee_id = ids(i);
END;
/
```

Benefits:

- High performance
- Efficient bulk processing
- Used with collections

---

# Summary

This section covered **PL/SQL Composite Datatypes and Collections**, including:

- Introduction to composite datatypes
- Table-based records using `%ROWTYPE`
- Custom records using `RECORD`
- Cursor-based records
- Collections (Associative arrays, VARRAYS, Nested tables)
- Comparison of collection types
- Bulk processing using `BULK COLLECT`
- Batch fetching using `LIMIT`
- High-performance DML using `FORALL`

These concepts are essential for **handling complex data structures and improving performance in enterprise PL/SQL applications**.
```