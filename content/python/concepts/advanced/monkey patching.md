# Monkey Patching in Python with Real-Time Use Cases

## 1. What is Monkey Patching?

**Monkey Patching** is the technique of **modifying or extending code at runtime** without changing the original source code.

In Python, since **everything is dynamic**, we can modify:

- functions
- methods
- classes
- modules
- libraries

This is often used for:

- hot fixes
- testing
- extending third-party libraries
- debugging
- mocking behavior

Basic idea

```
Existing behavior → Replace/Modify at runtime
```

---

# 2. Basic Example of Monkey Patching

Example

```python
class Employee:
    def greet(self):
        print("Hello from Employee")

def new_greet(self):
    print("Hello from Monkey Patch")

Employee.greet = new_greet

emp = Employee()
emp.greet()
```

Output

```
Hello from Monkey Patch
```

Explanation

```
Original method → replaced dynamically
```

---

# 3. Monkey Patching a Module Function

Example

```python
import math

def fake_sqrt(x):
    return "Not allowed"

math.sqrt = fake_sqrt

print(math.sqrt(16))
```

Output

```
Not allowed
```

Here we **patched the built-in math module**.

---

# 4. Use Case 1: Fixing Bugs in Third-Party Libraries

Sometimes a **third-party library has a bug**, and we need a temporary fix.

Example

```python
import some_library

def fixed_function():
    print("Bug fixed version")

some_library.problem_function = fixed_function
```

Real-world usage

- Production hotfix
- Temporary patch until official release
- Enterprise legacy systems

Example scenario

```
Production system using a library
Bug discovered
Monkey patch applied until library update
```

---

# 5. Use Case 2: Mocking for Unit Testing

Monkey patching is widely used in **testing frameworks**.

Example

```python
import requests

def fake_get(url):
    return "Mocked response"

requests.get = fake_get

print(requests.get("http://api.example.com"))
```

Output

```
Mocked response
```

Real-world usage

- Unit testing
- API mocking
- integration test simulation

Testing frameworks like:

- pytest
- unittest.mock

internally use monkey patching.

---

# 6. Use Case 3: Adding Features to Third-Party Classes

Example

```python
class User:
    def __init__(self, name):
        self.name = name

def say_hi(self):
    print("Hi", self.name)

User.say_hi = say_hi

u = User("Alice")
u.say_hi()
```

Output

```
Hi Alice
```

Real-world usage

- extending frameworks
- adding utility methods
- adapting legacy code

---

# 7. Use Case 4: Instrumentation and Monitoring

Used in **observability systems**.

Example

```python
import time

def monitor(func):

    def wrapper(*args, **kwargs):
        start = time.time()
        result = func(*args, **kwargs)
        end = time.time()

        print("Execution time:", end - start)

        return result

    return wrapper
```

Now patch existing function

```python
import myservice

myservice.process = monitor(myservice.process)
```

Real-world usage

- performance monitoring
- distributed tracing
- debugging production systems

Tools that use similar techniques

- New Relic
- Datadog
- OpenTelemetry

---

# 8. Use Case 5: Framework Extensions

Frameworks sometimes use monkey patching internally.

Example concept

```python
def new_render(self):
    print("Custom render")

FrameworkClass.render = new_render
```

Real-world usage

- customizing framework behavior
- plugin systems
- backward compatibility layers

---

# 9. Use Case 6: Hot Fix in Production Systems

Suppose a production bug occurs and redeployment is expensive.

Example

```python
import payment_module

def safe_payment():
    print("Temporary fix for payment")

payment_module.process_payment = safe_payment
```

Real-world usage

- financial systems
- SaaS platforms
- emergency fixes

---

# 10. Use Case 7: Feature Flags / Runtime Behavior Changes

Monkey patching can change behavior dynamically.

Example

```python
def new_algorithm():
    print("New algorithm")

system.compute = new_algorithm
```

Real-world usage

- A/B testing
- feature rollout
- experimentation

---

# 11. Monkey Patching in Web Frameworks

Some frameworks allow middleware that behaves like monkey patching.

Example concept

```
Django middleware
Flask extensions
FastAPI dependency injection
```

They dynamically modify request handling.

---

# 12. Example: Patching Built-in Print (Advanced)

Example

```python
import builtins

original_print = print

def custom_print(*args, **kwargs):
    original_print("LOG:", *args)

builtins.print = custom_print

print("Hello world")
```

Output

```
LOG: Hello world
```

Real-world usage

- logging systems
- debugging frameworks

---

# 13. Risks of Monkey Patching

Monkey patching can cause problems.

Risks

- Hard to debug
- Unexpected side effects
- Library updates may break patches
- Maintenance complexity

Example

```
Library update → patched method removed
System crashes
```

---

# 14. Best Practices

Use monkey patching only when necessary.

Recommended alternatives

- subclassing
- decorators
- dependency injection
- adapters

Safe scenarios

- testing
- debugging
- instrumentation
- temporary patches

---

# 15. Famous Tools Using Monkey Patching

Many popular tools rely on monkey patching internally.

Examples

### gevent
Patches networking libraries for async behavior

### eventlet
Patches blocking calls

### pytest monkeypatch
Testing utilities

### OpenTelemetry
Instrumentation

---

# 16. Summary

Monkey patching allows **runtime modification of code**.

Common real-world use cases

- bug fixes in third-party libraries
- mocking in unit tests
- extending framework behavior
- performance monitoring
- runtime feature changes
- production hot fixes

Important principle

```
With great power comes great responsibility
```

Monkey patching is powerful but should be used **carefully in production systems**.