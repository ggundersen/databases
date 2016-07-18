/*
 * Write a trigger that automatically deletes students when they graduate, 
 * i.e., when their grade is updated to exceed 12. 
 */

CREATE TRIGGER graduate
AFTER UPDATE ON Highschooler
FOR EACH ROW
WHEN New.grade > 12
BEGIN
    DELETE FROM Highschooler
    WHERE ID = New.ID;
END;

