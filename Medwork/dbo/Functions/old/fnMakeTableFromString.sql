﻿
CREATE FUNCTION fnMakeTableFromString(@STR VARCHAR(2000), @Divider CHAR(1))
RETURNS @ResultTable TABLE (ID INTEGER primary key, VALUE varchar(2000))
BEGIN
  DECLARE @CURID INTEGER
  DECLARE @REST VARCHAR(2000)
  DECLARE @CURVALUE VARCHAR(2000)
  DECLARE @POS INTEGER
  SELECT @REST=@STR
  SELECT @POS=CHARINDEX(@DIVIDER,@REST)
  SELECT @CURID = 1
  WHILE @POS>0 
  BEGIN
    SELECT @CURVALUE=SUBSTRING(@REST,1,@POS-1)
    SELECT @REST = SUBSTRING(@REST,@Pos+1, LEN(@REST)-@Pos)
    INSERT INTO @ResultTable SELECT @CURID, RTRIM(@CURVALUE)
    SELECT @POS=CHARINDEX(@DIVIDER,@REST)
    SELECT @CURID=@CURID+1
  END
  IF RTRIM(@REST)<>'' INSERT INTO @ResultTable SELECT @CURID, RTRIM(@REST)
  RETURN
END
