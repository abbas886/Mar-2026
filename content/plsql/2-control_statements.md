# PL/SQL Statements

## PL/SQL Control Statements

PL/SQL control statements allow developers to control the **flow of execution** in a PL/SQL program. These statements determine **which block of code should execute based on conditions** or **how many times a set of statements should repeat**.

Control statements are broadly categorized into:

1. **Selection Statements**
2. **Iteration Statements**
3. **Sequential Statements**

---

# Selection Statements (IF..THEN..ELSE..END IF)

Selection statements allow the program to **execute certain statements based on a condition**.

## Syntax

```
IF condition THEN
   statements;
END IF;
```

## IF...THEN...ELSE Syntax

```
IF condition THEN
   statements_if_true;
ELSE
   statements_if_false;
END IF;
```

## IF...THEN...ELSIF Syntax

```
IF condition1 THEN
   statements1;
ELSIF condition2 THEN
   statements2;
ELSE
   statements3;
END IF;
```

---

## Example 1 – Simple IF Statement

```
DECLARE
   salary NUMBER := 60000;
BEGIN
   IF salary > 50000 THEN
      DBMS_OUTPUT.PUT_LINE('High Salary');
   END IF;
END;
/
```

---

## Example 2 – IF ELSE Statement

```
DECLARE
   marks NUMBER := 45;
BEGIN
   IF marks >= 50 THEN
      DBMS_OUTPUT.PUT_LINE('Pass');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Fail');
   END IF;
END;
/
```

---

## Example 3 – IF ELSIF Statement

```
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
/
```

---

# Hands-on Practice for Selection Statements

### Example – Check Even or Odd

```
DECLARE
   num NUMBER := 10;
BEGIN
   IF MOD(num,2) = 0 THEN
      DBMS_OUTPUT.PUT_LINE('Even Number');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Odd Number');
   END IF;
END;
/
```

---

### Example – Check Adult or Minor

```
DECLARE
   age NUMBER := 21;
BEGIN
   IF age >= 18 THEN
      DBMS_OUTPUT.PUT_LINE('Adult');
   ELSE
      DBMS_OUTPUT.PUT_LINE('Minor');
   END IF;
END;
/
```

---

# CASE Statement

The **CASE statement** provides an alternative to multiple IF-ELSIF conditions.

It allows multiple conditions to be checked in a **more readable and structured way**.

## Syntax

```
CASE expression
   WHEN value1 THEN result1
   WHEN value2 THEN result2
   ELSE result3
END CASE;
```

---

## Example – Simple CASE

```
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
/
```

---

## Example – CASE with Numbers

```
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
/
```
### 2. Searched CASE
In **Searched CASE**, each `WHEN` clause contains a condition.

**Syntax**

CASE
   WHEN condition1 THEN result1
   WHEN condition2 THEN result2
   ELSE default_result
END CASE;

**Example**

DECLARE
   v_salary NUMBER := 90000;
   v_grade VARCHAR2(20);
BEGIN
   CASE
      WHEN v_salary > 100000 THEN v_grade := 'Executive';
      WHEN v_salary > 80000 THEN v_grade := 'Senior';
      WHEN v_salary > 50000 THEN v_grade := 'Mid Level';
      ELSE v_grade := 'Junior';
   END CASE;

   DBMS_OUTPUT.PUT_LINE('Employee Grade: ' || v_grade);
END;
/

### Difference

| Feature | Simple CASE | Searched CASE |
|--------|-------------|---------------|
| Comparison | Compares one expression with values | Evaluates logical conditions |
| Use Case | Fixed value matching | Complex conditions |
| Example | dept_id = 1,2,3 | salary > 80000 |

---

# Hands-on Practice for CASE

### Example – Grade Evaluation

```
DECLARE
   marks NUMBER := 72;
BEGIN
   CASE
      WHEN marks >= 90 THEN
         DBMS_OUTPUT.PUT_LINE('Grade A');
      WHEN marks >= 75 THEN
         DBMS_OUTPUT.PUT_LINE('Grade B');
      WHEN marks >= 60 THEN
         DBMS_OUTPUT.PUT_LINE('Grade C');
      ELSE
         DBMS_OUTPUT.PUT_LINE('Grade D');
   END CASE;
END;
/
```

