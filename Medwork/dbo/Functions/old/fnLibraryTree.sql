
CREATE FUNCTION fnLibraryTree (@ID INTEGER)  
RETURNS INTEGER
BEGIN
  DECLARE @ParentID INTEGER
  DECLARE @I INTEGER

  SET @ParentID = @ID
  SET @I = 0
  WHILE NOT (@ParentID IS NULL OR @ParentID=0)
  BEGIN
    SET @ParentID = (
      SELECT MasterID 
      FROM Library 
      WHERE
        ID = @ParentID 
    )
    
    IF NOT (@ParentID IS NULL OR @ParentID=0) SET @I = @I + 1
  END  
  RETURN @I
END
