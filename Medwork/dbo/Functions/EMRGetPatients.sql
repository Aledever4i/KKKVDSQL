CREATE FUNCTION dbo.EMRGetPatients()
RETURNS @Patients table (PatientId int)
AS
BEGIN
	INSERT INTO @Patients(
		PatientId
		) 
		SELECT DISTINCT
			sp.idpatient AS PatientId
			FROM dbo.selectpatients AS sp
			WHERE
				sp.IsSendingToFOMS = 0
				AND sp.FormTypeID IS NULL
				AND sp.FormID IS NULL
				AND sp.ActionID = 2 -- 2 - Изменение данных
	RETURN
END