use AdventureWorks2019
select pa.*
from person.Address as pa
where pa.city = 'bothelle';


use AdventureWorks2019
create nonclustered index ix_my_index
on [person].[address] ([city])
go