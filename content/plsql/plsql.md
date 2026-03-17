# The Complete PL/SQL Bootcamp: Beginner to Advanced PL/SQL

## 1. Introduction to PL/SQL

**PL/SQL (Procedural Language/SQL)** is Oracle's procedural extension to SQL. While SQL is used to query and manipulate data, PL/SQL allows developers to add **procedural programming constructs** such as variables, loops, conditions, and exception handling to SQL statements.

PL/SQL enables developers to implement **business logic directly inside the database**, which improves performance and reduces network communication between applications and the database server.

### Advantages of PL/SQL

- **Better Performance** – Multiple SQL statements can be executed in a single block, reducing network traffic.
- **Modular Programming** – Programs can be organized into procedures, functions, packages, and triggers.
- **Exception Handling** – Built-in mechanisms to handle runtime errors.
- **Security** – Business logic can be secured within the database using privileges.
- **Integration with SQL** – PL/SQL seamlessly integrates SQL statements.
- **Code Reusability** – Stored procedures and functions can be reused.


Example:

DECLARE
    message VARCHAR2(50);
BEGIN
    message := 'Hello PL/SQL';
    DBMS_OUTPUT.PUT_LINE(message);
END;
/
BEGIN
DBMS_OUTPUT.PUT_LINE('Hello PL/SQL');
END

---

## 2. PL/SQL Block Structure
- Anonymous Blocks
- Named Blocks
- Sections of a PL/SQL block
  - DECLARE
  - BEGIN
  - EXCEPTION
  - END
- Nested blocks

Example:

DECLARE
    num NUMBER := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Value: ' || num);
END;
/

---

## 3. Variables and Data Types
- Variable declaration
- PL/SQL data types
  - NUMBER
  - VARCHAR2
  - DATE
  - BOOLEAN
- %TYPE attribute
- %ROWTYPE attribute
- Constants
- Scope of variables

Example:

DECLARE
    emp_name VARCHAR2(50);
    salary NUMBER(10,2);
BEGIN
    emp_name := 'John';
    salary := 50000;
    DBMS_OUTPUT.PUT_LINE(emp_name || ' ' || salary);
END;
/

---

## 4. Operators in PL/SQL
- Arithmetic operators
- Comparison operators
- Logical operators
- String operators
- Assignment operator

Example:

DECLARE
    a NUMBER := 10;
    b NUMBER := 20;
BEGIN
    IF a < b THEN
        DBMS_OUTPUT.PUT_LINE('a is smaller');
    END IF;
END;
/

---

## 5. Conditional Statements
- IF statement
- IF-THEN
- IF-THEN-ELSE
- IF-THEN-ELSIF
- Nested IF
- CASE statement
- Simple CASE
- Searched CASE

Example:

DECLARE
    marks NUMBER := 85;
BEGIN
    IF marks >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('Grade A');
    ELSIF marks >= 75 THEN
        DBMS_OUTPUT.PUT_LINE('Grade B');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Grade C');
    END IF;
END;
/

---

## 6. Loops in PL/SQL
- Basic LOOP
- WHILE LOOP
- FOR LOOP
- Nested loops
- EXIT statement
- CONTINUE statement

Example:

# Basic LOOP
Syntax:

LOOP
   statements;
   EXIT WHEN condition;
END LOOP;

# Ex :
DECLARE
   v_counter NUMBER := 1;
BEGIN
   LOOP
      DBMS_OUTPUT.PUT_LINE('Counter: ' || v_counter);
      v_counter := v_counter + 1;

      EXIT WHEN v_counter > 5;
   END LOOP;
END;
/

# FOR loop
FOR variable IN start..end LOOP
   statements;
END LOOP;

# Ex:

BEGIN
    FOR i IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('Number: ' || i);
    END LOOP;
END;
/

# While
# Syntax: 
WHILE condition LOOP
   statements;
END LOOP;

# Example 
DECLARE
   v_counter NUMBER := 1;
BEGIN
   WHILE v_counter <= 5 LOOP
      DBMS_OUTPUT.PUT_LINE('Counter: ' || v_counter);
      v_counter := v_counter + 1;
   END LOOP;
END;
/

## 9. Procedures
- What is a procedure?
- Syntax of procedure
- Parameters
  - IN
  - OUT
  - IN OUT
- Calling procedures
- Stored procedures

