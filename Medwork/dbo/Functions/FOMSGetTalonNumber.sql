CREATE FUNCTION dbo.FOMSGetTalonNumber
(
	@ID int
)
RETURNS varchar(10)
AS
BEGIN
	DECLARE @Result varchar(10) = ''
	
	IF ((SELECT fr.TalonNumber FROM dbo.FOMSRequests AS fr WHERE fr.ID = @ID) IS NOT NULL)
	BEGIN
		SELECT
			@Result = ISNULL(CAST(fr.TalonNumber AS varchar(10)), '')
			FROM dbo.FOMSRequests AS fr
			WHERE fr.ID = @ID
	END
	ELSE
	BEGIN
		SELECT
			@Result = CAST(MAX(fr.TalonNumber) + 1 AS varchar(10))
			FROM dbo.FOMSRequests AS fr
	END
	
	RETURN @Result
END

