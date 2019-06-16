
CREATE PROCEDURE spSetPublicVar
  @Name CHAR(100),
  @Value CHAR(200)
AS
  DELETE FROM [Variable] 
  WHERE 
    Name=@Name AND SPID=0
    
  INSERT INTO [Variable] 
    (Name, Value, SPID) 
  VALUES 
    (@Name, @Value, 0)
  



GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spSetPublicVar] TO PUBLIC
    AS [dbo];

