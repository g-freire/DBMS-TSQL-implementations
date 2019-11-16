/*  
	Database Management Systems 2nd Edition - 2000
	5.4 - NESTED QUERIES
	
	A nested query is a query that has another query embedded within it; 
	the embedded query is called a subquery.

	A subquery typically appears within the WHERE clause of a query. 
	Subqueries can sometimes appear in the FROM clause or the HAVING clause.
	This section discusses only subqueries that appear in the WHERE clause. 
	The treatment of subqueries appearing elsewhere is quite similar.
*/  

BEGIN TRANSACTION Q15
	USE master
	GO
	USE BoatTourBusiness2
	GO 
COMMIT TRANSACTION Q15

SELECT * FROM Sailors S
SELECT * from Boats B
SELECT * from Reserves R

-- -------------------------------------------------
-- (Q.1) Find the names of sailors who have reserved boat 103
-- -------------------------------------------------
SELECT S.sname
FROM Sailors S
WHERE S.sid IN (SELECT R.sid 
				FROM Reserves R 
				WHERE R.bid = 103)

-- The subquery clearly depends on the current row S 
-- and must be re-evaluated for each row in Sailors. 
-- The occurrence of S in the subquery (in the form of the literal S.sid) 
-- is called a correlation, and such queries are called correlated queries.

-- another way 
SELECT S.sname
FROM Sailors S
WHERE EXISTS ( SELECT *
			   FROM Reserves R
			   WHERE R.bid = 103
			   AND R.sid = S.sid )

-- -------------------------------------------------
-- (Q.2) Find the names of sailors who have reserved boat 103
-- -------------------------------------------------
SELECT S.sname
FROM Sailors S
WHERE S.sid IN ( SELECT R.sid
				 FROM Reserves R
				 WHERE R.bid IN ( SELECT B.bid
								  FROM Boats B
								  WHERE B.color = 'red'))

-- -------------------------------------------------
-- (Q.21) Find the names of sailors who have reserved boat 103
-- -------------------------------------------------
SELECT S.sname
FROM Sailors S
WHERE S.sid NOT IN ( SELECT R.sid
					 FROM Reserves R
					 WHERE R.bid IN ( SELECT B.bid
									  FROM Boats B
									  WHERE B.color = 'red'))								  

-- -------------------------------------------------
-- (Q.22) Find sailors whose rating is better than some sailor called Horatio.
-- -------------------------------------------------
SELECT S.sid
FROM Sailors S
WHERE S.rating > ANY (  SELECT S2.rating
						FROM Sailors S2
						WHERE S2.sname = 'Horatio')

-- -------------------------------------------------
-- (Q.23) Find sailors whose rating is better than every sailor called Horatio.
-- -------------------------------------------------
SELECT S.sid
FROM Sailors S
WHERE S.rating > ALL (  SELECT S2.rating
						FROM Sailors S2
						WHERE S2.sname = 'Horatio')

-- -------------------------------------------------
-- (Q.23) WHERE S.rating >= ALL ( SELECT S2.rating
-- -------------------------------------------------
SELECT S.sid
FROM Sailors S
WHERE S.rating >= ALL ( SELECT S2.rating
						FROM Sailors S2
						)
-- or 
SELECT S.sid
FROM Sailors S
WHERE S.rating in ( SELECT max(S2.rating)
					FROM Sailors S2)


