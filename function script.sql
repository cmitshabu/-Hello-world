--step1--how to extract first name from contact name ?

--how to extract first name from contact name ?
---step2---
--A: well, here is your problem,
---customer = Alejandra camino -> Alejandra

--how to extract first year from work_year ?
--step 3--
select t.work_year
from dbo.salaries as t
order by 1;

--how to extract first name from contact name ?
---well, here is your problem,
---customer = Alejandra camino -> Alejandra
--google search how to extract name from data query sql?
https://stackoverflow.com/questions/35624662/how-to-extract-table-names-and-column-names-from-sql-query
--step4--
select t.work_year
		,left (t.work_year, CHARINDEX(' ', t.work_year + ' ') - 1) as first_year
		from dbo.salaries as t
		order by 1;

--step5--
/******************************************************************
name: udf_parse_first_name
purpose : parse first name from combined_name 
***********************************************************/
CREATE FUNCTION [dbo].[udf_parse_work_year]
(@v_combined_name AS VARCHAR(500)
)
RETURNS VARCHAR(100)

BEGIN
    DECLARE @V_first_name AS VARCHAR(100);
    SET @V_first_name = LEFT(@v_combined_name, CHARINDEX(' ', @v_combined_name + '') - 1);
    RETURN @V_first_name;
END;
go
	--step 6--
--how to extract first name from contact name ?
---well, here is your problem,
---customer = Alejandra camino -> Alejandra
--google search how to extract name from data query sql?
https://stackoverflow.com/questions/35624662/how-to-extract-table-names-and-column-names-from-sql-query

select t.work_year
,LEFT(t.work_year, CHARINDEX(' ', t.work_year + ' ') - 1) as first_name
,dbo.udf_parse_first_year(t.work_year) as first_year2
from dbo.salaries as t
order by 1;

---step7--
--how to extract first name from contact name ?
---well, here is your problem,
---customer = Alejandra camino -> Alejandra
--google search how to extract name from data query sql?
https://stackoverflow.com/questions/35624662/how-to-extract-table-names-and-column-names-from-sql-query

with s1 ------use a common table expression and compare first_year to first_year2
as (select t.work_year
,LEFT(work_year, CHARINDEX(' ', work_year + ' ') - 1) as first_year
,dbo.udf_parse_first_yea(t.work_year) as first_year2
from dbo.salaries as t)
select s1.*
from s1
where s1.work_year <> s1.first_year2; ----expected result is 0 rows

---step8---
--how to extract first name from contact name ?
---well, here is your problem,
---customer = Alejandra camino -> Alejandra
--google search how to extract name from data query sql?
https://stackoverflow.com/questions/35624662/how-to-extract-table-names-and-column-names-from-sql-query

select t.salary
	,t.salary_currency
	,t.work_year
	,dbo.udf_parse_first_year(t.work_year) as contactname_first_name
	, '' as work_year_last_year --how to extract first name from contact name ?
	,t.experience_level
	,t.company_location
	,t.company_size
from dbo.salaries as t
order by 3;
