/*
 * Exercise 1:
 * Find the names of all students who are friends with someone named Gabriel.
 */

SELECT h1.name
FROM Highschooler h1
  JOIN Friend ON Friend.ID1 = h1.ID
  JOIN Highschooler h2 ON h2.ID = Friend.ID2
WHERE h2.name = "Gabriel";