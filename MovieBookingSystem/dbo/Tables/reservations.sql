CREATE TABLE [dbo].[reservations]
(
	[id] INT PRIMARY KEY IDENTITY(1,1),
	[user_id] INT NOT NULL,
	[show_id] INT NOT NULL,
	[no_of_tickets] INT DEFAULT(1),
	CONSTRAINT fk_group_res_user FOREIGN KEY ([user_id])
    REFERENCES [dbo].[users]([id]),
	CONSTRAINT fk_group_res_show FOREIGN KEY ([show_id])
    REFERENCES [dbo].[schedules]([id])
)
