```markdown
## Oracle PL/SQL Package with Example

In Oracle PL/SQL, a **package** is a database object that groups related **procedures, functions, variables, and cursors** into a single unit.  
Packages help organize large applications, improve performance, and make code easier to maintain.

A package has two parts:

1. **Package Specification** – declares the public procedures, functions, and variables.
2. **Package Body** – contains the actual implementation of those procedures and functions.

### Package Specification

CREATE OR REPLACE PACKAGE emp_package AS

   PROCEDURE increase_salary(p_emp_id NUMBER, p_percent NUMBER);

   FUNCTION get_employee_name(p_emp_id NUMBER)
   RETURN VARCHAR2;

END emp_package;
/

This defines the **interface** of the package (what other programs can use).

### Package Body

CREATE OR REPLACE PACKAGE BODY emp_package AS

   PROCEDURE increase_salary(p_emp_id NUMBER, p_percent NUMBER)
   IS
   BEGIN
      UPDATE employee
      SET salary = salary + (salary * p_percent / 100)
      WHERE emp_id = p_emp_id;
   END increase_salary;

   FUNCTION get_employee_name(p_emp_id NUMBER)
   RETURN VARCHAR2
   IS
      v_name VARCHAR2(100);
   BEGIN
      SELECT emp_name
      INTO v_name
      FROM employee
      WHERE emp_id = p_emp_id;

      RETURN v_name;
   END get_employee_name;

END emp_package;
/

### Calling the Package Procedure

BEGIN
   emp_package.increase_salary(1001,10);
END;
/

### Calling the Package Function

SELECT emp_package.get_employee_name(1001)
FROM dual;

### Advantages of PL/SQL Packages

- Groups related database logic together
- Improves performance (package loaded once into memory)
- Provides better code organization
- Allows controlled access to procedures and functions
```
