/*****************************************************************************************************************
NAME:    IT143_W5.2_salaries_christian mitshabu 
PURPOSE: creating and showing salaties and average...

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     03/28/2024   christian mitshabu       1. Built this script for EC IT143


RUNTIME: 
Xm Xs

NOTES: 
This is where I talk about what this script is, why I built it, and other stuff...
 
******************************************************************************************************************/

SELECT GETDATE() AS my_date;
use exercises
--Q1 : How can I find the total amount of salary for all IT people per month?
--A1
SELECT salary, salary_currency,employment_type,
       (salary ) AS "total_salary"
FROM dbo.salaries;

--Q2--would you help me to see the culomn salary and year in order to compare and know which year we paid more than another?
--A2
select salary, work_year
from dbo.salaries

--Q3-:how me the sum of all prices and the total number of devices and divided each devices by prices ? I want to know how much we
--benefit in each devices?
--A3--
SELECT SUM(salary_in_usd) AS total_salary
FROM [exercises].[dbo].[salaries];

--Q4--: would you show me all id , battery and pc from your mobiles prices community? from MUamba paul
--A4
select id, battery_power, pc
from dbo.[Mobile prices classification]