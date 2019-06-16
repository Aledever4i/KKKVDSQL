CREATE PROCEDURE [dbo].[DirectionToChistovodnoeAdd]
	@DestinationId int,
	@DestinationDate datetime,
	@DestinationTakeDate datetime,
	@DoctorId int,
	@PatientId int,
	@PaymentTypeId int,
	@MkbId int,
	@DiagnosisId int,
	@EditorId int
AS
BEGIN
	INSERT INTO dbo.DirectionToChistovodnoe
	(
		DestinationId, 
		DestinationDate,
		DestinationTakeDate,
		DoctorId,
		PaymentTypeId,
		DiagnosisId,
		MkbId
	)
	VALUES
	(
			@DestinationId,
			@DestinationDate,
			@DestinationTakeDate,
			@DoctorId,
			@PaymentTypeId,
			@DiagnosisId,
			@MkbId
	)
END
