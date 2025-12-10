-- Data Ingestions --
-- 1. customer table view
CREATE OR REPLACE TABLE customers AS
SELECT *
FROM read_parquet('/home/mulyo/Learning/duckdb/parquet/customer_data.parquet');

-- 2. order table view
CREATE OR REPLACE TABLE orders AS
SELECT *
FROM read_parquet('/home/mulyo/Learning/duckdb/parquet/order_data.parquet');

-- 3. order_item table view
CREATE OR REPLACE TABLE order_item AS
SELECT *
FROM read_parquet('/home/mulyo/Learning/duckdb/parquet/order_item_data.parquet');

-- 4 insight ready: customer revenue
WITH customerrevenue AS(
  SELECT 
    c.customer_id,
    c.full_name AS customername,
    COUNT(DISTINCT o.order_id) AS ordercount,
    SUM(oi.item_quantity * oi.item_unit_price) AS revenue
  FROM
    customers c
  JOIN orders o ON c.customer_id = o.customer_id
  JOIN order_item oi ON o.order_id = oi.order_id
  GROUP BY 
    c.customer_id,
    c.full_name
  ORDER BY
    ordercount,
    revenue
    DESC
)

SELECT 
  customer_id, 
  customername, 
  ordercount, 
  revenue
FROM 
  customerrevenue
LIMIT 10;
