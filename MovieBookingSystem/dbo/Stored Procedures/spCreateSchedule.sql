CREATE PROCEDURE [dbo].[spCreateSchedule]
	@movieId INT,
	@hallId INT,
	@showTime DATETIME,
	@price INT
AS
BEGIN
	IF  EXISTS (
			SELECT * 
			FROM [dbo].[holidays]
			WHERE [hall_id] = @hallId AND [weekday] = DATENAME(WEEKDAY, @showTime)
		)
		OR (
			SELECT COUNT([id])
			FROM [dbo].[schedules] 
			GROUP BY [hall_id], CONVERT(DATE, [show_time])
			HAVING [hall_id] = @hallId AND CONVERT(DATE, [show_time]) = CONVERT(DATE, @showTime)
		) >= 2
		OR EXISTS (
			SELECT DATEDIFF(HOUR, [show_time], @showTime) AS difference 
			FROM [dbo].[schedules] 
			WHERE 
				DATEDIFF(HOUR, [show_time], @showTime) < 4 
				AND DATEDIFF(HOUR, [show_time], @showTime) > -4
				AND [hall_id] = @hallId
		)
		RAISERROR('You cant insert a schedule in this hall at the given date.', 1, 1);
	ELSE
		INSERT INTO [dbo].[schedules]([movie_id], [hall_id], [show_time], [price]) 
		VALUES (@movieId, @hallId, @showTime, @price);
END