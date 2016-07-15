/*
 * Write an instead-of trigger that enables insertions into view NoRating.
 *
 * Policy: An insertion should be accepted only when the (mID,title) pair 
 * already exists in the Movie table. (Otherwise, do nothing.) Insertions 
 * into view NoRating should delete all ratings for the corresponding movie.
 */

CREATE TRIGGER NoRatingInsert
INSTEAD OF INSERT ON NoRating
FOR EACH ROW
WHEN EXISTS (SELECT * FROM Movie WHERE mID = New.mID AND title = New.title)
BEGIN
    DELETE FROM Rating
    WHERE mID = New.mID;
END;

