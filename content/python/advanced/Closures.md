# Closures in Python with Real-Time Use Cases

## 1. What is a Closure?

A **closure** is a function that **remembers the variables from its outer (enclosing) function even after the outer function has finished executing**.

Key idea

```
Function + captured outer variables = Closure
```

A closure occurs when:

1. A function is defined inside another function
2. The inner function uses variables from the outer function
3. The outer function returns the inner function

---

# 2. Basic Example

```python
def outer():
    message = "Hello"

    def inner():
        print(message)

    return inner

func = outer()
func()
```

Output

```
Hello
```

Explanation

Even though `outer()` finished execution,  
`inner()` still remembers the variable `message`.

This memory retention is called a **closure**.

---

# 3. How Python Stores Closure Variables

Example

```python
def outer():
    x = 10

    def inner():
        print(x)

    return inner

f = outer()

print(f.__closure__)
```

Output

```
(<cell at ...: int object>)
```

Access closure value

```python
print(f.__closure__[0].cell_contents)
```

Output

```
10
```

---

# 4. Real-Time Use Case 1: Function Factories

Closures can generate **customized functions dynamically**.

Example

```python
def multiplier(n):

    def multiply(x):
        return x * n

    return multiply

double = multiplier(2)
triple = multiplier(3)

print(double(10))
print(triple(10))
```

Output

```
20
30
```

Real-world usage

```
Dynamic business rule creation
Financial calculations
Discount engines
```

Example scenario

```
Create tax calculators for different countries
```

---

# 5. Real-Time Use Case 2: Logging Wrapper

Closures are useful for **adding logging without modifying original code**.

Example

```python
def logger(func):

    def wrapper(*args):
        print("Calling function:", func.__name__)
        return func(*args)

    return wrapper

def add(a, b):
    return a + b

logged_add = logger(add)

print(logged_add(5, 3))
```

Output

```
Calling function: add
8
```

Real-world usage

```
Application logging
Debugging
Tracing API calls
```

---

# 6. Real-Time Use Case 3: Access Control / Authentication

Closures can store authentication information.

Example

```python
def authenticate(password):

    def check(user_password):
        if user_password == password:
            print("Access Granted")
        else:
            print("Access Denied")

    return check

login = authenticate("admin123")

login("admin123")
login("wrong")
```

Output

```
Access Granted
Access Denied
```

Real-world usage

```
Session validation
API authentication
Security wrappers
```

---

# 7. Real-Time Use Case 4: Caching / Memoization

Closures can store cached values.

Example

```python
def cache():

    store = {}

    def get_value(key, value):

        if key in store:
            return "From cache: " + str(store[key])

        store[key] = value
        return "Stored: " + str(value)

    return get_value

c = cache()

print(c("a", 100))
print(c("a", 200))
```

Output

```
Stored: 100
From cache: 100
```

Real-world usage

```
API response caching
Database query caching
AI model inference caching
```

---

# 8. Real-Time Use Case 5: Rate Limiting

Closures can track request counts.

Example

```python
def rate_limiter(limit):

    count = 0

    def request():

        nonlocal count

        if count < limit:
            count += 1
            print("Request allowed")
        else:
            print("Rate limit exceeded")

    return request

api_call = rate_limiter(3)

api_call()
api_call()
api_call()
api_call()
```

Output

```
Request allowed
Request allowed
Request allowed
Rate limit exceeded
```

Real-world usage

```
API gateways
Microservices rate limiting
Security throttling
```

---

# 9. Real-Time Use Case 6: Configuration Binding

Closures can bind configuration values.

Example

```python
def db_connector(connection_string):

    def connect():
        print("Connecting to:", connection_string)

    return connect

connect_db = db_connector("postgres://localhost:5432")

connect_db()
```

Output

```
Connecting to: postgres://localhost:5432
```

Real-world usage

```
Database connection builders
Cloud service connectors
SDK initialization
```

---

# 10. Closures vs Classes

Both can maintain state.

### Closure

```python
def counter():

    count = 0

    def increment():
        nonlocal count
        count += 1
        return count

    return increment
```

### Class

```python
class Counter:

    def __init__(self):
        self.count = 0

    def increment(self):
        self.count += 1
        return self.count
```

Comparison

| Feature | Closure | Class |
|------|------|------|
| Simplicity | Simple | More structure |
| State storage | Enclosed variables | Instance variables |
| Use case | Lightweight logic | Complex objects |

---

# 11. Closures vs Decorators

Decorators internally use **closures**.

Example

```python
def decorator(func):

    def wrapper():
        print("Before execution")
        func()
        print("After execution")

    return wrapper
```

Decorator syntax

```python
@decorator
def greet():
    print("Hello")
```

So internally:

```
Decorators = Closures
```

---

# 12. Real Example: Retry Logic

Example

```python
import time

def retry(times):

    def decorator(func):

        def wrapper(*args):

            for i in range(times):
                try:
                    return func(*args)
                except:
                    print("Retrying...")
                    time.sleep(1)

        return wrapper

    return decorator
```

Usage

```python
@retry(3)
def unstable():
    raise Exception("Error")

unstable()
```

Real-world usage

```
API retry
microservice communication
database reconnection
```

---

# 13. Advantages of Closures

Closures provide

- data hiding
- lightweight state management
- functional programming capability
- dynamic function creation

---

# 14. Summary

Closure definition

```
A closure is a function that remembers variables from its enclosing scope.
```

Key characteristics

```
Inner function
Outer variables captured
Outer function returns inner function
```

Common real-world use cases

- function factories
- logging wrappers
- caching systems
- authentication checks
- rate limiting
- configuration binding
- decorators
- retry mechanisms