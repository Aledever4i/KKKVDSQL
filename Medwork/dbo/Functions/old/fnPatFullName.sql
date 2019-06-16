CREATE FUNCTION fnPatFullName(@PatientID INTEGER)
RETURNS VARCHAR(100)
BEGIN
  RETURN (
    SELECT TOP 1
      CASE WHEN LastName IS NOT NULL THEN LastName else '' END +
      CASE WHEN FirstName IS NOT NULL THEN ' '+FirstName else '' END +
      CASE WHEN SecondName IS NOT NULL THEN ' '+SecondName else '' END
    FROM
      Patient WITH (NOLOCK)
    WHERE
      ID = @PatientID
    ORDER BY ID DESC
  )
END
