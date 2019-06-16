
CREATE PROCEDURE spCreateForeignKey
  @DetailTable VARCHAR(128),
  @DetailTableKey VARChar(128),
  @MasterTable VARCHAR(128),
  @MasterTableKey VARCHAR(128),
  @Options VARCHAR(100)
AS
  DECLARE @Name VARCHAR(300), @SQL VARCHAR(1024)
  
  SELECT @Name = 'FK_'+RTRIM(@DetailTable)+'_To_'+RTRIM(@MasterTable)

  IF (SELECT dbo.fnSysObjectExists(@Name, 'F'))=1
  BEGIN
    SELECT @SQL = 'ALTER TABLE ['+RTRIM(@DetailTable)+'] DROP CONSTRAINT ['+@Name+']'    
    EXEC(@SQL)
  END

  SELECT @SQL = 
    'ALTER TABLE ['+@DetailTable+'] ADD CONSTRAINT ['+RTRIM(@Name)+'] ' + 
    'FOREIGN KEY (['+@DetailTableKey+']) REFERENCES ['+@MasterTable+'] (['+@MasterTableKey+']) '+
    @Options

  EXEC(@SQL) 
