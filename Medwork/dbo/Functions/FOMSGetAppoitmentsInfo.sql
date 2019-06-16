CREATE FUNCTION [dbo].[FOMSGetAppoitmentsInfo](@RequestId int)
RETURNS @Result table (
	FirstPriemDate varchar(10),
	LastPriemDate varchar(10),
	TreatmentPlaceTypeId int, 
	PreviewDiagCode nvarchar(6),
	FinalDiagCode nvarchar(6),
	SopDiagCode nvarchar(6),
	NomGospit int,
	DiagCodeType int,
	DinamikaZabolev int
)
AS
BEGIN
	DECLARE @Appoitments table (
		ID int,
		PriemDate date,
		TreatmentPlaceTypeId int,
		DiagCode nvarchar(6),
		SopDiagCode nvarchar(6),
		NomGospit int,
		DiagCodeType int,
		DinamikaZabolev int
	)

	INSERT INTO @Appoitments(
		ID, 
		PriemDate,
		TreatmentPlaceTypeId,
		DiagCode,
		SopDiagCode,
		NomGospit,
		DiagCodeType,
		DinamikaZabolev
		)
		SELECT
			vv.ID,
			vv.DataPriema,
			vv.TreatmentPlaceTypeId,
			vv.DiagCode,
			vv.SopDiagCode,
			vv.NomGospit,
			vv.DiagCodeTypeId,
			vv.DinamikaZabolev
			FROM dbo.FOMSVisitsView AS vv
			WHERE vv.StatTalon = @RequestId
		
	DECLARE
		@FirstPriemDate varchar(10),
		@LastPriemDate varchar(10),
		@TreatmentPlaceTypeId int, 
		@PreviewDiagCode nvarchar(6),
		@FinalDiagCode nvarchar(6),
		@SopDiagCode nvarchar(6),
		@NomGospit int, -- 0
		@DiagCodeType int,
		@DinamikaZabolev int -- , 0
	
	SELECT
		@FirstPriemDate = CONVERT(varchar(10), MIN(app.PriemDate), 104),
		@LastPriemDate = CONVERT(varchar(10), MAX(app.PriemDate), 104)
		FROM @Appoitments AS app
		GROUP BY app.PriemDate
		
	SELECT
		@TreatmentPlaceTypeId = app.TreatmentPlaceTypeId
		FROM @Appoitments AS app
		WHERE app.TreatmentPlaceTypeId IS NOT NULL
		ORDER BY app.PriemDate ASC
	
	SELECT
		@PreviewDiagCode = app.DiagCode,
		@DiagCodeType = app.DiagCodeType
		FROM @Appoitments AS app
		WHERE app.DiagCode IS NOT NULL
		ORDER BY app.PriemDate ASC

	SELECT
		@FinalDiagCode = app.DiagCode
		FROM @Appoitments AS app
		WHERE app.DiagCode IS NOT NULL
		ORDER BY app.PriemDate DESC

	SELECT
		@SopDiagCode = app.SopDiagCode
		FROM @Appoitments AS app
		WHERE app.SopDiagCode IS NOT NULL
		ORDER BY app.PriemDate DESC
	
	SELECT
		@NomGospit = app.NomGospit
		FROM @Appoitments AS app
		WHERE app.NomGospit IS NOT NULL
		ORDER BY app.PriemDate ASC
		
	SELECT
		@DinamikaZabolev = app.DinamikaZabolev
		FROM @Appoitments AS app
		WHERE app.DinamikaZabolev IS NOT NULL
		ORDER BY app.PriemDate DESC
	
	INSERT INTO @Result(
		FirstPriemDate,
		LastPriemDate,
		TreatmentPlaceTypeId,
		PreviewDiagCode,
		FinalDiagCode,
		SopDiagCode,
		NomGospit,
		DiagCodeType,
		DinamikaZabolev
		)
		SELECT
			@FirstPriemDate AS FirstPriemDate,
			@LastPriemDate AS LastPriemDate,
			ISNULL(@TreatmentPlaceTypeId, 1) AS TreatmentPlaceTypeId, -- 1 - Поликлинника,
			ISNULL(@PreviewDiagCode, '') AS PreviewDiagCode,
			ISNULL(@FinalDiagCode, '') AS FinalDiagCode,
			ISNULL(@SopDiagCode, '') AS SopDiagCode,
			ISNULL(CAST(@NomGospit AS varchar(10)), '') AS NomGospit,
			ISNULL(@DiagCodeType, 1) AS DiagCodeType, -- 1 -  заболевание
			ISNULL(@DinamikaZabolev, 0) AS DinamikaZabolev -- 0 - отсутствует значение
			
	RETURN
END