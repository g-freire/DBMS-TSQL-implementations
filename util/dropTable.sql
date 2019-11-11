

SP_WHO 
--KILL 59

alter database [someTable] set single_user with rollback immediate
drop [someTable]


DECLARE @kill varchar(8000) = '';  
SELECT @kill = @kill + 'kill ' + CONVERT(varchar(5), session_id) + ';'  
FROM sys.dm_exec_sessions
WHERE database_id  = db_id('BoatTourStore')

EXEC(@kill);