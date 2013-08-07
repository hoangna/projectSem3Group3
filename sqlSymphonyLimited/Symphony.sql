USE master
GO

/* ---------------------------------------------------------------------- */
/* Create database "Symphony_Limited"                                     */
/* ---------------------------------------------------------------------- */

CREATE DATABASE [Symphony_Limited1]
GO

USE [Symphony_Limited1]
GO

/* ---------------------------------------------------------------------- */
/* Add table "Admin"                                                      */
/* ---------------------------------------------------------------------- */

CREATE TABLE [Admin] (
    [ID] INTEGER NOT NULL,
    [UserName] NVARCHAR(20),
    [Password] NVARCHAR(100),
    [Full_Name] NVARCHAR(100),
    [Phone_Number] NVARCHAR(20),
    [Email] NVARCHAR(100),
    CONSTRAINT [PK_Admin] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "Student"                                                    */
/* ---------------------------------------------------------------------- */

CREATE TABLE [Student] (
    [ID] INTEGER  NOT NULL,
    [Roll_Student] NVARCHAR(20) UNIQUE,
    [Full_Name] NVARCHAR(100),
    [Email] NVARCHAR(100),
    [Address] NVARCHAR(300),
    [Phone_Number] NVARCHAR(20),
    [Birthday] DATETIME,
    [Class_ID] INTEGER,
    [Practice_ID] INTEGER,
    CONSTRAINT [PK_Student] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "Test"					                                      */
/* ---------------------------------------------------------------------- */

CREATE TABLE [Test] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Title] NVARCHAR(200),
    [Roll_Student] NVARCHAR(20),
    [Mark] int,
    [Test_Date] datetime,    
    CONSTRAINT [PK_Test] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "Course"                                                     */
/* ---------------------------------------------------------------------- */
--Nhap cung tu Course >> tiep theo la sang Class >. sau do moi insert duoc
CREATE TABLE [Course] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Name] NVARCHAR(20),
    [Description] NTEXT,
    [Fee_Basic] FLOAT,
    [Duration_Basic] INTEGER,
    [Fee_Course] FLOAT,
    [Duration_Course] INTEGER,
    CONSTRAINT [PK_Course] PRIMARY KEY ([ID])
)
INSERT INTO Course(Name) VALUES ('Khoa hoc 5')
SELECT * FROM Course
GO
DROP TABLE Course
/* ---------------------------------------------------------------------- */
/* Add table "Practice"                                                   */
/* ---------------------------------------------------------------------- */

CREATE TABLE [Practice] (
	[ID] INTEGER   not null,
	[Title] NVARCHAR(20),
	[Price] FLOAT,
	CONSTRAINT [PK_Practice] PRIMARY KEY ([ID])
)
--INSERT INTO Practice(ID,Price) VALUES (2,1500)
--SELECT * FROM Practice
DROP TABLE Practice
/* ---------------------------------------------------------------------- */
/* Add table "Class"                                              */
/* ---------------------------------------------------------------------- */

CREATE TABLE [Class] (
	[ID] INTEGER IDENTITY(0,1) NOT NULL,
	[Name] NVARCHAR(20),
	[Course_ID] INTEGER,	
	CONSTRAINT [PK_Class] PRIMARY KEY ([ID])
)
--INSERT INTO Class(Name,Course_ID) VALUES ('DH5',4)
--SELECT * FROM Class
--DROP TABLE Class
GO

/* ---------------------------------------------------------------------- */
/* Add table "Topic"                                                      */
/* ---------------------------------------------------------------------- */

CREATE TABLE [Topic] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Name] NVARCHAR(20),    
    CONSTRAINT [PK_Topic] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "Topic_Class"                                                      */
/* ---------------------------------------------------------------------- */

CREATE TABLE [Topic_Class] (
    [Class_ID] INTEGER,
    [Topic_ID] INTEGER,
    CONSTRAINT [PK_Topic_Class] PRIMARY KEY ([Class_ID], [Topic_ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "Exam"                                              */
/* ---------------------------------------------------------------------- */

CREATE TABLE [Exam] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Title] NVARCHAR(20),			--thi lan thu may
    [Content] NTEXT,
    [Topic_ID] INTEGER,
    [Roll_Student] NVARCHAR(20),
    [Exam_Date] DATETIME,    
    [Mark] int,
    CONSTRAINT [PK_Exam] PRIMARY KEY ([ID])
    
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "FAQ"                                                        */
/* ---------------------------------------------------------------------- */

CREATE TABLE [FAQ] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Question] NTEXT,
    [Answer] NTEXT,
    CONSTRAINT [PK_FAQ] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "Centre_Branch"                                              */
/* ---------------------------------------------------------------------- */

CREATE TABLE [Centre_Branch] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
    [Name] NVARCHAR(200),
    [Phone_Number] NVARCHAR(20),
    [Address] NVARCHAR(300),
    [Fax] NVARCHAR(40),
    [Email] NVARCHAR(100),
    CONSTRAINT [PK_Centre_Branch] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Foreign key constraints                                                */
/* ---------------------------------------------------------------------- */

ALTER TABLE [Test] ADD CONSTRAINT [Student_Test] 
    FOREIGN KEY ([Roll_Student]) REFERENCES [Student] ([Roll_Student])
GO

ALTER TABLE [Student] ADD CONSTRAINT [Class_Student] 
    FOREIGN KEY ([Class_ID]) REFERENCES [Class] ([ID])
GO

ALTER TABLE [Student] ADD CONSTRAINT [Practice_Student] 
    FOREIGN KEY ([Practice_ID]) REFERENCES [Practice] ([ID])


GO
ALTER TABLE [Class] ADD CONSTRAINT [Course_Class] 
    FOREIGN KEY ([Course_ID]) REFERENCES [Course] ([ID])
GO
--ALTER TABLE Student
--DROP CONSTRAINT [Practice_Student] Cau lenh de? drop cac rang buoc trong bang?
 
ALTER TABLE [Topic_Class] ADD CONSTRAINT [Class_Topic_Class] 
    FOREIGN KEY ([Class_ID]) REFERENCES [Class] ([ID])
GO

ALTER TABLE [Topic_Class] ADD CONSTRAINT [Topic_Topic_Class] 
    FOREIGN KEY ([Topic_ID]) REFERENCES [Topic] ([ID])
GO

ALTER TABLE [Exam] ADD CONSTRAINT [Student_Exam] 
    FOREIGN KEY ([Roll_Student]) REFERENCES [Student] ([Roll_Student])
GO

ALTER TABLE [Exam] ADD CONSTRAINT [Topic_Exam] 
    FOREIGN KEY ([Topic_ID]) REFERENCES [Topic] ([ID])
GO

--insert INto FAQ
-- values('abc','abc')
