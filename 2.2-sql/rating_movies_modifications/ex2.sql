/*
 * Exercise 2:
 * Insert 5-star ratings by James Cameron for all movies in the database.
 * Leave the review date as NULL. 
 */

INSERT INTO Rating (rID, mID, stars, ratingDate)
SELECT r.rID, m.mID, 5, NULL
FROM Movie m
  NATURAL JOIN Reviewer r
WHERE r.name = "James Cameron";