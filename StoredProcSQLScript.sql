--Two statements that drop the two stored Procedures
drop Procedure AddStudent;
drop Procedure AddInstructor;

--A Stored Procedure (referred to later as StoredProc1)

DELIMITER $$
CREATE PROCEDURE AddStudent
(IN studentId INT, IN firstName VARCHAR(40), IN lastName VARCHAR(40), IN gradDate DATE, OUT OutComeMsg VARCHAR(150))

BEGIN
  DECLARE DateDiffVal FLOAT;

  SELECT DATEDIFF(gradDate, now()) into DateDiffVal;

  IF studentId <= 0 THEN
    SELECT "studentId must be GREATER than 0" into OutComeMsg;
  elseIF isnull(firstName) THEN
    SELECT "firstName must NOT be null" into OutComeMsg;
  elseIF isnull(lastName) THEN
    SELECT "lastName must NOT be null" into OutComeMsg;
  ELSEIf DateDiffVal <= 0 then
    SELECT "gradDate must be greater than todays date" into OutComeMsg;
  else
    INSERT INTO Student (studentId, firstName, lastName, gradDate)
      VALUES (studentId, firstName, lastName, gradDate);

    SELECT "Record added to the Student table" into OutComeMsg;
  END IF;

END$$
DELIMITER ;

--A Stored Procedure (referred to later as StoredProc2)

DELIMITER $$
CREATE PROCEDURE AddInstructor 
(IN empId INT, IN firstName VARCHAR(40), IN lastName VARCHAR(40), IN subject CHAR(20), OUT OutComeMsg VARCHAR(150))
BEGIN
  IF empId <= 0 THEN
    SELECT "empId needs to be GREATER than 0" into OutComeMsg;
  elseIF isnull(firstName) THEN
    SELECT "firstName can NOT be null" into OutComeMsg;
  elseIF isnull(lastName) THEN
    SELECT "lastName can NOT be null" into OutComeMsg;
  elseIF isnull(subject) THEN
    SELECT "subject can NOT be null" into OutComeMsg;
  else
    INSERT INTO Instructor(empId, firstName, lastName, subject)
      VALUES (empId, firstName, lastName, subject);
    
    SELECT "Record added to the Instructor table" into OutComeMsg;
  END IF;

END$$
DELIMITER ;

--SQL statements that call StoredProc1 and validate each possible path

call AddStudent (-329456881, 'Kyriakos', 'Papadakos', '2022-04-22', @OutComeMsg);
Select @OutComeMsg;

call AddStudent (719233467, null, 'Papadakos', '2022-04-22', @OutComeMsg);
Select @OutComeMsg;

call AddStudent (719233467, 'Kyriakos', null, '2022-04-22', @OutComeMsg);
Select @OutComeMsg;

call AddStudent (719233467, 'Kyriakos', 'Papadakos', '2018-04-22', @OutComeMsg);
Select @OutComeMsg;

call AddStudent (719233467, 'Kyriakos', 'Papadakos', '2022-04-22', @OutComeMsg);
Select @OutComeMsg;

--SQL statements that call StoredProc2 and validate each possible path 

call AddInstructor (-121345908, 'Annalise', 'Keating', 'Special Topics', @OutComeMsg);
Select @OutComeMsg;

call AddInstructor (121345908, null, 'Keating', 'Special Topics', @OutComeMsg);
Select @OutComeMsg;

call AddInstructor (121345908, 'Annalise', null, 'Special Topics', @OutComeMsg);
Select @OutComeMsg;

call AddInstructor (121345908, 'Annalise', 'Keating', null, @OutComeMsg);
Select @OutComeMsg;

call AddInstructor (121345908, 'Annalise', 'Keating', 'Special Topics', @OutComeMsg);
Select @OutComeMsg;
