/*  
	Database Management Systems 2nd Edition - 2000
	5.2 - THE FORM OF A BASIC SQL QUERY
	
	This section presents the syntax of  asimple SQL query 
	and explains its meanings through a conceptual evaluation strategy
	
	A conceputal evaluation strategy is a way to evaluate the query that is
	intended to be easy to UNDERSTAND, rather than EFFICIENT. 
	
	A DBMS would typically execute a query in a different and more efficient ways.

*/  

-- QUERY ZONE

BEGIN TRANSACTION Q15
	use master
	go
	use BoatTourBusiness2
	go 
 COMMIT TRANSACTION Q15

 -- -------------------------------------------------
-- (Q.15) Find All the and ages of all Sailors
-- -------------------------------------------------
select * from Sailors S -- most cases not good practice(clean) to use *

select S.sname, S.age
from Sailors S

--w/ distinct
select distinct S.sname, S.age
from Sailors S

-- -------------------------------------------------
-- (Q.11) Find all sailors with a rating above 7
-- -------------------------------------------------

select * from Sailors as S
where S.rating > 7

-- -------------------------------------------------
-- (Q.1) Find the names of sailors who have reserved boat number 103
-- -------------------------------------------------
select * from Sailors S
select * from Boats B
select * from Reserves R

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
select R.sid
from Boats B, Reserves R
where B.bid = R.bid and B.color = 'red'

-- or
SELECT B.color, S.sname , R.sid
FROM Sailors S, Reserves R, Boats B
WHERE B.color = 'red' AND  S.sid = R.sid AND R.bid = B.bid 


-- -------------------------------------------------
-- (Q.3) Find the colors of boats reserved by Lubber.
-- -------------------------------------------------
select * from Sailors S
select * from Boats B
select * from Reserves R

SELECT B.color, S.sname
FROM Sailors S, Reserves R, Boats B
WHERE S.sid = R.sid AND R.bid = B.bid AND S.sname = 'Lubber'
-- or
SELECT B.color, S.sname
FROM Sailors S, Reserves R, Boats B
WHERE S.sname = 'Lubber' AND  S.sid = R.sid AND R.bid = B.bid 