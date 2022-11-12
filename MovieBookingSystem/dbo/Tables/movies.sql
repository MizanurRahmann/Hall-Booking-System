CREATE TABLE [dbo].[movies]
(
	[id] INT PRIMARY KEY IDENTITY(1,1),
	[name] VARCHAR (50) NOT NULL,
	[running_time] DECIMAL(4,2) NOT NULL,
	[language] VARCHAR (10),
	[release_time] DATETIME,
	[genre] VARCHAR (30)
)
