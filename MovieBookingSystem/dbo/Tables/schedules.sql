CREATE TABLE [dbo].[schedules]
(
	[id] INT PRIMARY KEY IDENTITY(1,1),
	[movie_id] INT,
	[hall_id] INT NOT NULL,
	[show_time] DATETIME NOT NULL,
	[price] INT NOT NULL,
	CONSTRAINT fk_group_show_movie FOREIGN KEY ([movie_id])
    REFERENCES [dbo].[movies]([id]),
	CONSTRAINT fk_group_show_hall FOREIGN KEY ([hall_id])
    REFERENCES dbo.[halls]([id])
)
