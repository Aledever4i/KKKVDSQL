
CREATE FUNCTION fnGetPublicVar(@Name VARCHAR(100))
RETURNS VARCHAR(200)
BEGIN
  RETURN (
    SELECT TOP 1 
      RTRIM(Value) 
    FROM 
      [Variable] 
    WHERE 
      [Name]=@Name AND SPID=0
  )
END


GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnGetPublicVar] TO PUBLIC
    AS [dbo];

