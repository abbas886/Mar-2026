----PL/SQL blocks are used in real enterprise applications for validation, 
----automation, batch processing, and business logic inside the database

-- hello world
BEGIN  
    DBMS_OUTPUT.PUT_LINE('Hello PL/SQL');  
END; 

-- with variable
DECLARE  
   message VARCHAR2(50);  
BEGIN  
   message := 'Hello PL/SQL';  
   DBMS_OUTPUT.PUT_LINE(message);  
END; 

-- simple condition

DECLARE
   marks NUMBER := 45;
BEGIN
   IF marks >= 50 THEN
      DBMS_OUTPUT.PUT_LINE('Pass');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Fail');
   END IF;
END;

--– Check Even or Odd


DECLARE
   num NUMBER := 10;
BEGIN
   IF MOD(num,2) = 0 THEN
      DBMS_OUTPUT.PUT_LINE('Even Number');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Odd Number');
   END IF;
END;

--  – IF ELSIF Statement

DECLARE
   marks NUMBER := 85;
BEGIN
   IF marks >= 90 THEN
      DBMS_OUTPUT.PUT_LINE('Grade A');
   ELSIF marks >= 75 THEN
      DBMS_OUTPUT.PUT_LINE('Grade B');
   ELSIF marks >= 50 THEN
      DBMS_OUTPUT.PUT_LINE('Grade C');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Fail');
   END IF;
END;

--  case statement
DECLARE
   grade CHAR := 'A';
BEGIN
   CASE grade
      WHEN 'A' THEN
         DBMS_OUTPUT.PUT_LINE('Excellent');
      WHEN 'B' THEN
         DBMS_OUTPUT.PUT_LINE('Good');
      WHEN 'C' THEN
         DBMS_OUTPUT.PUT_LINE('Average');
      ELSE
         DBMS_OUTPUT.PUT_LINE('Needs Improvement');
   END CASE;
END;

-- – CASE with Numbers

DECLARE
   day_number NUMBER := 3;
BEGIN
   CASE day_number
      WHEN 1 THEN DBMS_OUTPUT.PUT_LINE('Monday');
      WHEN 2 THEN DBMS_OUTPUT.PUT_LINE('Tuesday');
      WHEN 3 THEN DBMS_OUTPUT.PUT_LINE('Wednesday');
      WHEN 4 THEN DBMS_OUTPUT.PUT_LINE('Thursday');
      WHEN 5 THEN DBMS_OUTPUT.PUT_LINE('Friday');
      ELSE DBMS_OUTPUT.PUT_LINE('Weekend');
   END CASE;
END;

-- basic loop
DECLARE
   i NUMBER := 1;
BEGIN
   LOOP
      DBMS_OUTPUT.PUT_LINE('Value: ' || i);
      i := i + 1;
      EXIT WHEN i > 5;
   END LOOP;
END;

-- for loop
BEGIN
   FOR i IN 1..5 LOOP
      DBMS_OUTPUT.PUT_LINE('Number: ' || i);
   END LOOP;
END;

-- while loop
DECLARE
   i NUMBER := 1;
BEGIN
   WHILE i <= 5 LOOP
      DBMS_OUTPUT.PUT_LINE('Count: ' || i);
      i := i + 1;
   END LOOP;
END;

-- nested blocks
BEGIN
   DBMS_OUTPUT.PUT_LINE('Outer Block Start');

   DECLARE
      message VARCHAR2(30) := 'Inner Block';
   BEGIN
      DBMS_OUTPUT.PUT_LINE(message);
   END;

   DBMS_OUTPUT.PUT_LINE('Outer Block End');
END;

--1️⃣ Simple PL/SQL Block (Basic Example) - Print employee information.

DECLARE
    v_name employee.emp_name%TYPE;
    v_salary employee.salary%TYPE;
BEGIN
    SELECT emp_name, salary
    INTO v_name, v_salary
    FROM employee
    WHERE emp_id = 1001;

    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || v_salary);
END;
/
--2️⃣ Salary Increment (Common Business Logic)
-- Give 10% increment to employees in Engineering department.
--Real use:✔ Payroll processing.
DECLARE
    v_dept_id NUMBER;
BEGIN
    SELECT dept_id
    INTO v_dept_id
    FROM dept
    WHERE dept_name = 'Engineering';

    UPDATE employee
    SET salary = salary * 1.10
    WHERE dept_id = v_dept_id;

    DBMS_OUTPUT.PUT_LINE('Salary updated for Engineering department');
END;

-- 3️⃣ Check Employee Exists Before Insert
-- Avoid duplicate employee records.
-- Real use: ✔ Data validation.
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM employee
    WHERE emp_id = 2001;

    IF v_count = 0 THEN
        INSERT INTO employee(emp_id, emp_name, job_title, dept_id)
        VALUES (2001, 'New Employee', 'Developer', 1);

        DBMS_OUTPUT.PUT_LINE('Employee inserted');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Employee already exists');
    END IF;
END;
/

-- 5️⃣ Calculate Bonus
-- Example: If salary > 80000 → give bonus.
-- Real use: ✔ HR bonus calculation.
DECLARE
    v_bonus NUMBER;
    v_salary NUMBER;
BEGIN
    SELECT salary
    INTO v_salary
    FROM employee
    WHERE emp_id = 1003;

    IF v_salary > 80000 THEN
        v_bonus := v_salary * 0.20;
    ELSE
        v_bonus := v_salary * 0.10;
    END IF;

    DBMS_OUTPUT.PUT_LINE('Bonus: ' || v_bonus);
END;

-- 6️⃣ Exception Handling (Very Important in Real Systems)
-- Real use: ✔ Prevent application crashes.
DECLARE
    v_salary NUMBER;
BEGIN
    SELECT salary
    INTO v_salary
    FROM employee
    WHERE emp_id = 9999;

    DBMS_OUTPUT.PUT_LINE(v_salary);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error');
END;

-- 7️⃣ Insert Log Record (Audit Example)
DECLARE
BEGIN
    INSERT INTO employee_log(emp_id, action_date)
    VALUES (1001, SYSDATE);

    DBMS_OUTPUT.PUT_LINE('Log inserted');
END;
create table employee_log( emp_id number , action_date date);
select * from employee_log;

