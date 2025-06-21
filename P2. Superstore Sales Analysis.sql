SELECT *
FROM data_superstore;

CREATE TABLE superstore
LIKE data_superstore;

SELECT *
FROM superstore;

INSERT superstore
SELECT *
FROM data_superstore;

-- Convert text to date in column order_date and ship_date
UPDATE superstore
SET 
  order_date = STR_TO_DATE(order_date, '%m/%d/%Y'),
  ship_date = STR_TO_DATE(ship_date, '%m/%d/%Y');
  
ALTER TABLE superstore
MODIFY COLUMN order_date DATE,
MODIFY COLUMN ship_date DATE;

SELECT *
FROM superstore;

-- check duplicate data
SELECT row_id, COUNT(*) AS cnt
FROM superstore
GROUP BY row_id
HAVING cnt > 1;

SELECT order_id, COUNT(*) AS cnt
FROM superstore
GROUP BY order_id
HAVING cnt > 1;