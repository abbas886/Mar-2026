# Python Static Methods vs Class Methods

## 1. Static Method

A **static method** is a method that **belongs to a class but does not access or modify class state or instance state**.

It behaves like a **normal function placed inside a class for logical grouping**.

Static methods are defined using the `@staticmethod` decorator.

### Key Characteristics

- Does **not receive `self` or `cls`**
- Cannot access instance variables
- Cannot modify class variables
- Used for **utility/helper functions**

### Syntax

    class ClassName:
        @staticmethod
        def method_name(parameters):
            pass

### Example

    class MathUtils:

        @staticmethod
        def add(a, b):
            return a + b

    result = MathUtils.add(5, 3)

    print(result)

Output

    8

### Static Method Access

Static methods can be called using:

    ClassName.method()

or

    object.method()

Example

    obj = MathUtils()
    print(obj.add(10, 20))

---

# 2. Class Method

A **class method** is a method that **operates on the class itself rather than instances of the class**.

It receives the **class reference (`cls`) as the first parameter**.

Defined using the `@classmethod` decorator.

### Key Characteristics

- First parameter is **`cls`**
- Can access **class variables**
- Can modify **class state**
- Often used as **alternative constructors**

### Syntax

    class ClassName:
        @classmethod
        def method_name(cls, parameters):
            pass

### Example

    class Employee:

        company = "TechCorp"

        @classmethod
        def change_company(cls, new_company):
            cls.company = new_company

    Employee.change_company("AI Corp")

    print(Employee.company)

Output

    AI Corp

---

# 3. Static Method vs Class Method Example

    class Employee:

        company = "TechCorp"

        def __init__(self, name):
            self.name = name

        @staticmethod
        def greet():
            print("Welcome to the company")

        @classmethod
        def change_company(cls, new_name):
            cls.company = new_name

    Employee.greet()

    Employee.change_company("GlobalTech")

    print(Employee.company)

Output

    Welcome to the company
    GlobalTech

---

# 4. Key Differences

| Feature | Static Method | Class Method |
|------|------|------|
First Parameter | None | cls |
Access Class Variables | No | Yes |
Modify Class State | No | Yes |
Access Instance Variables | No | No |
Decorator | @staticmethod | @classmethod |
Purpose | Utility functions | Operate on class data |

---

# 5. When to Use Static Method

Use static methods when:

- Method **does not need class or instance data**
- You want to **group utility functions inside a class**

Example use cases:

- Math utilities
- Validation helpers
- Conversion functions

---

# 6. When to Use Class Method

Use class methods when:

- Method **needs to access or modify class variables**
- Creating **alternative constructors**

Example

    class Employee:

        def __init__(self, name, salary):
            self.name = name
            self.salary = salary

        @classmethod
        def from_string(cls, emp_string):
            name, salary = emp_string.split("-")
            return cls(name, int(salary))

    emp = Employee.from_string("John-50000")

    print(emp.name, emp.salary)

Output

    John 50000

---

# 7. Summary

| Method Type | Description |
|------|------|
Static Method | Utility method that does not access class or instance data |
Class Method | Method that works with class variables and class state |

Quick Rule:

- **Use `@staticmethod` for helper functions**
- **Use `@classmethod` when working with class-level data**