/*
 * Write one or more triggers to maintain symmetry in friend relationships. 
 * Specifically, if (A,B) is deleted from Friend, then (B,A) should be deleted 
 * too. If (A,B) is inserted into Friend then (B,A) should be inserted too. 
 * Don't worry about updates to the Friend table.
 */

CREATE TRIGGER parity1
AFTER DELETE ON Friend
FOR EACH ROW
BEGIN
    DELETE FROM Friend
    WHERE ID1 = Old.ID2 AND ID2 = Old.ID1;
END;

| -- This pipe is required by the Lagunitas grading system.

CREATE TRIGGER parity2
AFTER INSERT ON Friend
FOR EACH ROW
BEGIN
    INSERT INTO Friend (ID1, ID2)
    VALUES (New.ID2, New.ID1);
END;

