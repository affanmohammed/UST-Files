select * from emp

select sal,comm , round(sal,0) from emp

select round(rand()*10,0)

select IIF (comm>0 ,'Comm ','NO Comm') as Result from emp

select comm,sal,comm+sal as 'fin', iif (comm>0.00,comm+sal,sal) as 'new_fin' from emp

select USER_NAME()

select ISNUMERIC('Result')

select ename,
case 
when sal>8000 and sal<=10000 then 'Junior'
when sal>=5000 and sal<=8000 then 'Senior'
else 'Director'
end as Designation from emp


select * from production.products order by list_price desc

--------------------------------------------------------
--rank rollup cube
--dense rank is a window function that assign rank to each row within a partition of a result set

select product_id, product_name , list_price, 
rank() over ( order by list_price desc) price_rank 
from production.products


select product_id, product_name , list_price, 
rank() over ( order by list_price desc) price_rank,
dense_rank() over ( order by list_price desc) dense_price_rank
from production.products

select product_id,sum(list_price) 'sum' from sales.order_items group by product_id

select product_id, item_id, sum(list_price) sales 
from sales.order_items group by cube(product_id,item_id) 


select product_id, item_id, sum(list_price) sales 
from sales.order_items group by product_id, rollup(item_id) 


-------------------------
-- Joins
-- Extracting data from 2 or more table based on commomn keys
-- INNER (intercept), OUTER (FULL,LEFT,RIGHT), CROSS

select * from production.products
select * from production.categories

select product_name, list_price, pc.category_name from production.products pp join production.categories pc on pp.category_id = pc.category_id


select product_name, list_price, pc.category_name from production.products pp 
join production.categories pc on pp.category_id = pc.category_id
where list_price>3500 order by product_name


select product_name, list_price, pc.category_name,pb.brand_name from production.products pp 
inner join production.categories pc on pp.category_id = pc.category_id
inner join production.brands pb on pb.brand_id = pp.brand_id
where list_price>4500 order by product_name


select * from production.products
select * from sales.order_items

select product_name, order_id from production.products pp 
left join sales.order_items so on so.product_id = pp.product_id
order by order_id



select product_name, ord.order_id, item_id, order_date from production.products pp 
left join sales.order_items so on so.product_id = pp.product_id
left join sales.orders ord on ord.order_id=so.order_id
order by ord.order_id

select product_name, ord.order_id, item_id, order_date from production.products pp 
left join sales.order_items so on so.product_id = pp.product_id
left join sales.orders ord on ord.order_id=so.order_id
where so.order_id is not null and ord.order_id=100
order by ord.order_id



select e.* ,d.* from emp e  join dept d on e.deptno=d.deptno

select ename,dname from emp e right join dept d on e.deptno=d.deptno

select ename,dname from emp e left join dept d on e.deptno=d.deptno

select e.* ,d.* from emp e full join dept d on e.deptno=d.deptno

select e.* ,d.* from emp e cross join dept d

select c1.city,
c1.first_name + ' ' + c1.last_name as "Customer 1",
c2.first_name + ' ' + c2.last_name as "Customer 2"
from sales.customers c1 inner join sales.customers c2
on c1.customer_id > c2.customer_id and c1.city=c2.city
order by c1.city, 
c1.first_name


select * from emp

select e.ename 'Employee', m.ename 'Manager' from emp e inner join emp m on m.empno = e.mgr order by m.ename


select * from sales.customers

select * from sales.orders
where customer_id in (
	select customer_id from sales.customers where city = 'NewYork'
)

select deptno from emp where sal > (
	select max(losal) from salgrade 
)

select dname from dept where deptno in 
(	
	select deptno from emp where sal > 
	(
	select max(losal) from salgrade 
	)
)