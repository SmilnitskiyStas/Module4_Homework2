USE AdventureWorks2019;
﻿--------------------------ДОМАШКА----------------------------

----------------------ЗАДАНИЕ №1-----------------------------
--Вывести всю информацию из таблицы Sales.Customer 
-------------------------------------------------------------

SELECT * 
FROM [Sales].[Customer];
GO

----------------------ЗАДАНИЕ №2-----------------------------
--Вывести всю информацию из таблицы Sales.Store отсортированную 
--по Name в алфавитном порядке
-------------------------------------------------------------

SELECT * 
FROM [Sales].[Store]
ORDER BY [Name];
GO

----------------------ЗАДАНИЕ №3-----------------------------
--Вывести из таблицы HumanResources.Employee всю информацию
--о десяти сотрудниках, которые родились позже 1989-09-28
-------------------------------------------------------------

SELECT TOP(10) * 
FROM [HumanResources].[Employee]
WHERE BirthDate > '1989-09-28';
GO

----------------------ЗАДАНИЕ №4-----------------------------
--Вывести из таблицы HumanResources.Employee сотрудников
--у которых последний символ LoginID является 0.
--Вывести только NationalIDNumber, LoginID, JobTitle.
--Данные должны быть отсортированы по JobTitle по убиванию
-------------------------------------------------------------

SELECT 
	NationalIDNumber,
	LoginID,
	JobTitle
FROM [HumanResources].[Employee]
WHERE LoginID LIKE '%0'
ORDER BY JobTitle DESC;
GO

----------------------ЗАДАНИЕ №5-----------------------------
--Вывести из таблицы Person.Person всю информацию о записях, которые были 
--обновлены в 2008 году (ModifiedDate) и MiddleName содержит
--значение и Title не содержит значение 
-------------------------------------------------------------

SELECT *
FROM [Person].[Person]
WHERE ModifiedDate LIKE '%2008%'
	AND MiddleName IS NOT NULL
	AND Title IS NULL;
GO

----------------------ЗАДАНИЕ №6-----------------------------
--Вывести название отдела (HumanResources.Department.Name) БЕЗ повторений
--в которых есть сотрудники
--Использовать таблицы HumanResources.EmployeeDepartmentHistory и HumanResources.Department
-------------------------------------------------------------
SELECT DISTINCT 
	HRD.Name
	FROM [HumanResources].[EmployeeDepartmentHistory] AS HREDH
JOIN [HumanResources].[Department] AS HRD
	ON HRD.DepartmentID = HREDH.DepartmentID
WHERE HREDH.BusinessEntityID IS NOT NULL
GO

----------------------ЗАДАНИЕ №7-----------------------------
--Сгрупировать данные из таблицы Sales.SalesPerson по TerritoryID
--и вывести сумму CommissionPct, если она больше 0
-------------------------------------------------------------

SELECT 
	TerritoryID,
	SUM(CommissionPct) AS [COUNT]
FROM [Sales].[SalesPerson]
WHERE CommissionPct > 0
GROUP BY TerritoryID
GO

----------------------ЗАДАНИЕ №8-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) 
--которые имеют самое большое кол-во 
--отпуска (HumanResources.Employee.VacationHours)
-------------------------------------------------------------

SELECT
	*
FROM [HumanResources].[Employee] AS HRE
WHERE HRE.VacationHours >= 99
GO

----------------------ЗАДАНИЕ №9-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) 
--которые имеют позицию (HumanResources.Employee.JobTitle)
--'Sales Representative' или 'Network Administrator' или 'Network Manager'
-------------------------------------------------------------

SELECT
*
FROM [HumanResources].[Employee]
WHERE JobTitle 
	IN ('Sales Representative', 'Network Administrator', 'Network Manager')
GO

----------------------ЗАДАНИЕ №10-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) и 
--их заказах (Purchasing.PurchaseOrderHeader). ЕСЛИ У СОТРУДНИКА НЕТ
--ЗАКАЗОВ ОН ДОЛЖЕН БЫТЬ ВЫВЕДЕН ТОЖЕ!!!
-------------------------------------------------------------
SELECT
	HRE.*,
	PPOH.*
FROM [HumanResources].[Employee] AS HRE
JOIN [Purchasing].[PurchaseOrderHeader] PPOH
	ON HRE.BusinessEntityID = PPOH.EmployeeID

GO