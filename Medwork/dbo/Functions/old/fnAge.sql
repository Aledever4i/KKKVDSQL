CREATE FUNCTION dbo.fnAge
(
	@BirthDate datetime, 
	@Now datetime
)
RETURNS int
BEGIN
  DECLARE @Age int

  SET @Age = DATEDIFF(YEAR, @BirthDate, @Now)

  IF @Now < DATEADD(YEAR, @Age, @BirthDate)
  BEGIN
	SET @Age = @Age - 1
  END

  RETURN @Age
END
