# Advanced Python Concepts with Examples

## List of Concepts Covered

1. Decorators  
2. Generators  
3. List Comprehensions  
4. Lambda Functions  
5. Iterators  
6. Context Managers  
7. Multithreading  
8. Multiprocessing  
9. Async Programming  
10. Metaclasses  
11. Monkey Patching  
12. Closures  
13. Duck Typing  
14. Dynamic Typing  
15. Memory Management  

---

# 1. Decorators

Decorators allow you to **modify the behavior of functions or methods** without changing their code.

### Example

    def logger(func):
        def wrapper():
            print("Function execution started")
            func()
            print("Function execution finished")
        return wrapper

    @logger
    def say_hello():
        print("Hello")

    say_hello()

Output

    Function execution started
    Hello
    Function execution finished

---

# 2. Generators

Generators allow you to **generate values lazily using the `yield` keyword**.

They are memory efficient.

### Example

    def number_generator(n):
        for i in range(n):
            yield i

    gen = number_generator(5)

    for value in gen:
        print(value)

Output

    0
    1
    2
    3
    4

---

# 3. List Comprehensions

A concise way to create lists.

### Example

    squares = [x*x for x in range(5)]
    print(squares)

Output

    [0, 1, 4, 9, 16]

With condition

    even_numbers = [x for x in range(10) if x % 2 == 0]
    print(even_numbers)

---

# 4. Lambda Functions

Lambda functions are **anonymous functions**.

### Example

    add = lambda a, b: a + b
    print(add(5, 3))

Output

    8

Using lambda with sorting

    students = [("John", 85), ("Alice", 92), ("Bob", 78)]

    students.sort(key=lambda x: x[1])

    print(students)

---

# 5. Iterators

An iterator is an object that implements:

- `__iter__()`
- `__next__()`

### Example

    class Counter:
        def __init__(self, max):
            self.max = max
            self.current = 0

        def __iter__(self):
            return self

        def __next__(self):
            if self.current < self.max:
                value = self.current
                self.current += 1
                return value
            else:
                raise StopIteration

    counter = Counter(5)

    for num in counter:
        print(num)

---

# 6. Context Managers

Context managers manage **resources automatically**.

Used with `with` statement.

### Example

    with open("file.txt", "w") as file:
        file.write("Hello World")

File automatically closes.

Custom context manager

    class FileManager:
        def __enter__(self):
            print("Opening resource")
            return self

        def __exit__(self, exc_type, exc_val, exc_tb):
            print("Closing resource")

    with FileManager():
        print("Working with resource")

---

# 7. Multithreading

Used to execute multiple tasks concurrently.

### Example

    import threading

    def print_numbers():
        for i in range(5):
            print(i)

    thread = threading.Thread(target=print_numbers)

    thread.start()
    thread.join()

---

# 8. Multiprocessing

Used to execute tasks in **parallel using multiple CPU cores**.

### Example

    from multiprocessing import Process

    def task():
        print("Process running")

    p = Process(target=task)

    p.start()
    p.join()

---

# 9. Async Programming

Async programming allows handling **I/O operations efficiently**.

Uses:

- `async`
- `await`

### Example

    import asyncio

    async def say_hello():
        print("Hello")
        await asyncio.sleep(2)
        print("World")

    asyncio.run(say_hello())

---

# 10. Metaclasses

Metaclasses define **how classes behave**.

A class itself is created by a metaclass.

### Example

    class Meta(type):
        def __new__(cls, name, bases, attrs):
            print("Creating class:", name)
            return super().__new__(cls, name, bases, attrs)

    class MyClass(metaclass=Meta):
        pass

Output

    Creating class: MyClass

---

# 11. Monkey Patching

Monkey patching allows modifying a class or module at runtime.

### Example

    class Dog:
        def speak(self):
            print("Bark")

    def new_speak(self):
        print("Woof")

    Dog.speak = new_speak

    d = Dog()
    d.speak()

Output

    Woof

---

# 12. Closures

A closure remembers variables from its enclosing scope.

### Example

    def outer(x):
        def inner(y):
            return x + y
        return inner

    add_five = outer(5)

    print(add_five(10))

Output

    15

---

# 13. Duck Typing

Python focuses on **behavior rather than type**.

"If it walks like a duck and quacks like a duck, it's a duck."

### Example

    class Dog:
        def speak(self):
            print("Bark")

    class Cat:
        def speak(self):
            print("Meow")

    def make_sound(animal):
        animal.speak()

    make_sound(Dog())
    make_sound(Cat())

---

# 14. Dynamic Typing

Variables do not have fixed types.

### Example

    x = 10
    print(type(x))

    x = "Hello"
    print(type(x))

---

# 15. Memory Management

Python uses **reference counting and garbage collection**.

Example

    import sys

    a = []
    print(sys.getrefcount(a))

---

# Summary

Advanced Python concepts include:

- Decorators  
- Generators  
- Iterators  
- Lambda functions  
- List comprehensions  
- Context managers  
- Multithreading  
- Multiprocessing  
- Async programming  
- Metaclasses  
- Closures  
- Monkey patching  
- Duck typing  
- Dynamic typing  
- Memory management  

These concepts are widely used in:

- backend frameworks  
- data processing  
- AI/ML systems  
- scalable distributed applications