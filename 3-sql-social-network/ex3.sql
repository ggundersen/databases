/*
 * Exercise 3:
 * For every pair of students who both like each other, return the name and grade of both students.
 * Include each pair only once, with the two names in alphabetical order. 
 */

SELECT h1.name, h1.grade, h2.name, h2.grade
FROM Highschooler h1
  JOIN Likes l1 ON l1.ID1 = h1.ID
  JOIN Highschooler h2 ON h2.ID = l1.ID2
  JOIN Likes l2 ON l2.ID1 = h2.ID
  JOIN Highschooler h3 ON h3.ID = l2.ID2
WHERE h3.ID = h1.ID
  AND h1.name < h2.name;