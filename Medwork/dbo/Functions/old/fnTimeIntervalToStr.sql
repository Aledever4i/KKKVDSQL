
CREATE FUNCTION fnTimeIntervalToStr(
  @StartTime DATETIME,
  @EndTime DATETIME
)
RETURNS VARCHAR(20)
BEGIN
  RETURN (SELECT 'c '+REPLACE(dbo.fnShortTime(@StartTime),':','.')+' по '+REPLACE(dbo.fnShortTime(@EndTime),':','.'))
END
