9/3/26
------

data
data base
database management system
relational database managent system

101 ram csc 1000

datatypes
--------
int
char
varchar  - varchar2
date
LOB
    CLOB
    BLOB
Text

name : varchar(15)
Ram
Chakradhar rao kumar

contraints:
----------
unique 
not null
primary key   - unique and not null
foreign key   - reference to another table's field
default  - 
check


* on delete cascade, on delete set null

DB Design
---------
Want store employee details
id - name - salary - dept - location - address - 
1  - Ram    1000     HR     Chennai     add1
2    Ram1  20000    Dev    Hyd         1dd2
3    Ram2   40000    Dev    Hyd2         1dd3
4    Ram3   50000    Dev    Hyd3         1dd4

update depart "Dev"  to Deveopment
Ram left the company
delete from employee where id = 1
select unique dept from employy
inserting...

Emp(id, name, salry,dept_id)
Dept(id, name, location, manager)

Association: The relationship between entity(database)
              classes/interfaces/Object(OOP)
Aggregation  -  part of  - tightlu coupled
Composition  -  part of  - loosely coupled
Generalization  - type of /kind  - use inheritance
Realization

How can you access a method from classA which is defined in ClassB

Form simple english sentance consist of 2 things/entities
with a word - type of / kind of

Form simple english sentance consist of 2 things/entities
with a word - part of


Employee
ContractEmployee
PermanantEmployee
Address
Department
Account


Mapping/role/multiplicity:
1 to 1  : Employee - Account 
1 to many (many to 1) : Department - Employee
many to many :  Teacher - subject
recursive :
class Employee{
  private String id;
  private String name;
  private int salary;
  private  Employee    manager;

}

create table employee(
    id varchar primarykey,
    name varchar not null,
    salary double nor null,
    depart_id int references department(id)
)
create table department(
    id int primarykey,
    name varchar unique
    location varchar not null
    manager varchar
)
-----------

Types of statements

DDL: create, drop, alter, truckate
DML :  insert, update, delete
TCL : rollback, savepoint, commit
DQL : select 

ACID : 
Automocity : Either all or non of the statements should executed
transfer some amount from A to B

transferAmount(a, b , amount){

    isExpired(a)
    isBlocked(a)
    isExceeded(a)
    savpoint sp1
    update table account set balance = balance -  amount
        where acccount_id =a
    isExpired(b)
    isBlocked(b)

    update table account set balance = balance +  amount
        where acccount_id =b
    commit;
}
catch(exception e){
    rollback sp1
}













