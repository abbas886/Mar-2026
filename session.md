# 04/03/2026

Data
Data Base
Data Base Management System
RDBMS
NoSQL


RDBMS
-----
data types
constraints
type of statements


data types:
int
char
varchar
varchar2
date
LOB
    BLOB
    CLOB
etc.,

constrants:
Unique  -  no duplicate - Exaple: 
Not null - should not be empty
Primary key - Unqiue and Not null - id fields
foreign key - referece key
Check   - Gender, Age, Marks 
default - Audit fields - createdBy, updatedBy, lastLogin etd.,
composite key - more than one key to identefy a row.

Statements:
DDL - Date Definition Language
DML - Data Manipulation Langauge
TCL - Transaction Controle Language
Fetching - Select

Associations:
-------------
Relationship between the tables (if it is sql)
             between the classes/interfaces/Objects(OOP)

Generalization   - kind of / type of
Aggregation - part of  - loosely coupled
Composition - part of  - tightly coupled
Realization

How can we access properperties/methods of one class(ClassA) in another class(ClassB)
ClassA extends ClassB
ClassA {
private ClassB b;

} 

based on the relationship
kind of / type of :  exnteds
 ContractEmployee is kind of Employee
 PermanentEmployee is type of Employee
 SavingAccount is type of Account

part of :
 Engine is part of Car
 Address is part of Employee
 Employee is part of Department



Role:
----
1-1   - Employee - Account
1-M (M-1)  - - Employee - Department,  Student - Branch
M-M   -  Student- Course,  Teacher-Subject
Recursive  -
Employee (id, name, salry, location,manager)

class Employee{

    private int id;
    private String name;
    private int salary;
    private String location;
    private  Employee    manager;
}

Design Database:
for an organization

Employee (id, name, salary, depat_id, project_id,account_id,
address_id,emp_type)
Department(id, name,...)
Project(id, name ...)
Account(id, type, cust_id, cust_name...)
Address(id, hno,street, city,pin...)
PermanentEmployee(id,hra,da,pf)
ContractEmployee(id, tenure)

Wrong design:
Employy(id, name, salary, depat_name,depart_head, dept_location)
without department table.

ACID 

05-03-26
--------
TCL
transfer amount from Account A to Account B
Account(acc_no, name, amount, isblocked, isActive)
savepoint A;
select amount from Account where acc_no=A
///checking
update Account set amount = amount-draw where acc_no=A
///checking
update Account set amount = ammoiunt + add where acc_no=B
commit
rollback savepoint A

what will happen if we delete a row in dept table?
if few employees are already there.  what will happened to these employees?


on delete cascade  -if you delte row in parent table(dept)
- child rows also automtically deleted.
on delete set null  -if you delete row in parent table(dept)
rows will not delte in child table - in dept column it will set null

1) delete row from dept where employees are already exist
2) remove foreign key contraint
    add foregin key constrain aga by "on delete cascade"
    insert few rows
    delete row from dept where employees are already exist

2) remove foreign key contraint
    add foregin key constrain aga by "on delete set null"
    insert few rows
    delete row from dept where employees are already exist


09/03/26
---------
subquery
Employee(id, name, salary, dept_id)
Department(id, name, location, manager)


Fetch all the employees belongs to particular department id = 101
select * from emp where dept_id=101

Fetch all the employees belongs to particular department name = "Development"

select * from employee
where 
dept_id =
(select id from department where name = "Development")


Fetch all the employees belongs to  department name = "Development" or "HR" or "Security"

select * from emplloyees where id  in
(
select id from department where name in ["Development", "HR","Security"]
)

joins:

Employee(id, name, salary, dept_id)
Department(id, name, location, manager)

Employees
101 Ramesh, 1000 10
102 Kishore, 3000 20
103 Ramu     5000 30
104 Rama    5000  

Department
10 IT
20 Security
30 HR
40 Contract

# Multi-row subquery → Use IN, ANY, ALL
# fetch all the employees belongs ether "development" or "HR"

select * from employee where dept_id
in = 
(select id from department where name = "development"
or name = "HR")

# Question :  select all the emloyees who are getting average salary of department "development"

select * from employees where salary >
(
select avg(salary) from employee
where id = 
(select id from department where name ="development")
)

11/03/26
--------
How to learn a programming language quickly

Telugu/English                  programming language
--------------                  ---------------------
alphabets                       alphabets
words                           keywords
grammer                         syntax
sentances                       statements
essay writing/paragraphs        function/program

Factors need to consider while writing programs
coding standards
    naming conventions - variables,methods, classes
code reusability
performance
    memory
    time
modularility

statements:
----------
input
output
conditional
    if
        simple if
        if - else
        nested if
        else - if 
    switch
controle statements
    for
    while
break  - will comeout from the loop
continue - will continue the loop by skippking statemement
return - will comout from the method

method
def method_name(parameters):
    statements

def message():
    return "hello";

def message (name):
    return "hello" + name;
def add(x,y):
    return x+y;

12/03/26
--------
Employeement
addEmployee(emp):
  list.add(emp)
deleteEmployee(empId)
updateEmployee()
getAllEmployees()
getEmployeeById()
employees = []  -- 1)list   2)dictionary
employee = {
    "emp_id"  :"1001",
    "emp_name" :"Eswar"
}

## OOP
model
 - 
repository
service
controller/api


















