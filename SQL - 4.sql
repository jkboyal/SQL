--1.
CREATE DATABASE "Boyal_Japneet_Test"
GO

USE Boyal_Japneet_Test

--2.
CREATE TABLE Employees
(
EmployeeID INT NOT NULL PRIMARY KEY,
lastname VARCHAR(25) NOT NULL,
firstname VARCHAR(25) NOT NULL,
);


 CREATE TABLE areas
 (
 areaid INTEGER NOT NULL,
area VARCHAR(40) NOT NULL,
 regionalid VARCHAR(25) NOT NULL
 );

  CREATE TABLE employeearea
 (
 EmployeeID INTEGER NOT NULL,
 areaid INTEGER NOT NULL
 );

 --Alter Database structure
 ALTER TABLE Employees
 ADD employee_salary INTEGER NULL; 

 --Altering Table EMPLOYEE  and adding Primary Key constraint
 ALTER TABLE Employees
 ADD CONSTRAINT key_1 PRIMARY KEY(EmployeeID);


 --Inserting data into the Employees table
INSERT INTO Employees VALUES(101, 'Guan', 'Brandon')
INSERT INTO Employees VALUES(102, 'Ray', 'Deb')
INSERT INTO Employees VALUES(103, 'Arya', 'Stark')
INSERT INTO Employees VALUES(104, 'Potter', 'Harry')
INSERT INTO Employees VALUES(105, 'Nolan', 'Chris')
INSERT INTO Employees VALUES(106, 'Andrews', 'Archie')
INSERT INTO Employees VALUES(107, 'Cooper', 'Betty')
INSERT INTO Employees VALUES(108, 'Jones', 'Jughead')
INSERT INTO Employees VALUES(109, 'Lodge', 'Veronica')
INSERT INTO Employees VALUES(110, 'Spade', 'Kate')

--Inserting data into the employeearea table
INSERT INTO  employeearea VALUES(101, 98105)
INSERT INTO employeearea VALUES(102, 98915)
INSERT INTO employeearea VALUES(103, 98165)
INSERT INTO employeearea VALUES(104, 98867)
INSERT INTO employeearea VALUES(105, 98101)


--Select top 2 from Employee Table
SELECT TOP 2 * FROM Employees;

--Select Employees from table whose first name starts with K
SELECT * FROM EMPLOYEES WHERE firstname like 'K%'

--Select Employees from table whose last name starts with A
SELECT * FROM Employees WHERE lastname like 'A%'

--Select top 3 from employeearea Table
SELECT TOP 3 * FROM employeearea;

--Select Employee ID from table whose area starts with 981
SELECT * FROM employeearea WHERE areaid like '981%';

--Dropping table
DROP TABLE areas
DROP TABLE employeearea

 --3.
CREATE TABLE TargetCustomers
(
TargetID INT NOT NULL PRIMARY KEY,
FirstName VARCHAR(40) NOT NULL,
LastName VARCHAR(40) NOT NULL,
Address VARCHAR(40) NOT NULL,
City VARCHAR(40) NOT NULL,
State VARCHAR(40) NOT NULL,
ZipCode INT NOT NULL
);

CREATE TABLE MailingLists
(
MailingListID INT NOT NULL PRIMARY KEY,
MailingList VARCHAR(40) NOT NULL
);

CREATE TABLE TargetMailingLists
(
TargetID INT NOT NULL,
MailingListID  INT NOT NULL,
FOREIGN KEY (TargetID) REFERENCES TargetCustomers(TargetID), 
FOREIGN KEY (MailingListID) REFERENCES MailingLists(MailingListID)
)

ALTER TABLE TargetMailingLists
ADD CONSTRAINT PK PRIMARY KEY(TargetID,MailingListID);