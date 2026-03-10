# PL/SQL Procedures, Functions, and Packages

## Types of Subprograms (Procedures and Functions)

A **subprogram** in PL/SQL is a named PL/SQL block that performs a specific task. Subprograms improve **modularity, reusability, and maintainability** of code.

PL/SQL supports two types of subprograms:

1. **Procedures**
2. **Functions**

| Subprogram | Description |
|------------|-------------|
| Procedure | Performs an action but does not necessarily return a value |
| Function | Performs a calculation and returns a single value |

---

# Procedures

A **procedure** is a named PL/SQL block that performs a specific task and may accept parameters.

## Syntax

```
CREATE OR REPLACE PROCEDURE procedure_name
(parameter1 datatype, parameter2 datatype)
IS
BEGIN
   statements;
END;
/
```

### Example

```
CREATE OR REPLACE PROCEDURE greet_user
IS
BEGIN
   DBMS_OUTPUT.PUT_LINE('Welcome to PL/SQL');
END;
/
```

Execute procedure:

```
BEGIN
   greet_user;
END;
/
```

---

# Procedure Parameters

Procedures can accept parameters to pass data.

Types of parameters:

| Parameter Type | Description |
|----------------|-------------|
| IN | Default parameter used to pass values to the procedure |
| OUT | Returns values from the procedure |
| IN OUT | Passes value and returns updated value |

### Example

```
CREATE OR REPLACE PROCEDURE add_numbers(
   a IN NUMBER,
   b IN NUMBER,
   result OUT NUMBER
)
IS
BEGIN
   result := a + b;
END;
/
```

Execution:

```
DECLARE
   total NUMBER;
BEGIN
   add_numbers(10,20,total);
   DBMS_OUTPUT.PUT_LINE(total);
END;
/
```

---

# Hands-on Practice for Procedures

### Example – Employee Salary Display

```
CREATE OR REPLACE PROCEDURE show_salary(emp_salary NUMBER)
IS
BEGIN
   DBMS_OUTPUT.PUT_LINE('Salary: ' || emp_salary);
END;
/
```

Execution:

```
BEGIN
   show_salary(50000);
END;
/
```

---

# Functions

A **function** is similar to a procedure but **must return a value** using the `RETURN` statement.

Functions are often used in **SQL statements**.

## Syntax

```
CREATE OR REPLACE FUNCTION function_name
(parameter datatype)
RETURN datatype
IS
BEGIN
   RETURN value;
END;
/
```

### Example

```
CREATE OR REPLACE FUNCTION calculate_bonus(salary NUMBER)
RETURN NUMBER
IS
BEGIN
   RETURN salary * 0.10;
END;
/
```

Execution:

```
DECLARE
   bonus NUMBER;
BEGIN
   bonus := calculate_bonus(50000);
   DBMS_OUTPUT.PUT_LINE(bonus);
END;
/
```

---

# Hands-on Practice for Functions

### Example – Square of a Number

```
CREATE OR REPLACE FUNCTION square_num(n NUMBER)
RETURN NUMBER
IS
BEGIN
   RETURN n*n;
END;
/
```

Execution:

```
BEGIN
   DBMS_OUTPUT.PUT_LINE(square_num(5));
END;
/
```

---

# Difference Between Procedures and Functions

| Feature | Procedure | Function |
|--------|-----------|----------|
| Purpose | Perform an action | Return a value |
| Return Value | Optional | Mandatory |
| Called From SQL | No | Yes |
| Return Statement | Not required | Required |

Example using function in SQL:

```
SELECT calculate_bonus(50000) FROM dual;
```

---

# Defining a Subprogram in an SQL Statement

Functions can be used directly inside SQL queries.

Example:

```
SELECT employee_id, calculate_bonus(salary)
FROM employees;
```

Procedures cannot be used inside SQL statements.

---

# Function Result Cache

The **result cache** stores function results in memory to improve performance.

If the same input values are used again, Oracle returns the result from cache instead of recalculating.

### Syntax

```
CREATE OR REPLACE FUNCTION get_square(n NUMBER)
RETURN NUMBER
RESULT_CACHE
IS
BEGIN
   RETURN n*n;
END;
/
```

