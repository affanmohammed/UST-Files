select * from worker

SELECT UPPER (First_Name) 'First_Name' FROM  Worker 

SELECT LOWER (First_Name) 'Last_Name' FROM  Worker 

SELECT SUBSTRING(First_Name,1,3) FROM  Worker



select YEAR(Joining_date) "Joining Year" from Worker 

SELECT  DATEDIFF(DAY, Joining_Date, GETDATE()) AS Days_Worked FROM Worker

SELECT FORMAT(JOINING_DATE, 'MMM') AS JoiningMonthMMM FROM Worker; 



SELECT DISTINCT DEPARTMENT FROM Worker

SELECT DEPARTMENT, COUNT(*) Count FROM Worker GROUP BY DEPARTMENT ORDER BY Count DESC

