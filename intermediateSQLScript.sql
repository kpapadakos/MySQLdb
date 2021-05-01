--A select statement that selects data from a single table
SELECT *
FROM Student;

--A select statement that selects data from a single table that limits the columns returned;
SELECT prefix, courseName
FROM Course;

--A select statement that selects data from a single table that limits the rows returned;
SELECT *
FROM StudCourse
Where finalGrade >= 90;

--A select statement that selects data from a single table that limits both the columns and the rows returned;
SELECT roomNum, building, testRoom
FROM Room
WHERE testRoom = 'y';

--A select statement that selects data from a single table with a where clause that uses a like 
SELECT lastName, empId
FROM Instructor
WHERE lastName 
LIKE 'K%'; 

--A select statement that selects data from a single table with a where clause that uses a between
SELECT lastName, gradDate
FROM Student
WHERE gradDate
BETWEEN '2021-01-01' AND '2023-01-01';

--A select statement that inner joins two tables
SELECT stu.firstName, stu.lastName, stuco.finalGrade
FROM Student AS stu
INNER JOIN 
StudCourse AS stuco
ON stu.studentId = stuco.studentId;

--A select statement that right joins two tables
SELECT stu.firstName, stu.lastName, stuco.finalGrade
FROM Student AS stu
RIGHT JOIN
StudCourse AS stuco
ON stu.studentId = stuco.studentId;

--A select statement that left joins two tables
SELECT i.firstName, i.lastName, c.roomNum, c.courseName
FROM Instructor AS i
LEFT JOIN
Course AS c
On i.empId = c.empId;
