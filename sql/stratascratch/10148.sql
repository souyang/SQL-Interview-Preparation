/**
Link: https://platform.stratascratch.com/coding/10139-number-of-speakers-by-language

Content:
Find the top 5 cities with the most 5-star businesses. Output the city name along with the number of 5-star businesses. Include both open and closed businesses.
In the case of multiple cities having the same number of 5-star businesses, use the ranking function returning the lowest rank in the group and output cities with a rank smaller than or equal to 5.

Table: yelp_business
business_id	name	neighborhood	address	city	state	postal_code	latitude	longitude	stars	review_count	is_open	categories
G5ERFWvPfHy7IDAUYlWL2A	All Colors Mobile Bumper Repair		7137 N 28th Ave	Phoenix	AZ	85051	33.45	-112.07	1	4	1	Auto Detailing;Automotive
0jDvRJS-z9zdMgOUXgr6rA	Sunfare		811 W Deer Valley Rd	Phoenix	AZ	85027	33.68	-112.08	5	27	1	Personal Chefs;Food;Gluten-Free;Food Delivery Services;Event Planning & Services;Restaurants
6HmDqeNNZtHMK0t2glF_gg	Dry Clean Vegas	Southeast	2550 Windmill Ln, Ste 100	Las Vegas	NV	89123	36.04	-115.12	1	4	1	Dry Cleaning & Laundry;Laundry Services;Local Services;Dry Cleaning

Company: Yelp

Step by Step Explanation: 

*/
WITH cte as (
    SELECT 
        city,
        COUNT(*) as count_of_5_stars,
        RANK() OVER(ORDER BY COUNT(*) DESC) as rank
    FROM
        yelp_business
    WHERE stars = 5
    GROUP BY city
    ORDER BY 2 DESC
)

SELECT city, count_of_5_stars FROM cte
WHERE rank<=5;

-- select city, count_of_5_stars
-- from (select city, count(*) count_of_5_stars, rank() over (order by count(*) desc) rnk
-- from yelp_business
-- where stars = 5
-- group by city
-- ) sub
-- where rnk <= 5