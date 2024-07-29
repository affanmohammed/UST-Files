CREATE TABLE SalesData (
    customer_id INT,
    customer_name NVARCHAR(100),
    customer_email NVARCHAR(100),
    sales_date DATE,
    product_name NVARCHAR(100),
    quantity INT,
    amount DECIMAL(10, 2)
);

-- Inserting sample data into the SampleSalesData table
INSERT INTO SalesData (customer_id, customer_name, customer_email, sales_date, product_name, quantity, amount)
VALUES
    (1, 'John Doe', 'john.doe@example.com', '2023-02-15', 'LAPTOP', 1, 1500.00),
    (2, 'Jane Smith', 'jane.smith@example.com', '2023-08-16', 'SMARTPHONE', 2, 1200.00),
    (3, 'Michael Johnson', 'michael.johnson@example.com', '2023-05-16', 'MOUSE', 2, 100.00),
    (4, 'Emily Brown', 'emily.brown@example.com', '2023-05-17', 'MONITOR', 1, 400.00),
    (5, 'William Jones', 'william.jones@example.com', '2024-02-18', 'LAPTOP', 1, 1500.00),
    (6, 'Emma Wilson', 'emma.wilson@example.com', '2024-03-18', 'MOUSE', 1, 50.00);

drop table SalesData
select * from SalesData

SELECT UPPER (customer_name) 'First_Name' FROM  SalesData 
SELECT LOWER (product_name) 'Product Name' FROM  SalesData
SELECT customer_id,customer_name FROM SalesData WHERE  customer_name Like 'E%'
SELECT SUBSTRING(customer_email,4,10) 'SubString' FROM  SalesData

SELECT YEAR(sales_date) "Sale Year" FROM SalesData 
SELECT  DATEDIFF(DAY, sales_date, GETDATE()) AS Days_After_Purchase FROM SalesData
SELECT FORMAT(sales_date, 'MMM') AS SaleMonthMMM FROM SalesData; 
	
SELECT DISTINCT product_name FROM SalesData
SELECT product_name, COUNT(DISTINCT customer_id) Count FROM SalesData GROUP BY product_name ORDER BY Count DESC
SELECT COUNT(*) Laptop_Purchase_Count from SalesData where product_name='Laptop'


alter table SalesData
add Selling_Price INT;
exec sp_rename 'SalesData.Amount','Cost_Price';

UPDATE SalesData
SET Selling_Price = 
    CASE 
        WHEN product_name = 'LAPTOP' THEN 2000.00
        WHEN product_name = 'SMARTPHONE' THEN 1500.00
        WHEN product_name = 'MOUSE' THEN 150.00
        WHEN product_name = 'MONITOR' THEN 750.00
        ELSE 0.00
    END;


-- drop table SalesData
Select * from SalesData

Alter table SalesData 
add profit INT;


UPDATE SalesData
SET profit = ISNULL(Selling_Price, 0) - ISNULL(Cost_Price, 0);

select * from SalesData

select cast(Sales_date as varchar) from SalesData

select customer_name from SalesData


select left(customer_name,charindex(' ', customer_name+' ')-1) FirstName,
right(customer_name,len(customer_name)-charindex(' ', customer_name+' ')) LastName from SalesData



SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'SalesData' ;


select * from SalesData

select SUM(Profit) "Total Profit" from SalesData
select MAX(Selling_price) "Max Sell price" from SalesData
select MIN(quantity) "min quantity" from salesData


select * from production.brands


