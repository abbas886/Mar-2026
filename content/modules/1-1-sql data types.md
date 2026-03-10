# SQL Numeric Data Types  

This document explains commonly used SQL numeric data types along with theory and examples.

---

# 1️⃣ INT (Integer)

## 📘 Description
- Stores whole numbers (no decimal values)
- Most commonly used numeric type
- Typically 4 bytes (implementation may vary by DB)

## 📌 Range (Typical)
- -2,147,483,648 to 2,147,483,647

## 🛠 Example

```sql
CREATE TABLE students (
    student_id INT
);
```

---

# 2️⃣ SMALLINT

## 📘 Description
- Stores smaller range of whole numbers
- Uses less storage than INT
- Typically 2 bytes

## 📌 Range (Typical)
- -32,768 to 32,767

## 🛠 Example

```sql
CREATE TABLE ratings (
    rating SMALLINT
);
```

---

# 3️⃣ BIGINT

## 📘 Description
- Stores very large whole numbers
- Used when INT range is not sufficient
- Typically 8 bytes

## 📌 Range (Typical)
- -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807

## 🛠 Example

```sql
CREATE TABLE transactions (
    transaction_id BIGINT
);
```

---

# 4️⃣ DECIMAL(p,s)

## 📘 Description
- Fixed-point numeric data type
- Used for exact precision (financial calculations)
- p = precision (total digits)
- s = scale (digits after decimal)

## 📌 Example Meaning
DECIMAL(10,2)
- Total digits = 10
- Decimal digits = 2
- Example value: 12345678.90

## 🛠 Example

```sql
CREATE TABLE salary_details (
    salary DECIMAL(10,2)
);
```

---

# 5️⃣ NUMERIC(p,s)

## 📘 Description
- Same as DECIMAL in most databases
- Stores exact numeric values
- Used in accounting and banking systems

## 🛠 Example

```sql
CREATE TABLE payments (
    amount NUMERIC(12,2)
);
```
Note : Both **NUMERIC** and **DECIMAL** are used for storing **exact numeric values with precision**.

According to SQL standard, NUMERIC guarantees exact precision while DECIMAL may allow implementation variation. In practice, most databases treat them the same.

---

# 6️⃣ FLOAT

## 📘 Description
- Stores approximate decimal numbers
- Used for scientific calculations
- May have rounding errors
- Precision depends on system

## ⚠ Important
Do NOT use FLOAT for money calculations.

## 🛠 Example

```sql
CREATE TABLE measurements (
    temperature FLOAT
);
```

---

# 7️⃣ DOUBLE (Double Precision)

## 📘 Description
- Higher precision floating-point type
- More accurate than FLOAT
- Still approximate (not exact)

## 🛠 Example

```sql
CREATE TABLE scientific_data (
    value DOUBLE
);
```

---

# 📊 Comparison Table

| Data Type  | Stores                 | Exact/Approx | Storage  | Best For |
|------------|------------------------|--------------|----------|----------|
| SMALLINT   | Small whole numbers    | Exact        | 2 bytes  | Small counters |
| INT        | Whole numbers          | Exact        | 4 bytes  | IDs, counts |
| BIGINT     | Large whole numbers    | Exact        | 8 bytes  | Large IDs |
| DECIMAL    | Fixed decimals         | Exact        | Variable | Money |
| NUMERIC    | Fixed decimals         | Exact        | Variable | Financial data |
| FLOAT      | Decimal numbers        | Approximate  | 4/8 bytes| Scientific |
| DOUBLE     | High precision decimals| Approximate  | 8 bytes  | Engineering |

---

# 🎯 When to Use What?

- Use SMALLINT → Small numeric values
- Use INT → Most common integer data
- Use BIGINT → Large numeric IDs
- Use DECIMAL/NUMERIC → Financial & exact precision
- Use FLOAT/DOUBLE → Scientific calculations

---

# 🔥 Key Interview Points

- DECIMAL and NUMERIC are exact types
- FLOAT and DOUBLE are approximate
- BIGINT uses more storage than INT
- Use DECIMAL for money, not FLOAT
- Precision (p) = total digits
- Scale (s) = digits after decimal

---

# 🚀 Conclusion

Choosing the correct numeric data type is important for:

- Data accuracy
- Storage optimization
- Performance
- Preventing overflow
- Avoiding rounding errors

Always select the smallest suitable data type that satisfies business requirements.

---

**End of Document**