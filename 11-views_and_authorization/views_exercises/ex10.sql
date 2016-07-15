/*
 * Write an instead-of trigger that enables deletions from view NoRating.
 *
 * Policy: Deletions from view NoRating should add a new rating for the 
 * deleted movie with rID = 201, stars = 1, and NULL ratingDate.
 */

CREATE TRIGGER NoRatingDelete
INSTEAD OF DELETE ON NoRating
FOR EACH ROW
BEGIN
    INSERT INTO Rating (mId, rID, stars, ratingDate)
    VALUES (Old.mID, 201, 1, NULL);
END;

