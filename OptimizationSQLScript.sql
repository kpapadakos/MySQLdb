--A statement that drops an index that you will create later in the script
drop index Indx_Student_gradDate on Student;

--A select statement that runs a sql statement 
SELECT s.lastName, s.firstName, sc.finalGrade, s.gradDate
FROM Student AS s
JOIN
StudCourse AS sc
WHERE s.studentId = sc.studentId
AND s.gradDate >= STR_TO_DATE('04/18/2022','%m/%d/%Y');

--Use Explain on the A select statement above to see how this query was executed 
Explain 
SELECT s.lastName, s.firstName, sc.finalGrade, s.gradDate 
FROM Student AS s 
JOIN 
StudCourse AS sc 
WHERE s.studentId = sc.studentId 
AND s.gradDate >= STR_TO_DATE('04/18/2022','%m/%d/%Y');

--A statement that creates an index that optimizes the select SQL statement
CREATE INDEX Indx_Student_gradDate ON Student(gradDate) using BTree;

--A select statement that runs the same sql statement
SELECT s.lastName, s.firstName, sc.finalGrade, s.gradDate
FROM Student AS s
JOIN
StudCourse AS sc
WHERE s.studentId = sc.studentId
AND s.gradDate >= STR_TO_DATE('04/18/2022','%m/%d/%Y');

--Use Explain on the A select statement above to see how this query was executed
Explain
SELECT s.lastName, s.firstName, sc.finalGrade, s.gradDate
FROM Student AS s
JOIN
StudCourse AS sc
WHERE s.studentId = sc.studentId
AND s.gradDate >= STR_TO_DATE('04/18/2022','%m/%d/%Y');
