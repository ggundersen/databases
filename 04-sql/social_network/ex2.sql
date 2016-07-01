/*
 * Exercise 2:
 * For every student who likes someone 2 or more grades younger than themselves,
 * return that student's name and grade, and the name and grade of the student they like. 
 */

SELECT h1.name, h1.grade, h2.name, h2.grade
FROM Highschooler h1
  JOIN Likes ON Likes.ID1 = h1.ID
  JOIN Highschooler h2 ON h2.ID = Likes.ID2
WHERE (h1.grade - h2.grade) >= 2;