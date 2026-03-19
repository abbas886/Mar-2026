# SELECT vs SELECT INTO (Complete Guide)

## 🔹 Basic Difference (Simple Words)
| Feature | SELECT | SELECT INTO |
|--------|--------|-------------|
| Purpose | Fetch and display data | Fetch and store data into variables |
| Usage | SQL queries | PL/SQL blocks |
| Rows | Can return multiple rows | Must return exactly one row |
| Output | Result set | Variable value |
| Errors | No error for multiple rows | Errors if 0 or >1 rows |

---

## ✅ SELECT (Normal Query)
- Used to **display data**
- Works directly in SQL editor

SELECT emp_name FROM employee;

👉 Returns multiple rows (list of employee names)

---

## ✅ SELECT INTO (PL/SQL)
- Used to **store data into variables**
- Used inside `BEGIN...END`

DECLARE
   v_name employee.emp_name%TYPE;
BEGIN
   SELECT emp_name INTO v_name
   FROM employee
   WHERE emp_id = 1001;

   DBMS_OUTPUT.PUT_LINE(v_name);
END;
/

👉 Stores value in variable

---

## ⚠️ Important Rule
`SELECT INTO` must return **exactly ONE row**

| Situation | Result |
|----------|--------|
| No rows | ❌ NO_DATA_FOUND |
| Multiple rows | ❌ TOO_MANY_ROWS |

---

## ✅ Handling Exceptions for SELECT INTO

DECLARE
   v_name employee.emp_name%TYPE;
BEGIN
   SELECT emp_name INTO v_name
   FROM employee
   WHERE emp_id = 9999;

   DBMS_OUTPUT.PUT_LINE(v_name);

EXCEPTION
   WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('No employee found');

   WHEN TOO_MANY_ROWS THEN
      DBMS_OUTPUT.PUT_LINE('Multiple employees found');

   WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Unexpected error');
END;
/

---

## ✅ SELECT INTO with Aggregate Functions (Safe Usage)
👉 Aggregate functions always return **one row**, so they are safe.

DECLARE
   v_avg_salary NUMBER;
BEGIN
   SELECT AVG(salary) INTO v_avg_salary
   FROM employee;

   DBMS_OUTPUT.PUT_LINE('Average Salary: ' || v_avg_salary);
END;
/

👉 Even if table is empty → returns NULL (no error)

---

## 🧠 Real-Time Interview Scenarios

### 🔹 Scenario 1: Fetch Single Employee Details
SELECT emp_name INTO v_name
FROM employee
WHERE emp_id = 1001;

---

### 🔹 Scenario 2: Validate Record Existence
DECLARE
   v_count NUMBER;
BEGIN
   SELECT COUNT(*) INTO v_count
   FROM employee
   WHERE dept_id = 10;

   IF v_count > 0 THEN
      DBMS_OUTPUT.PUT_LINE('Employees exist');
   END IF;
END;
/

---

### 🔹 Scenario 3: Avoid TOO_MANY_ROWS Error
SELECT emp_name INTO v_name
FROM employee
WHERE dept_id = 1
AND ROWNUM = 1;

---

### 🔹 Scenario 4: Use Cursor Instead of SELECT INTO
FOR rec IN (SELECT emp_name FROM employee WHERE dept_id = 1)
LOOP
   DBMS_OUTPUT.PUT_LINE(rec.emp_name);
END LOOP;

---

### 🔹 Scenario 5: Get Max/Min Value Safely
SELECT MAX(salary) INTO v_max_salary
FROM employee;

---

## 🎯 Key Takeaways
- SELECT → Multiple rows (display)
- SELECT INTO → Single row (store)
- Always handle:
  - NO_DATA_FOUND
  - TOO_MANY_ROWS
- Prefer aggregate functions for safe usage
- Use cursor when multiple rows are expected