# A procedure is a named PL/SQL block stored in the database that performs a specific task or set of operations.
It can accept input parameters and execute business logic, but it does not return a value directly like a function.
Example:

CREATE OR REPLACE PROCEDURE greet_user(name VARCHAR2)
AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello ' || name);
END;
/

---

## 10. Functions
- What is a function?
- Creating functions
- Returning values
- Difference between procedure and function
- Using functions in SQL


# A function is a named PL/SQL block stored in the database that performs a specific calculation or task and returns a single value.
It can accept input parameters and can be used inside SQL queries (like in SELECT statements).

Example:

CREATE OR REPLACE FUNCTION get_bonus(salary NUMBER)
RETURN NUMBER
AS
BEGIN
    RETURN salary * 0.10;
END;
/

---

## 8. Exception Handling
- What is an exception?
- Types of exceptions
  - Predefined exceptions
  - User-defined exceptions
- Exception propagation
- RAISE statement
- RAISE_APPLICATION_ERROR

Example:

DECLARE
    num NUMBER := 10;
    denom NUMBER := 0;
    result NUMBER;
BEGIN
    result := num / denom;
EXCEPTION
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Cannot divide by zero');
END;
/

---


## 11. Packages
- What is a package?
- Package specification
- Package body
- Advantages of packages
- Package variables
- Package procedures and functions

Example:

CREATE OR REPLACE PACKAGE emp_pkg AS
    PROCEDURE show_employee;
END emp_pkg;
/

CREATE OR REPLACE PACKAGE BODY emp_pkg AS
    PROCEDURE show_employee IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Employee Package');
    END;
END emp_pkg;
/

---

## 12. Triggers
- What is a trigger?
- Types of triggers
  - BEFORE trigger
  - AFTER trigger
  - INSTEAD OF trigger
- Row-level vs Statement-level triggers
- Trigger events
- Trigger conditions

Example:

CREATE OR REPLACE TRIGGER emp_audit
AFTER INSERT ON employees
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Employee inserted');
END;
/

---

## 13. Records and Collections
- PL/SQL Records
- Nested tables
- VARRAY
- Associative arrays
- Bulk processing

Example:

DECLARE
    TYPE num_array IS TABLE OF NUMBER;
    numbers num_array := num_array(1,2,3,4);
BEGIN
    FOR i IN numbers.FIRST .. numbers.LAST LOOP
        DBMS_OUTPUT.PUT_LINE(numbers(i));
    END LOOP;
END;
/

---

## 14. Dynamic SQL
- What is dynamic SQL?
- EXECUTE IMMEDIATE
- Bind variables
- Dynamic queries
- Dynamic DDL

Example:

DECLARE
    table_name VARCHAR2(30) := 'employees';
BEGIN
    EXECUTE IMMEDIATE 'DELETE FROM ' || table_name || ' WHERE salary < 30000';
END;
/

---

## 15. Performance Optimization
- Bulk Collect
- FORALL
- Reducing context switches
- Efficient cursor handling
- Using indexes effectively

Example:

DECLARE
    TYPE emp_table IS TABLE OF employees%ROWTYPE;
    emp_list emp_table;
BEGIN
    SELECT * BULK COLLECT INTO emp_list FROM employees;
END;
/

---

## 16. Advanced PL/SQL Topics
- Autonomous transactions
- Pipelined table functions
- Native compilation
- PL/SQL profiling
- Instrumentation
- Result cache
- Parallel execution

---

## 17. Security in PL/SQL
- Definer rights
- Invoker rights
- Grants and privileges
- Secure coding practices

---

## 18. PL/SQL Best Practices
- Code modularization
- Naming conventions
- Exception handling strategy
- Logging and debugging
- Performance tuning
- Avoiding common mistakes

---

## 19. Real-World PL/SQL Use Cases
- Batch processing jobs
- Data validation logic
- Automated data transformations
- ETL pipelines
- Business rule enforcement
- Financial transaction processing
- Reporting automation

---

## 20. Capstone Projects
- Employee Management System using PL/SQL
- Banking Transaction Processing System
- Order Processing System
- Data Migration Utility
- Audit Logging Framework

---

## Final Outcome
After completing this bootcamp, you will be able to:

- Write complex PL/SQL programs
- Build stored procedures and functions
- Design enterprise-grade PL/SQL packages
- Implement triggers and exception handling
- Optimize database operations using PL/SQL
- Build real-world database-driven applications