Benefits:
- Improves performance
- Reduces repeated computations

---

# Subprogram Parameters Using Mixed and Named Notations

PL/SQL allows parameters to be passed in three ways:

1. **Positional notation**
2. **Named notation**
3. **Mixed notation**

---

## Positional Notation

Parameters are passed in order.

```
BEGIN
   add_numbers(10,20,:result);
END;
/
```

---

## Named Notation

Parameters are passed using parameter names.

```
BEGIN
   add_numbers(a => 10, b => 20, result => :res);
END;
/
```

---

## Mixed Notation

Combination of positional and named notation.

```
BEGIN
   add_numbers(10, b => 20, result => :res);
END;
/
```

---

# Package Structure

A **package** is a collection of related procedures, functions, variables, and cursors.

A package has two parts:

1. **Package Specification**
2. **Package Body**

| Component | Purpose |
|-----------|---------|
| Package Specification | Declares public procedures, functions, variables |
| Package Body | Contains implementation |

---

# Package Specification

```
CREATE OR REPLACE PACKAGE emp_package AS
   PROCEDURE show_employee;
   FUNCTION get_bonus(salary NUMBER) RETURN NUMBER;
END emp_package;
/
```

---

# Package Body

```
CREATE OR REPLACE PACKAGE BODY emp_package AS

PROCEDURE show_employee IS
BEGIN
   DBMS_OUTPUT.PUT_LINE('Employee Details');
END;

FUNCTION get_bonus(salary NUMBER)
RETURN NUMBER
IS
BEGIN
   RETURN salary * 0.10;
END;

END emp_package;
/
```

---

# Overloading Procedure and Function

**Overloading** means defining multiple procedures or functions with the same name but different parameter lists.

### Example

```
CREATE OR REPLACE PACKAGE math_pkg AS
   FUNCTION add_num(a NUMBER, b NUMBER) RETURN NUMBER;
   FUNCTION add_num(a NUMBER, b NUMBER, c NUMBER) RETURN NUMBER;
END;
/
```

Package body:

```
CREATE OR REPLACE PACKAGE BODY math_pkg AS

FUNCTION add_num(a NUMBER, b NUMBER)
RETURN NUMBER
IS
BEGIN
   RETURN a + b;
END;

FUNCTION add_num(a NUMBER, b NUMBER, c NUMBER)
RETURN NUMBER
IS
BEGIN
   RETURN a + b + c;
END;

END;
/
```

---

# Creating a Package Using Procedures and Functions

Example:

Package specification:

```
CREATE OR REPLACE PACKAGE employee_pkg AS
   PROCEDURE show_employee(name VARCHAR2);
   FUNCTION calculate_bonus(salary NUMBER) RETURN NUMBER;
END employee_pkg;
/
```

Package body:

```
CREATE OR REPLACE PACKAGE BODY employee_pkg AS

PROCEDURE show_employee(name VARCHAR2)
IS
BEGIN
   DBMS_OUTPUT.PUT_LINE('Employee: ' || name);
END;

FUNCTION calculate_bonus(salary NUMBER)
RETURN NUMBER
IS
BEGIN
   RETURN salary * 0.15;
END;

END employee_pkg;
/
```

---

# Hands-on Practice for Packages

Execution:

```
BEGIN
   employee_pkg.show_employee('John');
END;
/
```

Calling function from package:

```
BEGIN
   DBMS_OUTPUT.PUT_LINE(employee_pkg.calculate_bonus(50000));
END;
/
```

Or inside SQL:

```
SELECT employee_pkg.calculate_bonus(50000)
FROM dual;
```

---

# Summary

This module covered **PL/SQL subprograms and packages**, including:

- Types of subprograms (Procedures and Functions)
- Procedure parameters (IN, OUT, IN OUT)
- Creating and executing procedures
- Creating and using functions
- Differences between procedures and functions
- Using functions in SQL statements
- Function result cache
- Parameter passing techniques (positional, named, mixed)
- Package structure (Specification and Body)
- Overloading procedures and functions
- Creating packages using procedures and functions

These concepts are essential for building **modular, reusable, and scalable PL/SQL applications in enterprise systems**.