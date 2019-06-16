
CREATE FUNCTION fnTestObjectAccess(@ObjID INTEGER, @GroupID INTEGER, @ParamName VARCHAR(100))
RETURNS BIT
BEGIN
  DECLARE @Access VARCHAR(256)
  DECLARE @RESULT BIT
  SELECT @Access = dbo.fnGetProfileParam(@GroupID,@ParamName)
  SELECT @RESULT= CASE 
                    WHEN @Access IS NULL THEN 1
                    WHEN @Access=CHAR(13) THEN 1 
                    WHEN RTrim(@Access)='' THEN 1
                    ELSE (SELECT CONVERT(BIT,COUNT(*)) 
                          FROM dbo.fnMakeTableFromString(@Access,',')
                          WHERE LTRIM(RTRIM(Value))=LTRIM(RTRIM(STR(@ObjID))))
                  END
  RETURN @RESULT
END
