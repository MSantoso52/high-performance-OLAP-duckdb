# high-performance-OLAP-duckdb
it's an embedded database that runs within your application or process, but it is specifically optimized for complex analytical queries on large datasets.

# *Project Overview*
# *Problem To Be Solved*
# *Business Impact*
# *Business Leverage*
# *Project Flow*
1. Create tables from parquet files
   ```bash
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
4. Dispaly dataset ready
# *Assumption* 
