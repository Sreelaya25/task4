
CREATE DATABASE ecommerce;
use ecommerce;
CREATE TABLE customers (customer_id INT PRIMARY KEY, customer_name VARCHAR(100), email VARCHAR(100), country VARCHAR(50));
CREATE TABLE orders (order_id INT PRIMARY KEY, customer_id INT, order_date DATE, order_total DECIMAL(10, 2), FOREIGN KEY (customer_id) REFERENCES customers(customer_id));
INSERT INTO customers VALUES
(1, 'Anjali', 'anjali@example.com', 'India'),
(2, 'Rahul', 'rahul@example.com', 'India'),
(3, 'Emily', 'emily@example.com', 'USA'),
(4, 'John', 'john@example.com', 'Canada');
INSERT INTO orders VALUES
(101, 1, '2024-05-01', 1500.00),
(102, 2, '2024-05-03', 900.00),
(103, 1, '2024-05-05', 600.00),
(104, 3, '2024-05-10', 1200.00),
(105, 4, '2024-05-12', 800.00);
SELECT * FROM customers
WHERE country = 'India'
ORDER BY customer_name;
SELECT country, COUNT(*) AS total_customers
FROM customers
GROUP BY country;
SELECT orders.order_id, customers.customer_name, orders.order_total
FROM orders
INNER JOIN customers ON orders.customer_id = customers.customer_id;
SELECT c.customer_name, o.order_total
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;
SELECT customer_name FROM customers
WHERE customer_id IN (
    SELECT customer_id FROM orders
    WHERE order_total > 1000
);
SELECT AVG(order_total) AS average_order_total FROM orders;
CREATE VIEW customer_orders_summary AS
SELECT c.customer_name, o.order_total
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;
SELECT * FROM customer_orders_summary;
CREATE INDEX idx_customer_id ON orders(customer_id);
select * from customers






