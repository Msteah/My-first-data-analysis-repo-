--CREATING DATABASE
CREATE DATABASE SQLASSIGNMENT1;

--ACTIVATING DATABASE FOR USE
USE SQLASSIGNMENT1;

--CREATING TABLES
CREATE TABLE CustomerRecord(
CustomerID INT,
CustomerName VARCHAR(50),
Gender VARCHAR(10),
Phone INT,
State VARCHAR(20),
City VARCHAR(20),
Email VARCHAR(40),
CompanyName VARCHAR(50),
);
--INSERTING RECORDS INTO TABLE
INSERT INTO CustomerRecord
Values
(001, 'Tracy Salubi', 'Female', 01289567, 'Rivers', 'Ahoada', 'tracysalubi@gmail.com', 'HovenEnterprise'),
(002, 'Olawumi Fagbote', 'Male', 01487694, 'Ondo', 'Oyun', 'wumifagbote@gmail.com', 'Goodswillandsons'),
(003, 'Adetayo Adekeye', 'Male', 01574829, 'Kwara', 'Osin', 'tayoadekeye@gmail.com', 'JayKaylimited'),
(004, 'Bolanle Adesina', 'Female', 01678430, 'Osun', 'Osogbo', 'boaladesina@gmail.com', 'Excelandsons'),
(005, 'Olumide Kuti', 'Male', 01382749, 'Oyo', 'Ibadan', 'midekuti@gmail.com', 'NBTSSSlimited'),
(006, 'Adekunle Olubanji', 'Male', 01473820, 'Lagos', 'Epe', 'kunlebanji@gmail.com', 'KoreEnterprise'),
(007, 'Iyabo Azeez', 'Female', 01728104, 'Ogun', 'Ifo', 'iyabo453@gmail.com', 'MoyeEnterprise'),
(008, 'Temidayo Ogunrinde', 'Male', 01639016,'Kwara', 'Ilorin', 'dayorinde@gmail.com', 'JayKaylimited'),
(009, 'Opeoluwa Ifafore', 'Female', 01723904, 'Ekiti', 'OyeEkiti', 'opeifafore@gmail.com', 'RealEnterprise'),
(010, 'Ayodele Badmus', 'Female', 01610058, 'Oyo', 'Akinyele', 'ayobadmus@gmail.com', 'NBTSSSlimited');


--CHECKINGTABLES
SELECT*
FROM CustomerRecord;


CREATE TABLE SalesRecord(
SalesID INT,
CustomerName VARCHAR(50),
Date DATE,
Unit INT,
Price INT,
Amount INT,
PaymentMode VARCHAR(20)
);

--INSERING RECORDS INTO TABLES
INSERT INTO SalesRecord
VALUES
(201, 'IyaboAzeez', '1986-09-11', 5, 500, 2500, 'Transfer'),
(202, 'OpeoluwaIfafore','1986-07-04', 1, 2000, 2000, 'POS'),
(203, 'OlumideKuti', '1986-06-18', 3, 5500, 16500, 'Cash'),
(204, 'BolanleAdesina', '1986-02-20', 7, 400, 2800, 'Cash'),
(205, 'AdetayoAdekeye', '1986-10-29', 4, 1000, 4000, 'Credit'),
(206, 'TemidayoOgunrinde', '1986-11-01', 2, 900, 1800, 'Transfer'),
(207, 'TracySalubi', '1986-06-05', 3, 500, 1500, 'Credit'),
(208, 'AyodeleBadmus', '1986-03-07', 5, 1500, 7500, 'POS'),
(209, 'OlawumiFagbote', '1986-10-09', 10, 500, 5000, 'POS'),
(210, 'AdekunleOlubanji', '1986-05-03', 8, 800, 6400, 'Transfer');

--CHECKING TABLES
SELECT *
FROM SalesRecord;

--CREATING TABLES
CREATE TABLE ProductRecord
(ProductID VARCHAR(40),
Category VARCHAR(50),
SubCategory VARCHAR (40),
ProductionName VARCHAR (30)
);

--INSERTING RECORDS INTO TABLES
INSERT INTO ProductRecord
VALUES
('TEC-PH-10002645', 'Technology', 'Phone', 'LG-G2'),
('OFF-AR-10003477','Office Supplies', 'Art', '4009 Highlighters'),
('TEC-AC-10002380', 'Technology', 'Accessories', 'Sony 8GB Memory Card'),
('FUR-CH-10002317','Furniture', 'Chairs', 'Seating Low-Back Swivel Chair'),
('TEC-MA-10003589','Technology', 'Machine', 'Cisco 8961 IP Phone Charcoal');

