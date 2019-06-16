CREATE FUNCTION dbo.STGetTalonNumber
(
	@ID int
)
RETURNS int
AS
BEGIN
	DECLARE @Result int
	
	IF (@ID = 0)
	BEGIN
		SELECT
			@Result = MAX(fr.ID) + 1
			FROM dbo.FOMSRequests AS fr
	END
	ELSE
	BEGIN
		SELECT
			@Result = fr.TalonNumber
			FROM dbo.FOMSRequests AS fr
			WHERE fr.ID = @ID
	END
	
	RETURN @Result
END

