-- DELETE FROM ALL TABLE
DELETE FROM StudCourse;
DELETE FROM Course;
DELETE FROM Student;
DELETE FROM Instructor;
DELETE FROM Room;

-- insert 10 records into Room
INSERT INTO Room
VALUES	(101, 'Green', 'n', 'y'),
	(601, 'Green', 'y', NULL),
	(305, 'Yellow', 'n', 'n'),
	(415, 'Yellow', 'n', NULL),
	(620, 'Red', 'y', 'y'),
	(504, 'White', 'n', 'y'),
	(206, 'Black', NULL, 'y'),
	(119, 'Orange', 'y', 'y'),
	(512, 'Pink', NULL, NULL),
	(702, 'Pink', 'n', 'n');

-- insert 10 records into Instructor
INSERT INTO Instructor
VALUES	(293827383, 'Raymond', 'Hand', 'History'),
	(837283942, 'John', 'Keating', 'English'),
	(638104829, 'John', 'Kimble', 'Physical Education'),
	(749283017, 'Veronica', 'Vaugn', 'History'),
	(394817737, 'Walter', 'White', 'Science'),
	(558922756, 'Sherman', 'Klump', 'Science'),
	(928401093, 'Rosemary', 'Cross', 'English'),
	(102948575, 'Charles', 'Xavier', 'Music'),
	(485773921, 'Ned', 'Schneebly', 'Music'),
	(209173751, 'Elizabeth', 'Halsey', 'Music');

-- insert 10 records into Student
INSERT INTO Student
VALUES	(208512806, 'Jeff', 'Spicoli', '2023-06-18'),
	(393827467, 'Mitch', 'Kramer', '2025-04-22'),
	(756483950, 'Ferris', 'Bueller', '2022-04-18'),
	(919283004, 'Cher', 'Horowitz', '2022-04-18'),
	(849502735, 'Danny', 'Zuko', '2022-04-18'),
	(903486754, 'Jesus', 'Shuttlesworth', '2021-06-18'),
	(209513498, 'Boobie', 'Miles', '2021-06-18'),
	(307736454, 'Regina', 'George', '2023-06-18'),
	(505984373, 'John', 'Bender', '2024-04-22'),
	(333294575, 'Marty', 'McFly', '2025-04-22');

-- insert 10 records into Course
INSERT INTO Course (prefix, courseNum, empId, roomNum, courseName)
VALUES	('MUS', 2011, 485773921, 101, 'Music in Media'),
	('MUS', 4700, 209173751, 305, 'Annie The Musical'),
	('HIS', 3450, 293827383, 415, 'U.S. History'), 
	('ENG', 2100, 928401093, 504, 'Women in Literature'),
	('SCI', 4240, 394817737, 601, 'Intro to Chemistry'),
	('HIS', 2730, 749283017, 512, 'Politics and Government'),
	('GYM', 2001, 638104829, 504, 'Weight Training'),
	('ENG', 4730, 837283942, 206, 'European Literature'),
	('SCI', 2100, 558922756, 119, 'Intro to Biology'),
	('MUS', 4750, 102948575, 702, 'X-Men The Musical');

-- insert 10 records into StudCourse
INSERT INTO StudCourse(studentId, finalGrade)
VALUES	(756483950, 83.47),
	(209513498, 100.00),
	(208512806, 78.89),
	(393827467, 93.54),
	(333294575, 88.72),
	(307736454, 96.22),
	(849502735, 94.32),
	(505984373, 48.33),
	(903486754, 85.76),
	(919283004, 98.44);

-- validate number of records added
SELECT * FROM StudCourse;
SELECT * FROM Course;
SELECT * FROM Student;
SELECT * FROM Instructor;
SELECT * FROM Room;

-- update and delete from Room table
UPDATE Room
SET building = 'Red'
WHERE building = 'Orange';

DELETE FROM Room
WHERE roomNum = 620;

-- update and delete from Instructor table
UPDATE Instructor
SET subject = 'Arts'
WHERE subject = 'Music';

DELETE FROM Instructor
WHERE empId = 102948575;

-- update and delete from Student table
UPDATE Student
SET gradDate = '2025-04-22'
WHERE studentId = 505984373;

DELETE FROM Student
WHERE studentId = 209513498;

-- update and delete from Course table
UPDATE Course
SET roomNum = 504
WHERE prefix = 'ENG' AND courseNum = 4730;

DELETE FROM Course
WHERE prefix = 'MUS' AND courseNum = 4750;

-- update and delete from StudCourse table
UPDATE StudCourse
SET finalGrade = 90
WHERE studentId = 333294575;

DELETE FROM StudCourse
WHERE studentId = 209513498;

-- validate number of records added
SELECT * FROM StudCourse;
SELECT * FROM Course;
SELECT * FROM Student;
SELECT * FROM Instructor;
SELECT * FROM Room;
