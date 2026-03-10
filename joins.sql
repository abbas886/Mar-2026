## INNER JOIN, LEFT JOIN, RIGHT JOIN, CROSS JOIN, SELF JOIN, and advanced join scenarios.

# Display employee name and department name.
select e.emp_name, d.dept_name from employee e, department d;  # duplicate records - use condition

select e.emp_name, d.dept_name from employee e, department d
where e.dept_id = d.dept_id;
# OR
select e.emp_name, d.dept_name from employee e
inner join department d
on d.dept_id = e.dept_id ;

# OR
select e.emp_name, d.dept_name from employee e
inner join department d
using (dept_id);

# Display employee name, job title, and department location.
select e.emp_name, e.job_title, d.location from employee e
inner join department d
using (dept_id);

# Display all employees working in the Engineering department.
select * from employee where dept_id = 
(select dept_id from department where dept_name="Engineering");
# without subquery
select * from employee e join department d using(dept_id) where d.dept_name="Engineering"; 

## LEFT JOIN returns all rows from left table even if there is no match.
# Display all employees and their department names.
select e.emp_name, d.dept_name from employee e
left join department d using(dept_id);

# Find employees who do not belong to any department.
select e.emp_name, d.dept_name from employee e
left join department d using (dept_id)
where d.dept_id is null;

# Show employees and department location if available.
select e.emp_name, d.location from employee e
left join department d using (dept_id);

select e.emp_name, d.location from employee e
left join department d using (dept_id)
where d.location is not null;


## RIGHT JOIN returns all rows from right table.
# Display all departments and employees working in them.
select d.dept_name, e.emp_name from department d
join employee e using(dept_id); 

# Find departments that have no employees.
select d.dept_name, e.emp_name from department d
left join employee e using(dept_id)
where e.emp_id is null;

## FULL JOIN (Simulated in MySQL) 
# MySQL does not support FULL OUTER JOIN directly, so we simulate using UNION
# Show all employees and all departments including unmatched rows.
select e.emp_name, d.dept_name from employee e
left join department d using (dept_id)
union
select e.emp_name, d.dept_name from employee e
right join department d using (dept_id);

# SELF JOIN Questions Used when a table joins itself. Example: employee → manager relationship.
# Display employees and their managers.
select e.emp_name as name, m.emp_name as manager from employee e
left join employee m on e.manager_id = m.emp_id;  # remove left and check
     # not m.emp_id = e.manager_id - it should be reverse

# Find employees who report to 'David Wilson'.
select * from employee where manager_id =
(select emp_id from employee where emp_name = 'David Wilson'); 

SELECT e.emp_name
FROM employee e
JOIN employee m
ON e.manager_id = m.emp_id
WHERE m.emp_name = 'David Wilson';

# Display employee and manager salary comparison.
SELECT e.emp_name,
       e.salary AS employee_salary,
       m.emp_name AS manager,
       m.salary AS manager_salary
FROM employee e
JOIN employee m
ON e.manager_id = m.emp_id;

## CROSS JOIN Questions :  CROSS JOIN returns Cartesian product.
# Display all combinations of employees and departments.
SELECT e.emp_name, d.dept_name
FROM employee e
CROSS JOIN department d;

# Find possible employee assignments for each department.
SELECT e.emp_name, d.dept_name
FROM employee e
CROSS JOIN department d;

# Advanced JOIN Questions
# Find employees who earn more than their manager.
SELECT e.emp_name, e.salary
FROM employee e
JOIN employee m
ON e.manager_id = m.emp_id
WHERE e.salary > m.salary;

# Find departments where employees earn more than 80000.
SELECT DISTINCT d.dept_name
FROM employee e
JOIN department d
ON e.dept_id = d.dept_id
WHERE e.salary > 80000;

# Display employees hired after their manager.
SELECT e.emp_name, e.hire_date, m.emp_name AS manager
FROM employee e
JOIN employee m
ON e.manager_id = m.emp_id
WHERE e.hire_date > m.hire_date;

# Find employees working in the same department as 'John Smith'.
SELECT e.emp_name
FROM employee e
JOIN employee j
ON e.dept_id = j.dept_id
WHERE j.emp_name = 'John Smith'
AND e.emp_name <> 'John Smith';

# Find number of employees in each department using JOIN.
SELECT d.dept_name, COUNT(e.emp_id)
FROM department d
LEFT JOIN employee e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;