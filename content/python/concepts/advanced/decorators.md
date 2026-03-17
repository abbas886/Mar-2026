# Python Decorators with Real-World Use Cases

## 1. What is a Decorator?

A **decorator** in Python is a function that **modifies or extends the behavior of another function without changing its code**.

Decorators are commonly used for:

- Logging
- Authentication
- Authorization
- Performance monitoring
- Caching
- Validation
- Retry mechanisms

Basic idea:

    function → decorator → enhanced function

---

# 2. Basic Decorator Example

A decorator wraps another function.

Example:

    def my_decorator(func):
        def wrapper():
            print("Before function execution")
            func()
            print("After function execution")
        return wrapper

    @my_decorator
    def say_hello():
        print("Hello")

    say_hello()

Output

    Before function execution
    Hello
    After function execution

Equivalent to:

    say_hello = my_decorator(say_hello)

---

# 3. Decorator with Arguments

Most real applications require passing arguments.

Example:

    def my_decorator(func):
        def wrapper(*args, **kwargs):
            print("Before execution")
            result = func(*args, **kwargs)
            print("After execution")
            return result
        return wrapper

    @my_decorator
    def add(a, b):
        return a + b

    print(add(3, 4))

Output

    Before execution
    After execution
    7

---

# 4. Real Use Case 1: Logging

Logging is one of the most common decorator use cases.

Example

    def log_function_call(func):
        def wrapper(*args, **kwargs):
            print(f"Calling function: {func.__name__}")
            result = func(*args, **kwargs)
            print(f"Function {func.__name__} executed")
            return result
        return wrapper

    @log_function_call
    def process_order(order_id):
        print(f"Processing order {order_id}")

    process_order(101)

Output

    Calling function: process_order
    Processing order 101
    Function process_order executed

Real-world usage:

- API logging
- Debugging production systems
- Monitoring microservices

---

# 5. Real Use Case 2: Authentication (Web Applications)

Decorators are heavily used in **web frameworks like Flask and Django**.

Example

    def require_login(func):
        def wrapper(user):
            if user != "admin":
                print("Access denied")
                return
            return func(user)
        return wrapper

    @require_login
    def view_dashboard(user):
        print("Welcome to the dashboard")

    view_dashboard("admin")
    view_dashboard("guest")

Output

    Welcome to the dashboard
    Access denied

Real-world usage:

- API authentication
- Role-based access
- Admin-only endpoints

---

# 6. Real Use Case 3: Execution Time Monitoring

Used in performance tuning.

Example

    import time

    def measure_time(func):
        def wrapper(*args, **kwargs):
            start = time.time()
            result = func(*args, **kwargs)
            end = time.time()
            print("Execution time:", end - start)
            return result
        return wrapper

    @measure_time
    def slow_function():
        time.sleep(2)
        print("Function completed")

    slow_function()

Output

    Function completed
    Execution time: 2.0

Real-world usage:

- Performance profiling
- ML model inference monitoring
- API latency tracking

---

# 7. Real Use Case 4: Caching (Memoization)

Decorators are widely used for caching expensive computations.

Example

    def cache(func):
        cache_data = {}

        def wrapper(n):
            if n in cache_data:
                return cache_data[n]

            result = func(n)
            cache_data[n] = result
            return result

        return wrapper

    @cache
    def fibonacci(n):
        if n <= 1:
            return n
        return fibonacci(n-1) + fibonacci(n-2)

    print(fibonacci(10))

Real-world usage:

- API result caching
- ML feature computation caching
- Database query caching

Python already provides this via:

    from functools import lru_cache

---

# 8. Real Use Case 5: Input Validation

Decorators help validate function inputs.

Example

    def validate_positive(func):
        def wrapper(num):
            if num < 0:
                raise ValueError("Number must be positive")
            return func(num)
        return wrapper

    @validate_positive
    def square_root(num):
        return num ** 0.5

    print(square_root(16))

---

# 9. Real Use Case 6: Retry Mechanism (Distributed Systems)

Very useful in **microservices and network calls**.

Example

    import time

    def retry(func):
        def wrapper(*args, **kwargs):
            for attempt in range(3):
                try:
                    return func(*args, **kwargs)
                except Exception:
                    print("Retrying...")
                    time.sleep(1)
            print("Failed after retries")
        return wrapper

    @retry
    def unstable_api():
        raise Exception("API failed")

    unstable_api()

Real-world usage:

- API retries
- Database reconnect
- Network fault tolerance

---

# 10. Decorators with Parameters

Decorators themselves can accept arguments.

Example

    def repeat(n):
        def decorator(func):
            def wrapper(*args, **kwargs):
                for i in range(n):
                    func(*args, **kwargs)
            return wrapper
        return decorator

    @repeat(3)
    def greet():
        print("Hello")

    greet()

Output

    Hello
    Hello
    Hello

---

# 11. Multiple Decorators

Multiple decorators can be applied to a function.

Example

    def decorator1(func):
        def wrapper():
            print("Decorator 1")
            func()
        return wrapper

    def decorator2(func):
        def wrapper():
            print("Decorator 2")
            func()
        return wrapper

    @decorator1
    @decorator2
    def say_hi():
        print("Hi")

    say_hi()

Execution order:

    decorator1(decorator2(say_hi))

---

# 12. Built-in Python Decorators

Common built-in decorators include:

- `@staticmethod`
- `@classmethod`
- `@property`
- `@lru_cache`

Example

    from functools import lru_cache

    @lru_cache(maxsize=100)
    def fib(n):
        if n < 2:
            return n
        return fib(n-1) + fib(n-2)

---

# 13. Real Industry Use Cases

Decorators are heavily used in:

### Web Frameworks

Flask

    @app.route("/users")

Django

    @login_required

### Machine Learning

- caching expensive feature calculations
- logging model inference time

### DevOps

- retry network calls
- monitoring execution time

### Microservices

- API authentication
- request logging
- rate limiting

---

# 14. Summary

Decorators allow **clean separation of cross-cutting concerns**.

Common uses include:

- Logging
- Authentication
- Performance monitoring
- Retry mechanisms
- Caching
- Validation

They help implement **Aspect-Oriented Programming (AOP)** style behavior in Python.