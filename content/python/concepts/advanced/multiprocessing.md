# Multiprocessing in Python with Real-World Use Cases

## 1. What is Multiprocessing?

**Multiprocessing** allows a Python program to **run multiple processes in parallel**, utilizing multiple CPU cores.

Each process has its **own memory space**, unlike threads which share memory.

Multiprocessing is mainly used for **CPU-bound tasks**.

Python provides multiprocessing through the **multiprocessing module**.

Example situations where multiprocessing is useful:

- Image processing
- Machine learning training
- Large data computations
- Parallel simulations
- Video processing

---

# 2. Basic Multiprocessing Example

Example

    from multiprocessing import Process

    def task():
        print("Process running")

    p1 = Process(target=task)
    p2 = Process(target=task)

    p1.start()
    p2.start()

    p1.join()
    p2.join()

    print("Program finished")

Each process runs independently.

---

# 3. Process with Arguments

Example

    from multiprocessing import Process

    def square(n):
        print(n * n)

    processes = []

    for i in range(5):
        p = Process(target=square, args=(i,))
        p.start()
        processes.append(p)

    for p in processes:
        p.join()

---

# 4. Use Case 1: Parallel Data Processing (Big Data / ETL)

Large datasets can be split across multiple processes.

Example

    from multiprocessing import Pool

    def process_data(x):
        return x * x

    data = list(range(10))

    with Pool(4) as p:
        result = p.map(process_data, data)

    print(result)

Real-world usage

- ETL pipelines
- Big data preprocessing
- Data transformation

---

# 5. Use Case 2: Image Processing Pipelines

Image operations are CPU-intensive.

Example

    from multiprocessing import Pool

    def process_image(image):
        print(f"Processing {image}")
        return image

    images = ["img1.jpg", "img2.jpg", "img3.jpg", "img4.jpg"]

    with Pool(4) as p:
        p.map(process_image, images)

Real-world usage

- Image resizing
- Video frame processing
- Computer vision pipelines

---

# 6. Use Case 3: Machine Learning Training

ML training can be parallelized across CPUs.

Example

    from multiprocessing import Pool

    def train_model(data):
        print("Training on dataset:", data)

    datasets = ["data1", "data2", "data3", "data4"]

    with Pool(4) as p:
        p.map(train_model, datasets)

Real-world usage

- Hyperparameter tuning
- Model training on multiple datasets
- Parallel ML experiments

---

# 7. Use Case 4: Parallel Web Crawling

Crawling many websites simultaneously.

Example

    from multiprocessing import Pool
    import time

    def crawl(site):
        print("Crawling", site)
        time.sleep(2)

    sites = ["site1.com", "site2.com", "site3.com", "site4.com"]

    with Pool(4) as p:
        p.map(crawl, sites)

Real-world usage

- Search engine crawlers
- Web data collection
- Market intelligence systems

---

# 8. Use Case 5: Scientific Simulations

Scientific simulations often require heavy computation.

Example

    from multiprocessing import Pool

    def simulation(x):
        return x ** 3

    data = range(1000)

    with Pool(8) as p:
        results = p.map(simulation, data)

Real-world usage

- Weather simulation
- Physics simulations
- Financial modeling

---

# 9. Use Case 6: Video Processing

Video files contain thousands of frames.

Example

    from multiprocessing import Pool

    def process_frame(frame):
        print("Processing frame", frame)

    frames = list(range(100))

    with Pool(8) as p:
        p.map(process_frame, frames)

Real-world usage

- Video encoding
- Frame analysis
- Video compression

---

# 10. Process Communication (Queue)

Processes communicate using **Queues or Pipes**.

Example

    from multiprocessing import Process, Queue

    def producer(q):
        q.put("data")

    def consumer(q):
        print(q.get())

    q = Queue()

    p1 = Process(target=producer, args=(q,))
    p2 = Process(target=consumer, args=(q,))

    p1.start()
    p2.start()

    p1.join()
    p2.join()

---

# 11. Shared Memory (Value and Array)

Example

    from multiprocessing import Process, Value

    def increment(counter):
        counter.value += 1

    counter = Value('i', 0)

    processes = []

    for _ in range(5):
        p = Process(target=increment, args=(counter,))
        p.start()
        processes.append(p)

    for p in processes:
        p.join()

    print(counter.value)

---

# 12. Process Pool (Best Practice)

Process pools manage worker processes efficiently.

Example

    from multiprocessing import Pool

    def cube(x):
        return x**3

    numbers = [1,2,3,4,5]

    with Pool(4) as p:
        result = p.map(cube, numbers)

    print(result)

---

# 13. Multiprocessing vs Multithreading

| Feature | Multiprocessing | Multithreading |
|------|------|------|
Execution | Multiple processes | Multiple threads |
Memory | Separate memory | Shared memory |
CPU usage | Uses multiple CPU cores | Limited by GIL |
Best for | CPU-bound tasks | I/O-bound tasks |
Overhead | Higher | Lower |

---

# 14. Python GIL and Multiprocessing

Python has a **Global Interpreter Lock (GIL)**.

This means:

- Only **one thread executes Python bytecode at a time**

Multiprocessing solves this because:

- Each process has **its own Python interpreter**
- Each process has **its own GIL**

Thus multiprocessing allows **true parallelism**.

---

# 15. Real Industry Use Cases

Multiprocessing is widely used in:

### Data Engineering
- Large dataset processing
- ETL jobs

### Machine Learning
- Hyperparameter tuning
- Parallel training

### Media Systems
- Video processing
- Image pipelines

### Scientific Computing
- Simulations
- Numerical analysis

### Financial Systems
- Risk analysis
- Market simulations

---

# 16. Summary

Multiprocessing allows **true parallel execution across CPU cores**.

Best suited for:

- Heavy computations
- Data processing
- Machine learning
- Scientific simulations

Important tools

- `Process`
- `Pool`
- `Queue`
- `Value`
- `Array`

Rule of thumb

    Use multiprocessing for CPU-bound tasks  
    Use multithreading for I/O-bound tasks
```