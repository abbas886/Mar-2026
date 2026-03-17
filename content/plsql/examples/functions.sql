-- In Oracle Database, PL/SQL functions are mainly used 
-- when a value must be returned and used inside SQL queries, 
-- calculations, validations, or reporting.

-- 1️⃣ Salary Calculation Function (HR Systems)
-- Many HR systems calculate net salary dynamically.
-- -- Real use: Payroll reports, Salary analytics

CREATE OR REPLACE FUNCTION get_net_salary(p_emp_id NUMBER)
RETURN NUMBER
IS
    v_salary NUMBER;
    v_bonus NUMBER;
BEGIN
    SELECT salary INTO v_salary
    FROM employee
    WHERE emp_id = p_emp_id;

    v_bonus := v_salary * 0.10;

    RETURN v_salary + v_bonus;
END;
/
-- Usage in SQL:
SELECT emp_name, get_net_salary(emp_id) AS net_salary FROM employee;

-- 2️⃣ Experience Calculation (Very Common)
-- Calculate employee experience from hire_date.
-- Real use: Promotion eligibility, HR dashboards
CREATE OR REPLACE FUNCTION get_experience(p_emp_id NUMBER)
RETURN NUMBER
IS
    v_years NUMBER;
BEGIN
    SELECT ROUND((SYSDATE - hire_date)/365,2)
    INTO v_years
    FROM employee
    WHERE emp_id = p_emp_id;

    RETURN v_years;
END;
/
SELECT emp_name, get_experience(emp_id) AS experience FROM employee;

-- 3️⃣ Department Employee Count
-- Real use: Department-wise analytics, reporting
CREATE OR REPLACE FUNCTION dept_employee_count(p_dept_id NUMBER)
RETURN NUMBER
IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM employee
    WHERE dept_id = p_dept_id;

    RETURN v_count;
END;
/
-- Usage in SQL:
SELECT dept_name, dept_employee_count(dept_id) FROM dept;

-- 4️⃣ Tax Calculation Function (Finance Systems)
-- Real use: Financial calculations.
CREATE OR REPLACE FUNCTION calculate_tax(p_salary NUMBER)
RETURN NUMBER
IS
BEGIN
    IF p_salary > 100000 THEN
        RETURN p_salary * 0.30;
    ELSIF p_salary > 50000 THEN
        RETURN p_salary * 0.20;
    ELSE
        RETURN p_salary * 0.10;
    END IF;
END;
/
-- Usage in SQL:
SELECT emp_name, salary, calculate_tax(salary) AS tax FROM employee;

-- 5️⃣ Status Evaluation Function
-- Example: Determine employee status.
-- Real use: HR analytics dashboards.

CREATE OR REPLACE FUNCTION employee_status(p_emp_id NUMBER)
RETURN VARCHAR2
IS
    v_salary NUMBER;
BEGIN
    SELECT salary INTO v_salary
    FROM employee
    WHERE emp_id = p_emp_id;

    IF v_salary > 90000 THEN
        RETURN 'Senior';
    ELSE
        RETURN 'Junior';
    END IF;
END;
/
-- Usage in SQL:
SELECT emp_name, employee_status(emp_id) FROM employee;

-- 6️⃣ Data Formatting Function
-- Format employee name.
-- Real use: ✔ Standardize data presentation.
CREATE OR REPLACE FUNCTION format_name(p_name VARCHAR2)
RETURN VARCHAR2
IS
BEGIN
    RETURN UPPER(p_name);
END;
/
-- Usage in SQL:
SELECT format_name(emp_name) FROM employee;

-- 7️⃣ Validation Function
-- Example: Check if salary is valid.
-- Real use: Data quality checks.

CREATE OR REPLACE FUNCTION valid_salary(p_salary NUMBER)
RETURN VARCHAR2
IS
BEGIN
    IF p_salary > 0 THEN
        RETURN 'VALID';
    ELSE
        RETURN 'INVALID';
    END IF;
END;
/
-- usage
SELECT emp_name, valid_salary(salary) FROM employee;

-- 8️⃣ Ranking or Score Calculation
--  Example: calculate performance score.
-- Real use: Performance management systems.
CREATE OR REPLACE FUNCTION performance_score(p_salary NUMBER)
RETURN NUMBER
IS
BEGIN
    RETURN p_salary * 0.05;
END;
/

-- Usage in SQL:
SELECT emp_name,  performance_score(salary) FROM employee;