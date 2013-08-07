--Procedure 
/* ---------------------------------------------------------------------- */
/* Create procedure Delete				                                  */
/* ---------------------------------------------------------------------- */
USE Symphony_Limited1
GO

--sp_deleteAdmin
/***********************************************************/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_deleteAdmin' ) 
BEGIN
	DROP PROC sp_deleteAdmin
END
GO
CREATE PROC sp_deleteAdmin
@ID INT
AS
BEGIN 
	DELETE Admin WHERE ID = @ID
END 
GO

--sp_deleteCentre_Branch
/************************************************************/
IF exists (SELECT * FROM dbo.sysobjects WHERE NAME = 'sp_deleteCentre_Branch')
	DROP PROC sp_deleteCentre_Branch
GO
CREATE PROC sp_deleteCentre_Branch
	@ID INT
AS
BEGIN
	DELETE Centre_Branch WHERE ID = @ID
END
GO

--sp_deleteFAQ
/************************************************************/
IF exists (SELECT * FROM dbo.sysobjects WHERE NAME = 'sp_deleteFAQ')
	DROP PROC sp_deleteFAQ
GO
CREATE PROC sp_deleteFAQ
	@ID	INTEGER
AS
BEGIN
	DELETE FAQ WHERE ID = @ID
END
GO

--sp_deleteTest
/************************************************************/
IF exists (SELECT * FROM dbo.sysobjects WHERE NAME = 'sp_deleteTest')
	DROP PROC sp_deleteTest
GO
CREATE PROC sp_deleteTest
	@ID	INTEGER
AS
BEGIN
	DELETE Test WHERE ID = @ID
END
GO

--sp_deleteExam
/************************************************************/
IF exists (SELECT * FROM dbo.sysobjects WHERE NAME = 'sp_deleteExam')
	DROP PROC sp_deleteExam
GO
CREATE PROC sp_deleteExam
	@ID	INTEGER
AS
BEGIN
	DELETE Exam WHERE ID = @ID
END
GO

--sp_deleteTopic
/************************************************************/
IF exists (SELECT * FROM dbo.sysobjects WHERE NAME = 'sp_deleteTopic')
	DROP PROC sp_deleteTopic
GO
CREATE PROC sp_deleteTopic
	@ID	INTEGER
AS
BEGIN	
	DELETE Topic_Class WHERE Topic_ID = @ID
	DELETE Topic WHERE ID = @ID
END
GO

--sp_deleteStudent
/************************************************************/
IF exists (SELECT * FROM dbo.sysobjects WHERE NAME = 'sp_deleteStudent')
	DROP PROC sp_deleteStudent
GO
CREATE PROC sp_deleteStudent
	@Roll_Student  NVARCHAR(20)
AS
BEGIN
	DELETE Exam WHERE Roll_Student = @Roll_Student
	DELETE Student WHERE Roll_Student = @Roll_Student
END
GO

--sp_deletePractice
/************************************************************/
IF exists (SELECT * FROM dbo.sysobjects WHERE NAME = 'sp_deletePractice')
	DROP PROC sp_deletePractice
GO
CREATE PROC sp_deletePractice
	@ID	INTEGER
AS
BEGIN
	
	DELETE Practice WHERE ID = @ID
END
GO

--sp_deleteClass
/************************************************************/
IF exists (SELECT * FROM dbo.sysobjects WHERE NAME = 'sp_deleteClass')
	DROP PROC sp_deleteClass
GO
CREATE PROC sp_deleteClass
	@ID	INTEGER
AS
BEGIN
	DELETE Topic_Class WHERE Class_ID = @ID
	DELETE Class WHERE ID = @ID
END
GO

--sp_deleteCourse 
/************************************************************/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_deleteCourse' ) 
BEGIN
	DROP PROC sp_deleteCourse
END
GO
CREATE PROC sp_deleteCourse
	@ID INT
AS
BEGIN 	
	DELETE Class WHERE Course_ID = @ID	
	DELETE Course WHERE ID = @ID
END 
GO

-- loi khi xoa practice course class



/* ---------------------------------------------------------------------- */
/* Create procedure Display			                                  */
/* ---------------------------------------------------------------------- */

--sp_GetgetAllCentre_Branch
/************************************************************/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_getAllCentre_Branch') 
BEGIN
	DROP PROC sp_getAllCentre_Branch
END
GO
CREATE PROC sp_getAllCentre_Branch
AS
BEGIN
	SELECT * FROM Centre_Branch
END


--sp_getAllFAQ
/************************************************************/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_getAllFAQ') 
BEGIN
	DROP PROC sp_getAllFAQ
END
GO
CREATE PROC sp_getAllFAQ
AS
BEGIN
	SELECT * FROM FAQ
END

--sp_getAllCourse
/************************************************************/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_getAllCourse') 
BEGIN
	DROP PROC sp_getAllCourse
END
GO
CREATE PROC sp_getAllCourse
AS
BEGIN
	SELECT * FROM Course
END

--sp_getAllTopic
/************************************************************/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_getAllTopic') 
BEGIN
	DROP PROC sp_getAllTopic
END
GO
CREATE PROC sp_getAllTopic
AS
BEGIN
	SELECT * FROM Topic
