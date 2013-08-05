USE master
GO

/* ---------------------------------------------------------------------- */
/* Create database "Symphony_Limited"                                     */
/* ---------------------------------------------------------------------- */

CREATE DATABASE [Symphony_Limited]
GO

USE [Symphony_Limited]
GO

/* ---------------------------------------------------------------------- */
/* Add table "Admin"                                                      */
/* ---------------------------------------------------------------------- */

CREATE TABLE [Admin] (
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
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
    [ID] INTEGER IDENTITY(0,1) NOT NULL,
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
GO

/* ---------------------------------------------------------------------- */
/* Add table "Practice"                                                   */
/* ---------------------------------------------------------------------- */

CREATE TABLE [Practice] (
	[ID] INTEGER IDENTITY(0,1) NOT NULL,
	[Title] NVARCHAR(20),
	[Price] FLOAT,
	CONSTRAINT [PK_Practice] PRIMARY KEY ([ID])
)
GO

/* ---------------------------------------------------------------------- */
/* Add table "Class"                                              */
/* ---------------------------------------------------------------------- */

CREATE TABLE [Class] (
	[ID] INTEGER IDENTITY(0,1) NOT NULL,
	[Name] NVARCHAR(20),
	[Course_ID] INTEGER,	
	CONSTRAINT [PK_Class] PRIMARY KEY ([ID])
)
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
/* ---------------------------------------------------------------------- */
/* Store Procedure "Symphony_Limited"                                     */
/* ---------------------------------------------------------------------- */
CREATE PROCEDURE addAdmin
    @[UserName] NVARCHAR(20),
    @[Password] NVARCHAR(100),
    @[Full_Name] NVARCHAR(100),
    @[Phone_Number] NVARCHAR(20),
    @[Email] NVARCHAR(100)
AS 
   INSERT INTO [Admin] VALUES (@[UserName],@[Password],@[Full_Name],@[Phone_Number],@[Email])
GO
CREATE PROCEDURE editAdmin
    @[ID] INTEGER ,
    @[UserName] NVARCHAR(20),
    @[Password] NVARCHAR(100),
    @[Full_Name] NVARCHAR(100),
    @[Phone_Number] NVARCHAR(20),
    @[Email] NVARCHAR(100)
AS 
    UPDATE [Admin] SET  
	  [UserName] = @[UserName]
      [Password]  = @[Password]
      [Full_Name] = @[Full_Name]
      [Phone_Number] = @[Phone_Number]
      [Email] = @[Email]
	WHERE [ID] = @[ID]
GO
CREATE PROCEDURE deleteAdmin
 @[ID] INTEGER 
 AS
  DELETE FROM [Admin] WHERE [ID] = @[ID]
 GO
 CREATE PROCEDURE getAdminById
  @[ID] INTEGER 
 AS 
  SELECT * FROM [Admin] WHERE [ID] = @[ID]
 GO
 CREATE PROCEDURE addStudent
    @[Roll_Student] NVARCHAR(20) ,
    @[Full_Name] NVARCHAR(100),
    @[Email] NVARCHAR(100),
    @[Address] NVARCHAR(300),
    @[Phone_Number] NVARCHAR(20),
    @[Birthday] DATETIME,
    @[Class_ID] INTEGER,
    @[Practice_ID] INTEGER
AS 
   INSERT INTO [Student] VALUES (@[Roll_Student],@[Full_Name],@[Email],@[Address],@[Phone_Number],@[Birthday],@[Class_ID],@[Practice_ID])
GO
CREATE PROCEDURE editStudent
    @[ID] INTEGER ,
    @[Roll_Student] NVARCHAR(20) ,
    @[Full_Name] NVARCHAR(100),
    @[Email] NVARCHAR(100),
    @[Address] NVARCHAR(300),
    @[Phone_Number] NVARCHAR(20),
    @[Birthday] DATETIME,
    @[Class_ID] INTEGER,
    @[Practice_ID] INTEGER,
AS 
    UPDATE [Student] SET  
	  @[Roll_Student] = @[Roll_Student]
      @[Full_Name]  = @[Full_Name]
      @[Email]  = @[Email] 
      @[Address] = @[Address]
      @[Phone_Number] = @[Phone_Number]
      @[Birthday] = @[Birthday]
      @[Class_ID] = @[Class_ID]
      @[Practice_ID] = @[Practice_ID]
	WHERE [ID] = @[ID]
GO
CREATE PROCEDURE deleteStudent
 @[ID] INTEGER 
 AS
  DELETE FROM [Student] WHERE [ID] = @[ID]
  
 GO
 
 CREATE PROCEDURE getStudentById
  @[ID] INTEGER 
 AS 
  SELECT * FROM [Admin] WHERE [ID] = @[ID]
GO
CREATE PROCEDURE addTest
    @[Title] NVARCHAR(200),
    @[Roll_Student] NVARCHAR(20),
    @[Mark] int,
    @[Test_Date] datetime       
AS 
   INSERT INTO [Test] VALUES (@[Title],@[Roll_Student],@[Mark],@[Test_Date])
 GO
 CREATE PROCEDURE editTest
    @[ID] INTEGER ,
    @[Title] NVARCHAR(200),
    @[Roll_Student] NVARCHAR(20),
    @[Mark] int,
    @[Test_Date] datetime     
AS 
	UPDATE [Test] SET  
	[ID] = @[ID]
    [Title] = @[Title]
    [Roll_Student] =@[Roll_Student]
    [Mark] = @[Mark]
    [Test_Date] = @[Test_Date]
	WHERE [ID] = @[ID]
GO
CREATE PROCEDURE deleteTest
    @[ID] INTEGER 
AS 
    DELETE FROM [Test] WHERE [ID] = @[ID]
GO
CREATE PROCEDURE getTestById
     @[ID] INTEGER 
AS 
    DELETE FROM [Test] WHERE [ID] = @[ID]
GO
CREATE PROCEDURE addCourse    
    @[Name] NVARCHAR(20),
    @[Description] NTEXT,
    @[Fee_Basic] FLOAT,
    @[Duration_Basic] INTEGER,
    @[Fee_Course] FLOAT,
    @[Duration_Course] INTEGER
AS
    INSERT INTO [Course] VALUES (,@[Name],@[Description],@[Fee_Basic],@[Duration_Basic],@[Fee_Course],@[Duration_Course])
GO
CREATE PROCEDURE editCourse
    @[ID] INT , 
	@[Name] NVARCHAR(20),
    @[Description] NTEXT,
    @[Fee_Basic] FLOAT,
    @[Duration_Basic] INTEGER,
    @[Fee_Course] FLOAT,
    @[Duration_Course] INTEGER
AS 
    UPDATE [Course] SET  
	[ID] = @[ID]
    [Name] = @[Name]
    [Description] = @[Description]
    [Fee_Basic] = @[Fee_Basic]
    [Duration_Basic] = @[Duration_Basic]
    [Fee_Course] = @[Fee_Course]
    [Duration_Course] = @[Duration_Course] 
	WHERE [ID] = @[ID]
GO
CREATE PROCEDURE deleteCourse
    @[ID] INTEGER 
AS 
    DELETE FROM [Course] WHERE [ID] = @[ID]
GO
CREATE PROCEDURE getCourseById
     @[ID] INTEGER 
AS 
    DELETE FROM [Course] WHERE [ID] = @[ID]
GO

   
 
  
