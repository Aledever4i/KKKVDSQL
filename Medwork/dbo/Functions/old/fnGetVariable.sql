
CREATE FUNCTION fnGetVariable(@Name VARCHAR(100))
RETURNS VARCHAR(200)
BEGIN
  RETURN (
    SELECT TOP 1 
      RTRIM(Value) 
    FROM 
      [Variable] 
    WHERE 
      [Name]=@Name AND SPID=@@SPID
  )
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnGetVariable] TO PUBLIC
    AS [dbo];

