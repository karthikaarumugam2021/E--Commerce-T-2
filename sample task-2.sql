CREATE DATABASE ecommerce;

USE ecommerce;

CREATE TABLE Category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(100)
);

CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL UNIQUE,
    price DECIMAL(10,2) NOT NULL CHECK (price > 0),
    stock_quantity INT NOT NULL CHECK (stock_quantity >= 0),
    category_id INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);
INSERT INTO Product
(product_id, product_name, price, stock_quantity, category_id)
VALUES
(101, 'Laptop', 55000.00, 20, 1),
(102, 'Smartphone', 25000.00, 30, 1),
(103, 'Headphones', 1500.00, 50, 1),
(104, 'Smart Watch', 3000.00, 25, 1),
(105, 'Bluetooth Speaker', 2500.00, 35, 1),
(106, 'Keyboard', 1200.00, 40, 1),

(107, 'T-Shirt', 800.00, 45, 2),
(108, 'Jeans', 1800.00, 25, 2),

(109, 'Python Programming', 700.00, 30, 3),
(110, 'Data Structures', 900.00, 20, 3),

(111, 'Washing Machine', 30000.00, 10, 4),
(112, 'Microwave Oven', 12000.00, 15, 4),

(113, 'Rice 5kg', 350.00, 50, 5),
(114, 'Cooking Oil 1L', 180.00, 60, 5);
INSERT INTO Product
(product_id, product_name, price, stock_quantity, category_id)
VALUES
(115, 'Tablet', 18000.00, 15, 1);
SELECT * FROM Product;

UPDATE Product
SET price = 58000.00
WHERE product_name = 'Laptop';
DELETE FROM Product
WHERE product_id = 106;
SELECT
    c.category_name,
    COUNT(p.product_id) AS product_count
FROM Category c
LEFT JOIN Product p
ON c.category_id = p.category_id
GROUP BY c.category_id, c.category_name;
SELECT
    c.category_name,
    AVG(p.price) AS average_price
FROM Category c
JOIN Product p
ON c.category_id = p.category_id
GROUP BY c.category_id, c.category_name;