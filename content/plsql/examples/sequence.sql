---- Oracle Sequence – Real Use Cases

--In **Oracle**, a **sequence** is a database object used to generate **unique numeric values automatically**. It is commonly used to create **primary keys, transaction IDs, order numbers, and other unique identifiers**.

--- 1. Generating Primary Keys for Tables
--One of the most common uses of sequences is generating **unique IDs for table records**.

--Example:

CREATE SEQUENCE emp_seq
START WITH 1001
INCREMENT BY 1;

--Insert using sequence:

INSERT INTO employee(emp_id, emp_name, salary)
VALUES(emp_seq.NEXTVAL, 'John Smith', 75000);

Use case:
-- Employee ID generation
-- Customer ID generation
-- Product ID generation

---

--- 2. Order Number Generation in E-Commerce
--Each order needs a **unique order number**.

CREATE SEQUENCE order_seq
START WITH 5000
INCREMENT BY 1;

INSERT INTO orders(order_id, order_date, customer_id)
VALUES(order_seq.NEXTVAL, SYSDATE, 101);

--Use case:
-- Order processing systems
-- Invoice numbering

---

--- 3. Transaction IDs in Banking Systems
--Banking systems require **unique transaction IDs** for every transaction.

CREATE SEQUENCE transaction_seq
START WITH 100000
INCREMENT BY 1;

INSERT INTO transactions(transaction_id, amount, transaction_date)
VALUES(transaction_seq.NEXTVAL, 5000, SYSDATE);

--Use case:
-- ATM transactions
-- Online banking transfers
-- Payment gateway systems

---

--- 4. Log or Audit Record IDs
--Sequences are used to create **unique identifiers for audit logs**.

CREATE SEQUENCE log_seq
START WITH 1
INCREMENT BY 1;

INSERT INTO audit_log(log_id, action_date, action_type)
VALUES(log_seq.NEXTVAL, SYSDATE, 'INSERT');

--Use case:
-- Security logs
-- System audit tracking
-- User activity monitoring

---

--- 5. Ticket or Request Numbers
--Helpdesk or support systems generate **unique ticket numbers**.

CREATE SEQUENCE ticket_seq
START WITH 10000
INCREMENT BY 1;

INSERT INTO support_ticket(ticket_id, issue_description)
VALUES(ticket_seq.NEXTVAL, 'Login issue');

-Use case:
-- IT support systems
-- Customer service tickets

---

--- 6. Bulk Data Loading
--When importing large datasets, sequences ensure **every record gets a unique ID automatically**.

INSERT INTO employee(emp_id, emp_name)
SELECT emp_seq.NEXTVAL, name
FROM employee_staging;

-Use case:
-- Data migration
-- ETL processes
-- Data warehouse loading

---

--- Important Sequence Methods

--NEXTVAL → Generates the next sequence value

SELECT emp_seq.NEXTVAL FROM dual;

--CURRVAL → Returns the current sequence value

SELECT emp_seq.CURRVAL FROM dual;

---

--- Advantages of Sequences

-- Automatically generates **unique numbers**
-- Avoids **duplicate primary keys**
-- Supports **high concurrency**
-- Very fast compared to manual ID generation