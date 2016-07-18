/*
 * Exercise 3:
 * Find the titles of all movies that have no ratings. 
 */

SELECT title FROM Movie
WHERE mID NOT IN (SELECT mID FROM Rating);