/*
 * Write an instead-of trigger that enables deletions from view NoRating.
 *
 * Policy: Deletions from view NoRating should delete the corresponding movie 
 * from the Movie table.
 */

CREATE TRIGGER NoRatingDelete
INSTEAD OF DELETE ON NoRating
FOR EACH ROW
BEGIN
    DELETE FROM Movie
    WHERE mID = Old.mID;
END;

