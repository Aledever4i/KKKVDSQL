CREATE FUNCTION dbo.fnPatSex
(
	@PatId int
)
RETURNS varchar(1)
AS
BEGIN
	DECLARE @sex varchar(1)
	
	SELECT
		@sex = CASE
			WHEN p.Sex = 'M'
				THEN 'М'
			WHEN p.Sex = 'F'
				THEN 'Ж'
			ELSE '-'
		END
		FROM dbo.Patient AS p
		WHERE p.ID = @PatId

	RETURN @sex
END

