
CREATE FUNCTION fnColumnExists(@TableName VARCHAR(200), @ColumnName VARCHAR(200))
RETURNS BIT
BEGIN
  DECLARE @TableID INTEGER

  SELECT @TableID = ID FROM SysObjects WHERE Type = 'U' AND Name = RTRIM(@TableName)
  RETURN (
    SELECT 
      CASE 
        WHEN 
          @TableID IS NOT NULL 
          AND EXISTS (SELECT * FROM SysColumns WHERE ID=@TableID AND Name=RTRIM(@ColumnName))
        THEN 1
        ELSE 0
      END
    )
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnColumnExists] TO PUBLIC
    AS [dbo];

