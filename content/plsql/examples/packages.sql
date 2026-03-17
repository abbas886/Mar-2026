--Step 1: Create PACKAGE SPECIFICATION
CREATE OR REPLACE PACKAGE emp_package AS

   PROCEDURE show_employee;

   FUNCTION get_bonus(salary NUMBER) RETURN NUMBER;

END emp_package;
/
-- Step 2: Create PACKAGE BODY (your code)
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

-- call procedure
BEGIN
   emp_package.show_employee;
END;
/
-- call function
SELECT emp_package.get_bonus(50000) FROM dual;