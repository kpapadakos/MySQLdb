-- Two statements that drop the two stored procedures that you are going to create

DROP PROCEDURE AddNewStudentNoExceptionNoWarning;
DROP PROCEDURE AddNewStudentExceptionNoWarning;

-- A statement to create a stored procedure with handlers for sqlexception and sqlwarning that will not trigger an exception when called

Delimiter //

Create Procedure AddNewStudentNoExceptionNoWarning()
BEGIN
DECLARE exit handler for sqlexception
BEGIN
  ROLLBACK;
    select 'sql exception';
END;

DECLARE exit handler for sqlwarning
BEGIN
  ROLLBACK;
   select 'sql warning';
END;

START TRANSACTION;

-- Insert 1 record into Student table

INSERT INTO Student
VALUES
 (616452314, 'Tyler', 'Durden', '2001-06-18');

INSERT INTO StudCourse(studentId, finalGrade)
VALUES
 (616452314, 77.77);

END //

-- A statement to create a stored procedure with handlers for sqlexception and sqlwarning that will trigger an exception when called.

Create Procedure AddNewStudentExceptionNoWarning()
BEGIN
DECLARE exit handler for sqlexception
BEGIN
  ROLLBACK;
   select 'sql exception';
END;

DECLARE exit handler for sqlwarning
BEGIN
  ROLLBACK;
   select 'sql warning';
END;

START TRANSACTION;

-- insert 1 record into Student table (with an error) 
-- A student exists with studentId = 505984373  

INSERT INTO Student
VALUES
  (505984373, 'Fogel', 'McLovin', '2022-04-18');

END //

Delimiter ;

-- Two statements that call the two stored procedure that you created.

Call AddNewStudentNoExceptionNoWarning();

Call AddNewStudentExceptionNoWarning();