--CHECKING TABLES
SELECT*
FROM ProductRecord;


/*
Q1 - From the humanresources.employee table, 
write a query in SQL to retrieve all fields and records 
from the employee table in the adventure works database.
sort the result in ascending order of the job title.*/
FOR SORTING, USE THE ORDER BY THEN SPECIFY YOUR COLUMN OF CHOICE.

--ACTIVATING DATABASE FOR USE
USE AdventureWorks2019;

--CHECKING TABLE
SELECT*
FROM HumanResources.Employee;

SELECT*
FROM HumanResources.Employee
ORDER BY JobTitle;


/*Q2 - From the person.person table, 
write a query in SQL to retrieve all fields and records 
from the employee table using table aliasing in the adventure works database.
sort the output in ascending order on last name.*/

SELECT* 
FROM Person.Person;

SELECT*
FROM Person.Person
ORDER BY LastName;

/*Q3 - From the production.product table, 
write a query that displays the productid, name, and color columns.
display only the rows in which the colors is not blue.*/

SELECT*
FROM Production.Product;

SELECT ProductID, Name, Color
FROM Production.Product
WHERE Color <> 'Blue';

/*Q4 - From the person.person table,
write a query in SQL to return all rows and a subset of the columns 
(FirstName, LastName, businessentityid) 
from the person table in the AdventureWorks database. 
The third column heading is renamed to Employee_id. 
Arranged the output in ascending order by lastname. */

SELECT* 
FROM Person.Person;

SELECT FirstName, LastName, BusinessEntityID
FROM Person.Person;

--RENAMING A COLUMN
Exec sp_rename 'Person.Person.BusinessEntityID', 'Employee_id', 'column';

SELECT FirstName, LastName, Employee_id
FROM Person.Person
ORDER BY LastName;

/*Q4 -  From the sales.salesorderheader table 
write a query in SQL to return all rows 
from the salesorderheader table in Adventureworks database 
and calculate the percentage of tax on the subtotal as decided. 
Return salesorderid, customerid, orderdate, subtotal, percentage of tax column. 
Arranged the result set in ascending order on subtotal.*/

SELECT*
FROM Sales.SalesOrderHeader;

SELECT SubTotal, TaxAmt, (TaxAmt/SubTotal)*100 AS PercentTax
FROM Sales.SalesOrderHeader;

SELECT SalesOrderID, CustomerID, OrderDate, SubTotal, (TaxAmt/SubTotal)*100 AS PercentTax
FROM Sales.SalesOrderHeader
ORDER BY SubTotal;


/*Q5 - From the humanresources.employee table 
write a query in SQL to create a list of 
unique jobtitles in the employee table in Adventureworks database. 
Return jobtitle column and arranged the resultset in ascending order.*/

SELECT*
FROM HumanResources.Employee;

SELECT COUNT (DISTINCT JobTitle) AS JobTitleCount
FROM HumanResources.Employee;

SELECT DISTINCT JobTitle
FROM HumanResources.Employee
ORDER BY JobTitle;

/*Q6 - From the sales.salesorderheader table 
write a query in SQL to calculate the total freight paid by each customer. 
Return customerid and total freight. 
Sort the output in ascending order on customerid.*/

SELECT*
FROM Sales.SalesOrderHeader;

SELECT CustomerID, SUM (Freight) AS TotalFreight
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
ORDER BY CustomerID;

/*Q7 - From the production.productinventory table,
write a query in SQL to retrieve total quantity of each productid 
which are in shelf of 'A' or 'C' or 'H'. 
Filter the results for sum quantity is more than 500. 
Return productid and sum of the quantity. 
Sort the results according to the productid in ascending order.*/

SELECT*
FROM Production.ProductInventory;

SELECT Shelf, ProductID, SUM(Quantity) AS TotalQty
FROM Production.ProductInventory
WHERE Shelf IN ('A','C','H')
GROUP BY Shelf, ProductID
HAVING SUM(Quantity) >500
ORDER BY ProductID;



/*Q8 - From the production.productinventory table, 
write a query in SQL to find the sum of the quantity of all combination 
of group of distinct locationid and shelf column. 
Return locationid, shelf and sum of quantity as TotalQuantity.*/

SELECT*
FROM Production.ProductInventory;

SELECT LocationID,Shelf, SUM(Quantity) AS TotalQty
FROM Production.ProductInventory
GROUP BY LocationID,Shelf;

/*Q10 - From the Person.BusinessEntityAddress table 
write a query in SQL to retrieve the number of employees for each City. 
Return city and number of employees. 
Sort the result in ascending order on city.*/

SELECT*
FROM Person.BusinessEntityAddress;


