﻿
CREATE FUNCTION fnPatID(@PatientID INTEGER)
RETURNS VARCHAR(10)
BEGIN
  RETURN (
    SELECT TOP 1 
      CASE 
        WHEN ISNULL(LTRIM(STR(ID)),'')='' THEN NULL
        ELSE LTRIM(STR(ID))
      END
    FROM
      Patient
    WHERE
      ID = @PatientID
    ORDER BY ID DESC
  )
END

