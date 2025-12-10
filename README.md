# high-performance-OLAP-duckdb
it's an embedded database that runs within your application or process, but it is specifically optimized for complex analytical queries on large datasets.

# *Project Overview*
# *Problem To Be Solved*
# *Business Impact*
# *Business Leverage*
# *Project Flow*
1. Create tables from parquet files
   ```sql
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
   ```
3. Create CTE 'customerrevenue'
   ```sql
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
       DESC)
   ```
5. Dispaly dataset ready
   ```sql
   SELECT 
     customer_id, 
     customername, 
     ordercount, 
     revenue
   FROM 
     customerrevenue
      LIMIT 10;
   ```
# *Assumption* 
