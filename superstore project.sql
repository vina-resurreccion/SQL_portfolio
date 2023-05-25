
-- Show the sales performance per region

Select region,sum(sales) as total_sales, sum(profit) as total_profit
from superstore.sales
group by region
order by total_sales desc

-- What is the total sales performance and profit per category?

Select Category, round(sum(sales),2) as total_sales, round(sum(profit),2) as total_profit
from superstore.sales
group by category
order by total_profit desc;

-- Arrange all states from top to bottom based on sales performance

Select state, round(sum(Sales),2) as total_sales
from superstore.sales
group by state
order by total_sales desc

-- Which 10 states has the highest sales generated?

Select state, round(sum(Sales),2) as total_sales
from superstore.sales
group by state
order by total_sales desc
limit 10;


-- What is the total sales per segment?

select segment, round(sum(sales),2) as total_sales
from superstore.sales
group by segment
order by total_sales desc;