END

--sp_getAllPractice
/************************************************************/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_getAllPractice') 
BEGIN
	DROP PROC sp_getAllPractice
END
GO
CREATE PROC sp_getAllPractice
AS
BEGIN
	SELECT * FROM Practice
END

--sp_getAllStudent
/************************************************************/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_getAllStudent') 
BEGIN
	DROP PROC sp_getAllStudent
END
GO
CREATE PROC sp_getAllStudent
AS
BEGIN
	SELECT * FROM Student
END

--sp_getAllClass
/************************************************************/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_getAllClass') 
BEGIN
	DROP PROC sp_getAllClass
END
GO
CREATE PROC sp_getAllClass
AS
BEGIN
	SELECT * FROM Class
END

--sp_getAllTest
/************************************************************/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_getAllTest') 
BEGIN
	DROP PROC sp_getAllTest
END
GO
CREATE PROC sp_getAllTest
AS
BEGIN
	SELECT * FROM Test
END

--sp_getAllExam
/************************************************************/
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_getAllExam') 
BEGIN
	DROP PROC sp_getAllExam
END
GO
CREATE PROC sp_getAllExam
AS
BEGIN
	SELECT * FROM Exam
END










/* ---------------------------------------------------------------------- */
/* Create procedure Edit			                                  */
/* ---------------------------------------------------------------------- */
IF EXISTS ( SELECT * FROM SYSOBJECTS WHERE NAME = 'sp_EditAllAdmin') 
BEGIN
	DROP PROC sp_EditAllAdmin
END
GO
CREATE PROC sp_EditAllAdmin
	@UserName NVARCHAR(20),
    @Password NVARCHAR(100),
    @Full_Name NVARCHAR(100),
    @Phone_Number NVARCHAR(20),
    @Email NVARCHAR(100)
AS
BEGIN
	UPDATE Admin SET 
		[Password] = @Password,  
		[Full_Name] = @Full_Name,
		[Phone_Number] = @Phone_Number,
		[Email] = @Email
	WHERE [UserName] = @UserName
END
GO


/* ---------------------------------------------------------------------- */
/* Create procedure Insert				                                  */
/* ---------------------------------------------------------------------- */

--sp_insertFAQ 
/***********************************************************/
IF exists (SELECT * FROM dbo.sysobjects WHERE NAME = 'sp_insertFAQ')
	DROP PROC sp_insertFAQ
GO
CREATE PROC sp_insertFAQ
	@Question NTEXT,
	@Answer NTEXT
AS
BEGIN
	INSERT INTO FAQ VALUES (@Question, @Answer)
END
GO

IF exists (SELECT * FROM dbo.sysobjects WHERE NAME = 'sp_insertAdmin')
	DROP PROC sp_insertAdmin
	
GO

CREATE PROCEDURE insertAdmin
    @ID INT ,
    @UserName NVARCHAR(20),
    @Password NVARCHAR(100)
AS 
   INSERT INTO Admin(ID,UserName,Password) VALUES (@ID,@UserName,@Password)
GO
 --DROP PROC editAdmin
CREATE PROCEDURE editAdmin
    @ID INTEGER ,
    @UserName NVARCHAR(20),
    @Password NVARCHAR(100)
AS
   UPDATE Admin
    SET UserName=@UserName,Password=@Password
    WHERE  ID = @ID

go
CREATE PROCEDURE deleteAdmin
     @ID INTEGER
AS 
     DELETE FROM Admin WHERE ID=@ID
GO
CREATE PROCEDURE insertStudent
    @ID INTEGER ,
    @Roll_Student NVARCHAR(20) ,
    @Full_Name NVARCHAR(100),
    @Email NVARCHAR(100) ,
    @Address NVARCHAR(300),
    @Phone_Number NVARCHAR(20),
    @Birthday DATETIME,
    @Class_ID INTEGER,
    @Practice_ID INTEGER
AS 
   INSERT INTO Student(ID,Roll_Student,Full_Name,Email,Address,Phone_Number,Birthday,Class_ID,Practice_ID) VALUES (@ID,@Roll_Student,@Full_Name,@Email,@Address,@Phone_Number,@Birthday,@Class_ID,@Practice_ID)


DROP PROC editStudent
GO
CREATE PROCEDURE editStudent
    @ID INTEGER ,
    @Roll_Student NVARCHAR(20),
    @Full_Name NVARCHAR(100),
    @Email NVARCHAR(100) ,
    @Address NVARCHAR(300),
    @Phone_Number NVARCHAR(20),
    @Birthday DATETIME,
    @Class_ID INTEGER,
    @Practice_ID INTEGER
AS 
   UPDATE Student SET
   Roll_Student = @Roll_Student,
   Full_Name = @Full_Name ,
   Email = @Email ,
   Address = @Address ,
   Phone_Number = @Phone_Number ,
   Birthday = @Birthday ,
   Class_ID = @Class_ID ,
   Practice_ID = @Practice_ID
WHERE ID = @ID
GO

CREATE PROCEDURE deleteStudent
     @ID INTEGER
AS 
     DELETE FROM Student WHERE ID=@ID
     
    







