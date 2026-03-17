# Async Programming in Python with Real-Time Examples

## 1. What is Asynchronous Programming?

**Asynchronous programming** allows a program to **run tasks concurrently without blocking the execution of other tasks**.

Instead of waiting for a task to complete (like network calls or I/O), the program **continues executing other tasks**.

Python provides async programming using:

- `async`
- `await`
- `asyncio`

Async programming is best suited for **I/O-bound operations** such as:

- API calls
- database queries
- file operations
- web scraping
- microservice communication

---

# 2. Basic Async Example

Example

```python
import asyncio

async def hello():
    print("Hello")
    await asyncio.sleep(2)
    print("World")

asyncio.run(hello())
```

Output

```
Hello
World
```

Explanation

- `async` → defines asynchronous function
- `await` → pauses execution until the task completes

---

# 3. Running Multiple Async Tasks

Example

```python
import asyncio

async def task(name):
    print(f"Task {name} started")
    await asyncio.sleep(2)
    print(f"Task {name} completed")

async def main():
    await asyncio.gather(
        task("A"),
        task("B"),
        task("C")
    )

asyncio.run(main())
```

Output (parallel execution)

```
Task A started
Task B started
Task C started
Task A completed
Task B completed
Task C completed
```

---

# 4. Async vs Blocking Execution

Blocking example

```python
import time

def task():
    time.sleep(2)

for i in range(3):
    task()
```

Total time = **6 seconds**

Async example

```python
import asyncio

async def task():
    await asyncio.sleep(2)

async def main():
    await asyncio.gather(task(), task(), task())

asyncio.run(main())
```

Total time ≈ **2 seconds**

---

# 5. Real Use Case 1: Parallel API Calls (Microservices)

Modern systems often call **multiple services simultaneously**.

Example

```python
import asyncio

async def call_api(service):
    print(f"Calling {service}")
    await asyncio.sleep(2)
    print(f"Response from {service}")

async def main():
    await asyncio.gather(
        call_api("UserService"),
        call_api("PaymentService"),
        call_api("OrderService")
    )

asyncio.run(main())
```

Real-world usage

- API Gateway
- Microservice orchestration
- Service aggregators

---

# 6. Real Use Case 2: Async Web Scraping

Example

```python
import asyncio

async def scrape(site):
    print(f"Scraping {site}")
    await asyncio.sleep(2)
    print(f"Completed {site}")

async def main():
    sites = ["site1.com", "site2.com", "site3.com"]

    tasks = [scrape(site) for site in sites]

    await asyncio.gather(*tasks)

asyncio.run(main())
```

Real-world usage

- Market research
- SEO crawlers
- Data collection systems

---

# 7. Real Use Case 3: High-Concurrency Web Servers

Async frameworks like:

- FastAPI
- Sanic
- aiohttp

handle thousands of concurrent requests.

Example concept

```python
async def handle_request():
    await asyncio.sleep(1)
    return "response"
```

Real-world usage

- REST APIs
- streaming APIs
- chat systems

---

# 8. Real Use Case 4: Async Database Operations

Async database drivers improve performance.

Example concept

```python
async def fetch_users():
    await db.execute("SELECT * FROM users")
```

Real-world usage

- high traffic APIs
- SaaS platforms
- real-time dashboards

Common async DB libraries

- asyncpg
- aiomysql
- motor (MongoDB)

---

# 9. Real Use Case 5: Real-Time Chat Systems

Async programming powers **chat systems and websockets**.

Example concept

```python
async def handle_chat(user):
    while True:
        message = await receive_message(user)
        await broadcast(message)
```

Real-world usage

- chat apps
- collaborative tools
- multiplayer games

---

# 10. Real Use Case 6: Streaming Data Processing

Async is used for **streaming pipelines**.

Example

```python
import asyncio

async def producer(queue):
    for i in range(5):
        await queue.put(i)

async def consumer(queue):
    while True:
        item = await queue.get()
        print("Consumed", item)
        queue.task_done()

async def main():
    queue = asyncio.Queue()

    await asyncio.gather(
        producer(queue),
        consumer(queue)
    )

asyncio.run(main())
```

Real-world usage

- Kafka consumers
- streaming analytics
- event-driven systems

---

# 11. Real Use Case 7: Async File Operations

Example concept

```python
import asyncio

async def read_file():
    await asyncio.sleep(1)
    print("File processed")

asyncio.run(read_file())
```

Real-world usage

- log processing
- ETL pipelines
- cloud storage systems

---

# 12. Async Task Scheduling

Async tasks can run periodically.

Example

```python
import asyncio

async def job():
    while True:
        print("Running scheduled job")
        await asyncio.sleep(5)

asyncio.run(job())
```

Real-world usage

- monitoring agents
- background workers
- periodic data sync

---

# 13. Async vs Multithreading vs Multiprocessing

| Feature | Async | Multithreading | Multiprocessing |
|------|------|------|------|
Best For | I/O tasks | I/O tasks | CPU tasks |
Concurrency | Yes | Yes | Yes |
Parallel CPU | No | Limited (GIL) | Yes |
Memory | Shared | Shared | Separate |

---

# 14. When to Use Async Programming

Use async when tasks involve:

- network requests
- database calls
- web scraping
- messaging systems
- streaming data

Avoid async for:

- heavy computations
- CPU-bound tasks
- ML training

---

# 15. Real Industry Applications

Async programming is widely used in:

### Web APIs
FastAPI, aiohttp

### Streaming Systems
Kafka consumers

### Cloud Platforms
async microservices

### FinTech Systems
real-time trading feeds

### AI Systems
async model inference APIs

---

# 16. Summary

Async programming enables **high-concurrency systems**.

Key benefits

- non-blocking execution
- efficient I/O handling
- scalable web services
- high throughput systems

Important Python tools

- `async`
- `await`
- `asyncio`
- `asyncio.gather()`
- `asyncio.Queue()`

Rule of thumb

Use **async for high-concurrency I/O systems**.