/*
 * Exercise 3
 * For all cases where A is friends with B, and B is friends with C, add a new friendship for the pair A and C.
 * Do not add duplicate friendships, friendships that already exist, or friendships with oneself.
 * (This one is a bit challenging; congratulations if you get it right.)
 */

INSERT INTO Friend (ID1, ID2)
SELECT f1.ID1, f2.ID2

/* This is tricky, but allows us to avoid four joins.
 * Friend A (f1.ID1) has a friend B (f1.ID2 / f2.ID1) who is friends with C (f2.ID2)
 */
FROM Friend f1
  JOIN Friend f2 ON f1.ID2 = f2.ID1

/* Where A and C are not the same person */
WHERE f1.ID1 != f2.ID2

/* Remove any existing friends */
EXCEPT SELECT * FROM Friend;