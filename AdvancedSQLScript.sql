--A select statement that selects data where an attribute is either null or not null

SELECT *
FROM Room
WHERE testRoom IS NOT NULL;

--A select statement that includes an AVG

SELECT AVG(finalGrade)
FROM StudCourse;

--A select statement that includes a COUNT

SELECT COUNT(testRoom)
FROM Room
WHERE testRoom = 'y';

--A select statement that includes a MAX

SELECT MAX(finalGrade)
FROM StudCourse;

--A select statement that includes a MIN

SELECT MIN(finalGrade)
FROM StudCourse
WHERE finalGrade > 89;

--A select statement that includes a SUM

SELECT SUM(finalGrade)
FROM StudCourse;

--A select statement that includes an aggregate function and an ORDER BY

SELECT lastName, COUNT(subject)
FROM Instructor 
WHERE subject != 'Arts'
GROUP BY lastName
ORDER BY lastName;

--A select statement that uses an aggregate function and a HAVING

SELECT studentId, MIN(finalGrade)
FROM StudCourse
GROUP BY finalGrade
HAVING MIN(finalGrade) > 84;

--A select statement with a subquery that includes an IN

SELECT *
FROM Instructor
WHERE subject IN ('Arts', 'English');

--A select statement with another query nested in it
SELECT MAX(finalGrade)
FROM StudCourse
WHERE studentId IN
(
 SELECT studentId
 FROM Student
 WHERE gradDate = '2025-04-22'
);
