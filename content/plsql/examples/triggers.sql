CREATE OR REPLACE TRIGGER emp_insert_trigger
AFTER INSERT
ON employee
BEGIN
   DBMS_OUTPUT.PUT_LINE('New employee inserted');
END;

desc employee;
select * from dept;
insert into employee values(1000,'abbas','architect',2000,sysdate,-300,10000,1)

-- validation before inserting
CREATE OR REPLACE TRIGGER check_salary
BEFORE INSERT
ON employee
FOR EACH ROW
BEGIN
   IF :NEW.salary < 0 THEN
      RAISE_APPLICATION_ERROR(-20001,'Salary cannot be negative');
   END IF;
END;

-- INSTEAD OF Trigger Example
-- Used with **views that are not directly updatable**.

CREATE OR REPLACE TRIGGER engineering_dept_view_trigger
INSTEAD OF INSERT
ON engineering_dept_view
BEGIN
   INSERT INTO employee(emp_id, emp_name)
   VALUES(:NEW.emp_id, :NEW.emp_name);
END;

CREATE OR REPLACE VIEW engineering_dept_view AS
SELECT emp_id, emp_name
FROM employee
WHERE dept_id=1;

insert into engineering_dept_view values(2002,'rakesh')

-- after update
CREATE OR REPLACE TRIGGER emp_update_trigger
AFTER UPDATE
ON employee
BEGIN
   DBMS_OUTPUT.PUT_LINE('Employee record updated');
END;

----------- audit table -------------
-- Create audit table:

```
CREATE TABLE employee_audit
(
   emp_id NUMBER,
   action_date DATE,
   action_type VARCHAR2(20)
);
```

--Create trigger:

```
CREATE OR REPLACE TRIGGER emp_audit_trigger
AFTER INSERT OR DELETE OR UPDATE
ON employee
FOR EACH ROW
BEGIN
   IF INSERTING THEN
      INSERT INTO employee_audit
      VALUES(:NEW.emp_id, SYSDATE, 'INSERT');
   ELSIF DELETING THEN
      INSERT INTO employee_audit
      VALUES(:OLD.emp_id, SYSDATE, 'DELETE');
   ELSIF UPDATING THEN
      INSERT INTO employee_audit
      VALUES(:OLD.emp_id, SYSDATE, 'UPDATE');
   END IF;

END;
/
```

--Test:

```
insert into employee values(9999,'temp','temp',2000,sysdate,60000,10000,1);
update employee set salary = 70000 where emp_id = 9999
DELETE FROM employee WHERE emp_id = 9999;
```

--Check audit table:

```
SELECT * FROM employee_audit;
```