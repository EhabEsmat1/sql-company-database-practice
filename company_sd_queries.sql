SELECT * FROM Employee
SELECT * FROM Project
SELECT * FROM Works_for
SELECT * FROM Departments
SELECT * FROM Dependent


--1
SELECT * FROM Employee
WHERE Dno = 10;

--2
SELECT Fname+' '+Lname as Fullname,Salary
FROM Employee
WHERE Salary > 1500

--3
SELECT * FROM Project
WHERE Plocation = 'Zaied City'

--4
SELECT E.Fname, D.Dname
FROM Employee E
JOIN Departments D ON E.Dno = D.Dnum;

--5
SELECT Dno, COUNT(*) AS EmployeeCount
FROM Employee
GROUP BY Dno;

--6
SELECT P.Pname,P.Pnumber,Count(Fname) as [number of employees working on Project]
FROM Employee E
join Works_for wf on E.SSN = wf.ESSn
join Project P on wf.Pno = P.Pnumber
Group by p.Pnumber , P.Pname

--7
SELECT Fname+' '+Lname as FullName ,D.Dependent_name
FROM Employee E
inner join Dependent D on E.SSN = D.ESSN

--8
SELECT 
    E.Fname + ' ' + E.Lname AS FullName,
    COUNT(P.Pnumber) AS ProjectCount
FROM Employee E
LEFT JOIN Works_for wf ON E.SSN = wf.ESSn
LEFT JOIN Project P ON wf.Pno = P.Pnumber
GROUP BY E.Fname, E.Lname;

--9
SELECT Max(Salary) as [Top Salary] ,D.Dname
FROM Employee E
join Departments D on E.Dno = D.Dnum
group by Dname

--10
SELECT top 1 Fname+' '+Lname as FullName ,Salary
FROM Employee
order by Salary desc

--11
SELECT Fname+' '+Lname as FullName , Salary
FROM Employee E
WHERE (SELECT AVG(Salary) from Employee)
< Salary

--12
SELECT D.Dname,E.Fname+' '+E.Lname as FullName
FROM Departments D
join Employee E on D.MGRSSN = E.SSN

--13
SELECT E.Fname + ' ' + E.Lname AS FullName
FROM Employee E
JOIN Works_for wf ON E.SSN = wf.ESSn
GROUP BY E.SSN, E.Fname, E.Lname
HAVING COUNT(wf.Pno) =
    (SELECT COUNT(*) FROM Project);

