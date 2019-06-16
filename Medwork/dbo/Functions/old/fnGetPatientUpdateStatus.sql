﻿

CREATE  FUNCTION fnGetPatientUpdateStatus(@PatID INT)
RETURNS INT
BEGIN
  DECLARE @RESULT INT
  DECLARE @RANGESTART INT, @RANGEEND INT
 
  SELECT TOP 1 @RANGESTART=RangeStart, @RangeEnd=RangeEnd FROM UpdateRange
  select @RESULT=SUM(ID) 
  from 
    number
  where 
    ID>@RANGESTART and ID<@RANGEEND and 
    not EXISTS (SELECT * FROM PATIENT WHERE PATIENT.ID=number.ID)

  RETURN @RESULT
END



