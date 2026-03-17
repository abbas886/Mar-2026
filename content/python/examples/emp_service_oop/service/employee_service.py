# define all the crud operations related to employee
from model.employee import Employee
class EmployeeService:
    def __init__(self):
        self.employees = []
    def add_employee(self, id, name, salary, dept_id):
        if self.get_employee_by_id(id):
            raise ValueError("Employee with ID {} already exists".format(id))
        employee = Employee(id, name, salary, dept_id)
        self.employees.append(employee)

    def get_employee_by_id(self, id):
        for employee in self.employees:
            if employee.id == id:
                return employee
        return None
    def delete_employee_by_id(self, id):
        emp = self.get_employee_by_id(id)
        if emp:
            self.employees.remove(emp)
            return True
        return False
    def update_employee_salary(self, id, new_salary):
        emp = self.get_employee_by_id(id)
        if emp:
            emp.salary = new_salary
            return True
        return False
    def get_employees_by_department(self, dept_id):
        dept_employees = []
        for employee in self.employees:
            if employee.dept_id == dept_id:
                dept_employees.append(employee)
        return dept_employees
    def get_all_employees(self):
        return self.employees  
     