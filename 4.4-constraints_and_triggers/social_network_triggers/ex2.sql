/*
 * Write one or more triggers to manage the grade attribute of new 
 * Highschoolers. If the inserted tuple has a value less than 9 or greater than 
 * 12, change the value to NULL. On the other hand, if the inserted tuple has a 
 * null value for grade, change it to 9. 
 */

CREATE TRIGGER r1
AFTER INSERT ON Highschooler
FOR EACH ROW
WHEN New.grade IS NULL
BEGIN
    UPDATE Highschooler
    SET grade = 9
    WHERE ID = new.ID;
END;

| -- This pipe is required by the Lagunitas grading system.

CREATE TRIGGER r2
AFTER INSERT ON Highschooler
FOR EACH ROW
WHEN New.grade < 9 OR New.grade > 12
BEGIN
    UPDATE Highschooler
    SET grade = NULL
    WHERE ID = new.ID;
END;

