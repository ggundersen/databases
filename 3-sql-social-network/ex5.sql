/*
 * Exercise 5:
 * For every situation where student A likes student B, but we have no information about whom B likes
 * (that is, B does not appear as an ID1 in the Likes table), return A and B's names and grades. 
 */

SELECT a.name, a.grade, b.name, b.grade
FROM Highschooler a
  JOIN Likes l1 ON l1.ID1 = a.ID
  JOIN Highschooler b ON b.ID = l1.ID2
WHERE NOT EXISTS (SELECT * FROM Likes l2 WHERE l2.ID1 = b.ID);