
CREATE PROCEDURE spCreateIndex
  @TableName VARCHAR(200), 
  @FieldName VARCHAR(200)
AS
  DECLARE @IndexName VARCHAR(1024)

  SELECT @IndexName = 'IX_'+RTRIM(@TableName)+'_'+RTRIM(@FieldName)

  IF NOT EXISTS (
    SELECT * FROM dbo.SysIndexes 
    WHERE 
      Name = @IndexName
    )
  BEGIN
    SELECT @IndexName = 
      'CREATE INDEX '+RTRIM(@IndexName)+' ON '+RTRIM(@TableName)+' ('+RTRIM(@FieldName)+')'
    EXEC(@IndexName) 
  END
