/**
Link: https://platform.stratascratch.com/coding/10065-find-whether-the-number-of-seniors-works-at-facebook-is-higher-than-its-number-of-usa-based-employees/official-solution?python=&code_type=1

Find whether the number of senior workers (i.e., more experienced) at Meta/Facebook is higher than number of USA based employees at Facebook/Meta.
If the number of seniors is higher then output as 'More seniors'. Otherwise, output as 'More USA-based'.

facebook_employees

id	location	age	gender	is_senior
0	USA	24	M	FALSE
1	USA	31	F	TRUE
2	USA	29	F	FALSE
3	USA	33	M	FALSE
4	USA	36	F	TRUE
5	India	41	F	TRUE
6	India	44	F	TRUE
7	India	28	F	FALSE
8	India	24	M	FALSE
9	UK	18	M	FALSE
10	UK	21	M	FALSE
11	UK	23	F	TRUE
12	Switzerland	30	F	TRUE
13	Switzerland	31	M	TRUE

id: int
location: varchar
age: int
gender: varchar
is_senior: bool

Steps: 
1. Combine counts n_seniors and n_us_based into one row so that it could be compared.
2. Use Case When logic to compare two values and generate result.

1. SELECT STATEMENTS LEFT JOIN SELECT STATEMENTS ON TRUE
2. Compare Two values using CASE WHEN
*/
SELECT
    CASE 
        WHEN n_seniors > n_usa_based
        THEN 'More seniors'
        ELSE 'More USA-based'
    END AS winner
FROM
    (SELECT
       COUNT(*) AS n_seniors
    FROM
        facebook_employees where is_senior = TRUE) seniors
LEFT JOIN
    (SELECT
        COUNT(*) AS n_usa_based
    FROM
        facebook_employees
    WHERE
        location = 'USA'
    ) us_based
ON TRUE