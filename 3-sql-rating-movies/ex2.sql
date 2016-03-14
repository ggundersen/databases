/*
 * Exercise 2:
 * Find all years that have a movie that received a rating of 4 or 5, and sort them in increasing order. 
 */

SELECT DISTINCT year FROM Movie
NATURAL JOIN Rating
WHERE stars = 4 OR stars = 5;