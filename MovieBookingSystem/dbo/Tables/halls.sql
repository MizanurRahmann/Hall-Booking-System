CREATE TABLE [dbo].[halls]
(
	[id] INT PRIMARY KEY IDENTITY(1,1),
	[hall_name] VARCHAR (50) NOT NULL,
	[cinema_id] INT NOT NULL,
	[capacity] INT NOT NULL,
	CONSTRAINT fk_group_hall FOREIGN KEY ([cinema_id])
    REFERENCES [dbo].[cinemas]([id])
)
