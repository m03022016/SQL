-- DATA ANALYST CLASS FINAL PROJECT
-- In this file we perform the SQL work for the filanl project of 2024 Spring DA cohort
/*
PROJECT REQUIREMENTS
1. Import the CSV (Flat files data) to SQL Database
- Import the tables EmployeeSampleDataCSV, DepartmentSampleDataCSV. to SQL database Emp_DB
- While importing, ensure to select right data types for each attribute (Ex. Hire Date & Exit date to be Date, Annual_Sal to be Int/Float, Bonus to be float)
- Select Employee_ID and Dept_ID as primary Key (Select Check Box)
2. After the tables created in Emp_DB, ensure to use Alter command to add Foreign Key for EmployeeSampleDataCSV (EDept_ID), DepartmentSampleDataCSV (Dept_Id)
3. The Direct query should contain the below data attributes
-Employee_Id,
-Full_Name,
-Business_Unit,
-Gender,
-Ethnicity,
-Annual_Salary,
-Bonus,
-Department_Name,
-Dept_State,
-Dept_Zip,
-Dep_Country,
-(Annual_Salary+(Annual_Salary*Convert(float, Bonus)/100)) as 'Revised Sal'
4. Use inner Join for direct query using the table EmployeeSampleDataCSV, DepartmentSampleDataCSV
*/

--Creating new Data Base
Create database Emp_DB;
use Emp_DB;

-- Importing EmployeeSampleDataCSV table to Emp_DB Database (SQL Wizard is used)
Select * FROM EMPLOYEE; -- checking if the import was succesful

-- Importing DepartmentSampleDataCSV table to Emp_DB Database (SQL Wizard is used)
Select * FROM DEPARTMENT; -- checking if the import was succesful

-- Adding a foreign key constrain to the DEPARTMENT table
Alter table EMPLOYEE
Add constraint FK_DeptID
Foreign key (Edept_ID) references DEPARTMENT(Dept_ID);

-- Creating the SQL Direct Query for importing data to PowerBI
Select Employee_Id, Full_Name, Business_Unit, Gender, Ethnicity, Annual_Salary, Bonus, 
	Department_Name, Dept_State, Dept_Zip, Dep_Country,
	(Annual_Salary+(Annual_Salary*Bonus)/100) as 'Revised_Sal'
From EMPLOYEE E 
JOIN DEPARTMENT DE on E.Edept_ID = DE.Dept_ID;

-- Comparing the average salary from power BI report with SQL function
Select avg(Annual_Salary) as 'Average_Salary', Department_Name
From EMPLOYEE E 
JOIN DEPARTMENT DE on E.Edept_ID = DE.Dept_ID
Group by Department_Name
Order by Average_Salary;

Begin Tran
DELETE FROM EMPLO
WHERE Edept_ID = 'D003';

commit
Rollback Tran


Select count(Edept_ID) from Employee
Where Edept_ID = 'D003';

SELECT * INTO EMPLO
FROM EMPLOYEE

SELECT * FROM EMPLO

Alter table EMPLO
Add constraint FK_DeptID2
Foreign key (Edept_ID) references DEPARTMENT(Dept_ID);

Alter table EMPLO
Add constraint PK_Emplo
PRIMARY KEY (Employee_ID);