-- Create the Database

use master
go

create database StudentClass
go

use StudentClass
go

-- Create the Tables
CREATE TABLE Students
(
    StudentID int IDENTITY(1,1) PRIMARY KEY ,
    StudentName nchar(50) NOT NULL
)

CREATE TABLE Classrooms
(
    ClassroomID int IDENTITY(1,1) PRIMARY KEY,
    RoomNumber int NOT NULL
)

--Now that we have our two tables created we need to create the junction table that will link them together.  The junction table is created by using the primary key from the Classrooms and Students tables.

CREATE TABLE StudentClassroom
(
    StudentID int NOT NULL,
    ClassroomID int NOT NULL,
    CONSTRAINT PK_StudentClassroom PRIMARY KEY
    (
        StudentID,
        ClassroomID
    ),
    FOREIGN KEY (StudentID) REFERENCES Students (StudentID),
    FOREIGN KEY (ClassroomID) REFERENCES Classrooms (ClassroomID)
)

--  We have now created a table with columns for the StudentID and the ClassroomID. 
--  This table also uses a combination of these two columns as the primary key.
--  This means that each student-classroom pair is unique. 
--  Each student can belong to many classrooms, each classroom can belong to many students but each pair can only occur once.
--  You should also note that the columns in the junction table are setup as foreign keys to the Students and Classrooms tables.  


--INSERT SOME VALUES

INSERT INTO Students(StudentName) 
VALUES ('Alice'),('Bob'),('Foo'),('Bar')

INSERT INTO  Classrooms(RoomNumber) 
VALUES (225), (445), (100)

INSERT INTO  StudentClassroom 
VALUES (1,1), (2,2),(3,2),(4,4)

SELECT *
FROM StudentClassroom

SELECT *
FROM Students

SELECT *
FROM Classrooms

--delete from Classrooms where ClassroomID = 3
--delete from Classrooms where ClassroomID = 3

