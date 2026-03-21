-- DIMENSIONS (cleaned from raw transactions)

-- Date dimension
-- Raw data had mixed formats like 01-01-24 / 2024/01/01 → standardized
CREATE TABLE dim_date (
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    day INT NOT NULL,
    month INT NOT NULL,
    year INT NOT NULL
);

INSERT INTO dim_date VALUES
(1, '2023-01-22', 22, 1, 2023),
(2, '2023-02-07', 7, 2, 2023),
(3, '2023-03-04', 4, 3, 2023),
(4, '2023-04-07', 7, 4, 2023),
(5, '2023-05-06', 6, 5, 2023),
(6, '2023-06-06', 6, 6, 2023);


-- Store dimension
-- Removed NULL store names and fixed casing
CREATE TABLE dim_store (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL
);

INSERT INTO dim_store VALUES
(1, 'Reliance Smart', 'Mumbai'),
(2, 'Dmart', 'Delhi'),
(3, 'Big Bazaar', 'Ahmedabad'),
(4, 'Reliance Fresh', 'Pune');


-- Product dimension
-- Category cleaned: electronics / ELECTRONICS → Electronics
CREATE TABLE dim_product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(255) NOT NULL
);

INSERT INTO dim_product VALUES
(1, 'Laptop', 'Electronics'),
(2, 'Mobile', 'Electronics'),
(3, 'Headphones', 'Electronics'),
(4, 'Chair', 'Furniture'),
(5, 'Table', 'Furniture'),
(6, 'Milk', 'Groceries'),
(7, 'Rice Bag', 'Groceries');


-- FACT TABLE (main transactional data)

CREATE TABLE fact_sales (
    sale_id INT PRIMARY KEY,
    date_id INT NOT NULL,
    store_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);


-- CLEANED FACT DATA (fetched from given CSV)

-- Fixes applied:
-- - NULL quantities replaced with valid numbers
-- - Prices standardized
-- - total_amount recalculated
-- - Invalid/missing rows ignored

INSERT INTO fact_sales VALUES
(1, 1, 1, 1, 1, 60000.00, 60000.00),
(2, 1, 2, 2, 2, 20000.00, 40000.00),
(3, 2, 1, 3, 2, 2500.00, 5000.00),
(4, 2, 3, 4, 3, 5000.00, 15000.00),
(5, 3, 2, 6, 10, 60.00, 600.00),
(6, 3, 4, 7, 2, 1200.00, 2400.00),
(7, 4, 1, 2, 1, 20000.00, 20000.00),
(8, 4, 3, 5, 1, 7000.00, 7000.00),
(9, 5, 2, 4, 2, 5000.00, 10000.00),
(10, 5, 4, 6, 5, 60.00, 300.00),
(11, 6, 1, 1, 1, 60000.00, 60000.00),
(12, 6, 3, 3, 3, 2500.00, 7500.00);