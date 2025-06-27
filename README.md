#  SQL Task 4: Sales Data Analysis using PostgreSQL

This project showcases a simple sales dataset and how to analyze it using **SQL aggregate functions**, `GROUP BY`, and `HAVING` clauses. It includes table creation, data insertion, and analytical queries—all executed using **pgAdmin (PostgreSQL)**.

---

##  Tools Used

- **PostgreSQL** – Relational Database System  
- **pgAdmin 4** – SQL GUI Client  
- **SQL** – Structured Query Language

---

##  Table Structure

```sql
CREATE TABLE sales(
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    quantity INT,
    price NUMERIC(10,2),
    sale_date DATE 
);
```

---

##  Sample Data

```sql
INSERT INTO sales (product_name, category, quantity, price, sale_date)
VALUES
('Laptop', 'Electronics', 3, 45000.00, '2024-06-10'),
('Mobile', 'Electronics', 5, 15000.00, '2024-06-11'),
('T-shirt', 'Clothing', 10, 500.00, '2024-06-12'),
('Jeans', 'Clothing', 4, 1200.00, '2024-06-13'),
('Refrigerator', 'Electronics', 1, 30000.00, '2024-06-14'),
('Shoes', 'Footwear', 6, 1000.00, '2024-06-15'),
('Socks', 'Footwear', 12, 100.00, '2024-06-16'),
('T-shirt', 'Clothing', 8, 500.00, '2024-06-17'),
('Mobile', 'Electronics', 2, 14000.00, '2024-06-18'),
('Shoes', 'Footwear', 3, 1100.00, '2024-06-19');
```

---

##  Data Analysis Queries

###  View All Data

```sql
SELECT * FROM sales;
```

###  Count Unique Categories

```sql
SELECT COUNT(DISTINCT(category)) AS unique_categories FROM sales;
```

###  Quantity and Sales per Category

```sql
SELECT category, SUM(quantity) AS total_quantity, SUM(quantity * price) AS total_sales 
FROM sales
GROUP BY category;
```

###  Max & Min Sales Among Categories

```sql
-- Max
SELECT MAX(total_sales) AS max_sale
FROM (
    SELECT category, SUM(quantity * price) AS total_sales FROM sales GROUP BY category
) AS sub;

-- Min
SELECT MIN(total_sales) AS min_sale
FROM (
    SELECT category, SUM(quantity * price) AS total_sales FROM sales GROUP BY category
) AS sub;
```

###  Average Price per Category

```sql
SELECT category, AVG(price) AS avg_price FROM sales GROUP BY category;
```

###  Total Sales per Date

```sql
SELECT sale_date, SUM(quantity * price) AS total_sales
FROM sales
GROUP BY sale_date
ORDER BY total_sales DESC;
```

###  Top 3 Sale Dates

```sql
SELECT sale_date, SUM(quantity * price) AS total_sales
FROM sales
GROUP BY sale_date
ORDER BY total_sales DESC
LIMIT 3;
```

---

## 🔍 HAVING Clause (Group Filters)

### Show Categories with Sales > ₹30,000

```sql
SELECT category, SUM(quantity * price) AS total_sales
FROM sales
GROUP BY category
HAVING SUM(quantity * price) > 30000;
```

### Show Categories with Sales > ₹11,000

```sql
SELECT category, SUM(quantity * price) AS total_sales
FROM sales
GROUP BY category
HAVING SUM(quantity * price) > 11000;
```

---

##  Concepts Covered

- `GROUP BY` for grouping records  
- Aggregate functions: `SUM()`, `AVG()`, `COUNT()`, `MAX()`, `MIN()`  
- `HAVING` for filtering aggregated results  
- Subqueries in aggregation

---

##  Status

Project successfully tested and executed in **pgAdmin 4** using **PostgreSQL**.

---

##  Author

**Rushikesh Yadav**  
Data Analyst | SQL Enthusiast
