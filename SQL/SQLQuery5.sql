-- INDEXING ---



create table person1
(
	Id Int Identity,
	Name nvarchar(40),
	Email nvarchar(40),
	Dept nvarchar(40)
	);


declare @counter int=1
while (@counter <=20000)
begin
	declare @Name nvarchar(40) = 'name'+rtrim(@counter)
	declare @Email nvarchar(40) = 'email' + rtrim(@counter)+'@domain.com'
	declare @Dept nvarchar(40) = 'dept' + rtrim(@counter)

	insert into person values(@Name, @Email, @Dept)

	set @counter +=1
end


Select * from person where id=12345

select * from person
select count(*) from person
drop table person

alter table person add constraint pk_person primary key (Id)

-- an index in a table improves the query perfomance by speeding up the data lookup. 
-- By default a query analyzer does a sqeuential scan on every row in a table until it fined the searched result.
-- An index scan is much faster because index acts as a popinter reference  to the rows addewss in a table
-- Basically 2 types of indexes:
--	1. Clustered- a clustered index determines the physical order of data in a table.
--				  there can be only one clustered index in the table
--		syntax:	  create clustered index name_id on person (name asc, department desc)
--
--  2. Non Clustered- a NC index creates a seperate index table to store the sorted column value and 
--					  a pointer reference to the records called the rowid. A rowid 


create nonclustered index nc_person_name on person(Name)
select * from person where name= 'name12345'