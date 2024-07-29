select * from production.categories
select * from production.products
select * from production.stocks


select TOP(10) c.category_name , p.product_name from production.products p inner join 
production.categories c on c.category_id=p.category_id

Select top(10) * from production.stocks order by quantity desc

Select  * from production.products WHERE list_price>7000

