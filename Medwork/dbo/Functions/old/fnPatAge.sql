
CREATE FUNCTION [dbo].[fnPatAge](@PatientID INTEGER, @CurDate DateTime)
RETURNS VARCHAR(50)
BEGIN
  RETURN (
    SELECT 
      CASE 
        WHEN BIRTHDATE IS NULL THEN 'не указан'
        WHEN dbo.fnAge(birthdate, @curdate)>0 then LTRIM(STR(dbo.fnAge( birthdate, @curdate)))+
                                                       CASE RIGHT(LTRIM(STR(dbo.fnAge( birthdate, @curdate))),1)
                                                         WHEN 0 THEN ' лет'
                                                         WHEN 1 THEN ' год'
                                                         WHEN 2 THEN ' года'
                                                         WHEN 3 THEN ' года'
                                                         WHEN 4 THEN ' года'
                                                         WHEN 5 THEN ' лет'
                                                         WHEN 6 THEN ' лет'
                                                         WHEN 7 THEN ' лет'
                                                         WHEN 8 THEN ' лет'
                                                         WHEN 9 THEN ' лет'
                                                       END
      END
    FROM
      Patient WITH (NOLOCK)
    WHERE
      ID = @PatientID
  )
END



