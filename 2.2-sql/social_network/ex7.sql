/*
 * Exercise 7:
 * For each student A who likes a student B where the two are not friends, find if they have a friend C in common (who can introduce them!).
 * For all such trios, return the name and grade of A, B, and C. 
 */

SELECT a.name, a.grade, b.name, b.grade, c.name, c.grade
FROM Highschooler a
  JOIN Likes l ON l.ID1 = a.ID
  JOIN Highschooler b ON b.ID = l.ID2
  JOIN Friend f ON f.ID2 = a.ID
  JOIN Friend f2 ON f2.ID2 = b.ID
  JOIN Highschooler c ON f.ID1 = c.ID
/* Ensures f and f2 are the same person, i.e. friend C */
WHERE f.ID1 = f2.ID1
/* Where A is not friend with B */
AND a.ID NOT IN (
  SELECT f3.ID1
  FROM Friend f3
  WHERE f3.ID2 = b.ID
);