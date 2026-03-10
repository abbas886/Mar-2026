# Find employees earning above average
select * from employee where salary >
(select avg(salary) from employee);

# Find highest paid employee
select * from employee where salary = 
(select max(salary) from employee);

# Find employees in sales department
select * from employee where dept_id = 
(select dept_id from department where dept_name='sales');

# Find departments without employees;
select dept_name from department d
where not exists 
(select 1 from employee e
where e.dept_id = d.dept_id);


# Compare salary across departments
select e1.emp_name, e1.salary from employee e1
where salary >
(select avg(e2.salary) from employee e2
where e1.dept_id = e2.dept_id);


select * from department;
insert into department values(10,'temp','Pune')
