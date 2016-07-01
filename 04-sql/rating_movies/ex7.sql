/*
 * Exercise 7:
 * For each movie that has at least one rating, find the highest number of stars that movie received.
 * Return the movie title and number of stars. Sort by movie title. 
 */

SELECT * FROM (
  SELECT title, MAX(stars)
  FROM Rating NATURAL JOIN Movie NATURAL JOIN Reviewer
  GROUP BY title
) ORDER BY title ASC;