
CREATE FUNCTION dbo.fnGetText(@Name VARCHAR(100))
RETURNS VARCHAR(4000)
BEGIN
  RETURN (
    SELECT TOP 1 
      SUBSTRING(Text,1,4000)
    FROM 
      [Text] 
    WHERE 
      [Name]=@Name
  )
END

