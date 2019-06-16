
CREATE FUNCTION [dbo].[fnAppServices](@ID INTEGER)  
RETURNS VARCHAR(8000)
BEGIN
	DECLARE @result VARCHAR(8000)
	DECLARE @sName VARCHAR(255)
	set @result = ''

	DECLARE sCursor CURSOR FOR
	SELECT ServiceName FROM AppointmentService
	WHERE masterid = @ID 

	OPEN sCursor

	-- Perform the first fetch.
	FETCH NEXT FROM sCursor into @sName

	-- Check @@FETCH_STATUS to see if there are any more rows to fetch.
	WHILE @@FETCH_STATUS = 0
	BEGIN
	   -- This is executed as long as the previous fetch succeeds.
		set @result = @result + @sName + '; '
		FETCH NEXT FROM sCursor into @sName
	END

	CLOSE sCursor
	DEALLOCATE sCursor

	RETURN (SELECT RTRIM(@result))
END
