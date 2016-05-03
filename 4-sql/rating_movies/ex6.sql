/*
 * Exercise 6:
 * For all cases where the same reviewer rated the same movie twice and gave it a higher rating the second time,
 * return the reviewer's name and the title of the movie. 
 */

SELECT m1.name, m1.title
FROM (Movie NATURAL JOIN Reviewer NATURAL JOIN Rating) AS m1
  JOIN (Movie NATURAL JOIN Reviewer NATURAL JOIN Rating) AS m2
WHERE m1.title = m2.title
  AND m1.name = m2.name
  AND m1.ratingDate > m2.ratingDate
  AND m1.stars > m2.stars;