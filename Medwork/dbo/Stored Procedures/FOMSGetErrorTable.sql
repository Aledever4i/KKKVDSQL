
CREATE PROCEDURE dbo.FOMSGetErrorTable
	@xml xml = NULL
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @errors table (
		RecId int,
		CardNum int,
		Insurance varchar(300),
		ErrorType int,
		ErrorDescr varchar(300)
	)

	INSERT INTO @errors(RecId, CardNum, Insurance, ErrorType, ErrorDescr)
		SELECT
			CASE WHEN error.value('(../IDCASE)[1]', 'int') = '' THEN NULL ELSE error.value('(../IDCASE)[1]', 'int') END AS IDCASE,
			CASE WHEN error.value('(../NHISTORY)[1]', 'int') = '' THEN NULL ELSE error.value('(../NHISTORY)[1]', 'int') END AS NHISTORY,
			CASE WHEN error.value('(../C_INSUR)[1]', 'varchar(300)') = '' THEN NULL ELSE error.value('(../C_INSUR)[1]', 'varchar(300)') END AS C_INSUR,
			CASE WHEN error.value('(I_TYPE)[1]', 'int') = '' THEN NULL ELSE error.value('(I_TYPE)[1]', 'int') END AS I_TYPE,
			CASE WHEN error.value('(COMMENT)[1]', 'varchar(300)') = '' THEN NULL ELSE error.value('(COMMENT)[1]', 'varchar(300)') END AS COMMENT    
			FROM @xml.nodes('/FLK_P/ZAP/SLUCH/OTKAZ') AS col(error)
			
	SELECT
		e.RecId AS StatTalonId,
		e.CardNum,
		e.Insurance,
		e.ErrorType,
		e.ErrorDescr,
		p.ID AS PatientId
		FROM @errors AS e
		JOIN dbo.Patient AS p ON p.CardNum = e.CardNum
		JOIN dbo.FOMSRequests AS r ON r.ID = e.RecId
END

