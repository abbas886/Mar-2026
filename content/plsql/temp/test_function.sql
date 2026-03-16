-- plsql block  
block
  -- declare variables
  v_num1 number := 10;
  v_num2 number := 20;
  v_sum number;
begin
  -- calculate sum
  v_sum := v_num1 + v_num2;
  -- display result
  dbms_output.put_line('The sum of ' || v_num1 || ' and ' || v_num2 || ' is: ' || v_sum);
end;
-- get department name of given employee id

create or replace function get_department_name(p_emp_id in number) return varchar2 is
  v_dept_name varchar2(100);
begin
  select d.department_name
  into v_dept_name
  from employees e
  join departments d on e.department_id = d.department_id
  where e.employee_id = p_emp_id;
  return v_dept_name;
exception
  when no_data_found then
    return 'Employee not found';
  when others then
    return 'An error occurred: ' || sqlerrm;
end;