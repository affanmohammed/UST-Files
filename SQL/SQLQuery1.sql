--printing: SELECT--
--select * from sales.customers
--select first_name,last_name,email from sales.customers
--select first_name+' '+last_name as "Full_Name" from sales.customers
--select s.email from sales.customers as s

-------------------------------------------------------
--Sorting of data: ORDER BY--

--select first_name,last_name,email,zip_code,city 
--from sales.customers
--order by first_name desc, last_name asc
--order by city desc
--order by city 

-------------------------------------------------------
--Filtering and Searching: WHERE--

--select * from sales.customers where zip_code = '12010'
--select * from sales.customers
--where zip_code != '12010'
--order by street

--select * from production.stocks 
--where quantity<20 and quantity>10 
--order by product_id

--select state , first_name from sales.customers
--where state !='CA' and state != 'NY'

--select distinct state, city from sales.customers

--select state, first_name from sales.customers
--where state in ('CA','NY')

--select * from sales.customers where phone is not null

--select * from sales.customers where first_name like '%in'
--select * from sales.customers where first_name like 'A%'
--select * from sales.customers where first_name like '%st%'
--select * from sales.customers where first_name like '___c%'
--select * from sales.customers where first_name like '____in'
--select * from sales.customers where first_name like 'E%st'

--select * from production.products
--where model_year between 2016 and 2018

--select * from production.products
--where model_year between 2019 and 2020


-------------------------------------------------------
--Aggregationg and Filtering; GROUP BY and HAVING

--select count(*) from production.products
--select count(phone) as "Phone_Count", count(*) as "Total_count" from sales.customers
--select count(model_year),count(distinct model_year) from production.products
--select count(*) "Count", max(list_price) "Max", min(list_price) "Min",avg(list_price)"Avg" from production.products
--select model_year, count(*) "Count", min(list_price) from production.products group by model_year


-------------------------------------------------------
--select model_year, count(*) "Count", min(list_price) "Min", avg(list_price) "Avg" 
--from production.products group by model_year

--select model_year, count(model_year) "Count", max(list_price) "Max" from production.products
--group by model_year having count(model_year) >50

--select product_name, model_year , avg(list_price) over (partition by model_year) as 'Avgprice', 
--list_price-avg(list_price) over (partition by model_year) as 'diff' from production.products


-------------------------------------------------------

--select top(5)* from production.products

--select top 20 percent * from production.products 

--select * from (select product_name, model_year, category_id, list_price from production.products 
--where model_year = 2016) as "subtable" where subtable.category_id = 3

