--Assignment 1
--create database
CREATE DATABASE db_School

--Assignment 2
--create table Classes
CREATE TABLE Classes (
	Class_ID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	Class_Name VARCHAR(50)
)

--Assignment 3
--create table Students
CREATE TABLE Students (
	Student_ID INT NOT NULL IDENTITY(1,1),
	Student_Name VARCHAR(50)
)

--Assignment 4
--create table Instructor
CREATE TABLE Instructor (
	Instructor_ID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	Instructor_Name VARCHAR(50)
)

--Assignment 5
--add the class_id column to students table as a foreign key linking to Classes table primary key column
ALTER TABLE Students
ADD Class_ID INT FOREIGN KEY REFERENCES Classes(Class_ID) ON UPDATE CASCADE ON DELETE CASCADE

--add the instructor_id column to students table as a foreign key linking to Instructor table primary key column
ALTER TABLE Students
ADD Instructor_ID INT FOREIGN KEY REFERENCES Instructor(Instructor_ID) ON UPDATE CASCADE ON DELETE CASCADE

--Assignment 6
--add values to the class table
INSERT INTO Classes(Class_Name)
VALUES 
	('Software Developer Boot Camp'),
	('C# Boot Camp');

--Assignment 7
-- add values to the Students table
INSERT INTO Students(Student_Name)
VALUES
	('Adam'),
	('Sara'),
	('Liam'),
	('Noah'),
	('Bary'),
	('Lora')

--Assignment 8
-- add value to the Instructor table
INSERT INTO Instructor(Instructor_Name)
VALUES
	('Albert-Einstein'),
	('Marie-Curie')

--Assignment 9
--update the FOREIGN key columns with values
UPDATE Students
SET Class_ID = 1, Instructor_ID = 2
--data will be added where values from student_id column are matching the values between the ()
WHERE [Student_ID] in (1,3,5)

--Assignment 10
UPDATE Students
SET Class_ID = 2, Instructor_ID = 1
WHERE [Student_ID] in (2,4,6)

--Assignment 11
--select all instructors names
SELECT Instructor_Name FROM Instructor

--Assignment 12
--sellect all students names in alphabetical order
SELECT Student_Name 
FROM Students 
ORDER BY Student_Name ASC


--Assignment 13
--INER JOIN all three tables to dispaly the classes with the students and instructors names linked to each class
SELECT   Classes.Class_Name , Students.Student_Name , Instructor.Instructor_Name
FROM Students
INNER JOIN Classes ON Classes.Class_ID = Students.Class_ID
INNER JOIN Instructor ON Instructor.Instructor_ID = Students.Instructor_ID
ORDER BY Classes.Class_Name --ASC
