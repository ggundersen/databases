/*
 * Exercise 2:
 * If two students A and B are friends, and A likes B but not vice-versa, remove the Likes tuple.
 */

DELETE FROM Likes
/* If a person liked more than one other person, this query would not work. */
WHERE ID1 IN (
  SELECT h1.ID
  FROM Highschooler h1
    JOIN Friend f1 ON f1.ID1 = h1.ID
    JOIN Highschooler h2 ON h2.ID = f1.ID2
    JOIN Likes l2 ON l2.ID1 = h1.ID
  WHERE l2.ID2 = h2.ID
    AND h2.ID NOT IN (
      SELECT ID1
      FROM Likes
      WHERE ID2 = h1.ID
    )
);