
CREATE PROCEDURE spDropSysObject
  @ObjectName VARCHAR(128)
AS
  DECLARE @Type CHAR(2)
  DECLARE @KeyWord VARCHAR(20)

  SET @ObjectName = RTRIM(@ObjectName)

  SELECT TOP 1 @Type = [Type] 
  FROM 
    SysObjects 
  WHERE
    Name = @ObjectName

  IF @Type = 'P' SET @KeyWord = 'PROCEDURE'
  IF @Type = 'FN' SET @KeyWord = 'FUNCTION' 
  IF @Type = 'U' SET @KeyWord = 'TABLE' 
  IF @Type = 'V' SET @KeyWord = 'VIEW' 
  IF @Type = 'TR' SET @KeyWord = 'TRIGGER'
  IF @Type = 'F' SET @KeyWord = 'CONSTRAINT'
  
  
  IF @KeyWord IS NOT NULL 
  BEGIN
    SET @KeyWord = RTRIM(@KeyWord)
    EXEC('DROP '+@KeyWord+' ['+ @ObjectName + ']')
--    SELECT 'DROPPED '+@KeyWord+' '+@ObjectName
  END
