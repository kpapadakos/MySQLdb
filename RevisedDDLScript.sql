-- DROP ALL TABLES
DROP TABLE IF EXISTS StudCourse;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Instructor;
DROP TABLE IF EXISTS Room;

-- create Room table
CREATE TABLE Room (
roomNum		INT,
building	CHAR(15),
lab		ENUM('y','n'),
testRoom	ENUM('y','n'),

CONSTRAINT RoomPK PRIMARY KEY (roomNum)
);

-- create Instructor table
CREATE TABLE Instructor (
empId		INT,
firstName	VARCHAR(40),
lastName	VARCHAR(40),
subject		CHAR(20),

CONSTRAINT InstructorPK PRIMARY KEY (empId)
);

-- create Student table
CREATE TABLE Student (
studentId	INT,
firstName	VARCHAR(40),
lastName	VARCHAR(40),
gradDate	DATE,

CONSTRAINT StudentPK PRIMARY KEY (studentId)
);

-- create Course table
CREATE TABLE Course (
courseID	INT PRIMARY KEY AUTO_INCREMENT,
prefix		CHAR(3),
courseNum	INT,
empId		INT,
roomNum		INT,
courseName	VARCHAR(35),

CONSTRAINT empFK FOREIGN KEY (empId) REFERENCES Instructor(empId)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT roomNumFK FOREIGN KEY (roomNum) REFERENCES Room(roomNum)
ON DELETE CASCADE
ON UPDATE CASCADE
);

-- create StudCourse table
CREATE TABLE StudCourse (
studCourseId	INT PRIMARY KEY AUTO_INCREMENT,
studentId	INT,
finalGrade	FLOAT,

CONSTRAINT scidFK FOREIGN KEY (studcourseId) REFERENCES Course(courseID)
ON DELETE CASCADE
ON UPDATE CASCADE,
CONSTRAINT studIdFK FOREIGN KEY (studentId) REFERENCES Student(studentId)
ON DELETE CASCADE
ON UPDATE CASCADE
);

