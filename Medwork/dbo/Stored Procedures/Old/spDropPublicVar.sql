
CREATE PROCEDURE spDropPublicVar
  @VarName CHAR(100)
AS
  DELETE FROM [Variable]
  WHERE
    Name=@VarName AND SPID=0

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spDropPublicVar] TO PUBLIC
    AS [dbo];

