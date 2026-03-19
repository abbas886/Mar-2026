DECLARE
   emp_record employee%ROWTYPE;
BEGIN
   SELECT *
   INTO emp_record
   FROM employee
   WHERE emp_id = 1001;

   DBMS_OUTPUT.PUT_LINE(emp_record.emp_id || ' ' || emp_record.emp_name);
END;
desc employee;
select * from employee;

-- department
DECLARE
   dept_record dept%ROWTYPE;
BEGIN
   SELECT *
   INTO dept_record
   FROM dept
   WHERE dept_id = 10;

   DBMS_OUTPUT.PUT_LINE(dept_record.dept_name);
END;
desc dept;

-- custom record
DECLARE
   TYPE emp_type IS RECORD
   (
      emp_id NUMBER,
      emp_name VARCHAR2(50),
      salary NUMBER
   );

   emp_record emp_type;
BEGIN
   emp_record.emp_id := 101;
   emp_record.emp_name := 'John';
   emp_record.salary := 50000;

   DBMS_OUTPUT.PUT_LINE(emp_record.emp_name);
END;

-- Associative Arrays (Index By Tables)
-- Associative arrays store key-value pairs where elements are accessed using an index.
DECLARE
   TYPE name_array IS TABLE OF VARCHAR2(50)
   INDEX BY PLS_INTEGER;

   names name_array;
BEGIN
   names(1) := 'John';
   names(2) := 'David';
   names(3) := 'Sara';

   DBMS_OUTPUT.PUT_LINE(names(2));
END;

-- A **VARRAY (Variable Array)** is a collection with a **fixed maximum size**.

DECLARE
   TYPE marks_array IS VARRAY(5) OF NUMBER;

   marks marks_array := marks_array(80,85,90,75,88);
BEGIN
   DBMS_OUTPUT.PUT_LINE(marks(3));
END;

-- forall - loop
DECLARE
   TYPE num_table IS TABLE OF NUMBER;

   ids num_table := num_table(101,102,103);
BEGIN
   FORALL i IN 1..ids.COUNT
      DELETE FROM employee
      WHERE emp_id = ids(i);
END;
