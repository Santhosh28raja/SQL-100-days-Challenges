/*
Find the Longest Duration Between Two Orders by the Same Customer
*/ 

use practice;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date date
);

INSERT INTO orders VALUES
(1, 101, '2023-07-01'),
(2, 102, '2023-07-02'),
(3, 101, '2023-07-03'),
(4, 103, '2023-07-04');

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO order_items VALUES
(1, 1, 201, 2, 20.00),
(2, 1, 202, 1, 15.00),
(3, 2, 201, 1, 20.00),
(4, 3, 203, 3, 25.00),
(5, 4, 202, 2, 15.00);

-- Query
SELECT customer_id, MAX(order_date) - MIN(order_date) AS max_duration
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;