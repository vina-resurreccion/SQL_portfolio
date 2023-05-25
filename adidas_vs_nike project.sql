
-- Which top 2 products have the highest number of reviews?
-- This can be a factor in indicating which brand is more popular.

Select max(reviews) as review, `Product Name`
from adidas_vs_nike.reviews
group by `Product Name`
order by review desc
limit 2;


-- What is the average rating of Adidas?

Select avg(rating) as rating
from adidas_vs_nike.reviews
where brand like "adidas%"


-- What is the average rating of Nike?

Select avg(rating) as rating
from adidas_vs_nike.reviews
where brand like "nike%"

-- What is the average sales price of adidas?

Select avg(`Sale Price`) as avg_price
from adidas_vs_nike.reviews
where brand like "adidas%"

-- What is the average sales price of nike?

Select avg(`Sale Price`) as avg_price
from adidas_vs_nike.reviews
where brand like "nike%"

-- Comparing the two brands, the lower average price of adidas can be a factor in it's popularity in terms of the number of reviews