---

### Example – Department Code

```
DECLARE
   dept_id NUMBER := 3;
BEGIN
   CASE dept_id
      WHEN 1 THEN DBMS_OUTPUT.PUT_LINE('HR Department');
      WHEN 2 THEN DBMS_OUTPUT.PUT_LINE('Finance Department');
      WHEN 3 THEN DBMS_OUTPUT.PUT_LINE('IT Department');
      ELSE DBMS_OUTPUT.PUT_LINE('Other Department');
   END CASE;
END;
/
```

---

# Iteration Statements

Iteration statements allow a block of code to **execute repeatedly**.

Types of loops in PL/SQL:

1. **Basic LOOP**
2. **FOR LOOP**
3. **WHILE LOOP**

---

# LOOP Statement

The **LOOP statement** executes repeatedly until an EXIT condition is met.

## Syntax

```
LOOP
   statements;
   EXIT WHEN condition;
END LOOP;
```

### Example

```
DECLARE
   i NUMBER := 1;
BEGIN
   LOOP
      DBMS_OUTPUT.PUT_LINE('Value: ' || i);
      i := i + 1;
      EXIT WHEN i > 5;
   END LOOP;
END;
/
```

---

# FOR LOOP

A **FOR LOOP automatically handles initialization, condition checking, and incrementing**.

## Syntax

```
FOR counter IN lower_bound..upper_bound LOOP
   statements;
END LOOP;
```

### Example

```
BEGIN
   FOR i IN 1..5 LOOP
      DBMS_OUTPUT.PUT_LINE('Number: ' || i);
   END LOOP;
END;
/
```

---

# WHILE LOOP

The **WHILE loop executes as long as a condition is true**.

## Syntax

```
WHILE condition LOOP
   statements;
END LOOP;
```

### Example

```
DECLARE
   i NUMBER := 1;
BEGIN
   WHILE i <= 5 LOOP
      DBMS_OUTPUT.PUT_LINE('Count: ' || i);
      i := i + 1;
   END LOOP;
END;
/
```

---

# Hands-on Practice for Iteration

### Example – Print Numbers 1 to 10

```
BEGIN
   FOR i IN 1..10 LOOP
      DBMS_OUTPUT.PUT_LINE(i);
   END LOOP;
END;
/
```

---

### Example – Multiplication Table

```
DECLARE
   num NUMBER := 5;
BEGIN
   FOR i IN 1..10 LOOP
      DBMS_OUTPUT.PUT_LINE(num || ' x ' || i || ' = ' || num*i);
   END LOOP;
END;
/
```

---

# Sequential Statements

Sequential statements execute **one after another in the order they appear**.

Example:

```
BEGIN
   DBMS_OUTPUT.PUT_LINE('Step 1');
   DBMS_OUTPUT.PUT_LINE('Step 2');
   DBMS_OUTPUT.PUT_LINE('Step 3');
END;
/
```

Output:

Step 1  
Step 2  
Step 3  

---

# Nesting of Blocks

A **nested block** means placing one PL/SQL block inside another block.

Nested blocks help in **organizing complex programs and creating local scopes for variables**.

## Example

```
BEGIN
   DBMS_OUTPUT.PUT_LINE('Outer Block Start');

   DECLARE
      message VARCHAR2(30) := 'Inner Block';
   BEGIN
      DBMS_OUTPUT.PUT_LINE(message);
   END;

   DBMS_OUTPUT.PUT_LINE('Outer Block End');
END;
/
```

Output:

Outer Block Start  
Inner Block  
Outer Block End  

---

# Summary

This module covered **PL/SQL control statements**, including:

- Selection statements (IF, IF-ELSE, IF-ELSIF)
- CASE statements
- Iteration statements (LOOP, FOR, WHILE)
- Sequential statements
- Nesting of PL/SQL blocks

These constructs help developers implement **decision-making and repetition logic in PL/SQL programs**, which are essential for building complex database applications.