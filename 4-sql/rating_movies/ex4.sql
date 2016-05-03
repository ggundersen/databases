/*
 * Exercise 4:
 * Some reviewers didn't provide a date with their rating.
 * Find the names of all reviewers who have ratings with a NULL value for the date. 
 */

SELECT name FROM Reviewer WHERE rID IN (
  SELECT rID FROM Rating WHERE ratingDate IS NULL
);