# decorator logger
def logger(func):
    def wrapper():
        print("Function execution started")
        func()
        print("Function execution finished")
    return wrapper

@logger
def function():
    print("hello")

function();

    