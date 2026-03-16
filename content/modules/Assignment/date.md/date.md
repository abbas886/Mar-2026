-- Employees hired after a specific date
SELECT emp_name, hire_date
FROM employee
WHERE hire_date > DATE '2021-01-01';

--Employees hired in a specific year
SELECT emp_name, hire_date
FROM employee
WHERE EXTRACT(YEAR FROM hire_date) = 2023;

-- 3. Employees hired in a specific month
SELECT emp_name, hire_date
FROM employee
WHERE EXTRACT(MONTH FROM hire_date) = 1;

-- Employees hired in the last 2 years
SELECT emp_name, hire_date
FROM employee
WHERE hire_date >= ADD_MONTHS(SYSDATE, -24);

--5. Number of employees hired per year
SELECT EXTRACT(YEAR FROM hire_date) AS year,
       COUNT(*) AS total_employees
FROM employee
GROUP BY EXTRACT(YEAR FROM hire_date)
ORDER BY year;

--6. Number of employees hired per department
SELECT d.dept_name,
       COUNT(e.emp_id) AS total_hired
FROM employee e
JOIN dept d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

--7. Employees hired today
SELECT emp_name
FROM employee
WHERE TRUNC(hire_date) = TRUNC(SYSDATE);

--8. Employees hired in the last 30 days
SELECT emp_name, hire_date
FROM employee
WHERE hire_date >= SYSDATE - 30;

--9. Years of experience for each employee
SELECT emp_name,
       hire_date,
       ROUND((SYSDATE - hire_date)/365,2) AS years_of_experience
FROM employee;

--10. Employees hired before their manager
SELECT e.emp_name AS employee,
       m.emp_name AS manager,
       e.hire_date,
       m.hire_date
FROM employee e
JOIN employee m
ON e.manager_id = m.emp_id
WHERE e.hire_date < m.hire_date;

--11. Employees hired between two dates
SELECT emp_name, hire_date
FROM employee
WHERE hire_date BETWEEN DATE '2020-01-01'
AND DATE '2022-12-31';

--12. Oldest employee in the company
SELECT emp_name, hire_date
FROM employee
ORDER BY hire_date
FETCH FIRST 1 ROW ONLY;

--13. Newest employee
SELECT emp_name, hire_date
FROM employee
ORDER BY hire_date DESC
FETCH FIRST 1 ROW ONLY;

--14. Month-wise hiring report
SELECT TO_CHAR(hire_date,'YYYY-MM') AS month,
       COUNT(*) AS employees
FROM employee
GROUP BY TO_CHAR(hire_date,'YYYY-MM')
ORDER BY month;

--15. Employees hired on Monday
SELECT emp_name, hire_date
FROM employee
WHERE TO_CHAR(hire_date,'DAY') LIKE 'MONDAY%';