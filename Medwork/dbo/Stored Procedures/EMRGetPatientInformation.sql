CREATE PROCEDURE [dbo].[EMRGetPatientInformation]
AS
BEGIN
	SELECT DISTINCT
		p.ID AS PatientId,
        CASE
            WHEN p.PolicyTypeId = 3 THEN p.NomerPolisa
            ELSE NULL
            END AS Enp,
        ins.SMO AS insuranceCode,
        ins.Name AS insuranceCompany,
        ins.OKATO AS insuranceCompanyOkato,
        CAST(p.PolicyTypeId AS varchar) AS policyType,
        p.SeriyaPolisa AS policySer,
        p.NomerPolisa AS policyNum,
        p.FirstName AS givenName,
        p.LastName AS familyName,
        p.SecondName AS middleName,
        p.BirthDate AS dob
        FROM dbo.Patient AS p
        JOIN dbo.selectpatients AS sp ON
			sp.idpatient = p.ID
			--AND sp.IsSendingToFOMS = 0
			AND sp.FormTypeID IS NULL
			AND sp.FormID IS NULL
			AND sp.ActionID = 2 -- 2 - Изменение данных
			AND sp.idpatient = 105501
        LEFT JOIN dbo.FOMSF002 AS ins ON ins.SMO = p.SMO      
END