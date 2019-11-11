/*  
	Database Management Systems 2nd Edition - 2000
	5.2 - THE FORM OF A BASIC SQL QUERY
	
	This section presents the syntax of  asimple SQL query 
	and explains its meanings through a conceptual evaluation strategy
	
	A conceputal evaluation strategy is a way to evaluate the query that is
	intended to be easy to UNDERSTAND, rather than EFFICIENT. 
	
	A DBMS would typically execute a query in a different and more efficient ways.

*/  


-- DDL - Data Definition Language

BEGIN TRANSACTION TCreateDB  

	use master
	go

	create database BoatTourBusiness2
	go 


-- ROLLBACK TRAN TCreateDB;
COMMIT TRAN TCreateDB;



BEGIN TRANSACTION TCreateTables  

	use BoatTourBusiness2
	go

	create table Sailors
	(
	  sid int ,
	  sname varchar(50),
	  rating int,
	  age float
	);
	go

	create table Reserves
	(
	  sid int ,
	  bid int,
	  day varchar(50),
	  --day DateTime,
	);
	go

	create table Boats
	( bid  int,
	  bname varchar(50),
	  color varchar(50)
	)
	go

COMMIT TRAN TCreateTables;
go

-- DML - Data  Manipulation Language

BEGIN TRANSACTION TPopulateTable;  

	insert into Sailors(sid,sname,rating,age)
	values
			(22, 'Dustin', 7, 45.0),
			(29, 'Brutus', 1, 33.0),
			(31, 'Lubber', 8, 55.5),
			(32, 'Andy', 8, 25.5),
			(58, 'Rusty', 10, 35.5),
			(64, 'Horatio', 7, 35.0),
			(71, 'Zorba', 10, 16.0),
			(74, 'Horation', 9, 35.0),
			(85, 'Art', 3, 25.5),
			(95, 'Bob', 3, 63.5)



	insert into Boats(bid, bname, color) 
	values 
			(101, 'Interlake', 'blue'),
			(102, 'Interlake', 'red'),
			(103, 'Clipper', 'green'),
			(104, 'Marine', 'red')



	insert into Reserves(sid, bid, day)
	values 
			(22, 101, '10/10/98'),
			(22, 102, '10/10/98'),
			(22, 103, '10/8/98'),
			(22, 101, '10/7/98'),
			(31, 101, '11/10/98'),
			(31, 101, '11/6/98'),
			(31, 101, '11/12/98'),
			(64, 101, '9/5/98'),
			(64, 101, '9/8/98'),
			(74, 101, '9/8/98')


----ROLLBACK TRAN T1  
COMMIT TRAN TPopulateTable;
go


select * from Sailors
select * from Reserves
select * from Boats 

-- begin tran deleteTables
-- 	drop table Sailors
-- 	drop table Reserves
-- 	drop table Boats
-- commit tran


