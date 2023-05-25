

-- Convert data type of the column "week" from string to date

ALTER TABLE demand_forecasting.test MODIFY week DATE;
UPDATE demand_forecasting.test SET week = STR_TO_DATE(date, '%Y-%m-%d');

-- Get sales forecast per week for the next 12 weeks

WITH cte_total_price_per_week AS (
    SELECT week, SUM(total_price) AS total_price_per_week
    FROM demand_forecasting.train
    WHERE week BETWEEN '2013/05/14' AND '2013/12/03'
    GROUP BY week
    ORDER BY week
)
SELECT AVG(total_price_per_week)
FROM cte_total_price_per_week

-- Get units sales forecast per week per sku for the next 12 weeks

SELECT test.sku_id, avg(train.units_sold) AS average_units_sold
FROM demand_forecasting.test test
JOIN demand_forecasting.train train ON test.sku_id = train.sku_id
WHERE train.week BETWEEN '2013/05/14' AND '2013/12/03'
GROUP BY test.sku_id;
