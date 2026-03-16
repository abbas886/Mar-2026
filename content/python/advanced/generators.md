# Real-World Use Cases of Python Generators

## 1. What is a Generator?

A **generator** in Python is a function that **returns an iterator and produces values lazily using the `yield` keyword**.

Unlike normal functions that return all values at once, generators **produce values one at a time when requested**.

### Basic Example

    def count_up_to(n):
        i = 1
        while i <= n:
            yield i
            i += 1

    for num in count_up_to(5):
        print(num)

Output

    1
    2
    3
    4
    5

### Why Generators?

Generators are useful when:

- Working with **large datasets**
- Processing **streams of data**
- Avoiding **high memory consumption**
- Implementing **lazy evaluation**

---

# 2. Use Case 1: Reading Large Files (Memory Efficient)

If a file is very large (GBs), loading it entirely into memory is inefficient.

Generators allow **line-by-line processing**.

Example

    def read_large_file(file_path):
        with open(file_path, "r") as file:
            for line in file:
                yield line

    for line in read_large_file("logs.txt"):
        print(line.strip())

Benefits

- Uses **constant memory**
- Suitable for **log processing**
- Works well for **data pipelines**

Real-world usage

- Log processing
- ETL pipelines
- Streaming file processing

---

# 3. Use Case 2: Streaming Data Processing

Generators are useful when processing **continuous data streams**.

Example: Sensor data stream

    import random
    import time

    def sensor_data():
        while True:
            yield random.randint(20, 40)
            time.sleep(1)

    for data in sensor_data():
        print("Temperature:", data)

Real-world usage

- IoT sensor data
- Stock market feeds
- Kafka stream processing
- Real-time analytics

---

# 4. Use Case 3: Data Pipelines (ETL Systems)

Generators help build **efficient data pipelines**.

Example

    def read_data():
        for i in range(10):
            yield i

    def filter_even(numbers):
        for num in numbers:
            if num % 2 == 0:
                yield num

    def square(numbers):
        for num in numbers:
            yield num * num

    data = read_data()
    data = filter_even(data)
    data = square(data)

    for value in data:
        print(value)

Pipeline Flow

    read_data → filter_even → square

Real-world usage

- ETL pipelines
- Data transformation
- ML preprocessing pipelines

---

# 5. Use Case 4: Pagination in APIs

Generators help **paginate large datasets from databases**.

Example

    def fetch_records():
        for i in range(1, 1000000):
            yield {"id": i}

    for record in fetch_records():
        print(record)

Instead of loading **1 million records into memory**, records are fetched one at a time.

Real-world usage

- REST APIs
- Database cursor processing
- Batch processing systems

---

# 6. Use Case 5: Lazy Evaluation for Large Computations

Generators compute values **only when needed**.

Example

    def squares(n):
        for i in range(n):
            yield i * i

    gen = squares(1000000)

    print(next(gen))
    print(next(gen))

Output

    0
    1

Only the required values are calculated.

Real-world usage

- Data science pipelines
- Machine learning preprocessing
- Large mathematical computations

---

# 7. Use Case 6: Infinite Sequences

Generators are perfect for **infinite sequences**.

Example

    def fibonacci():
        a, b = 0, 1
        while True:
            yield a
            a, b = b, a + b

    fib = fibonacci()

    for _ in range(10):
        print(next(fib))

Output

    0
    1
    1
    2
    3
    5
    8
    13
    21
    34

Real-world usage

- Simulation systems
- Event streams
- Continuous data feeds

---

# 8. Use Case 7: Log Processing Systems

Generators are ideal for processing **large log files**.

Example

    def parse_logs(file):
        with open(file) as f:
            for line in f:
                if "ERROR" in line:
                    yield line

    for error in parse_logs("server.log"):
        print(error)

Real-world usage

- DevOps monitoring
- Security log analysis
- Observability systems

---

# 9. Use Case 8: Machine Learning Data Loaders

Generators are used in **ML training pipelines** to load batches of data.

Example

    def data_loader(dataset, batch_size):
        for i in range(0, len(dataset), batch_size):
            yield dataset[i:i+batch_size]

    data = list(range(20))

    for batch in data_loader(data, 5):
        print(batch)

Output

    [0,1,2,3,4]
    [5,6,7,8,9]
    [10,11,12,13,14]
    [15,16,17,18,19]

Real-world usage

- TensorFlow data pipelines
- PyTorch data loaders
- Training large ML models

---

# 10. Use Case 9: Web Scraping Pipelines

Generators help process scraped data incrementally.

Example

    def scrape_pages():
        for page in range(1, 100):
            yield f"Scraping page {page}"

    for result in scrape_pages():
        print(result)

Real-world usage

- Scraping large websites
- Streaming scraped data to databases
- Distributed crawlers

---

# 11. Generator Expressions

Generators can also be written using **generator expressions**.

Example

    squares = (x*x for x in range(10))

    for num in squares:
        print(num)

Difference from list comprehension

    list comprehension → stores in memory
    generator expression → lazy evaluation

Example

    nums = [x*x for x in range(1000000)]  # large memory
    nums = (x*x for x in range(1000000))  # memory efficient

---

# 12. Summary

Generators are extremely useful for:

- Processing **large files**
- **Streaming data**
- Building **ETL pipelines**
- Handling **infinite sequences**
- **API pagination**
- **Log processing**
- **Machine learning data pipelines**

Key advantage

    Lazy evaluation → low memory usage → high performance

Generators are widely used in:

- Data Engineering
- Machine Learning
- Backend Systems
- DevOps Monitoring
- Streaming Architectures