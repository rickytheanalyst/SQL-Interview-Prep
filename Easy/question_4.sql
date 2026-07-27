/*
==================================================================================================
NOTE: 
    Solution for the question is at the end of the file. Feel 
    free to copy the DDL and Insert Queries.
==================================================================================================
Q: Find the total cost of each customer's orders. Output customer's id, first name, and the total 
   order cost. Order records by customer's first name alphabetically.

*/

/* ===== CUSTOMERS TABLE ===== */

CREATE TABLE customers(
	id            INT PRIMARY KEY,
	first_name    NVARCHAR(50),
	last_name     NVARCHAR(50),
	city          NVARCHAR(50),
	address       NVARCHAR(100),
	phone_number  NVARCHAR(50)
);

INSERT INTO customers (
    id,
    first_name,
    last_name,
    city,
    address,
    phone_number
)
VALUES
(8, 'John', 'Joseph', 'San Francisco', NULL, '928-386-8164'),
(7, 'Jill', 'Michael', 'Austin', NULL, '813-297-0692'),
(4, 'William', 'Daniel', 'Denver', NULL, '813-368-1200'),
(5, 'Henry', 'Jackson', 'Miami', NULL, '808-601-7513'),
(13, 'Emma', 'Isaac', 'Miami', NULL, '808-690-5201'),
(14, 'Liam', 'Samuel', 'Miami', NULL, '808-555-5201'),
(15, 'Mia', 'Owen', 'Miami', NULL, '808-640-5201'),
(1, 'Mark', 'Thomas', 'Arizona', '4476 Parkway Drive', '602-993-5916'),
(12, 'Eva', 'Lucas', 'Arizona', '4379 Skips Lane', '301-509-8805'),
(6, 'Jack', 'Aiden', 'Arizona', '4833 Coplin Avenue', '480-303-1527'),
(2, 'Mona', 'Adrian', 'Los Angeles', '1958 Peck Court', '714-409-9432'),
(10, 'Lili', 'Oliver', 'Los Angeles', '3832 Euclid Avenue', '530-695-1180'),
(3, 'Farida', 'Joseph', 'San Francisco', '3153 Rhapsody Street', '813-368-1200'),
(9, 'Justin', 'Alexander', 'Denver', '4470 McKinley Avenue', '970-433-7589'),
(11, 'Frank', 'Jacob', 'Miami', '1299 Randall Drive', '808-590-5201');
------------------------------------------------------------------------------------------------------
/* ===== ORDERS TABLE ===== */

CREATE TABLE orders (
    id INT PRIMARY KEY,
    cust_id INT,
    order_date DATE,
    order_details VARCHAR(50),
    total_order_cost INT
);

INSERT INTO orders (
    id,
    cust_id,
    order_date,
    order_details,
    total_order_cost
)
VALUES
(1, 3, '2019-03-04', 'Coat', 100),
(2, 3, '2019-03-01', 'Shoes', 80),
(3, 3, '2019-03-07', 'Skirt', 30),
(4, 7, '2019-02-01', 'Coat', 25),
(5, 7, '2019-03-10', 'Shoes', 80),
(6, 15, '2019-02-01', 'Boots', 100),
(7, 15, '2019-01-11', 'Shirts', 60),
(8, 15, '2019-03-11', 'Slipper', 20),
(9, 15, '2019-03-01', 'Jeans', 80),
(10, 15, '2019-03-09', 'Shirts', 50),
(11, 5, '2019-02-01', 'Shoes', 80),
(12, 12, '2019-01-11', 'Shirts', 60),
(13, 12, '2019-03-11', 'Slipper', 20),
(14, 4, '2019-02-01', 'Shoes', 80),
(15, 4, '2019-01-11', 'Shirts', 60),
(16, 3, '2019-04-19', 'Shirts', 50),
(17, 7, '2019-04-19', 'Suit', 150),
(18, 15, '2019-04-19', 'Skirt', 30),
(19, 15, '2019-04-20', 'Dresses', 200),
(20, 12, '2019-01-11', 'Coat', 125),
(21, 7, '2019-04-01', 'Suit', 50),
(22, 7, '2019-04-02', 'Skirt', 30),
(23, 7, '2019-04-03', 'Dresses', 50),
(24, 7, '2019-04-04', 'Coat', 25),
(25, 7, '2019-04-19', 'Coat', 125),
(26, 3, '2019-04-20', 'Gloves', 20),
(27, 3, '2019-04-21', 'Tie', 25),
(28, 3, '2019-04-22', 'Cap', 15),
(29, 3, '2019-04-23', 'Jacket', 120),
(30, 1, '2019-04-19', 'Jacket', 150),
(31, 1, '2019-04-19', 'Shoes', 125);
--------------------------------------------------------------------------------------------
SELECT * FROM customers
SELECT * FROM orders

-- ===== ANSWER =====
SELECT 
    c.id,
    c.first_name,
    SUM(o.total_order_cost) AS "Total Cost"
FROM customers c
INNER JOIN orders o
ON c.id = o.cust_id
GROUP BY 
    c.id,
    c.first_name
ORDER BY
    c.first_name




