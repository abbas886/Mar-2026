--1. Index on one column

CREATE INDEX idx_emp_name
ON employee(emp_name);

--2. Create Composite Index (Multiple Columns)
CREATE INDEX idx_emp_dept_salary
ON employee(dept_id, salary);

--3. Unique Index- Ensures column values are unique

CREATE UNIQUE INDEX idx_emp_email
ON employee(email);

-- 4. Bitmap Index- Suitable for low-cardinality columns (few distinct values)

CREATE BITMAP INDEX idx_emp_gender
ON employee(gender);

-- 5. Function-Based Index - Index on expressions or functions

CREATE INDEX idx_upper_name
ON employee(UPPER(emp_name));

-- Check Indexes on Table

SELECT index_name, table_name
FROM user_indexes
WHERE table_name = 'EMPLOYEE';

-- Drop Index
DROP INDEX idx_emp_salary;