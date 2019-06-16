
CREATE PROCEDURE spSetVariable
  @Name CHAR(50),
  @Value CHAR(200)
AS
  DELETE FROM [Variable] 
  WHERE 
    Name=@Name AND SPID=@@SPID
    
  INSERT INTO [Variable] 
    (Name, Value, SPID) 
  VALUES 
    (@Name, @Value, @@SPID)
  



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spSetVariable] TO PUBLIC
    AS [dbo];

