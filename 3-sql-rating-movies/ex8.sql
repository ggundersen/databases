/*
 * Exercise 8:
 * For each movie, return the title and the 'rating spread', that is, the difference between highest and lowest ratings given to that movie.
 * Sort by rating spread from highest to lowest, then by movie title. 
 */

SELECT * FROM (
  SELECT title, MAX(stars) - MIN(stars) AS spread
  FROM Rating NATURAL JOIN Movie NATURAL JOIN Reviewer
  GROUP BY title
) ORDER BY spread DESC, title ASC;