CREATE FUNCTION [dbo].[udfWeekendOfHall](@hallId INT)
RETURNS varchar (20)
AS
BEGIN
	DECLARE @returnedHallId varchar (20);
	SELECT  @returnedHallId = CONCAT(weekday, ': ', [hall_id]) FROM [dbo].[holidays] WHERE [hall_id] = @hallId;
	
	RETURN @returnedHallId
END