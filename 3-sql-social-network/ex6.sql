/*
 * Exercise 6:
 * Find names and grades of students who only have friends in the same grade.
 * Return the result sorted by grade, then by name within each grade. 
 */

/* Students with any friend in the same grade */
SELECT h1.name, h1.grade
FROM Highschooler h1
  JOIN Friend f ON f.ID1 = h1.ID
  JOIN Highschooler h2 ON h2.ID = f.ID2
WHERE h2.grade = h1.grade

EXCEPT

/* Students with any friend not in the same grade */
SELECT h1.name, h1.grade
FROM Highschooler h1
  JOIN Friend f ON f.ID1 = h1.ID
  JOIN Highschooler h2 ON h2.ID = f.ID2
WHERE h2.grade != h1.grade

ORDER BY h1.grade, h1.name;