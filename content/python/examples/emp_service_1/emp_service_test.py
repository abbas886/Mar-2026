import emp_service as service

service.add_employee(1, "Alice", 50000, 101)
service.add_employee(2, "Bob", 60000, 102)

# Test get_employee_by_id
assert service.get_employee_by_id(1)['name'] == "Alice"
assert service.get_employee_by_id(2)['name'] == "Bob"
assert service.get_employee_by_id(3) is None
emp = service.get_employee_by_id(1)
print(emp)
service.delete_employee_by_id(1)
assert service.get_employee_by_id(1) is None
service.update_employee_salary(2, 65000)
#assert with message
assert service.get_employee_by_id(2)['salary'] == 65000, "Salary update failed for employee ID 2"
# assert  service.get_employee_by_id(2)['salary'] == 64000
# Test update_employee_salary
