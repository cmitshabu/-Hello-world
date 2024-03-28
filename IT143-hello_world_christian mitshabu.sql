/*****************************************************************************************************************
NAME:    IT143_W5.2_hello_world_christian mitshabu 
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

--Q1:  what is the first date in the date Data sets only the first date with the ID 1? christian mitshabu author
--A1--see the SQL command
SELECT ID, MIN(date) AS first_date
FROM dbo.t_hello_world
WHERE ID = 1
GROUP BY ID;

--Q2--: how many column are there in the hello world community ? christian mitshabu
--A2--see the SQL command
select * from dbo.t_hello_world

--Q3--:demonstrate by the request SQL the column employee_id and the department_id , Inner join those two column 
--A3--see the SQL command
SELECT employee_id, department_id*
FROM employee_salary
INNER JOIN employee_id  ON department_id = employee_name;

--Q4--:would you create a procedures for getting all informations in hello_world ? muamba paul
--A4--see the SQL command
CREATE PROCEDURE 

GetHelloWorldData
AS
BEGIN
    SET NOCOUNT ON;

    SELECT [my_massage], [current_battery_power]
    FROM [exercises].[dbo].[t_hello_world];
END;
