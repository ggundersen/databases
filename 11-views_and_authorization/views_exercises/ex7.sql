/*
 * Write an instead-of trigger that enables insertions into view HighlyRated.
 *
 * Policy: An insertion should be accepted only when the (mID,title) pair 
 * already exists in the Movie table. (Otherwise, do nothing.) Insertions into
 * view HighlyRated should add a new rating for the inserted movie with 
 * rID = 201, stars = 5, and NULL ratingDate. 
 */

CREATE TRIGGER HighlyRatedInsert
INSTEAD OF INSERT ON HighlyRated
FOR EACH ROW
WHEN EXISTS (SELECT * FROM Movie WHERE mID = New.mID AND title = New.title)
BEGIN
    INSERT INTO Rating (mID, rID, stars, ratingDate)
    VALUES (New.mID, 201, 5, NULL);
END;

