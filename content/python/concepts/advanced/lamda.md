# Python Lambda Functions with Real / Complex Use Cases

## 1. What is a Lambda Function?

A **lambda function** is a **small anonymous function** defined using the `lambda` keyword.

It can have **multiple inputs but only one expression**.

Syntax

    lambda arguments : expression

Example

    add = lambda a, b: a + b
    print(add(3, 5))

Output

    8

Equivalent normal function

    def add(a, b):
        return a + b

---

# 2. When to Use Lambda Functions

Lambda functions are useful when:

- A function is **small and used only once**
- Used inside **functional programming operations**
- Used with **map(), filter(), reduce()**
- Used in **sorting operations**
- Used in **data processing pipelines**

---

# 3. Use Case 1: Sorting Complex Data Structures

Sorting objects or dictionaries using a custom key.

Example

    employees = [
        {"name": "Alice", "salary": 60000},
        {"name": "Bob", "salary": 45000},
        {"name": "Charlie", "salary": 75000}
    ]

    employees_sorted = sorted(employees, key=lambda x: x["salary"])

    print(employees_sorted)

Output

    [
      {'name': 'Bob', 'salary': 45000},
      {'name': 'Alice', 'salary': 60000},
      {'name': 'Charlie', 'salary': 75000}
    ]

Real-world usage

- Sorting database results
- Sorting API responses
- Sorting complex objects

---

# 4. Use Case 2: Data Transformation Using map()

`map()` applies a function to each element of a collection.

Example

    numbers = [1, 2, 3, 4, 5]

    squares = list(map(lambda x: x*x, numbers))

    print(squares)

Output

    [1, 4, 9, 16, 25]

Real-world usage

- Data preprocessing
- Feature transformation in ML
- ETL pipelines

---

# 5. Use Case 3: Filtering Data Using filter()

`filter()` selects elements based on a condition.

Example

    numbers = [10, 15, 20, 25, 30]

    even_numbers = list(filter(lambda x: x % 2 == 0, numbers))

    print(even_numbers)

Output

    [10, 20, 30]

Real-world usage

- Filtering records
- Data cleaning
- Filtering logs

---

# 6. Use Case 4: Aggregations Using reduce()

`reduce()` applies cumulative operations.

Example

    from functools import reduce

    numbers = [1, 2, 3, 4]

    product = reduce(lambda x, y: x * y, numbers)

    print(product)

Output

    24

Real-world usage

- Aggregating values
- Financial calculations
- Distributed computing

---

# 7. Use Case 5: Sorting Multiple Fields

Example

    students = [
        ("Alice", 90),
        ("Bob", 85),
        ("Charlie", 90),
        ("David", 85)
    ]

    sorted_students = sorted(students, key=lambda x: (x[1], x[0]))

    print(sorted_students)

Real-world usage

- Multi-column sorting
- Database result ordering
- Ranking systems

---

# 8. Use Case 6: Event Processing Systems

Lambda functions are useful for **event handlers**.

Example

    events = [
        {"type": "login", "user": "Alice"},
        {"type": "logout", "user": "Bob"},
        {"type": "login", "user": "Charlie"}
    ]

    logins = list(filter(lambda e: e["type"] == "login", events))

    print(logins)

Real-world usage

- Log analytics
- Event-driven systems
- Streaming pipelines

---

# 9. Use Case 7: Web Development (Frameworks)

Frameworks often use lambda functions for **small handlers**.

Example (Flask-style concept)

    routes = {
        "/health": lambda: "OK",
        "/version": lambda: "1.0.0"
    }

    print(routes["/health"]())

Real-world usage

- API routing
- Quick handlers
- Lightweight endpoints

---

# 10. Use Case 8: Data Science / Machine Learning

Lambda functions are frequently used in **pandas transformations**.

Example

    import pandas as pd

    df = pd.DataFrame({
        "salary": [40000, 60000, 80000]
    })

    df["tax"] = df["salary"].apply(lambda x: x * 0.2)

    print(df)

Real-world usage

- Feature engineering
- Data transformations
- Data cleaning

---

# 11. Use Case 9: Priority Queues

Lambda functions are useful for defining priority rules.

Example

    tasks = [
        {"task": "deploy", "priority": 2},
        {"task": "fix bug", "priority": 1},
        {"task": "write docs", "priority": 3}
    ]

    tasks_sorted = sorted(tasks, key=lambda t: t["priority"])

    print(tasks_sorted)

Real-world usage

- Task schedulers
- Job queues
- Workflow engines

---

# 12. Use Case 10: Functional Pipelines

Lambda functions help build **compact data pipelines**.

Example

    data = [1, 2, 3, 4, 5]

    result = list(
        map(
            lambda x: x * 10,
            filter(lambda x: x % 2 == 0, data)
        )
    )

    print(result)

Pipeline

    filter → map → result

Output

    [20, 40]

Real-world usage

- Streaming data pipelines
- ETL transformations
- Data engineering workflows

---

# 13. Limitations of Lambda Functions

Lambda functions should **not be used for complex logic**.

Limitations

- Only **one expression**
- Cannot contain **multiple statements**
- Cannot contain **assignments**
- Harder to debug if overused

Example (bad practice)

    lambda x: (x+1 if x > 10 else x-1 if x < 5 else x*2)

Better to use normal functions for complex logic.

---

# 14. Lambda vs Normal Functions

| Feature | Lambda Function | Normal Function |
|------|------|------|
Name | Anonymous | Named |
Complex Logic | Not suitable | Suitable |
Multiple Statements | Not allowed | Allowed |
Return Statement | Implicit | Explicit |
Usage | Small functions | Large reusable functions |

---

# 15. Summary

Lambda functions are useful for:

- Sorting complex data
- Data transformations
- Filtering records
- Aggregations
- Functional pipelines
- Event processing
- Data science transformations

Common usage areas

- Data engineering
- Machine learning
- Backend systems
- Streaming pipelines
- ETL processing

Rule of thumb

    Use lambda for small one-line operations
    Use normal functions for complex logic
```