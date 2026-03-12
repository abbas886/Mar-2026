# employee management system
# initialize employee list
# getAllEmployees() - returns list of all employees
# getEmployeeById(id) - returns employee with given id
# addEmployee(employee) - adds a new employee to the list
# deleteEmployee(id) - removes employee with given id from the list
class Employee:
    def __init__(self, id, name, salary, department, position):
        self.id = id
        self.name = name
        self.salary = salary
        self.department = department
        self.position = position
    def addEmployee(self, employee):
        self.employee_list.append(employee)
    def getAllEmployees(self):
        return self.employee_list
    def getEmployeeById(self, id):
        for employee in self.employee_list:
            if employee.id == id:
                return employee
        return None
    def deleteEmployee(self, id):
        for employee in self.employee_list:
            if employee.id == id:
                self.employee_list.remove(employee)
                return True
        return False
