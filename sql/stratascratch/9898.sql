/**

https://platform.stratascratch.com/coding/9898-unique-salaries

Find the top three distinct salaries for each department. Output the department name and the top 3 distinct salaries by each department. Order your results alphabetically by department and then by highest salary to lowest.

id	first_name	last_name	age	sex	employee_title	department	salary	target	bonus	email	city	address	manager_id
1	Allen	Wang	55	F	Manager	Management	200000	0	300	Allen@company.com	California	23St	1
13	Katy	Bond	56	F	Manager	Management	150000	0	300	Katty@company.com	Arizona		1
19	George	Joe	50	M	Manager	Management	100000	0	300	George@company.com	Florida	26St	1
11	Richerd	Gear	57	M	Manager	Management	250000	0	300	Richerd@company.com	Alabama		1
10	Jennifer	Dion	34	F	Sales	Sales	100000	200	150	Jennifer@company.com	Alabama		13
18	Lala	Mark	26	F	Sales	Sales	100000	200	150	Laila@company.com	Florida	23St	11
20	Sarah	Becky	31	F	Senior Sales	Sales	200000	200	150	Sarrah@company.com	Florida	53St	19
21	Suzan	Lee	34	F	Sales	Sales	130000	200	150	Suzan@company.com	Florida	56St	19
22	Mandy	John	31	F	Sales	Sales	130000	200	150	Mandy@company.com	Florida	45St	19
23	Britney	Berry	45	F	Sales	Sales

This interview question testing dense_rank() as the window function that could remove the duplicates when partitioning
*/
with top_salaries as
(
select
salary,
department,
dense_rank() over(partition by department order by salary desc) as rank
from twitter_employee
)
select
department,
salary
from top_salaries
where rank <=3
group by 1,2
order by 1,2 desc