
CREATE FUNCTION fnLibraryObjectPath(@ID INTEGER)  
RETURNS VARCHAR(8000)
BEGIN
  DECLARE @ParentID INTEGER
  DECLARE @Name VARCHAR(8000)

  SELECT @ParentID=MasterID, @Name=Name 
  FROM OpenDataSource('Microsoft.Jet.OLEDB.4.0', 'Data Source=E:\public\_medwork\current\medwork project\data\local.mdb')...form
  WHERE
    ID = @ID 
    
  IF NOT (@ParentID IS NULL OR @ParentID=0) 
  BEGIN
    SELECT 
      @Name = RTRIM(dbo.fnLibraryObjectPath(@ParentID))+'\'+@Name
  END  
  RETURN (SELECT RTRIM(@Name))
END
