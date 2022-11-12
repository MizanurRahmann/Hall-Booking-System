CREATE TABLE [dbo].cinemas
(
	[id] INT PRIMARY KEY IDENTITY(1,1),
	[cinema_name] VARCHAR (50) NOT NULL,
	[city_id] INT NOT NULL,
	CONSTRAINT fk_group_cinemas FOREIGN KEY ([city_id])
    REFERENCES [dbo].[cities](id)
)
