
CREATE FUNCTION fnGetUsrNameFromID(@UsrID INTEGER)
RETURNS VARCHAR(30)
BEGIN
  RETURN (
    SELECT TOP 1
      u.Name
    FROM
      Usr u
    WHERE
      u.ID = @UsrID
  )
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnGetUsrNameFromID] TO PUBLIC
    AS [dbo];

