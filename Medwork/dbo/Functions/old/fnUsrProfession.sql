CREATE FUNCTION dbo.fnUsrProfession
(
	@RecId int
)
RETURNS varchar(100)
AS
BEGIN
	DECLARE @Result varchar(100)

	SELECT 
		@Result = ISNULL(usr.DoctorPost, 'должность не указана')
		FROM dbo.Usr AS usr
		WHERE usr.ID = @RecId

	RETURN @Result
END

