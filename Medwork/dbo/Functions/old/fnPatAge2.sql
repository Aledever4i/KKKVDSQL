CREATE FUNCTION [dbo].[fnPatAge2](@PatientID INTEGER, @CurDate DateTime)
RETURNS VARCHAR(50)
BEGIN
  RETURN (
    SELECT 
      CASE 
        WHEN BIRTHDATE IS NULL THEN 0
        WHEN dbo.fnAge(birthdate, @curdate)>0 then LTRIM(STR(dbo.fnAge( birthdate, @curdate)))
      END
    FROM
      Patient WITH (NOLOCK)
    WHERE
      ID = @PatientID
  )
END



