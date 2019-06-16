﻿
CREATE FUNCTION fnConvertMoney(@Money FLOAT, @CourseID INTEGER)
RETURNS FLOAT
BEGIN
  RETURN CONVERT(INTEGER, @Money * (SELECT [Value] FROM Course WHERE ID=@CourseID))
END

GO
GRANT EXECUTE
    ON OBJECT::[dbo].[fnConvertMoney] TO PUBLIC
    AS [dbo];
