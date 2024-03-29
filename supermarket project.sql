-- What is the total sales generated by each branch?
-- This shows the performance evaluation per branch which can be useful in strategic decision making and stock level allocation


SELECT branch,round(sum(total),2) as total_sales FROM supermarket.sales
group by branch;

-- What is the total revenue per product line?
-- This shows which product line performs well. This information can be used for effective inventory management and targeted marketing


Select  `Product line`, round(sum(Total),2) as total_sales
from supermarket.sales
group by `Product line`;


-- Which branch has the highest average customer rating
-- This information can be used in providing insights about potential areas of improvement and as well as developing customer service startegies

Select branch, round(avg(Rating),2) as average_rating
from supermarket.sales
group by branch
order by average_rating;

-- What is the distribution of members and non-members among the customers?
-- This will show the distribution of member and non-member customers which can be helpful in assessing if the company needs to develop and strengthen loyalty programs

-- USE CTE

With cte_membership_type as (Select `Customer type`, case
when `Customer type`= "normal" then "nonmember"
when `Customer type`= "member" then "member" 
end as "membership_type"
from supermarket.sales)
Select `Customer type`, count(membership_type) as membership_type_count
from cte_membership_type
group by `Customer type`;

-- What is the average basket size per branch?
-- This can help the company is assessing their pricing strategies as well as developing discount strategies like bulk deals

Select branch, avg(Total) as average_total_sales, avg(Quantity) as average_total_qty
from supermarket.sales
group by branch
order by avg(Total);







