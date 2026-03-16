-- get the department name of employee
-- if the employee id does not exist, return 'Employee not found'
-- if any other error occurs, return the error message
create or replace function get_department_name(p_emp_id in number) 
 return varchar2 is
  v_dept_name varchar2(100);
begin
  select d.dept_name
  into v_dept_name
  from employee e
  join dept d on e.dept_id = d.dept_id
  where e.emp_id = p_emp_id;
  return v_dept_name;
exception
  when no_data_found then
    return 'Employee not found';
  when others then
    return 'An error occurred: ' || sqlerrm;
end;

DECLARE
   v_name VARCHAR2(100);
BEGIN
   v_name := get_department_name(1000);
   DBMS_OUTPUT.PUT_LINE(v_name);
END;
/
