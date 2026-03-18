# Python Assessment – Solutions (All in Functions)

## 1. Prime Number
def is_prime(n):
    if n < 2:
        return False
    for i in range(2, int(n**0.5) + 1):
        if n % i == 0:
            return False
    return True

---

## 2. Largest of Three Numbers
def largest_of_three(a, b, c):
    return max(a, b, c)

---

## 3. Fibonacci Series
def fibonacci(n):
    result = []
    a, b = 0, 1
    for _ in range(n):
        result.append(a)
        a, b = b, a + b
    return result

---

## 4. Palindrome String
def is_palindrome(s):
    return s == s[::-1]

---

## 5. Remove Duplicates from List
def remove_duplicates(lst):
    return list(set(lst))

---

## 6. Tuple Element Count
def count_in_tuple(t, value):
    return t.count(value)

---

## 7. Set Intersection
def intersection(s1, s2):
    return s1 & s2

---

## 8. Character Frequency
def char_frequency(s):
    freq = {}
    for ch in s:
        freq[ch] = freq.get(ch, 0) + 1
    return freq

---

## 9. List Comprehension
def squares_list(n):
    return [x*x for x in range(1, n+1)]

---

## 10. Lambda Sort
def sort_by_second(lst):
    return sorted(lst, key=lambda x: x[1])

---

## 11. Exception Handling
def safe_division(a, b):
    try:
        return a / b
    except ZeroDivisionError:
        return "Cannot divide by zero"

---

## 12. File Handling
def count_lines(filename):
    with open(filename, "r") as f:
        return len(f.readlines())

---

## 13. Class & Object
class Employee:
    def __init__(self, name, salary):
        self.name = name
        self.salary = salary

    def display(self):
        return f"{self.name} {self.salary}"

---

## 14. Inheritance
class Manager(Employee):
    def __init__(self, name, salary, dept):
        super().__init__(name, salary)
        self.dept = dept

---

## 15. Polymorphism
class Animal:
    def sound(self):
        return "Animal sound"

class Dog(Animal):
    def sound(self):
        return "Bark"

---

## 16. Encapsulation
class Person:
    def __init__(self):
        self.__age = 0

    def set_age(self, age):
        self.__age = age

    def get_age(self):
        return self.__age

---

## 17. Abstraction
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

---

## 18. Regex Email Validation
import re
def validate_email(email):
    pattern = r'^[\w\.-]+@[\w\.-]+\.\w+$'
    return bool(re.match(pattern, email))

---

## 19. Sorting List of Dictionaries
def sort_dict_list(lst):
    return sorted(lst, key=lambda x: x['age'])

---

## 20. Binary Search
def binary_search(arr, target):
    left, right = 0, len(arr)-1
    while left <= right:
        mid = (left + right)//2
        if arr[mid] == target:
            return mid
        elif arr[mid] < target:
            left = mid + 1
        else:
            right = mid - 1
    return -1

---

## 21. Top 3 Salaries
def top_three_salaries(salaries):
    return sorted(salaries, reverse=True)[:3]