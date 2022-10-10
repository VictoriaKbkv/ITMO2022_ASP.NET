SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

USE [master];
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'NewSchool')
	DROP DATABASE NewSchool;
GO

-- Create the NewSchool database.
CREATE DATABASE NewSchool;
GO

-- Specify a simple recovery model 
-- to keep the log growth to a minimum.
ALTER DATABASE NewSchool 
	SET RECOVERY SIMPLE;
GO

USE NewSchool;
GO

-- Create the Student table.
IF NOT EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[Student]') 
		AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Student](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
	[EnrollmentDate] [date] NULL,
 CONSTRAINT [PK_NewSchool.Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO


--Create the StudentGrade table.
IF NOT EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[StudentGrade]') 
		AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[StudentGrade](
	[GradeID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[GradeDate] [date] NOT NULL,
	[Grade] [smallint] NOT NULL,
 CONSTRAINT [PK_StudentGrade] PRIMARY KEY CLUSTERED 
(
	[GradeID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO


-- Create the Course table.
IF NOT EXISTS (SELECT * FROM sys.objects 
		WHERE object_id = OBJECT_ID(N'[dbo].[Course]') 
		AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Course](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_NewSchool.Course] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO



-- Define the relationship between StudentGrade and Course.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentGrade_Course]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[StudentGrade]'))
ALTER TABLE [dbo].[StudentGrade]  WITH CHECK ADD  
       CONSTRAINT [FK_StudentGrade_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[StudentGrade] CHECK 
       CONSTRAINT [FK_StudentGrade_Course]
GO

--Define the relationship between StudentGrade and Student.
IF NOT EXISTS (SELECT * FROM sys.foreign_keys 
       WHERE object_id = OBJECT_ID(N'[dbo].[FK_StudentGrade_Student]')
       AND parent_object_id = OBJECT_ID(N'[dbo].[StudentGrade]'))
ALTER TABLE [dbo].[StudentGrade]  WITH CHECK ADD  
       CONSTRAINT [FK_StudentGrade_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[StudentGrade] CHECK 
       CONSTRAINT [FK_StudentGrade_Student]
GO


-- Insert data into the Student table.
USE NewSchool
GO

SET IDENTITY_INSERT dbo.Student OFF
GO

INSERT INTO dbo.Student (LastName, FirstName, Status, EnrollmentDate)
VALUES 
('Potter', 'Harry', 'Current', GETDATE()-400),
('Weasley', 'Ron', 'Current', GETDATE()-400),
('Granger', 'Hermione', 'Current', GETDATE()-400),
('Finnigan', 'Seamus', 'Current', GETDATE()-400),
('Abbott', 'Hannah', 'Current', GETDATE()-400),
('Parkinson', 'Pansy', 'Current', GETDATE()-400),
('Smith', 'Zacharias', 'Current', GETDATE()-400),
('Zabini', 'Blaise', 'Current', GETDATE()-400),
('Malfoy', 'Draco', 'Current', GETDATE()-400),
('Thomas', 'Dean', 'Current', GETDATE()-400),
('Macmillan', 'Ernie', 'Current', GETDATE()-400),
('Crabbe', 'Vincent', 'Current', GETDATE()-400),
('Goyle', 'Gregory', 'Current', GETDATE()-400),
('Bell', 'Katie', 'Current', GETDATE()-400),
('Patil', 'Parvati', 'Current', GETDATE()-400),
('McGonagall', 'Minerva', 'Completed Course', GETDATE()-700),
('Hagrid', 'Rubeus', 'Left/Failed Course', GETDATE()-700)
GO

-- Insert data into the Course table.
INSERT INTO dbo.Course (Title)
VALUES ('ITMO Web App Development Foundations')
GO

INSERT INTO [dbo].[StudentGrade] (CourseID, StudentID, GradeDate, Grade)
VALUES 
(1, 1, '2021-10-15', 72),
(1, 1, '2021-11-15', 87),
(1, 1, '2021-12-15', 79),
(1, 1, '2022-1-15', 60),
(1, 1, '2022-2-15', 99),
(1, 1, '2022-3-15', 69),
(1, 1, '2022-4-15', 93),
(1, 1, '2022-5-15', 54),
(1, 1, '2022-6-15', 65),
(1, 1, '2022-7-15', 64),
(1, 1, '2022-8-15', 55),
(1, 1, '2022-9-15', 99),
(1, 2, '2021-10-15', 70),
(1, 2, '2021-11-15', 63),
(1, 2, '2021-12-15', 57),
(1, 2, '2022-1-15', 69),
(1, 2, '2022-2-15', 81),
(1, 2, '2022-3-15', 71),
(1, 2, '2022-4-15', 53),
(1, 2, '2022-5-15', 57),
(1, 2, '2022-6-15', 96),
(1, 2, '2022-7-15', 82),
(1, 2, '2022-8-15', 75),
(1, 2, '2022-9-15', 55),
(1, 3, '2021-10-15', 95),
(1, 3, '2021-11-15', 95),
(1, 3, '2021-12-15', 95),
(1, 3, '2022-1-15', 95),
(1, 3, '2022-2-15', 99),
(1, 3, '2022-3-15', 97),
(1, 3, '2022-4-15', 96),
(1, 3, '2022-5-15', 99),
(1, 3, '2022-6-15', 98),
(1, 3, '2022-7-15', 96),
(1, 3, '2022-8-15', 99),
(1, 3, '2022-9-15', 97),
(1, 4, '2021-10-15', 58),
(1, 4, '2021-11-15', 54),
(1, 4, '2021-12-15', 80),
(1, 4, '2022-1-15', 90),
(1, 4, '2022-2-15', 75),
(1, 4, '2022-3-15', 64),
(1, 4, '2022-4-15', 76),
(1, 4, '2022-5-15', 76),
(1, 4, '2022-6-15', 97),
(1, 4, '2022-7-15', 86),
(1, 4, '2022-8-15', 91),
(1, 4, '2022-9-15', 87),
(1, 5, '2021-10-15', 98),
(1, 5, '2021-11-15', 94),
(1, 5, '2021-12-15', 62),
(1, 5, '2022-1-15', 99),
(1, 5, '2022-2-15', 50),
(1, 5, '2022-3-15', 60),
(1, 5, '2022-4-15', 79),
(1, 5, '2022-5-15', 79),
(1, 5, '2022-6-15', 57),
(1, 5, '2022-7-15', 57),
(1, 5, '2022-8-15', 60),
(1, 5, '2022-9-15', 54),
(1, 6, '2021-10-15', 67),
(1, 6, '2021-11-15', 71),
(1, 6, '2021-12-15', 94),
(1, 6, '2022-1-15', 83),
(1, 6, '2022-2-15', 60),
(1, 6, '2022-3-15', 96),
(1, 6, '2022-4-15', 76),
(1, 6, '2022-5-15', 87),
(1, 6, '2022-6-15', 74),
(1, 6, '2022-7-15', 80),
(1, 6, '2022-8-15', 96),
(1, 6, '2022-9-15', 81),
(1, 7, '2021-10-15', 72),
(1, 7, '2021-11-15', 94),
(1, 7, '2021-12-15', 62),
(1, 7, '2022-1-15', 58),
(1, 7, '2022-2-15', 62),
(1, 7, '2022-3-15', 97),
(1, 7, '2022-4-15', 79),
(1, 7, '2022-5-15', 90),
(1, 7, '2022-6-15', 70),
(1, 7, '2022-7-15', 80),
(1, 7, '2022-8-15', 86),
(1, 7, '2022-9-15', 65),
(1, 8, '2021-10-15', 59),
(1, 8, '2021-11-15', 84),
(1, 8, '2021-12-15', 80),
(1, 8, '2022-1-15', 98),
(1, 8, '2022-2-15', 71),
(1, 8, '2022-3-15', 70),
(1, 8, '2022-4-15', 50),
(1, 8, '2022-5-15', 92),
(1, 8, '2022-6-15', 76),
(1, 8, '2022-7-15', 99),
(1, 8, '2022-8-15', 53),
(1, 8, '2022-9-15', 69),
(1, 9, '2021-10-15', 54),
(1, 9, '2021-11-15', 60),
(1, 9, '2021-12-15', 50),
(1, 9, '2022-1-15', 95),
(1, 9, '2022-2-15', 100),
(1, 9, '2022-3-15', 61),
(1, 9, '2022-4-15', 84),
(1, 9, '2022-5-15', 63),
(1, 9, '2022-6-15', 70),
(1, 9, '2022-7-15', 54),
(1, 9, '2022-8-15', 77),
(1, 9, '2022-9-15', 75),
(1, 10, '2021-10-15', 92),
(1, 10, '2021-11-15', 53),
(1, 10, '2021-12-15', 63),
(1, 10, '2022-1-15', 50),
(1, 10, '2022-2-15', 93),
(1, 10, '2022-3-15', 77),
(1, 10, '2022-4-15', 68),
(1, 10, '2022-5-15', 100),
(1, 10, '2022-6-15', 90),
(1, 10, '2022-7-15', 52),
(1, 10, '2022-8-15', 95),
(1, 10, '2022-9-15', 87),
(1, 11, '2021-10-15', 68),
(1, 11, '2021-11-15', 97),
(1, 11, '2021-12-15', 64),
(1, 11, '2022-1-15', 86),
(1, 11, '2022-2-15', 67),
(1, 11, '2022-3-15', 85),
(1, 11, '2022-4-15', 63),
(1, 11, '2022-5-15', 88),
(1, 11, '2022-6-15', 63),
(1, 11, '2022-7-15', 79),
(1, 11, '2022-8-15', 70),
(1, 11, '2022-9-15', 97),
(1, 12, '2021-10-15', 51),
(1, 12, '2021-11-15', 55),
(1, 12, '2021-12-15', 60),
(1, 12, '2022-1-15', 65),
(1, 12, '2022-2-15', 54),
(1, 12, '2022-3-15', 47),
(1, 12, '2022-4-15', 63),
(1, 12, '2022-5-15', 52),
(1, 12, '2022-6-15', 42),
(1, 12, '2022-7-15', 63),
(1, 12, '2022-8-15', 63),
(1, 12, '2022-9-15', 43),
(1, 13, '2021-10-15', 40),
(1, 13, '2021-11-15', 53),
(1, 13, '2021-12-15', 44),
(1, 13, '2022-1-15', 64),
(1, 13, '2022-2-15', 55),
(1, 13, '2022-3-15', 63),
(1, 13, '2022-4-15', 53),
(1, 13, '2022-5-15', 55),
(1, 13, '2022-6-15', 43),
(1, 13, '2022-7-15', 60),
(1, 13, '2022-8-15', 52),
(1, 13, '2022-9-15', 55),
(1, 14, '2021-10-15', 87),
(1, 14, '2021-11-15', 72),
(1, 14, '2021-12-15', 57),
(1, 14, '2022-1-15', 55),
(1, 14, '2022-2-15', 72),
(1, 14, '2022-3-15', 59),
(1, 14, '2022-4-15', 54),
(1, 14, '2022-5-15', 92),
(1, 14, '2022-6-15', 68),
(1, 14, '2022-7-15', 64),
(1, 14, '2022-8-15', 95),
(1, 14, '2022-9-15', 70),
(1, 15, '2021-10-15', 90),
(1, 15, '2021-11-15', 86),
(1, 15, '2021-12-15', 98),
(1, 15, '2022-1-15', 52),
(1, 15, '2022-2-15', 90),
(1, 15, '2022-3-15', 75),
(1, 15, '2022-4-15', 64),
(1, 15, '2022-5-15', 100),
(1, 15, '2022-6-15', 71),
(1, 15, '2022-7-15', 93),
(1, 15, '2022-8-15', 74),
(1, 15, '2022-9-15', 51),
(1, 16, '2021-10-15', 83),
(1, 16, '2021-11-15', 95),
(1, 16, '2021-12-15', 85),
(1, 16, '2022-1-15', 86),
(1, 16, '2022-2-15', 83),
(1, 16, '2022-3-15', 87),
(1, 16, '2022-4-15', 88),
(1, 16, '2022-5-15', 99),
(1, 16, '2022-6-15', 83),
(1, 16, '2022-7-15', 91),
(1, 16, '2022-8-15', 95),
(1, 16, '2022-9-15', 99),
(1, 17, '2021-10-15', 67),
(1, 17, '2021-11-15', 57),
(1, 17, '2021-12-15', 69),
(1, 17, '2022-1-15', 56),
(1, 17, '2022-2-15', 68),
(1, 17, '2022-3-15', 70),
(1, 17, '2022-4-15', 52),
(1, 17, '2022-5-15', 51),
(1, 17, '2022-6-15', 56),
(1, 17, '2022-7-15', 54),
(1, 17, '2022-8-15', 70),
(1, 17, '2022-9-15', 52)
GO
