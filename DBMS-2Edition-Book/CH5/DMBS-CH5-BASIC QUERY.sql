BEGIN TRANSACTION Q15
	USE master
	GO
	USE BoatTourBusiness2
	GO 
COMMIT TRANSACTION Q15

 -- -------------------------------------------------
-- (Q.15) Find All the and ages of all Sailors
-- -------------------------------------------------
SELECT * FROM Sailors S -- most cases not good practice(clean) to use *
SELECT * from Boats B
SELECT * from Reserves R

SELECT S.sname, S.age
FROM Sailors S

--w/ distinct
SELECT distinct S.sname, S.age
FROM Sailors S

-- -------------------------------------------------
-- (Q.11) Find all sailors with a rating above 7
-- -------------------------------------------------

SELECT * from Sailors as S
WHERE S.rating > 7

-- -------------------------------------------------
-- (Q.1) Find the names of sailors who have reserved boat number 103
-- -------------------------------------------------

-- without considering that boat number is the FK
SELECT *
FROM Sailors S, Reserves R, Boats B
WHERE B.bid = 103 AND R.sid = S.sid AND R.bid = B.bid 

--WHERE JOIN
SELECT *
FROM Sailors S, Reserves R
WHERE S.sid = R.sid AND R.bid=103

--EXPLICIT JOIN
SELECT S.sname
FROM Sailors S
JOIN Reserves R
ON S.sid = R.sid AND R.bid=103

-- -------------------------------------------------
-- (Q.16) Find  the sids of sailors who have reserved a red boat.
-- -------------------------------------------------
SELECT R.sid
from Boats B, Reserves R
where B.bid = R.bid and B.color = 'red'

-- -------------------------------------------------
-- (Q.3) Find the colors of boats reserved by Lubber.
-- -------------------------------------------------
SELECT B.color, S.sname
FROM Sailors S, Reserves R, Boats B
WHERE S.sid = R.sid AND R.bid = B.bid AND S.sname = 'Lubber'

-- -------------------------------------------------
-- (Q.4) Find the names of sailors who have reserved at least one boat.
-- -------------------------------------------------
SELECT *
FROM Sailors S, Reserves R
WHERE S.sid = R.sid

-- -------------------------------------------------
-- Expressions and Strings in the SELECT Command  -- Select is the Projection Operator from Relational Algebra
-- -------------------------------------------------

-- -------------------------------------------------
-- (Q.17) Compute increments for the ratings of persons who have 
--        sailed two differente boats on the same day
-- -------------------------------------------------
SELECT S.sname, S.rating+ 1 AS rating
FROM Sailors S, Reserves R1, Reserves R2
WHERE S.sid = R1.sid AND S.sid = R2.sid
AND R1.day = R2.day AND R1.bid <> R2.bid

SELECT S1.sname AS name1, S2.sname AS name2
FROM Sailors S1, Sailors S2
WHERE 2*S1.rating = S2.rating -1

