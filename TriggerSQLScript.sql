--Drop Log table statement
Drop TABLE dataLog;

--A SQL statement that creates the Log table 
Create TABLE dataLog (
  idNum INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  User VARCHAR(255) NOT NULL,
  TableName VARCHAR(255) NOT NULL,
  Action VARCHAR(255) NOT NULL,
  Record VARCHAR(255) NOT NULL,
  TimeStamp TIMESTAMP
  );

--Three statements that drop the three triggers (referred to below as Trigger1, Trigger2, and Trigger3)
drop Trigger TriggerInsertStudent;
drop Trigger TriggerUpdateRoom;
drop Trigger TriggerDeleteInstructor;

--A trigger that fires on an insert (referred to later as Trigger1)
DELIMITER $$

CREATE TRIGGER TriggerInsertStudent
AFTER INSERT
ON Student
  FOR EACH ROW
  BEGIN
    SELECT concat('Student = ', NEW.studentId) into @Record;

  
    INSERT INTO dataLog
    (User, TableName, Action, Record, TimeStamp)
    values('kapadakos', 'Student', 'Insert', @Record, now());

END$$
DELIMITER ;

--A trigger that fires on an update (referred to later as Trigger2)
DELIMITER $$

CREATE TRIGGER TriggerUpdateRoom
BEFORE UPDATE
ON Room
  FOR EACH ROW
  BEGIN
    SELECT concat('Old roomNum = ', OLD.roomNum) into @Record;
    
    INSERT INTO dataLog
    (User, TableName, Action, Record, TimeStamp)
    values('kapadakos', 'Room', 'Update', @Record, now());

END$$
DELIMITER ;

--A trigger that fires on a delete (referred to later as Trigger3)
DELIMITER $$

CREATE TRIGGER TriggerDeleteInstructor
AFTER DELETE
ON Instructor
  FOR EACH ROW
  BEGIN
    SELECT concat('Old empId = ', OLD.empId) into @Record;

    INSERT INTO dataLog
    (User, TableName, Action, Record, TimeStamp)
    values ('kapadakos', 'Instructor', 'Delete', @Record, now());

END$$
DELIMITER ;

--A SQL statement that causes Trigger1 to fire

INSERT INTO Student
(studentId, firstName, lastName, gradDate)
values (123555789, 'John', 'Doe', "2022-01-01");

--A SQL statement that validates that Trigger1 was fired

SELECT * FROM dataLog;

--A SQL statement that causes Trigger2 to fire

UPDATE Room
SET lab = 'y' 
WHERE roomNum = 504;

--A SQL statement that validates that Trigger2 was fired

SELECT * FROM dataLog;

--A SQL statement that causes Trigger3 to fire

DELETE FROM Instructor
WHERE empId = 121345908;

--A SQL statement that validates that Trigger3 was fired

SELECT * FROM dataLog;

--A SQL select statement showing the records in the data log table

SELECT * FROM dataLog;
