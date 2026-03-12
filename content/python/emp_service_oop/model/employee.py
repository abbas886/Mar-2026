# employee model
class Employee:
    def __init__(self, id, name, salary, dept_id):
        self.id = id
        self.name = name
        self.salary = salary
        self.dept_id = dept_id

    def __str__(self):
        return "Employee(id={}, name={}, salary={}, dept_id={})".format(self.id, self.name, self.salary, self.dept_id)  
    