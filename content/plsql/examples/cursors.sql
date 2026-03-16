DECLARE
   CURSOR emp_cursor IS
      SELECT emp_id, emp_name
      FROM employee;

   v_id employee.emp_id%TYPE;
   v_name employee.emp_name%TYPE;

BEGIN
   OPEN emp_cursor;

   LOOP
      FETCH emp_cursor INTO v_id, v_name;
      EXIT WHEN emp_cursor%NOTFOUND;

      DBMS_OUTPUT.PUT_LINE(v_id || ' ' || v_name);
   END LOOP;

   CLOSE emp_cursor;
END;

-- Cursor Using FOR LOOP (Simpler Syntax)
-- Oracle automatically handles OPEN, FETCH, and CLOSE.

BEGIN
   FOR emp_rec IN (SELECT emp_name, salary FROM employee)
   LOOP
      DBMS_OUTPUT.PUT_LINE(emp_rec.emp_name || ' - ' || emp_rec.salary);
   END LOOP;
END;

-- Cursor with Parameter
-- Used when the query needs input parameters.

DECLARE
   CURSOR emp_cursor(p_dept_id NUMBER) IS
      SELECT emp_name, salary
      FROM employee
      WHERE dept_id = p_dept_id;

BEGIN
   FOR emp_rec IN emp_cursor(1)
   LOOP
      DBMS_OUTPUT.PUT_LINE(emp_rec.emp_name || ' - ' || emp_rec.salary);
   END LOOP;
END;

-- Cursor with Update (Real-world Example)
--  Example: Increase salary of employees department-wise.

DECLARE
   CURSOR emp_cursor IS
      SELECT emp_id, salary
      FROM employee
      WHERE dept_id = 1
      FOR UPDATE;

BEGIN
   FOR emp_rec IN emp_cursor
   LOOP
      UPDATE employee
      SET salary = emp_rec.salary * 1.10
      WHERE CURRENT OF emp_cursor;
   END LOOP;

   COMMIT;
END;

-- Nested Cursor (Advanced Example)
-- Example: Department-wise employee listing.

DECLARE
   CURSOR dept_cursor IS
      SELECT dept_id, dept_name
      FROM dept;

   CURSOR emp_cursor(p_dept_id NUMBER) IS
      SELECT emp_name
      FROM employee
      WHERE dept_id = p_dept_id;

BEGIN
   FOR dept_rec IN dept_cursor
   LOOP
      DBMS_OUTPUT.PUT_LINE('Department: ' || dept_rec.dept_name);

      FOR emp_rec IN emp_cursor(dept_rec.dept_id)
      LOOP
         DBMS_OUTPUT.PUT_LINE('   Employee: ' || emp_rec.emp_name);
      END LOOP;

   END LOOP;
END;

-- Cursor Attributes

--Cursor attributes provide information about cursor status.

--| Attribute | Description |
--|--------|-------------|
--| %FOUND | TRUE if row fetched |
--| %NOTFOUND | TRUE if no row found |
--| %ROWCOUNT | Number of rows processed |
--| %ISOPEN | Checks if cursor is open |
-- Example:

DECLARE
   CURSOR emp_cursor IS SELECT emp_name FROM employee;
   v_name employee.emp_name%TYPE;
BEGIN
   OPEN emp_cursor;
   FETCH emp_cursor INTO v_name;

   IF emp_cursor%FOUND THEN
      DBMS_OUTPUT.PUT_LINE('Row found');
   END IF;

   CLOSE emp_cursor;
END;
/