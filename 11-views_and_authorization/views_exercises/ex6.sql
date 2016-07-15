/*
 * Write an instead-of trigger that enables deletions from view HighlyRated.
 *
 * Policy: Deletions from view HighlyRated should update all ratings for the 
 * corresponding movie that have stars > 3 so they have stars = 3.
 */

CREATE TRIGGER HighlyRatedDelete
INSTEAD OF DELETE ON HighlyRated
FOR EACH ROW
BEGIN
    UPDATE Rating
    SET stars = 3
    WHERE stars > 3
    AND mID = Old.mID;
END;

