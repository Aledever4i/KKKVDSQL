CREATE PROCEDURE [dbo].[EMRSetIsSend]
	@PatientId int,
	@IsSend bit
AS
BEGIN
	UPDATE dbo.selectpatients
		SET IsSendingToFOMS = @IsSend
		WHERE
			idpatient = @PatientId
			AND ActionID IN (1, 2) -- 2 - Изменение данных
END