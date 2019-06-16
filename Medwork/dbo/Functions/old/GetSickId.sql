CREATE FUNCTION dbo.GetSickId
(
	@String varchar(MAX)
)
RETURNS int
AS
BEGIN
	DECLARE @EnRuReplace varchar(MAX)
	SET @EnRuReplace = dbo.GetRuEnReplace(@String, 1)
	
	RETURN (
		SELECT 
			ID
			FROM dbo.mkb10 
			WHERE KOD = @EnRuReplace
	)
END