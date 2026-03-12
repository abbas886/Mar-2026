import test

# create an instance of the Employee class
employee1 = test.Employee(1, "John Doe", 50000, "IT", "Software Engineer")
employee2 = test.Employee(2, "Jane Smith", 60000, "HR", "HR Manager")
# add employees to the employee list
employee1.addEmployee(employee1)
employee1.addEmployee(employee2)
# get all employees
print(employee1.getAllEmployees())
# get employee by id
print(employee1.getEmployeeById(1))