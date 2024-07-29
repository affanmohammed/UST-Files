-- Create Worker table
CREATE TABLE Worker (
    WORKER_ID INT IDENTITY(1,1) PRIMARY KEY,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT,
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

-- Insert data into Worker table
INSERT INTO Worker (FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
VALUES
    ('Monika', 'Arora', 100000, '2020-02-14 09:00:00', 'HR'),
    ('Niharika', 'Verma', 80000, '2011-06-14 09:00:00', 'Admin'),
    ('Vishal', 'Singhal', 300000, '2020-02-14 09:00:00', 'HR'),
    ('Amitabh', 'Singh', 500000, '2020-02-14 09:00:00', 'Admin'),
    ('Vivek', 'Bhati', 500000, '2011-06-14 09:00:00', 'Admin'),
    ('Vipul', 'Diwan', 200000, '2011-06-14 09:00:00', 'Account'),
    ('Satish', 'Kumar', 75000, '2020-01-14 09:00:00', 'Account'),
    ('Geetika', 'Chauhan', 90000, '2011-04-14 09:00:00', 'Admin');

-- Create Bonus table
CREATE TABLE Bonus (
    BONUS_ID INT IDENTITY(1,1) PRIMARY KEY,
    WORKER_REF_ID INT,
    BONUS_AMOUNT INT,
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

-- Insert data into Bonus table
INSERT INTO Bonus (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE)
VALUES
    (1, 5000, '2020-02-16'),
    (2, 3000, '2011-06-16'),
    (3, 4000, '2020-02-16'),
    (1, 4500, '2020-02-16'),
    (2, 3500, '2011-06-16');

-- Create Title table
CREATE TABLE Title (
    TITLE_ID INT IDENTITY(1,1) PRIMARY KEY,
    WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

-- Insert data into Title table
INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM)
VALUES
    (1, 'Manager', '2016-02-20 00:00:00'),
    (2, 'Executive', '2016-06-11 00:00:00'),
    (8, 'Executive', '2016-06-11 00:00:00'),
    (5, 'Manager', '2016-06-11 00:00:00'),
    (4, 'Asst. Manager', '2016-06-11 00:00:00'),
    (7, 'Executive', '2016-06-11 00:00:00'),
    (6, 'Lead', '2016-06-11 00:00:00'),
    (3, 'Lead', '2016-06-11 00:00:00');


select * from Worker
select * from Title
select * from Bonus


-- 1 Write a query to display all the first_name  in upper case
	SELECT UPPER (First_Name) 'First_Name' FROM  Worker 

-- 2 Write a querty to display unique department from workers table
	SELECT DISTINCT DEPARTMENT FROM Worker

-- 3 Write an SQL query to print the first three characters of FIRST_NAME from Worker table
	SELECT SUBSTRING(First_Name,1,3) FROM  Worker

-- 4 Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from Worker table.
	SELECT CHARINDEX('a', first_name COLLATE Latin1_General_BIN) AS position FROM Worker WHERE first_name = 'Amitabh';

-- 5 Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length
	SELECT  DISTINCT (DEPARTMENT), LEN (DEPARTMENT) as 'Length' FROM Worker 

-- 6 Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending
	SELECT * FROM Worker Order By FIRST_NAME ASC , Department DESC 

-- 7 Write a query to get workers whose name are Vipul and Satish
	SELECT * FROM Worker  WHERE FIRST_NAME = 'Vipul' or FIRST_NAME = 'Satish'

-- 8 Write an SQL query to print details of the Workers whose FIRST_NAME contains 'a'
	SELECT * FROM Worker WHERE  FIRST_NAME Like 'a%'

-- 9 Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets
	SELECT * FROM Worker WHERE  FIRST_NAME LIKE '_____h'

-- 10 Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000
	SELECT * FROM Worker WHERE salary>= 100000 and salary<= 500000

-- 11 Write an SQL query to print details of the Workers who have joined in Feb’2014
	SELECT * FROM Worker WHERE JOINING_DATE >= '2014-02-01' AND JOINING_DATE < '2014-03-01';

-- 12 Write an SQL query to fetch the count of employees working in the department ‘Admin’
	SELECT COUNT(*) Admin_Count from Worker where DEPARTMENT='Admin'

-- 13 Write an SQL query to fetch the no. of workers for each department in the descending order
	SELECT DEPARTMENT, COUNT(DISTINCT WORKER_ID) Count FROM Worker GROUP BY DEPARTMENT ORDER BY Count DESC

-- 14 Write a query to display workers who are managers
	SELECT * FROM Worker WHERE Department= 'Admin'

-- 15 Write query to find duplicate rows title table
	SELECT TITLE_ID, WORKER_REF_ID, COUNT(*) AS count
	FROM Title
	GROUP BY TITLE_ID, WORKER_REF_ID
	HAVING COUNT(*) > 1;

-- 16 Write an SQL query to show all workers who got the bonus along with bonus amount
	SELECT  w.worker_id ID, MIN(first_name) AS "Name",SUM(B.BONUS_AMOUNT) AS "Total Bonus"  
	FROM Worker w inner join Bonus b ON w.WORKER_ID = b.WORKER_REF_ID
	GROUP BY w.WORKER_ID

-- 17 Write a query to find employees in worker table that do not exist in bonus table (ie did not get bonus)
	SELECT W.FIRST_NAME "No Bonus" from Worker W where W.WORKER_ID not in (SELECT B.WORKER_REF_ID from Bonus B)
 
-- 18 Write a query to find the highest 2 salaries
	SELECT DISTINCT TOP(2) SALARY FROM Worker ORDER BY SALARY DESC

-- 19 Find 2nd highest without using TOP or LIMIT
	SELECT MAX(SALARY) "2nd Highest" FROM Worker WHERE SALARY< (SELECT MAX(SALARY) FROM Worker)

-- 20 Find people who have the same salary
	SELECT W1.FIRST_NAME from Worker W1 inner join Worker W2 ON (W1.WORKER_ID != W2.WORKER_ID and W1.SALARY = W2.SALARY )

-- 21 Write a query to fetch 1st 50% records without using Top

	SELECT *
	FROM (
	  SELECT *, ROW_NUMBER() OVER (ORDER BY Worker_Id) AS row_num
	  FROM Worker
	) AS numbered_table
	WHERE row_num <= (SELECT COUNT(*) FROM Worker) / 2;


-- 22 Write a query to select a department with more than 3 people in worker table
	SELECT DEPARTMENT FROM Worker group by DEPARTMENT Having COUNT(*) >3

-- 23 Write a query to select 1st and last row of a worker table
	SELECT * FROM 
	(
	  SELECT *, ROW_NUMBER() OVER (ORDER BY WORKER_ID ASC) AS RowAsc FROM Worker
	) AS FirstWorker WHERE RowAsc = 1
	UNION
	SELECT * FROM 
	(
	  SELECT *, ROW_NUMBER() OVER (ORDER BY WORKER_ID DESC) AS RowDesc FROM Worker
	) AS LastWorker WHERE RowDesc = 1

-- 24 Write a query to select last 5 entries from worker table
	SELECT TOP(5) * from Worker order by WORKER_ID DESC

-- 25 Write a query to select people with highest salary in each group
	SELECT  MAX(SALARY) "Max Salary", MAX(FIRST_NAME) "FirstName", DEPARTMENT from Worker group by DEPARTMENT 

-- 26 Write a query to fetch departments along with the total salaries paid for each of them
	SELECT DEPARTMENT , SUM(SALARY) "Total Salary" FROM Worker Group By DEPARTMENT

-- 27 Write a query to fetch the names of workers who earn the highest salary
	SELECT FIRST_NAME "Higest Salary" FROM Worker WHERE SALARY=(SELECT MAX(SALARY) FROM Worker)

--
SELECT * FROM Title
SELECT * FROM Worker
SELECT * FROM Bonus
--




