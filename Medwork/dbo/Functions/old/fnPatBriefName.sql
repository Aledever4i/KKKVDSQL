
CREATE FUNCTION [dbo].[fnPatBriefName](@PatientID INTEGER)
RETURNS VARCHAR(50)
BEGIN
  RETURN (
    SELECT TOP 1
      RTRIM(
		  ISNULL(p.LastName, '') + ' '+
		  CASE 
			WHEN p.FirstName IS NOT NULL
				THEN LEFT(p.FirstName, 1) + '.'
			ELSE ''
		  END  
		  + CASE 
				WHEN p.SecondName IS NOT NULL
					THEN LEFT(p.SecondName, 1) + '.'
			ELSE '' 
		  END
    )
    FROM Patient AS p WITH (NOLOCK)
    WHERE p.ID = @PatientID
    ORDER BY p.ID DESC
  )
END
