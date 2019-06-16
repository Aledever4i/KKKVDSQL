CREATE FUNCTION dbo.PatientPolicyNumberCheck
(
    @PolicyNumber varchar(100),
    @PolicyTypeId int
)
RETURNS bit
AS
BEGIN
    RETURN (
        SELECT
            CASE
                WHEN 
                    (@PolicyTypeId = 3 AND ISNUMERIC(@PolicyNumber) = 1 AND LEN(@PolicyNumber) = 16) 
                    OR (@PolicyTypeId <> 3) 
                    THEN 1
                ELSE 0
                END
    )
END
