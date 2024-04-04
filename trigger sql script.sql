
---Q1 how to keep tract of when record was last modified ?
----A1 :this work for the first initial

alter table dbo.hello_world
add last_modified_date datetime default getdate();

--Q1
---how to keep tract of when record was last modified ?
----A1 :this work for the first initial

--alter table dbo.hello_world
--add last_modified_date datetime default getdate();
---Q2 how to keep tract of when record was last modified ?
---A2 maybe use an after update tragger ?
https://strackoverflow.com/questions/9522982/t-sql-tagger=update
https://strackoverflow.com/questions/how_to_create_tagger_of_when_changed_data

create trigger trg_hello_world_last_mod on dbo.t_hello_world
after update
as
update dbo.t_hello_world
			set 
			last_modified_date = GETDATE()
			where my_massage in
			(
			select distinct 
			my_massage
			from inserted
			);

			--did it work ?
--A--let us see 
--remove stuff if it is already there
delete from dbo.t_hello_world
where my_massage in('hello_world2', 'hello_world3', 'hello_world4')

---load test rows
insert into dbo.t_hello_world (my_massage)
values ('hello_world'), ('hello_world')


---see if the trigger worker
select t.*
from dbo.t_hello_world as t;
 
 ---try it again
 update dbo.t_hello_world set my_massage = 'hello_world4'
 where my_massage = 'hello_world3'

 ------see if the trigger worker
select t.*
from dbo.t_hello_world as t;

-------Q4 how to keep tract of when record was last modified ?
----A4 :this work for the first initial
alter table dbo.t_hello_world
add last_modified_by varchar(50) default suser_name();