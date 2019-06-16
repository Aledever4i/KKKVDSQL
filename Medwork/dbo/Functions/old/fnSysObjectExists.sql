CREATE FUNCTION fnSysObjectExists(
  @ObjectName CHAR(200), 
  @Type CHAR(2))
RETURNS BIT
BEGIN
  RETURN( 
    SELECT CASE 
      WHEN EXISTS (SELECT * FROM SysObjects WHERE Type=@Type AND Name=@ObjectName)
      THEN 1
    ELSE 0
    END)
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnSysObjectExists] TO PUBLIC
    AS [dbo];

