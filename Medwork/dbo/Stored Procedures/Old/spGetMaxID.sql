﻿CREATE PROCEDURE spGetMaxID
  @TableName CHAR(1024),
  @MaxID INTEGER OUTPUT
AS
  DECLARE @SQL CHAR(2048)
  DECLARE @ID INTEGER
  
  SET @SQL = 'SET @ID = (SELECT TOP 1 [ID] FROM ' + @TableName + ' ORDER BY [ID] DESC)'
  
  EXECUTE(@SQL)
  SET @MaxID = @ID
  IF @ID IS NULL 
  BEGIN
    SET @ID = 0
  END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spGetMaxID] TO PUBLIC
    AS [dbo];
