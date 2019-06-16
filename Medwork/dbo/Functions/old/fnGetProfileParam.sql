
CREATE FUNCTION fnGetProfileParam(@GroupID INTEGER, @ParamName CHAR(50))
RETURNS VARCHAR(256)
BEGIN
  DECLARE @StartPos INTEGER
  DECLARE @EQPos INTEGER
  DECLARE @EndPos INTEGER
  DECLARE @Result VARCHAR(256)

  
  SELECT @StartPos=CHARINDEX(RTRIM(@ParamName),profile) FROM UsrGroup WHERE GroupID=@GroupID
  IF @StartPos>0
  BEGIN
    SELECT @EndPos=CHARINDEX(CHAR(13),profile,@StartPos) FROM UsrGroup WHERE GroupID=@GroupID
    SELECT @EQPos=CHARINDEX('=',profile,@StartPos) FROM UsrGroup WHERE GroupID=@GroupID
    IF @EQPos>0
    BEGIN
      IF @EndPos>0 
      BEGIN
        SELECT @RESULT = SUBSTRING(profile,@EQPos+1,@EndPos-@EQPos-1) FROM UsrGroup 
        WHERE GroupID=@GroupID
      END
      ELSE
        SELECT @RESULT = SUBSTRING(profile,@EQPos+1,256) FROM UsrGroup WHERE GroupID=@GroupID
    END
  END
  ELSE SET @RESULT=NULL
  IF @RESULT=CHAR(13) SELECT @RESULT=''
  RETURN LTRIM(@RESULT)
END
