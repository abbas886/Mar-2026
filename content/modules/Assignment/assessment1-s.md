# SQL / Oracle Assessment – Complete Answers (All Queries)

## 1. DDL
CREATE TABLE project (
   project_id NUMBER PRIMARY KEY,
   project_name VARCHAR2(100),
   start_date DATE,
   budget NUMBER(12,2)
);

---

## 2. DML (INSERT)
INSERT INTO employee (emp_id, emp_name, salary, dept_id)
VALUES (2001, 'John Doe', 60000, 1);

---

## 3. UPDATE
UPDATE employee
SET salary = salary * 1.10
WHERE dept_id = 1;

---

## 4. DELETE
DELETE FROM employee
WHERE hire_date < DATE '2020-01-01';

---

## 5. WHERE Clause
SELECT *
FROM employee
WHERE salary > 70000;

---

## 6. GROUP BY
SELECT dept_id, SUM(salary) AS total_salary
FROM employee
GROUP BY dept_id;

---

## 7. GROUP BY with HAVING
SELECT dept_id, SUM(salary) AS total_salary
FROM employee
GROUP BY dept_id
HAVING SUM(salary) > 200000;

---

## 8. SUBQUERY
SELECT *
FROM employee
WHERE salary > (SELECT AVG(salary) FROM employee);

---

## 9. JOIN
SELECT e.emp_name, d.dept_name
FROM employee e
JOIN dept d ON e.dept_id = d.dept_id;

---

## 10. UNION
SELECT emp_name FROM employee WHERE dept_id = 1
UNION
SELECT emp_name FROM employee WHERE dept_id = 2;

---

## 11. INTERSECT
SELECT emp_name FROM employee WHERE dept_id = 1
INTERSECT
SELECT emp_name FROM employee WHERE dept_id = 2;

---

## 12. PL/SQL BLOCK
DECLARE
   v_name employee.emp_name%TYPE;
BEGIN
   SELECT emp_name INTO v_name
   FROM employee
   WHERE emp_id = 1001;

   DBMS_OUTPUT.PUT_LINE(v_name);
END;
/

---

## 13. PROCEDURE
CREATE OR REPLACE PROCEDURE update_salary(p_emp_id NUMBER, p_amount NUMBER) AS
BEGIN
   UPDATE employee
   SET salary = salary + p_amount
   WHERE emp_id = p_emp_id;

   COMMIT;
END;
/

---

## 14. FUNCTION
CREATE OR REPLACE FUNCTION get_bonus(p_salary NUMBER)
RETURN NUMBER
IS
BEGIN
   RETURN p_salary * 0.10;
END;
/

---

## 15. TRIGGER
CREATE OR REPLACE TRIGGER trg_salary_check
BEFORE UPDATE OF salary ON employee
FOR EACH ROW
BEGIN
   IF :NEW.salary < :OLD.salary THEN
      RAISE_APPLICATION_ERROR(-20001, 'Salary cannot be reduced');
   END IF;
END;
/

---

## 16. CURSOR
DECLARE
   CURSOR emp_cur IS
      SELECT emp_name, salary FROM employee;
BEGIN
   FOR rec IN emp_cur LOOP
      DBMS_OUTPUT.PUT_LINE(rec.emp_name || ' - ' || rec.salary);
   END LOOP;
END;
/

---

## 17. SEQUENCE
CREATE SEQUENCE emp_seq
START WITH 1000
INCREMENT BY 1;

---

## 18. VIEW
CREATE OR REPLACE VIEW emp_dept_view AS
SELECT e.emp_name, d.dept_name
FROM employee e
JOIN dept d ON e.dept_id = d.dept_id;

---

## 19. INDEX
CREATE INDEX idx_emp_salary
ON employee(salary);