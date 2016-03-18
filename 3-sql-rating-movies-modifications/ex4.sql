/*
 * Exercise 4:
 * Remove all ratings where the movie's year is before 1970 or after 2000, and the rating is fewer than 4 stars.
 */

DELETE FROM Rating
WHERE mID IN (
  SELECT mID
  FROM Movie
  WHERE year < 1970 OR year > 2000
) AND stars < 4;