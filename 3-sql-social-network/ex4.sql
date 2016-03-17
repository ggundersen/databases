/*
 * Exercise 4:
 * Find all students who do not appear in the Likes table (as a student who likes or is liked) and return their names and grades.
 * Sort by grade, then by name within each grade.  
 */

SELECT name, grade
FROM Highschooler
WHERE NOT EXISTS (
  SELECT * FROM Likes WHERE ID1 = ID
)
AND NOT EXISTS (
  SELECT * FROM Likes WHERE ID2 = ID
);