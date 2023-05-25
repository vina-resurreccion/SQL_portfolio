
-- convert data type of the column "date" from string to date

ALTER TABLE walmart.sales MODIFY date DATE;
UPDATE walmart.sales SET date = STR_TO_DATE(date, '%Y-%m-%d');

-- Create temp table with a column that shows "year_only"

CREATE TEMPORARY TABLE temp_sales_data
SELECT YEAR(date) AS year_only, date, round(sum(weekly_sales), 2) AS sales_total
FROM walmart.sales
GROUP BY date;

-- Show the total sales per year from 2010 to 2011

Select year_only, sum(sales_total)
from temp_sales_data
where year_only in (2010, 2011)
group by year_only


-- What is the trending sales forcast for the whole month of November 2012?

SELECT (round(sum(weekly_sales), 2)/5)*30 as nov_sales_forecast
FROM walmart.sales
WHERE date = '2012-11-05';


-- What is the trending sales forcast for the whole month of December 2012?

SELECT (round(sum(weekly_sales), 2)/10)*31 as dec_sales_forecast
FROM walmart.sales
WHERE date = '2012-12-10';