---- In real enterprise systems built on Oracle Database, 
----PL/SQL procedures are widely used to implement business 
--logic close to the data. They are commonly invoked from 
--applications, batch jobs, APIs, or tools like Oracle APEX.

--Examples
--1️⃣ Payroll Processing
--A procedure calculates salaries, bonuses, and deductions for employees every month.
--Example scenario
--Calculate tax
--Apply bonus
--Update payroll table

-- Real use Monthly payroll batch jobs.
CREATE OR REPLACE PROCEDURE process_salary(p_emp_id NUMBER)
IS
    v_salary NUMBER;
    v_bonus NUMBER;
BEGIN
    SELECT salary INTO v_salary
    FROM employee
    WHERE emp_id = p_emp_id;

    v_bonus := v_salary * 0.10;

    UPDATE employee
    SET salary = salary + v_bonus
    WHERE emp_id = p_emp_id;

END;
/

-- calling from block
begin
process_salary(1001);
end

-- 2️⃣ Data Validation Before Insert
-- Used to enforce business rules before inserting records.
-- Example rule: Employee salary cannot exceed department limit.
--Real use: Prevent invalid data entering database.
CREATE OR REPLACE PROCEDURE add_employee(
    p_emp_id NUMBER,
    p_name VARCHAR2,
    p_salary NUMBER,
    p_dept NUMBER
)
IS
BEGIN
    IF p_salary > 200000 THEN
        RAISE_APPLICATION_ERROR(-20001,'Salary exceeds limit');
    END IF;

    INSERT INTO employee(emp_id, emp_name, salary, dept_id)
    VALUES(p_emp_id,p_name,p_salary,p_dept);
END;
/

--3️⃣ Batch Data Processing
-- Procedures run scheduled jobs that process thousands of records.
-- Example: Nightly account reconciliation
-- Bulk updates.
CREATE OR REPLACE PROCEDURE update_bonus
IS
BEGIN
    UPDATE employee
    SET salary = salary * 1.05
    WHERE dept_id = 1;
END;
/

-- 4️⃣ Reporting Procedures
-- Complex reports are generated using stored procedures.
-- Example:
-- Department salary report.
CREATE OR REPLACE PROCEDURE dept_salary_report
IS
BEGIN
    FOR r IN (
        SELECT d.dept_name, SUM(e.salary) total_salary
        FROM dept d
        JOIN employee e
        ON d.dept_id = e.dept_id
        GROUP BY d.dept_name
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE(r.dept_name || ' : ' || r.total_salary);
    END LOOP;
END;
/

-- 5️⃣ API Layer for Applications
-- Enterprise apps call procedures instead of writing SQL directly.
-- Example architecture:
-- Web Application
--      ↓
--REST API
--      ↓
--Stored Procedure
--      ↓
--Database Tables
-- Real use Banking systems, ERP systems.

CREATE OR REPLACE PROCEDURE get_employee(
    p_emp_id NUMBER
)
IS
    v_name VARCHAR2(50);
BEGIN
    SELECT emp_name INTO v_name
    FROM employee
    WHERE emp_id = p_emp_id;

    DBMS_OUTPUT.PUT_LINE(v_name);
END;
/

-- 6️⃣ Audit Logging
-- Procedures log all changes made to data.
-- Example:
-- Real use: Compliance tracking.
CREATE OR REPLACE PROCEDURE log_employee_update(
    p_emp_id NUMBER
)
IS
BEGIN
    INSERT INTO employee_log(emp_id, action_date)
    VALUES(p_emp_id, SYSDATE);
END;
/