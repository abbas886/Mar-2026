# PL/SQL Triggers

## Introduction to Trigger

A **trigger** in PL/SQL is a **stored program unit that automatically executes when a specific event occurs on a table or view**.

Triggers are commonly used for:

- Data validation
- Auditing
- Enforcing business rules
- Automatic data modifications
- Logging database activity

Unlike procedures or functions, **triggers execute automatically** when the triggering event occurs.

Example use case:
When a new employee is inserted into the `employees` table, a trigger can automatically insert a record into an **audit table**.

---

# Features of Triggers

Key features of triggers include:

- Automatically executed when a database event occurs
- Associated with tables or views
- Can enforce complex business rules
- Can be executed **before or after a DML operation**
- Can operate **once per statement or once per row**
- Can reference old and new values using `:OLD` and `:NEW`

Example references:

| Reference | Description |
|-----------|-------------|
| :NEW | New value of the column after INSERT or UPDATE |
| :OLD | Old value of the column before UPDATE or DELETE |

---

# Creating Triggers

Triggers are created using the `CREATE TRIGGER` statement.

### Basic Syntax

```
CREATE OR REPLACE TRIGGER trigger_name
BEFORE | AFTER INSERT | UPDATE | DELETE
ON table_name
BEGIN
   -- Trigger body
END;
/
```

### Example

```
CREATE OR REPLACE TRIGGER emp_insert_trigger
AFTER INSERT
ON employees
BEGIN
   DBMS_OUTPUT.PUT_LINE('New employee inserted');
END;
/
```

This trigger runs **after a new employee is inserted**.

---

# Trigger Timing

Trigger timing specifies **when the trigger should fire relative to the triggering event**.

| Timing | Description |
|-------|-------------|
| BEFORE | Executes before the DML operation |
| AFTER | Executes after the DML operation |
| INSTEAD OF | Used with views instead of tables |

---

## BEFORE Trigger Example

```
CREATE OR REPLACE TRIGGER check_salary
BEFORE INSERT
ON employees
FOR EACH ROW
BEGIN
   IF :NEW.salary < 0 THEN
      RAISE_APPLICATION_ERROR(-20001,'Salary cannot be negative');
   END IF;
END;
/
```

---

## AFTER Trigger Example

```
CREATE OR REPLACE TRIGGER log_employee_insert
AFTER INSERT
ON employees
BEGIN
   DBMS_OUTPUT.PUT_LINE('Employee inserted successfully');
END;
/
```

---

## INSTEAD OF Trigger Example

Used with **views that are not directly updatable**.

```
CREATE OR REPLACE TRIGGER emp_view_trigger
INSTEAD OF INSERT
ON employee_view
BEGIN
   INSERT INTO employees(employee_id, name)
   VALUES(:NEW.employee_id, :NEW.name);
END;
/
```

---

# Trigger Events

Triggers fire when specific **DML events** occur.

| Event | Description |
|------|-------------|
| INSERT | Trigger fires when a row is inserted |
| UPDATE | Trigger fires when a row is updated |
| DELETE | Trigger fires when a row is deleted |

Example:

```
CREATE OR REPLACE TRIGGER emp_update_trigger
AFTER UPDATE
ON employees
BEGIN
   DBMS_OUTPUT.PUT_LINE('Employee record updated');
END;
/
```

Multiple events can also be combined:

```
AFTER INSERT OR UPDATE OR DELETE
```

---

# Trigger Types

Triggers are classified based on execution level.

| Trigger Type | Description |
|--------------|-------------|
| Statement-Level Trigger | Executes once per SQL statement |
| Row-Level Trigger | Executes once for each affected row |

---

## Statement Level Trigger

```
CREATE OR REPLACE TRIGGER emp_stmt_trigger
AFTER INSERT
ON employees
BEGIN
   DBMS_OUTPUT.PUT_LINE('Insert statement executed');
END;
/
```

Runs **once per statement**, even if multiple rows are inserted.

---

## Row Level Trigger

Uses `FOR EACH ROW`.

```
CREATE OR REPLACE TRIGGER emp_row_trigger
AFTER INSERT
ON employees
FOR EACH ROW
BEGIN
   DBMS_OUTPUT.PUT_LINE('Employee ID: ' || :NEW.employee_id);
END;
/
```

Runs **once for every row inserted**.

---

# Execution Order of Triggers

If multiple triggers exist for the same event, Oracle follows this execution order:

1. BEFORE Statement trigger
2. BEFORE Row trigger
3. DML operation
4. AFTER Row trigger
5. AFTER Statement trigger

Example sequence:

```
BEFORE STATEMENT
BEFORE EACH ROW
INSERT/UPDATE/DELETE
AFTER EACH ROW
AFTER STATEMENT
```

---

# Compound Triggers

A **compound trigger** allows multiple timing points within a single trigger.

It improves performance by reducing context switching between SQL and PL/SQL.

Sections in a compound trigger:

- BEFORE STATEMENT
- BEFORE EACH ROW
- AFTER EACH ROW
- AFTER STATEMENT

### Example

```
CREATE OR REPLACE TRIGGER emp_compound_trigger
FOR INSERT ON employees
COMPOUND TRIGGER

BEFORE STATEMENT IS
BEGIN
   DBMS_OUTPUT.PUT_LINE('Insert started');
END BEFORE STATEMENT;

AFTER EACH ROW IS
BEGIN
   DBMS_OUTPUT.PUT_LINE('Inserted employee: ' || :NEW.employee_id);
END AFTER EACH ROW;

AFTER STATEMENT IS
BEGIN
   DBMS_OUTPUT.PUT_LINE('Insert completed');
END AFTER STATEMENT;

END;
/
```

---

# Enable and Disable Triggers

Triggers can be enabled or disabled using `ALTER TRIGGER`.

### Disable Trigger

```
ALTER TRIGGER emp_insert_trigger DISABLE;
```

### Enable Trigger

```
ALTER TRIGGER emp_insert_trigger ENABLE;
```

Disable all triggers on a table:

```
ALTER TABLE employees DISABLE ALL TRIGGERS;
```

Enable all triggers:

```
ALTER TABLE employees ENABLE ALL TRIGGERS;
```

---

# Hands-on Practice with Triggers

## Example – Audit Trigger

Create audit table:

```
CREATE TABLE employee_audit
(
   emp_id NUMBER,
   action_date DATE,
   action_type VARCHAR2(20)
);
```

Create trigger:

```
CREATE OR REPLACE TRIGGER emp_audit_trigger
AFTER INSERT OR DELETE
ON employees
FOR EACH ROW
BEGIN
   IF INSERTING THEN
      INSERT INTO employee_audit
      VALUES(:NEW.employee_id, SYSDATE, 'INSERT');
   ELSIF DELETING THEN
      INSERT INTO employee_audit
      VALUES(:OLD.employee_id, SYSDATE, 'DELETE');
   END IF;
END;
/
```

Test:

```
INSERT INTO employees VALUES (101,'John',50000);

DELETE FROM employees WHERE employee_id = 101;
```

Check audit table:

```
SELECT * FROM employee_audit;
```

---

# Summary

This section covered **PL/SQL Triggers**, including:

- Introduction to triggers
- Features and advantages of triggers
- Creating triggers
- Trigger timing (BEFORE, AFTER, INSTEAD OF)
- Trigger events (INSERT, UPDATE, DELETE)
- Trigger types (Statement-level and Row-level)
- Execution order of triggers
- Compound triggers
- Enabling and disabling triggers
- Real-time examples and hands-on practice

Triggers are powerful tools used in **enterprise database systems to enforce business rules, maintain data integrity, and automate database operations**.