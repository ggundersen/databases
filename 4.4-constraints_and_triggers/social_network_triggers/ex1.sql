/*
 * Write a trigger that makes new students named 'Friendly' automatically like 
 * everyone else in their grade. That is, after the trigger runs, we should have 
 *('Friendly', A) in the Likes table for every other Highschooler A in the same 
 * grade as 'Friendly'. 
 */

CREATE TRIGGER gregarious
AFTER INSERT ON Highschooler
FOR EACH ROW
WHEN New.name = "Friendly"
BEGIN
  INSERT INTO Likes (ID1, ID2)
  SELECT New.ID, h.ID FROM Highschooler h
  WHERE h.grade = New.grade AND h.ID != New.ID;
END;

