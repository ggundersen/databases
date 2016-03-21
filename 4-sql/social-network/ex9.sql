/*
 * Exercise 9:
 * Find the name and grade of all students who are liked by more than one other student.
 */

SELECT h.name, h.grade
FROM Highschooler h
  JOIN Likes l ON l.ID2 = h.ID
  JOIN Highschooler h2 ON h2.ID = l.ID1
GROUP BY h.ID
HAVING COUNT(*) > 1;