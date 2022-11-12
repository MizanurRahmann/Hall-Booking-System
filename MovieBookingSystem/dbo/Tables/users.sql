CREATE TABLE [dbo].[users]
(
	[id] INT PRIMARY KEY IDENTITY(1,1),
	[name] VARCHAR (30) NOT NULL,
	[city_id] INT NOT NULL,
	CONSTRAINT fk_group_users FOREIGN KEY ([city_id])
    REFERENCES [dbo].[cities]([id])
)
