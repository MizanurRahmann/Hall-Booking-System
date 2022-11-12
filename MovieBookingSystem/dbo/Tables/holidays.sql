CREATE TABLE [dbo].[holidays]
(
	[id] INT PRIMARY KEY IDENTITY(1,1),
	[weekday] VARCHAR (10) NOT NULL,
	[hall_id] INT NOT NULL,
	CONSTRAINT fk_group_holiday FOREIGN KEY ([hall_id])
    REFERENCES [dbo].[halls]([id])
)
