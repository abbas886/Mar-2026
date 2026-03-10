# PL/SQL Sequences

## What is a Sequence?

A **sequence** in Oracle is a **database object used to generate unique sequential numbers automatically**. It is commonly used to generate **primary key values** for table rows.

Sequences help avoid manual numbering and ensure **uniqueness in multi-user environments**.

### Key Characteristics

- Generates **unique numbers automatically**
- Supports **multiple users concurrently**
- Improves performance when generating IDs
- Often used with **INSERT statements**
- Independent of tables (can be used by multiple tables)

### Example Use Case

If we have a table:

```
EMPLOYEES
---------
EMP_ID
EMP_NAME
SALARY
```

Instead of manually assigning `EMP_ID`, a sequence can automatically generate it.

---

# CREATE a Sequence

The `CREATE SEQUENCE` statement is used to create a new sequence.

### Syntax

```
CREATE SEQUENCE sequence_name
START WITH number
INCREMENT BY number
MINVALUE number
MAXVALUE number
CYCLE | NOCYCLE
CACHE number | NOCACHE;
```

### Important Parameters

| Parameter | Description |
|----------|-------------|
| START WITH | First number generated |
| INCREMENT BY | Step size between sequence values |
| MINVALUE | Minimum value allowed |
| MAXVALUE | Maximum value allowed |
| CYCLE | Restart sequence after reaching max |
| NOCYCLE | Do not restart sequence |
| CACHE | Store sequence numbers in memory |

---

### Example – Creating a Sequence

```
CREATE SEQUENCE emp_seq
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 999999
NOCYCLE
CACHE 20;
```

This sequence:

- Starts at **1**
- Increments by **1**
- Stores **20 numbers in memory**

---

# ALTER a Sequence

The `ALTER SEQUENCE` statement modifies an existing sequence.

### Syntax

```
ALTER SEQUENCE sequence_name
INCREMENT BY number
MAXVALUE number
MINVALUE number
CACHE number
NOCACHE
CYCLE | NOCYCLE;
```

### Example

```
ALTER SEQUENCE emp_seq
INCREMENT BY 5
MAXVALUE 1000000
CACHE 50;
```

This changes:

- Increment to **5**
- Cache size to **50**

---

# DROP a Sequence

The `DROP SEQUENCE` statement removes a sequence from the database.

### Syntax

```
DROP SEQUENCE sequence_name;
```

### Example

```
DROP SEQUENCE emp_seq;
```

After dropping, the sequence can no longer be used.

---

# Using Sequence in PL/SQL (Pseudo Columns)

Oracle sequences provide two pseudo columns:

| Pseudo Column | Description |
|---------------|-------------|
| NEXTVAL | Generates the next sequence value |
| CURRVAL | Returns the current sequence value |

Important rule:

- `CURRVAL` can be used **only after NEXTVAL is called in the session**

---

## Using NEXTVAL

```
SELECT emp_seq.NEXTVAL FROM dual;
```

This generates the next sequence number.

---

## Using CURRVAL

```
SELECT emp_seq.CURRVAL FROM dual;
```

Returns the current value generated in the session.

---

## Using Sequence in INSERT

```
INSERT INTO employees(emp_id, emp_name, salary)
VALUES(emp_seq.NEXTVAL,'John',50000);
```

Each insert automatically generates a new `emp_id`.

---

## Using Sequence in PL/SQL Block

```
DECLARE
   new_id NUMBER;
BEGIN
   SELECT emp_seq.NEXTVAL
   INTO new_id
   FROM dual;

   DBMS_OUTPUT.PUT_LINE('Generated ID: ' || new_id);
END;
/
```

---

# Caching a Sequence

**Caching** improves sequence performance by storing a set of sequence numbers in memory.

Instead of accessing disk every time, Oracle uses cached values.

### Syntax

```
CREATE SEQUENCE emp_seq
START WITH 1
INCREMENT BY 1
CACHE 20;
```

This means Oracle stores **20 sequence numbers in memory**.

Example:

```
1,2,3,4,5,...20
```

These are quickly used without disk access.

---

### Advantages of Sequence Caching

- Faster sequence generation
- Reduced disk I/O
- Better performance in high concurrency systems

---

### Disadvantage

If the database crashes, **unused cached numbers are lost**, causing gaps in sequence values.

Example:

Generated numbers: 1–20  
Used numbers: 1–10  

If the database crashes, numbers **11–20 are skipped**.

---

# Sequence Without Cache

```
CREATE SEQUENCE emp_seq
START WITH 1
INCREMENT BY 1
NOCACHE;
```

This ensures **no gaps**, but performance may be slower.

---

# Real-Time Example

Create sequence:

```
CREATE SEQUENCE order_seq
START WITH 1000
INCREMENT BY 1
CACHE 10;
```

Insert records:

```
INSERT INTO orders(order_id, customer_name)
VALUES(order_seq.NEXTVAL,'Rahul');

INSERT INTO orders(order_id, customer_name)
VALUES(order_seq.NEXTVAL,'Amit');
```

Generated IDs:

```
1000
1001
```

---

# Summary

This section covered **PL/SQL Sequences**, including:

- What a sequence is
- Creating sequences
- Altering sequences
- Dropping sequences
- Using sequence pseudo columns (`NEXTVAL`, `CURRVAL`)
- Using sequences in INSERT statements
- Using sequences in PL/SQL blocks
- Sequence caching and performance benefits

Sequences are widely used in **enterprise database applications to generate unique identifiers efficiently**.