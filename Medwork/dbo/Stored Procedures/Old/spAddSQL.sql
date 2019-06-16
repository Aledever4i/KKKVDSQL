CREATE PROCEDURE spAddSQL 
  @SQL CHAR(1024),
  @Separator CHAR(256) = ''
AS
  IF @Separator<>'' 
    IF (SELECT COUNT(*) FROM tmpSQLGenerator)=0 
      SET @Separator = ''

  INSERT INTO tmpSQLGenerator (SQL)
  VALUES (RTRIM(@Separator) + RTRIM(@SQL))

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spAddSQL] TO PUBLIC
    AS [dbo];

