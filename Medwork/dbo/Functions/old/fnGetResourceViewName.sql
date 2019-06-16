CREATE FUNCTION fnGetResourceViewName(
  @ResourceTypeID INTEGER,
  @Date DATETIME)
RETURNS CHAR(200)
BEGIN
  RETURN (
    SELECT TOP 1 ViewName 
    FROM 
      ResourceView 
    WHERE 
      ResourceTypeID=@ResourceTypeID
      AND
      Date=@Date
  )
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnGetResourceViewName] TO PUBLIC
    AS [dbo];

