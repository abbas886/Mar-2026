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









