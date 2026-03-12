employees = []
def add_employee(id, name, salary, dept_id):
    if get_employee_by_id(id):
        raise ValueError("Employee with ID {} already exists".format(id))
    employee = {
        'id': id,
        'name': name,
        'salary': salary,
        'dept_id': dept_id
    }
    employees.append(employee)

def get_employee_by_id(id):
    for employee in employees:
        if employee['id'] == id:
            return employee
    return None
def delete_employee_by_id(id):
    emp = get_employee_by_id(id)
    if emp:
        employees.remove(emp)
        return True
    return False
def update_employee_salary(id, new_salary):
    emp = get_employee_by_id(id)
    if emp:
        emp['salary'] = new_salary
        return True
    return False
def get_employees_by_department(dept_id):
    dept_employees = []
    for employee in employees:
        if employee['dept_id'] == dept_id:
            dept_employees.append(employee)
    return dept_employees
def get_all_employees():
    return employees
