-- Task - 4 

-- Table 

CREATE TABLE sales(
	id SERIAL PRIMARY KEY,
	product_name VARCHAR(50),
	category VARCHAR(30),
	quantity  INT,
	price NUMERIC(10,2),
	sale_date DATE 
);


-- INSERT DATA

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

-- check
SELECT * FROM sales;

-- Analysing data 

-- count all unique category
SELECT COUNT(DISTINCT(category)) AS unique_categories FROM sales;

-- counting products category wise
SELECT category, SUM(quantity) AS category_count FROM sales GROUP BY category;

-- Quantity and sales per category
SELECT category, SUM(quantity) AS total_quantity, SUM(quantity * price) AS total_sales 
FROM sales
GROUP BY category;

-- max sales among all 
SELECT MAX(total_sales) AS max_sale
FROM (
	SELECT category, SUM(quantity * price) AS total_sales FROM sales group by category
);

-- min sales among all 
SELECT MIN(total_sales) AS min_sale FROM
(
	SELECT category, sum(quantity * price) AS total_sales FROM sales GROUP BY category
);


-- average price categoru wise
SELECT category, avg(price) AS  avg_price FROM sales GROUP BY category;

-- cheking sales on date basis
SELECT sale_date, sum(quantity * price ) as total_sales
FROM sales 
GROUP BY sale_date
ORDER BY total_sales DESC;

SELECT sale_date, sum(quantity * price ) as total_sales
FROM sales 
GROUP BY sale_date
ORDER BY total_sales DESC
LIMIT 3;


-- fiter - having 

SELECT category, SUM(quantity * price ) AS  total_sales
FROM sales
GROUP BY category
HAVING SUM(quantity * price ) > 30000;


SELECT category, sum(quantity * price) AS total_sales
FROM sales 
GROUP BY  category
HAVING SUM(quantity * price ) > 11000;

