
CREATE PROCEDURE spDropViewsLike
  @Pattern VARCHAR(128)
AS
  DECLARE @ViewName VARCHAR(128)

  SELECT @Pattern = RTRIM(@Pattern)

  DECLARE crBadViews CURSOR
  FOR
    SELECT Name FROM SysObjects
    WHERE 
      Type='V' AND Name LIKE @Pattern
  OPEN crBadViews

  DECLARE @COUNT INTEGER
  SET @COUNT=0

  FETCH NEXT FROM crBadViews INTO @ViewName
  WHILE @@FETCH_STATUS=0
  BEGIN
    SET @ViewName=RTRIM(@ViewName)
    EXEC('DROP VIEW '+@ViewName)
    SET @COUNT = @COUNT + 1
    FETCH NEXT FROM crBadViews INTO @ViewName
  END  

  CLOSE crBadViews
  DEALLOCATE crBadViews  
  IF (@COUNT>0) SELECT 'Dropped views: '+CONVERT(CHAR(10), @COUNT)
