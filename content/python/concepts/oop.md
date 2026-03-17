# Object-Oriented Programming (OOP) in Python with Examples

## List of OOP Concepts

1. Class and Object  
2. Constructor (`__init__`)  
3. Instance Variables and Methods  
4. Class Variables and Class Methods  
5. Static Methods  
6. Encapsulation  
7. Inheritance  
8. Method Overriding  
9. Multiple Inheritance  
10. Polymorphism  
11. Abstraction  
12. Composition  
13. Operator Overloading  

---

# 1. Class and Object

A **class** is a blueprint for creating objects.  
An **object** is an instance of a class.

### Example

    class Employee:
        pass

    emp1 = Employee()
    emp2 = Employee()

    print(type(emp1))

---

# 2. Constructor (`__init__`)

A constructor initializes object attributes when an object is created.

### Example

    class Employee:
        def __init__(self, id, name, salary):
            self.id = id
            self.name = name
            self.salary = salary

    emp1 = Employee(101, "John", 50000)

    print(emp1.name)
    print(emp1.salary)

---

# 3. Instance Variables and Methods

Instance variables belong to individual objects.

### Example

    class Employee:
        def __init__(self, name, salary):
            self.name = name
            self.salary = salary

        def display(self):
            print("Name:", self.name)
            print("Salary:", self.salary)

    emp = Employee("Alice", 60000)
    emp.display()

---

# 4. Class Variables and Class Methods

Class variables are shared by all objects.

### Example

    class Employee:
        company = "TechCorp"

        def __init__(self, name):
            self.name = name

    emp1 = Employee("John")
    emp2 = Employee("Alice")

    print(emp1.company)
    print(emp2.company)

---

### Class Method

    class Employee:
        company = "TechCorp"

        @classmethod
        def change_company(cls, new_name):
            cls.company = new_name

    Employee.change_company("AI Corp")
    print(Employee.company)

---

# 5. Static Methods

Static methods do not access instance or class variables.

### Example

    class MathUtils:

        @staticmethod
        def add(a, b):
            return a + b

    print(MathUtils.add(5, 3))

---

# 6. Encapsulation

Encapsulation means **restricting access to variables and methods**.

Private variables use double underscore.

### Example

    class BankAccount:

        def __init__(self, balance):
            self.__balance = balance

        def deposit(self, amount):
            self.__balance += amount

        def get_balance(self):
            return self.__balance

    account = BankAccount(1000)
    account.deposit(500)

    print(account.get_balance())

---

# 7. Inheritance

Inheritance allows a class to **reuse properties and methods of another class**.

### Example

    class Animal:
        def speak(self):
            print("Animal makes sound")

    class Dog(Animal):
        def bark(self):
            print("Dog barks")

    d = Dog()

    d.speak()
    d.bark()

---

# 8. Method Overriding

A subclass can override a method of the parent class.

### Example

    class Animal:
        def speak(self):
            print("Animal sound")

    class Dog(Animal):
        def speak(self):
            print("Dog barks")

    d = Dog()
    d.speak()

---

# 9. Multiple Inheritance

A class can inherit from multiple parent classes.

### Example

    class Father:
        def skills(self):
            print("Gardening")

    class Mother:
        def skills(self):
            print("Cooking")

    class Child(Father, Mother):
        pass

    c = Child()
    c.skills()

---

# 10. Polymorphism

Polymorphism allows **same method name with different behavior**.

### Example

    class Dog:
        def sound(self):
            print("Bark")

    class Cat:
        def sound(self):
            print("Meow")

    animals = [Dog(), Cat()]

    for animal in animals:
        animal.sound()

---

# 11. Abstraction

Abstraction hides internal implementation details.

Python provides abstraction using **ABC module**.

### Example

    from abc import ABC, abstractmethod

    class Shape(ABC):

        @abstractmethod
        def area(self):
            pass

    class Circle(Shape):

        def __init__(self, r):
            self.r = r

        def area(self):
            return 3.14 * self.r * self.r

    c = Circle(5)

    print(c.area())

---

# 12. Composition

Composition means **one class contains another class object**.

### Example

    class Engine:
        def start(self):
            print("Engine started")

    class Car:
        def __init__(self):
            self.engine = Engine()

        def start_car(self):
            self.engine.start()

    car = Car()
    car.start_car()

---

# 13. Operator Overloading

Python allows redefining operators for objects.

### Example

    class Vector:

        def __init__(self, x, y):
            self.x = x
            self.y = y

        def __add__(self, other):
            return Vector(self.x + other.x, self.y + other.y)

    v1 = Vector(2, 3)
    v2 = Vector(4, 5)

    v3 = v1 + v2

    print(v3.x, v3.y)

---

# Summary

Object-Oriented Programming in Python includes:

- Classes and Objects
- Constructors
- Instance and Class Variables
- Static and Class Methods
- Encapsulation
- Inheritance
- Method Overriding
- Multiple Inheritance
- Polymorphism
- Abstraction
- Composition
- Operator Overloading

OOP helps in building:

- modular applications
- reusable code
- scalable systems
- maintainable software