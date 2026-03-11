use company_db;

# get avg salary of each department
select dept_id, avg(salary) from employee group by dept_id;

# Find the number of employees in each department.
select dept_id, count(*) from employee group by dept_id;

# Find departments having more than 3 employees.
select dept_id, count(*) as count from employee group by dept_id having count>3;

# Find departments where average salary is greater than 70000.
select dept_id, avg(salary) avs_sal from employee group by dept_id having avg(salary)>70000;

## GROUP BY Multiple Columns
# Find the number of employees by department and job title.
select dept_id, job_title, count(*) from employee group by dept_id, job_title;

# Find average salary for each job title in each department.
select dept_id, job_title, avg(salary) as avg_salary from employee group by dept_id, job_title;

## Advanced GROUP BY Questions
# Find the department with highest total salary.
select dept_id, sum(salary) as total from employee group by dept_id order by total desc limit 1


#Find departments having at least one employee earning more than 90000.
select dept_id from employee group by dept_id having max(salary)>90000;

# Find job titles where more than 2 employees exist.
select job_title, count(*) as count from employee group by job_title having count>2;

# Find departments where minimum salary is greater than 50000.
select dept_id, min(salary) min_salary from employee group by dept_id having min_salary>50000;

#Find departments where total commission is greater than 10000.
select dept_id, sum(commission) as tot_com from employee group by dept_id having tot_com>10000;
