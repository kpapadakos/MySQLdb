--Three statements that drop the three views (referred to below as View1, View2, and View3)

DROP VIEW ViewStudentReport;
DROP VIEW ViewCourseReport;
DROP VIEW ViewTopStudent;

--A statement that creates a view that combines at least 2 tables (referred to later as View1) 

CREATE View ViewStudentReport AS
SELECT s.studentId, s.firstName, s.lastName, sc.finalGrade
FROM Student AS s
INNER JOIN
StudCourse AS sc
ON s.studentId = sc.studentId;

--A statement that creates a view that combines at least 3 tables (referred to later as View2)

CREATE View ViewCourseReport AS
SELECT c.prefix, c.courseNum, c.empId, i.lastName, r.roomNum 
FROM Course AS c
INNER JOIN
Instructor AS i
ON c.empId = i.empId
INNER JOIN
Room AS r
ON r.roomNum = c.roomNum
ORDER BY c.prefix;

--A statement that creates a view that uses an aggregate function (referred to later as View3)

CREATE View ViewTopStudent AS
SELECT MAX(sc.finalGrade), s.studentId, s.lastName
FROM Student AS s
INNER JOIN
StudCourse AS sc
On sc.studentId = s.studentId;

--A select statement that utilizes View1

SELECT *
FROM ViewTopStudent;

--A select statement that utilizes View2

SELECT MIN(finalGrade)
FROM ViewStudentReport;

--A select statement that utilizes View3

SELECT *
FROM ViewCourseReport;
