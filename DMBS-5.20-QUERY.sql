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

	select distinct S.sname, S.age
 	from Sailors S















COMMIT TRANSACTION Q15




