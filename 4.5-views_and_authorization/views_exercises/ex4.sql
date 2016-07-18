/*
 * Finally, write a single instead-of trigger that combines all three of the 
 * previous triggers to enable simultaneous updates to attributes mID, title, 
 * and/or stars in view LateRating. Combine the view-update policies of the 
 * three previous problems, with the exception that mID may now be updated. 
 * Make sure the ratingDate attribute of view LateRating has not also been 
 * updated -- if it has been updated, don't make any changes. 
 */

CREATE TRIGGER LateRatingUpdate
INSTEAD OF UPDATE ON LateRating
FOR EACH ROW
-- Don't make any changes if ratingDate has changed.
WHEN Old.mID IN (SELECT mID FROM Rating WHERE ratingDate = New.RatingDate)
BEGIN
    UPDATE Movie
    SET 
      title = New.title,
      mID = New.mID
    WHERE mID = Old.mID;
    
    UPDATE Rating
    SET stars = New.stars
    -- Remember, (mID, ratingDate) is a key for Rating.
    WHERE mID = Old.mID AND ratingDate = Old.ratingDate;
    
    -- We cannot combine this upate with the above update because Rating has
    -- a combined key with ratingDate.
    UPDATE Rating
    SET mID = New.mID
    WHERE mID = Old.mID;
END;
