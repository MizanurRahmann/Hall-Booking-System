CREATE PROCEDURE spBookTicket 
	@userId INT, 
	@numOfTickets INT, 
	@scheduleId INT,
	@result INT OUTPUT
AS
BEGIN
	DECLARE @totalBuyTicketByThisUser INT;
	DECLARE @totalSoldTicketsForThisShow INT;
	DECLARE @totalHallCapacity INT;

	SET @totalBuyTicketByThisUser = 0;
	SET @totalSoldTicketsForThisShow = 0;
	SET @totalHallCapacity = 0;

	-- total sold tickets to this user for this show
	SELECT @totalBuyTicketByThisUser = SUM([no_of_tickets]) 
	FROM [dbo].[reservations] 
	GROUP BY [user_id], [show_id]
	HAVING [user_id] = @userId AND [show_id] = @scheduleId 

	-- total sold tickets for this show to different users
	SELECT @totalSoldTicketsForThisShow = SUM([no_of_tickets]) 
	FROM [dbo].[reservations]
	WHERE [show_id] = @scheduleId;
	
	-- total hall capacity where this show will be held
	SELECT @totalHallCapacity = [h].[capacity]
	FROM [dbo].[schedules] AS s
	INNER JOIN [dbo].[halls] AS [h] ON [h].[id] = [s].[hall_id]
	WHERE [s].[id] = @scheduleId;

	
	IF @totalBuyTicketByThisUser + @numOfTickets > 4
		SET @result = -2;
	ELSE
		BEGIN
			IF @totalSoldTicketsForThisShow + @numOfTickets > @totalHallCapacity
				SET @result = -1;
			ELSE
				BEGIN
					INSERT INTO [dbo].[reservations]([user_id], [show_id], [no_of_tickets])
					VALUES (@userId, @scheduleId, @numOfTickets);

					SELECT @result = SUM([price] * @numOfTickets) FROM [dbo].[schedules] WHERE [id] = @scheduleId;
				END
		END
END
