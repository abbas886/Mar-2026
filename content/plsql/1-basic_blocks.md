# PL/SQL Basic Blocks

## Introduction to PL/SQL and Its Advantages

**PL/SQL (Procedural Language/SQL)** is Oracle's procedural extension to SQL. While SQL is used to query and manipulate data, PL/SQL allows developers to add **procedural programming constructs** such as variables, loops, conditions, and exception handling to SQL statements.

PL/SQL enables developers to implement **business logic directly inside the database**, which improves performance and reduces network communication between applications and the database server.

### Advantages of PL/SQL

- **Better Performance** – Multiple SQL statements can be executed in a single block, reducing network traffic.
- **Modular Programming** – Programs can be organized into procedures, functions, packages, and triggers.
- **Exception Handling** – Built-in mechanisms to handle runtime errors.
- **Security** – Business logic can be secured within the database using privileges.
- **Integration with SQL** – PL/SQL seamlessly integrates SQL statements.
- **Code Reusability** – Stored procedures and functions can be reused.

---

# Block Structure

A **PL/SQL program is written in blocks**. A block is the basic unit of a PL/SQL program.

A block contains three sections:

DECLARE  
   -- Variable declarations (optional)

BEGIN  
   -- Executable statements (mandatory)

EXCEPTION  
   -- Error handling statements (optional)

END;

### Explanation

| Section | Description |
|--------|-------------|
| DECLARE | Declares variables, constants, cursors |
| BEGIN | Contains executable code |
| EXCEPTION | Handles runtime errors |
| END | Marks the end of the block |

### Example

DECLARE  
   message VARCHAR2(50);  
BEGIN  
   message := 'Hello PL/SQL';  
   DBMS_OUTPUT.PUT_LINE(message);  
END;  
/

---

# Types of PL/SQL Blocks

## Anonymous Block

Anonymous blocks are **unnamed blocks** that are executed immediately and are not stored in the database.

Example:

BEGIN  
   DBMS_OUTPUT.PUT_LINE('Welcome to PL/SQL');  
END;  
/

Characteristics:
- No name
- Not stored in database
- Executed once

---

## Named Blocks

Named blocks are stored in the database and can be reused. Examples include:

- Procedures
- Functions
- Packages
- Triggers

Example:

CREATE OR REPLACE PROCEDURE greet_user  
AS  
BEGIN  
   DBMS_OUTPUT.PUT_LINE('Hello User');  
END;  
/

---

# PL/SQL Building Elements

PL/SQL programs are composed of several basic building elements.

## Identifiers

Identifiers are names given to variables, constants, tables, procedures, and other database objects.

Examples:

employee_id  
salary  
total_amount  

Rules for identifiers:
- Must start with a letter
- May include letters, numbers, `_`, `$`, `#`
- Cannot be reserved keywords

Example:

DECLARE  
   emp_name VARCHAR2(50);  
BEGIN  
   emp_name := 'John';  
END;  
/

---

## Literals

Literals are **fixed values** used in programs.

Examples:

100  
'Hello'  
TRUE  
DATE '2024-01-01'

Types of literals:
- Numeric literals
- Character literals
- Boolean literals
- Date literals

---

## Semicolon Delimiter

In PL/SQL, **each statement ends with a semicolon (;)**.

Example:

salary := 50000;

---

## Comments

Comments are used to improve code readability.

Single-line comment:

-- This is a comment

Multi-line comment:

/*
This is a
multi-line comment
*/

---

# PL/SQL Data Types

PL/SQL supports multiple data type categories.

## Scalar Data Types

Scalar types store **a single value**.

| Data Type | Description |
|----------|-------------|
| NUMBER | Numeric values |
| VARCHAR2 | Variable-length string |
| CHAR | Fixed-length string |
| DATE | Date and time |
| BOOLEAN | TRUE or FALSE |

Example:

DECLARE  
   age NUMBER := 25;  
   name VARCHAR2(30) := 'John';  
BEGIN  
   DBMS_OUTPUT.PUT_LINE(name);  
END;  
/

---

## Vector (Composite) Data Types

Composite types store **multiple values**.

Examples include:
- Records
- Collections
- Arrays

Example:

DECLARE  
   TYPE num_array IS TABLE OF NUMBER;  
   numbers num_array := num_array(10,20,30);  
BEGIN  
   DBMS_OUTPUT.PUT_LINE(numbers(1));  
END;  
/

---

## Reference Data Types

Reference types refer to database table columns or rows.

Examples:

- %TYPE
- %ROWTYPE

Example:

DECLARE  
   emp_salary employees.salary%TYPE;  
BEGIN  
   NULL;  
END;  
/

---

## LOB Data Types (Large Objects)

LOB types store large amounts of data.

| Data Type | Description |
|----------|-------------|
| BLOB | Binary Large Object |
| CLOB | Character Large Object |
| NCLOB | Unicode Character Large Object |
| BFILE | External binary file |

Example:

DECLARE  
   document CLOB;  
BEGIN  
   NULL;  
END;  
/

---

# Operators and Variables in PL/SQL

## Variables

Variables store values used during program execution.

Example:

DECLARE  
   salary NUMBER;  
BEGIN  
   salary := 50000;  
END;  
/

---

## Arithmetic Operators

| Operator | Description |
|---------|-------------|
| + | Addition |
| - | Subtraction |
| * | Multiplication |
| / | Division |

Example:

DECLARE  
   a NUMBER := 10;  
   b NUMBER := 5;  
   result NUMBER;  
BEGIN  
   result := a + b;  
   DBMS_OUTPUT.PUT_LINE(result);  
END;  
/

---

## Comparison Operators

| Operator | Meaning |
|---------|---------|
| = | Equal |
| != | Not equal |
| > | Greater than |
| < | Less than |
| >= | Greater than or equal |
| <= | Less than or equal |

---

## Logical Operators

| Operator | Description |
|---------|-------------|
| AND | Both conditions must be true |
| OR | At least one condition must be true |
| NOT | Reverses a condition |

Example:

DECLARE  
   age NUMBER := 20;  
BEGIN  
   IF age > 18 THEN  
      DBMS_OUTPUT.PUT_LINE('Adult');  
   END IF;  
END;  
/

---

# Hands-on PL/SQL Practice

### Example 1 – Print Message

BEGIN  
   DBMS_OUTPUT.PUT_LINE('Welcome to PL/SQL');  
END;  
/

### Example 2 – Simple Calculation

DECLARE  
   a NUMBER := 10;  
   b NUMBER := 20;  
   result NUMBER;  
BEGIN  
   result := a + b;  
   DBMS_OUTPUT.PUT_LINE('Result: ' || result);  
END;  
/

### Example 3 – Conditional Logic

DECLARE  
   marks NUMBER := 75;  
BEGIN  
   IF marks >= 50 THEN  
      DBMS_OUTPUT.PUT_LINE('Pass');  
   ELSE  
      DBMS_OUTPUT.PUT_LINE('Fail');  
   END IF;  
END;  
/

### Example 4 – Loop Example

BEGIN  
   FOR i IN 1..5 LOOP  
      DBMS_OUTPUT.PUT_LINE('Number: ' || i);  
   END LOOP;  
END;  
/

---

# Summary

This section covered the **fundamentals of PL/SQL**, including:

- Introduction to PL/SQL
- Advantages of PL/SQL
- PL/SQL block structure
- Types of PL/SQL blocks
- PL/SQL building elements
- PL/SQL data types
- Variables and operators
- Hands-on examples

These concepts form the **foundation for advanced PL/SQL topics such as cursors, procedures, functions, triggers, and packages**.