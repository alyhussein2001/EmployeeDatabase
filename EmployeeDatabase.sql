-- Table structure for table 'Employee'

CREATE TABLE Employee (
    EmpID        INTEGER PRIMARY KEY
                         NOT NULL,
    FName        TEXT    NOT NULL,
    LName        TEXT    NOT NULL,
    YOB          INTEGER NOT NULL,
    PhoneNumber  INTEGER NOT NULL,
    DepartmentId TEXT    NOT NULL
                         REFERENCES Department (DepartmentId),
    Nationality  TEXT    NOT NULL,
    Salary       INTEGER NOT NULL
);



-- Putting in employee data for 'Employee' table


INSERT INTO Employee (EmpID, FName, LName, YOB, PhoneNumber, DepartmentID, Nationality, Salary)
VALUES(101, Aly, Hussein, 06/01/2001, 7064599586, 1, Egypt. 90000),
(102, Alex, Castillo, 07/08/2001, 7622017497, 1, Mexico, 110000),
(103, Chris, Kyle, 11/22/1997, 7069852145, 3, USA, 80000),
(104, Rachel, Higgins, 04/12/1994, 4045678908, 3, USA, 85000),
(105, Lesly, Park, 02/03/1998, 6788499730, 2, USA, 95000),
(106, Sofia, Hernandez, 06/08/1995, 6411238579, 2, Mexico, 90000),
(107, Mohamed, Salah, 03/16/1991, 4044633158, 2, Egypt, 115000),
(108, Hassan, Silva, 08/14/2000, 6785233176, 1, Egypt, 95000),
(109, Johnny, Mack, 09/22/1998, 7064875312, 1, Australia, 110000),
(110, Marwa, Hanem, 07/12/1989, 6784357821, 3, Saudi Arabia, 85000),
(111, Jacob, Pickens, 12/02/1995, 7812345671, 4, Canada, 96000),
(112, Colby, Winter, 05/16/1995, 8421598764, 4, USA, 110000);


-- Table Structure for table 'Department'


CREATE TABLE Department (
    DepartmentId   INTEGER PRIMARY KEY
                           REFERENCES Employee (Department),
    DepartmentName TEXT
);


-- Putting in department data 'Department' table


INSERT INTO Department (DepartmentID, DepartmentName)
VALUES(1, 'Information Technology'),
(2, 'Marketing'),
(3, 'Human Resources'),
(4, 'Finance');


-- Query 1: List all employees with their first name, last name, and department
SELECT FName, LName, DepartmentName
FROM Employee
JOIN Department ON Employee.DepartmentID = Department.DepartmentID;

-- Query 2: List the number of employees in each department
SELECT DepartmentName, COUNT(EmployeeID) AS TotalEmployees
FROM Employee
JOIN Department ON Employee.DepartmentID = Department.DepartmentID

-- Query 3: Update the phone number of an employee
UPDATE Employee
SET PhoneNumber = 5487698543
WHERE EmployeeID = 104;

-- Query 4: Find the employee with the highest salary
SELECT FName, LName, MAX(Salary) AS HighestSalary
FROM Employee;

-- Query 5: Display the average salary for each department
SELECT DepartmentName, AVG(Salary) AS AverageSalary
FROM Employee
JOIN Department ON Employee.DepartmentID = Department.DepartmentID
GROUP BY DepartmentName;