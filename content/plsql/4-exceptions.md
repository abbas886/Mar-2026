# PL/SQL Exceptions

## Introduction to Exceptions

An **exception** in PL/SQL is an error condition that occurs during the execution of a program. When an error occurs, the normal execution of the program is interrupted, and control is transferred to the **exception handling section** of the PL/SQL block.

PL/SQL provides a structured mechanism to **detect, handle, and recover from runtime errors** using the `EXCEPTION` block.

Basic PL/SQL block structure with exception handling:

DECLARE
   -- Variable declarations
BEGIN
   -- Executable statements
EXCEPTION
   -- Exception handling code
END;
/

Example:

DECLARE
   num1 NUMBER := 10;
   num2 NUMBER := 0;
   result NUMBER;
BEGIN
   result := num1 / num2;
EXCEPTION
   WHEN ZERO_DIVIDE THEN
      DBMS_OUTPUT.PUT_LINE('Error: Division by zero');
END;
/

---

# Benefits of Exception Handling

Exception handling provides several advantages in PL/SQL programs:

1. **Improves program reliability** by managing unexpected errors.
2. **Prevents abnormal program termination**.
3. **Provides meaningful error messages** to users.
4. **Separates error handling logic from normal program logic**.
5. **Allows graceful recovery from errors**.

Without exception handling, a program would terminate abruptly when an error occurs.

---

# Types of Exceptions

PL/SQL supports two main types of exceptions:

1. **Predefined Exceptions**
2. **User-Defined Exceptions**

| Exception Type | Description |
|----------------|-------------|
| Predefined Exceptions | Built-in exceptions automatically defined by Oracle |
| User-Defined Exceptions | Exceptions defined by the programmer |

---

# Predefined Exceptions

Predefined exceptions are built-in exceptions that Oracle automatically raises when certain errors occur.

Examples of predefined exceptions:

| Exception | Description |
|----------|-------------|
| NO_DATA_FOUND | No rows returned from a query |
| TOO_MANY_ROWS | Query returned more than one row |
| ZERO_DIVIDE | Division by zero |
| INVALID_NUMBER | Invalid numeric conversion |
| VALUE_ERROR | Arithmetic or conversion error |
| DUP_VAL_ON_INDEX | Duplicate value in a unique column |

Example:

DECLARE
   emp_name VARCHAR2(50);
BEGIN
   SELECT first_name
   INTO emp_name
   FROM employees
   WHERE employee_id = 9999;

EXCEPTION
   WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('Employee not found');
END;
/

---

# User Defined Exceptions

User-defined exceptions are exceptions that programmers create to handle specific business conditions.

Steps to create a user-defined exception:

1. Declare the exception
2. Raise the exception
3. Handle the exception

Example:

DECLARE
   invalid_salary EXCEPTION;
   salary NUMBER := -500;
BEGIN
   IF salary < 0 THEN
      RAISE invalid_salary;
   END IF;

EXCEPTION
   WHEN invalid_salary THEN
      DBMS_OUTPUT.PUT_LINE('Salary cannot be negative');
END;
/

---

# Hands-on Practice for User Defined Exception

Example – Age Validation

DECLARE
   invalid_age EXCEPTION;
   age NUMBER := 15;
BEGIN
   IF age < 18 THEN
      RAISE invalid_age;
   END IF;

   DBMS_OUTPUT.PUT_LINE('Eligible for voting');

EXCEPTION
   WHEN invalid_age THEN
      DBMS_OUTPUT.PUT_LINE('Age must be 18 or above');
END;
/

---

Example – Bank Withdrawal Validation

DECLARE
   insufficient_balance EXCEPTION;
   balance NUMBER := 1000;
   withdraw_amount NUMBER := 1500;
BEGIN
   IF withdraw_amount > balance THEN
      RAISE insufficient_balance;
   END IF;

   DBMS_OUTPUT.PUT_LINE('Withdrawal successful');

EXCEPTION
   WHEN insufficient_balance THEN
      DBMS_OUTPUT.PUT_LINE('Insufficient account balance');
END;
/

---

# Raise Application Error

`RAISE_APPLICATION_ERROR` is a built-in procedure used to generate **custom error messages** with specific error numbers.

It allows developers to create **application-specific exceptions**.

Syntax:

RAISE_APPLICATION_ERROR(error_number, error_message);

Rules:
- Error number must be between **-20000 and -20999**
- Custom error message can be provided

Example:

DECLARE
   salary NUMBER := -1000;
BEGIN
   IF salary < 0 THEN
      RAISE_APPLICATION_ERROR(-20001,'Salary cannot be negative');
   END IF;
END;
/

Example – Banking Validation

DECLARE
   balance NUMBER := 2000;
   withdraw_amount NUMBER := 3000;
BEGIN
   IF withdraw_amount > balance THEN
      RAISE_APPLICATION_ERROR(-20002,'Withdrawal exceeds account balance');
   END IF;
END;
/

Output Example:

ORA-20002: Withdrawal exceeds account balance

---

# Summary

This section covered **PL/SQL Exception Handling**, including:

- Introduction to exceptions
- Benefits of exception handling
- Types of exceptions (Predefined and User-defined)
- Handling predefined exceptions
- Creating and handling user-defined exceptions
- Using `RAISE_APPLICATION_ERROR` for custom error messages

Exception handling is essential in PL/SQL programs to ensure **robust, reliable, and fault-tolerant database applications**.