﻿
CREATE FUNCTION fnTime(@Value DATETIME)
RETURNS DATETIME
BEGIN
  DECLARE @V FLOAT

  SELECT @V = CONVERT(FLOAT, @Value+1)
  RETURN (SELECT CONVERT(DATETIME, @V+1e-10- FLOOR(@V)))
END
