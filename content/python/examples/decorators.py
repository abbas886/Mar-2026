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

# decorators with arguments
def repeat(num_times):
    def decorator(func):
        def wrapper(*args, **kwargs):
            for _ in range(num_times):
                func(*args, **kwargs)
        return wrapper
    return decorator
@repeat(3)
def greet(name):
    print(f"Hello, {name}!")
greet("Alice")

# decorators with return values
def uppercase(func):
    def wrapper():
        result = func()
        return result.upper()
    return wrapper
@uppercase
def get_message():
    return "Hello, World!"
print(get_message())

# decorators with arguments and return values
def add_prefix(prefix):
    def decorator(func):
        def wrapper(name):
            return f"{prefix} {func(name)}"
        return wrapper
    return decorator
@add_prefix("Mr.")
def get_name(name):
    return name
print(get_name("Smith"))

# class-based decorators
class Timer:
    def __init__(self, func):
        self.func = func

    def __call__(self, *args, **kwargs):
        import time
        start_time = time.time()
        result = self.func(*args, **kwargs)
        end_time = time.time()
        print(f"Execution time: {end_time - start_time} seconds")
        return result   
@Timer
def compute_square(n):
    return n * n
print(compute_square(10))

# nested decorators
def bold(func):
    def wrapper():
        return f"<b>{func()}</b>"
    return wrapper
def italic(func):
    def wrapper():
        return f"<i>{func()}</i>"
    return wrapper
@bold
@italic
def get_text():
    return "Hello"
print(get_text())

# decorators with class methods
def method_logger(func):
    def wrapper(self, *args, **kwargs):
        print(f"Calling method {func.__name__} with arguments {args} and keyword arguments {kwargs}")
        return func(self, *args, **kwargs)
    return wrapper
class MyClass:
    @method_logger
    def my_method(self, x):
        return x * 2
obj = MyClass()
print(obj.my_method(5))

# decorators with static methods
def static_logger(func):
    def wrapper(*args, **kwargs):
        print(f"Calling static method {func.__name__} with arguments {args} and keyword arguments {kwargs}")
        return func(*args, **kwargs)
    return wrapper
class MyStaticClass:
    @staticmethod
    @static_logger
    def my_static_method(x):
        return x * 2
print(MyStaticClass.my_static_method(5))

# decorators with class methods and static methods
def combined_logger(func):
    def wrapper(*args, **kwargs):
        print(f"Calling method {func.__name__} with arguments {args} and keyword arguments {kwargs}")
        return func(*args, **kwargs)
    return wrapper
class MyCombinedClass:
    @combined_logger
    def my_method(self, x):
        return x * 2
    @staticmethod
    @combined_logger
    def my_static_method(x):
        return x * 2    
obj = MyCombinedClass()
print(obj.my_method(5))
print(MyCombinedClass.my_static_method(5))



