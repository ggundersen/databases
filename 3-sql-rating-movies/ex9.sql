/*
 * Exercise 9:
 * Find the difference between the average rating of movies released before 1980 and the average rating of movies released after 1980.
 * (Make sure to calculate the average rating for each movie, then the average of those averages for movies before 1980 and movies after.
 * Don't just calculate the overall average rating before and after 1980.)
 */

SELECT preAvgStars - postAvgStars
FROM (SELECT AVG(avgStars) AS preAvgStars FROM (
  SELECT name, title, AVG(stars) AS avgStars
  FROM Movie NATURAL JOIN Rating NATURAL JOIN Reviewer
  WHERE year < 1980
  GROUP BY title
))
JOIN
(SELECT AVG(avgStars) AS postAvgStars FROM (
  SELECT name, title, AVG(stars) AS avgStars
  FROM Movie NATURAL JOIN Rating NATURAL JOIN Reviewer
  WHERE year > 1980
  GROUP BY title
));
