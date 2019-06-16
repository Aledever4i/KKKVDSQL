CREATE FUNCTION dbo.fnPatCardLocation
(
	@PatId int
)
RETURNS nvarchar(100)
AS
BEGIN
	return (
		SELECT
			Section
			from dbo.Patient AS p
			where p.ID = @PatId
	)
END
