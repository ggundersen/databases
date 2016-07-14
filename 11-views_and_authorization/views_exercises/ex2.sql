/*
 * Write an instead-of trigger that enables updates to the stars attribute of 
 * view LateRating.
 *
 * Policy: Updates to attribute stars in LateRating should update Rating.stars 
 * for the corresponding movie rating. (You may assume attributes 
 * [mID,ratingDate] together are a key for table Rating.) Make sure the mID and 
 * ratingDate attributes of view LateRating have not also been updated -- if 
 * either one has been updated, don't make any changes. Don't worry about 
 * updates to title.
 */

CREATE TRIGGER LateRatingStarsUpdate
INSTEAD OF UPDATE ON LateRating
FOR EACH ROW
BEGIN
    UPDATE Rating
    SET stars = New.stars
    WHERE mID = New.mID AND ratingDate = New.ratingDate;
END;

