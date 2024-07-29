
select * from production.categories

select upper(category_name), left(category_name,5), len(category_name), right(category_name,5) from production.categories

select trim(category_name),upper(category_name), left(category_name,5), len(category_name) from production.categories

select category_name, upper(category_name),patindex('%Bi_y%',category_name) , len(category_name) from production.categories

select  category_name, replace(category_name,'Bikes','Motorbikes') from production.categories

select substring(product_name, 5,10) from production.products

select CURRENT_TIMESTAMP,GETDATE()

select DATEADD(year,2,getdate()) "2 years after"
select DATEADD(year,-2,getdate()) "2 years before"
select DATEADD(month,2,getdate()) "2 months after"

select DATEDIFF(Year,hiredate,format(getdate(),'yyyy-mm-dd' )) from dbo.emp

select SYSDATETIME(), GETDATE()



select YEAR(getdate()), MONTH(getdate()), DAY(getdate()) 

