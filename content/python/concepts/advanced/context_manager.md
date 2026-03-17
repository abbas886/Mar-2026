# Advanced Real / Complex Use Cases of Python Context Managers

## 1. What is a Context Manager?

A **Context Manager** is a Python construct that **manages resources automatically** using the `with` statement.

It ensures that **setup and cleanup logic is executed properly**, even if exceptions occur.

Basic syntax:

    with resource_manager() as resource:
        # use resource

Typical example:

    with open("file.txt") as f:
        data = f.read()

Here:

- `__enter__()` → executed when entering the block  
- `__exit__()` → executed when leaving the block

Context managers are heavily used in **enterprise systems, distributed systems, ML pipelines, and DevOps automation**.

---

# 2. Custom Context Manager (Basic Structure)

Context managers are implemented using:

- `__enter__`
- `__exit__`

Example

    class DatabaseConnection:

        def __enter__(self):
            print("Opening database connection")
            return self

        def __exit__(self, exc_type, exc_val, exc_tb):
            print("Closing database connection")

    with DatabaseConnection() as db:
        print("Executing queries")

Output

    Opening database connection
    Executing queries
    Closing database connection

---

# 3. Use Case 1: Database Transaction Management

Context managers are ideal for **automatic commit/rollback handling**.

Example

    class Transaction:

        def __init__(self, connection):
            self.connection = connection

        def __enter__(self):
            self.cursor = self.connection.cursor()
            return self.cursor

        def __exit__(self, exc_type, exc_val, exc_tb):
            if exc_type:
                self.connection.rollback()
                print("Transaction rolled back")
            else:
                self.connection.commit()
                print("Transaction committed")

Usage

    with Transaction(connection) as cursor:
        cursor.execute("INSERT INTO users VALUES (1,'Alice')")

Real-world usage

- Banking systems
- Payment systems
- Financial transaction processing

---

# 4. Use Case 2: Distributed Locking (Concurrency Control)

Context managers can control **distributed locks**.

Example

    import threading

    lock = threading.Lock()

    class LockManager:

        def __enter__(self):
            lock.acquire()
            print("Lock acquired")

        def __exit__(self, exc_type, exc_val, exc_tb):
            lock.release()
            print("Lock released")

Usage

    with LockManager():
        print("Critical section")

Real-world usage

- Microservices concurrency
- Prevent race conditions
- Job schedulers

---

# 5. Use Case 3: Performance Monitoring

Used for measuring execution time of critical code.

Example

    import time

    class Timer:

        def __enter__(self):
            self.start = time.time()

        def __exit__(self, exc_type, exc_val, exc_tb):
            end = time.time()
            print("Execution time:", end - self.start)

Usage

    with Timer():
        for i in range(1000000):
            pass

Real-world usage

- Performance profiling
- ML model inference timing
- API latency measurement

---

# 6. Use Case 4: Temporary Configuration Changes

Context managers help temporarily change application configuration.

Example

    class TempConfig:

        def __init__(self, config, key, value):
            self.config = config
            self.key = key
            self.value = value

        def __enter__(self):
            self.old_value = self.config[self.key]
            self.config[self.key] = self.value

        def __exit__(self, exc_type, exc_val, exc_tb):
            self.config[self.key] = self.old_value

Usage

    config = {"debug": False}

    with TempConfig(config, "debug", True):
        print(config)

    print(config)

Output

    {'debug': True}
    {'debug': False}

Real-world usage

- Feature toggles
- Testing environments
- Temporary runtime settings

---

# 7. Use Case 5: API Rate Limiting

Context managers can control **API call limits**.

Example

    import time

    class RateLimiter:

        def __enter__(self):
            self.start = time.time()

        def __exit__(self, exc_type, exc_val, exc_tb):
            elapsed = time.time() - self.start
            if elapsed < 1:
                time.sleep(1 - elapsed)

Usage

    for i in range(5):
        with RateLimiter():
            print("Calling API")

Real-world usage

- External API integrations
- SaaS platforms
- Web scraping systems

---

# 8. Use Case 6: Resource Pool Management

Context managers help manage **resource pools**.

Example

    class ConnectionPool:

        def __init__(self, pool):
            self.pool = pool

        def __enter__(self):
            self.conn = self.pool.pop()
            return self.conn

        def __exit__(self, exc_type, exc_val, exc_tb):
            self.pool.append(self.conn)

Usage

    pool = ["conn1", "conn2", "conn3"]

    with ConnectionPool(pool) as conn:
        print("Using", conn)

Real-world usage

- Database connection pools
- Thread pools
- HTTP connection pools

---

# 9. Use Case 7: ML Training Resource Management

ML pipelines often allocate **GPU resources**.

Example

    class GPUContext:

        def __enter__(self):
            print("Allocating GPU")

        def __exit__(self, exc_type, exc_val, exc_tb):
            print("Releasing GPU")

Usage

    with GPUContext():
        print("Training ML model")

Real-world usage

- TensorFlow / PyTorch training
- GPU scheduling
- Model training pipelines

---

# 10. Use Case 8: File Locking for Distributed Systems

Example

    import fcntl

    class FileLock:

        def __init__(self, file):
            self.file = open(file, "w")

        def __enter__(self):
            fcntl.flock(self.file, fcntl.LOCK_EX)

        def __exit__(self, exc_type, exc_val, exc_tb):
            fcntl.flock(self.file, fcntl.LOCK_UN)
            self.file.close()

Usage

    with FileLock("lockfile"):
        print("Critical operation")

Real-world usage

- Prevent duplicate cron jobs
- Distributed batch processing
- Deployment pipelines

---

# 11. Context Managers Using contextlib

Python provides an easier way using `contextlib`.

Example

    from contextlib import contextmanager

    @contextmanager
    def timer():
        import time
        start = time.time()
        yield
        end = time.time()
        print("Execution time:", end - start)

Usage

    with timer():
        sum(range(1000000))

---

# 12. Nested Context Managers

Multiple context managers can be used together.

Example

    with open("input.txt") as infile, open("output.txt", "w") as outfile:
        data = infile.read()
        outfile.write(data)

Real-world usage

- Multiple resource handling
- Multi-service transactions

---

# 13. Summary

Context managers solve **resource lifecycle problems**.

Key benefits

- Automatic cleanup
- Exception-safe resource handling
- Cleaner code
- Better resource control

Advanced enterprise use cases

- Database transactions
- Distributed locking
- Performance monitoring
- API rate limiting
- Resource pooling
- ML training pipelines
- File locking
- Configuration management

Context managers are widely used in:

- **Backend systems**
- **DevOps automation**
- **Machine learning pipelines**
- **Microservices architectures**
```