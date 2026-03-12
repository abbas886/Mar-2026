# Using @dataclass is the modern Python approach for creating data models.
It automatically generates methods like:

__init__

__repr__

__eq__
# from dataclasses import dataclass
from typing import Dict, List, Optional
Why @dataclass is Preferred in Modern Systems

Benefits:

Less boilerplate code

Cleaner models

Better readability

Works well with:

FastAPI

Pydantic

AI/ML pipelines

Microservices

## Repository Pattern in Python (similar to Spring Boot JPA Repository)
app/
 ├── models/
 │      employee.py
 ├── repositories/
 │      employee_repository.py
 ├── services/
 │      employee_service.py
 ├── api/
 │      employee_controller.py
 └── main.py
## Advanced Improvement (Senior Architect Level)

Repository can become pluggable:
 EmployeeRepository (Interface)
      ↑
InMemoryEmployeeRepository
      ↑
DatabaseEmployeeRepository
      ↑
RedisEmployeeRepository
Interesting point for AI/ML systems

The same pattern is used in RAG pipelines:
EmbeddingRepository
VectorStoreRepository
DocumentRepository