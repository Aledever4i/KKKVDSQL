CREATE FUNCTION fnTimeInInterval (
  @Time DATETIME, 
  @StartTime DATETIME,
  @IntervalInMinutes INTEGER
) RETURNS BIT
BEGIN
  RETURN (
    CASE 
      WHEN DATEPART(hour, @Time)*60 + DATEPART(minute, @Time) 
           BETWEEN 
           (DATEPART(hour, @StartTime)*60 + DATEPART(minute, @StartTime)) 
           AND 
           (DATEPART(hour, @StartTime)*60 + DATEPART(minute, @StartTime) + @IntervalInMinutes-1)
      THEN 1
    ELSE 0
    END)
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnTimeInInterval] TO PUBLIC
    AS [dbo];

