﻿
CREATE FUNCTION fnDate(@Value DATETIME)
RETURNS DATETIME
BEGIN
  DECLARE @V FLOAT

  SELECT @V = CONVERT(FLOAT, @Value)
  RETURN (SELECT CONVERT(DATETIME, FLOOR(@V)))
END
