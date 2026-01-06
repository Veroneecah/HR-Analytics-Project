USE [HRData-Full Database]

SELECT 
    *
FROM [dbo].[Employees]

--1.-- Show the	Top 10 Salary Earners

SELECT TOP 10
    Employee_Name,
    Position,
    Department,
    Salary
FROM [dbo].[Employees]
ORDER BY 4 DESC

--2.--Show the average salary by race of our employees

SELECT
    RaceDesc AS Race,
    ROUND (AVG (Salary), 2) AS Average_Salary
FROM [dbo].[Employees]
GROUP BY 
    [RaceDesc]
ORDER BY 2 DESC

--3.--Show the average salary by gender

SELECT
    Sex AS Gender,
    ROUND (AVG (Salary), 2) AS Average_Salary
FROM [dbo].[Employees]
GROUP BY 
    Sex
ORDER BY 2 DESC

--4.--Show us our top 15 managers' performances so far

SELECT TOP 15
    ManagerName,
    Department,
    ROUND (AVG (EmpSatisfaction), 2) AS Average_Satisfaction_Rating
FROM [dbo].[Employees]
WHERE 
    ManagerName IS NOT NULL
GROUP BY 
    ManagerName, Department
ORDER BY 3 DESC


--5.-- What is our gender ratio by department

SELECT
    Department,
    Sex AS Gender,
    COUNT(*) AS Staff_Count
FROM [dbo].[Employees]
GROUP BY 
    Department, Sex
ORDER BY 1,2 DESC


--6.--What is our Race Ratio by Department

SELECT
    Department,
    RaceDesc,
    COUNT(*) AS Staff_Count
FROM [dbo].[Employees]
GROUP BY 
    Department, RaceDesc
ORDER BY 1,2 DESC


--7.--What are our employees' performances based on recruitment source

SELECT
    RecruitmentSource,
    ROUND (AVG (EmpSatisfaction), 2) AS Average_Satisfaction_Rating
FROM [dbo].[Employees]
GROUP BY 
    RecruitmentSource
ORDER BY 2 DESC

--8.--What is the average salary by department

SELECT
    Department,
    ROUND (AVG (Salary), 2) AS Average_Salary
FROM [dbo].[Employees]
GROUP BY 
    Department
ORDER BY 2 DESC

--9.--What has been our average salary per year, since year 2010 - 2018

SELECT
    YEAR (DateofHire) AS Hire_Year,
    ROUND (AVG (Salary), 2) AS Average_Salary
FROM [dbo].[Employees]
WHERE 
    YEAR (DateofHire) BETWEEN 2010 AND 2018
GROUP BY 
    YEAR (DateofHire)
ORDER BY 1 

--10.--	What is our average employee satisfaction rating per year

SELECT
    YEAR (DateofHire) AS Hire_Year,
    ROUND (AVG (EmpSatisfaction), 2) AS Average_Satisfaction_Rating
FROM [dbo].[Employees]
GROUP BY 
    YEAR(DateofHire)
ORDER BY 1



