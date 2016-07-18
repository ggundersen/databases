/*
 * Write a trigger to enforce the following behavior: If A liked B but is 
 * updated to A liking C instead, and B and C were friends, make B and C no 
 * longer friends. Don't forget to delete the friendship in both directions, and
 * make sure the trigger only runs when the "liked" (ID2) person is changed but 
 * the "liking" (ID1) person is not changed. 
 */

CREATE TRIGGER heartbreak
AFTER UPDATE ON Likes
FOR EACH ROW
WHEN 
    -- When the liked person changes, but the liker does not.
    (New.ID1 = Old.ID1 AND New.ID2 != Old.ID2)
    AND 
    -- The two liked persons were friends.
    (
        -- B is friends with C.
        (EXISTS (SELECT ID1 FROM Friend WHERE ID1 = Old.ID2 AND ID2 = New.ID2))
        OR
        -- C is friends with B.
        (EXISTS (SELECT ID1 FROM Friend WHERE ID1 = New.ID2 AND ID2 = Old.ID2))
    )
BEGIN
    DELETE FROM Friend
    WHERE 
        -- B is friends with C.
        (ID1 = Old.ID2 AND ID2 = New.ID2)
        OR
        -- C is friends with B.
        (ID1 = New.ID2 AND ID2 = Old.ID2);
END;

