/*  
	5.2 - THE FORM OF A BASIC SQL QUERY
	
	This section presents the syntax of  asimple SQL query 
	and explains its meanings through a conceptual evaluation strategy
	
	A conceputal evaluation strategy is a way to evaluate the query that is
	intended to be easy to UNDERSTAND, rather than EFFICIENT. 
	
	A DBMS would typically execute a query in a different and more efficient ways.

*/  

use master
go

--create database BoatTourStore
use BoatTourStore

user master
drop database BoatTourStore

SP_WHO 
 alter database BoatTourStore set single_user with rollback immediate

 drop databaseBoatTourStore

KILL 59

BoatTourStore


DECLARE @kill varchar(8000) = '';  
SELECT @kill = @kill + 'kill ' + CONVERT(varchar(5), session_id) + ';'  
FROM sys.dm_exec_sessions
WHERE database_id  = db_id('BoatTourStore')

EXEC(@kill);