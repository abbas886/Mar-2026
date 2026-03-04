# Introduction to Databases  
# Introduction to SQL & NoSQL  
# Advantages and Disadvantages  

---

# 1️⃣ Introduction to Databases

A **database** is an organized collection of data that can be easily accessed, managed, and updated.

It allows:
- Efficient storage
- Fast retrieval
- Data consistency
- Security and access control
- Backup and recovery

---

## Why Do We Need Databases?

Without databases:
- Data redundancy increases
- Data inconsistency occurs
- Difficult to manage large data
- No centralized control

With databases:
- Structured storage
- Concurrent access
- Integrity constraints
- Scalability

---

## Types of Databases

### 1. Relational Databases (RDBMS)
- Data stored in tables
- Uses rows and columns
- Relationships using foreign keys
- Structured schema

Examples:
- MySQL
- PostgreSQL
- Oracle
- SQL Server

---

### 2. Non-Relational Databases (NoSQL)
- Flexible schema
- Designed for scalability
- Handles unstructured/semi-structured data

Types:
- Document databases
- Key-value stores
- Column-family databases
- Graph databases

Examples:
- MongoDB
- Cassandra
- Redis
- Neo4j

---

# 2️⃣ Introduction to SQL

SQL (Structured Query Language) is used to manage relational databases.

It supports:
- Data definition
- Data manipulation
- Data control
- Transaction management

---

## SQL Categories

### 1. DDL (Data Definition Language)
- CREATE
- ALTER
- DROP
- TRUNCATE

### 2. DML (Data Manipulation Language)
- INSERT
- UPDATE
- DELETE
- SELECT

### 3. DCL (Data Control Language)
- GRANT
- REVOKE

### 4. TCL (Transaction Control Language)
- COMMIT
- ROLLBACK
- SAVEPOINT

---

## Key Characteristics of SQL Databases

- Structured schema
- ACID properties
- Strong consistency
- Vertical scaling
- Joins supported

---

# 3️⃣ Introduction to NoSQL

NoSQL stands for "Not Only SQL".

It is designed for:
- Big Data
- Distributed systems
- High scalability
- Flexible schema

---

## Types of NoSQL Databases

### 1. Document Database
Stores JSON-like documents.

Example:
{
  "id": 1,
  "name": "Abbas",
  "skills": ["Java", "SQL"]
}

Use Case:
- Content management systems
- User profiles

---

### 2. Key-Value Store
Stores data as key-value pairs.

Example:
session_id → user_data

Use Case:
- Caching
- Session management

---

### 3. Column-Family Database
Stores data by columns instead of rows.

Use Case:
- Analytics
- Large-scale distributed systems

---

### 4. Graph Database
Stores relationships between entities.

Use Case:
- Social networks
- Recommendation engines
- Fraud detection

---

# 4️⃣ SQL vs NoSQL Comparison

| Feature | SQL | NoSQL |
|----------|------|--------|
| Schema | Fixed | Flexible |
| Scaling | Vertical | Horizontal |
| Transactions | Strong (ACID) | Eventual (BASE) |
| Data Type | Structured | Structured + Unstructured |
| Joins | Supported | Limited / Not native |
| Best For | OLTP systems | Big data & distributed systems |

---

# 5️⃣ Advantages and Disadvantages

---

## SQL Databases

### Advantages
- Strong data integrity
- ACID compliance
- Complex queries supported
- Mature ecosystem
- Strong relationships via joins

### Disadvantages
- Hard to scale horizontally
- Schema changes are complex
- Not ideal for unstructured data
- Performance issues at massive scale

---

## NoSQL Databases

### Advantages
- Horizontal scalability
- Flexible schema
- High performance for large datasets
- Good for distributed systems
- Handles unstructured data

### Disadvantages
- Limited ACID support (varies by DB)
- Complex joins not supported
- Data duplication common
- Consistency challenges

---

# 6️⃣ When to Use What?

## Use SQL When:
- Data is structured
- Relationships are important
- ACID transactions required
- Financial systems
- ERP/Banking systems

## Use NoSQL When:
- Massive data volume
- Real-time analytics
- Flexible schema required
- Distributed architecture
- High scalability needed

---

# 7️⃣ Real-World Examples

| System Type | Recommended DB |
|-------------|----------------|
| Banking System | SQL |
| E-commerce Orders | SQL |
| Social Media Feed | NoSQL |
| Caching Layer | NoSQL (Redis) |
| Analytics Platform | NoSQL (Cassandra) |
| Recommendation Engine | Graph DB |

---

# 8️⃣ ACID vs BASE

## ACID (SQL)
- Atomicity
- Consistency
- Isolation
- Durability

## BASE (NoSQL)
- Basically Available
- Soft state
- Eventual consistency

---

# 9️⃣ Final Summary

Databases are essential for modern applications.

SQL:
- Structured
- Strong consistency
- Relationship-driven systems

NoSQL:
- Scalable
- Flexible
- High-performance distributed systems

Choosing between SQL and NoSQL depends on:
- Data structure
- Scale requirements
- Consistency needs
- Application architecture

A modern architecture often uses:
- SQL for core transactions
- NoSQL for caching, analytics, and scalability

---

**End of Document**