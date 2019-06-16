
CREATE PROCEDURE spDropVariable
  @VarName CHAR(100)
AS
  DELETE FROM [Variable]
  WHERE
    Name=@VarName AND SPID=@@SPID

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[spDropVariable] TO PUBLIC
    AS [dbo];

