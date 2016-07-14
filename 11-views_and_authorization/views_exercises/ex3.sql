/* 
 * Write an instead-of trigger that enables updates to the mID attribute of 
 * view LateRating.
 *
 * Policy: Updates to attribute mID in LateRating should update Movie.mID and
 * Rating.mID for the corresponding movie. Update all Rating tuples with the 
 * old mID, not just the ones contributing to the view. Don't worry about 
 * updates to title, stars, or ratingDate.
 */

CREATE TRIGGER LateRatingMIDUpdate
INSTEAD OF UPDATE ON LateRating
FOR EACH ROW
BEGIN
    UPDATE Rating
    SET mID = New.mID
    WHERE mID = Old.mID;
    UPDATE Movie
    SET mID = New.mID
    WHERE mID = Old.mID;
END;

