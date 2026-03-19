-- =========================
-- CUSTOMERS TABLE
-- =========================
CREATE TABLE customers (
    customer_id VARCHAR(255) PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL
);

INSERT INTO customers VALUES
('C001', 'Aarav', 'aarav@outlook.com', 'Mumbai'),
('C002', 'Isha', 'isha@yahoo.com', 'Delhi'),
('C003', 'Vihaan', 'vihaan@protonmail.com', 'Ahmedabad'),
('C004', 'Ananya', 'ananya@icloud.com', 'Pune'),
('C005', 'Kabir', 'kabir@zoho.com', 'Bangalore');


-- =========================
-- PRODUCTS TABLE
-- =========================
CREATE TABLE products (
    product_id VARCHAR(255) PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(255) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

INSERT INTO products VALUES
('P006', 'Laptop', 'Electronics', 60000),
('P002', 'Mobile', 'Electronics', 20000),
('P003', 'Headphones', 'Accessories', 2000),
('P004', 'Chair', 'Furniture', 5000),
('P005', 'Table', 'Furniture', 7000),
('P006', 'Tablet', 'Electronics', 15000);

-- =========================
-- SALES REPRESENTATIVES TABLE
-- =========================
CREATE TABLE sales_reps (
    sales_rep_id VARCHAR(255) PRIMARY KEY,
    sales_rep_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    office_city VARCHAR(255) NOT NULL
);

INSERT INTO sales_reps VALUES
('S001', 'Riya', 'riya@company.in', 'Mumbai'),
('S002', 'Arjun', 'arjun@corpmail.com', 'Delhi'),
('S003', 'Mehul', 'mehul@business.org', 'Pune'),
('S004', 'Sneha', 'sneha@enterprise.net', 'Ahmedabad'),
('S005', 'Kunal', 'kunal@workmail.co', 'Bangalore');


-- =========================
-- ORDERS TABLE
-- =========================
CREATE TABLE orders (
    order_id VARCHAR(255) PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id VARCHAR(255) NOT NULL,
    sales_rep_id VARCHAR(255) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES sales_reps(sales_rep_id)
);

INSERT INTO orders VALUES
('O001', '2024-01-01', 'C001', 'S001'),
('O002', '2024-01-02', 'C002', 'S002'),
('O003', '2024-01-03', 'C003', 'S003'),
('O004', '2024-01-04', 'C004', 'S004'),
('O005', '2024-01-05', 'C005', 'S005');


-- =========================
-- ORDER ITEMS TABLE
-- =========================
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id VARCHAR(255) NOT NULL,
    product_id VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items VALUES
(1, 'O001', 'P001', 1),
(2, 'O001', 'P003', 2),
(3, 'O002', 'P002', 1),
(4, 'O003', 'P004', 3),
(5, 'O004', 'P005', 1);


COMMIT