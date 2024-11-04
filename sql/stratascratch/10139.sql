/**
Link: https://platform.stratascratch.com/coding/10139-number-of-speakers-by-language

Content: Find the number of speakers of each language by country. Output the country, language, and the corresponding number of speakers. Output the result based on the country in ascending order.

Tables: 

playbook_events
user_id	occurred_at	event_type	event_name	location	device
6991	2014-06-09 18:26:54	engagement	home_page	United States	iphone 5
18851	2014-08-29 13:18:38	signup_flow	enter_info	Russia	asus chromebook
14998	2014-07-01 12:47:56	engagement	login	France

playbook_users
user_id	created_at	company_id	language	activated_at	state
11	2013-01-01 04:41:13	1	german	2013-01-01	active
52	2013-01-05 15:30:45	2866	spanish	2013-01-05	active
108	2013-01-10 11:04:58	1848	spanish	2013-01-10	active


Company: Google Apple

Step by Step Explanation: 
We need to output location, language and user_id count, therefore, we need to join table playbook_users and playbook_events.
1. We create CTE on distinct user_id, language and location
2. We select location, language and count using groupby and orderby based on the question
*/
with locations as (
    select distinct e.user_id, u.language, e.location
    from playbook_events e 
        join playbook_users u on e.user_id = u.user_id
)

select location, language, count(distinct user_id) 
from locations
group by language, location
order by location asc