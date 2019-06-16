
CREATE PROCEDURE [dbo].[FOMSAddAppoitmentsToRequest]
	@RequestId int,
	@PatId int,
	@FinanceSourceId int = 1
AS
BEGIN
	-- Добавление посещения в стат талон
	SET NOCOUNT ON;
	
	UPDATE dbo.PatForm 
		SET StatTalon = NULL 
		WHERE 
			StatTalon = @RequestId
			AND FormID IN (31084, 31177)
			AND PatID = @PatId

	UPDATE pf
		SET pf.StatTalon = @RequestId
		FROM dbo.PervichniyPriemDermatologa AS ppd
		JOIN dbo.PatForm AS pf ON 
			pf.ID = ppd.ID
			AND pf.StatTalon IS NULL
			AND pf.FormID = 31084 --  31084 - первичный
		LEFT JOIN dbo.Napravlenie AS nap ON nap.OsmotrFormID = ppd.ID
		WHERE 
			nap.PatID = @PatId
			AND (nap.FinanceSourceId = @FinanceSourceId OR nap.FinanceSourceId IS NULL)
	
	UPDATE pf
		SET pf.StatTalon = @RequestId
		FROM dbo.PovtorniyPriemDermatologa AS pov
		JOIN dbo.PatForm AS pf ON 
			pf.ID = pov.ID
			AND pf.StatTalon IS NULL
			AND pf.FormID = 31177 --  31177 - повторный
		LEFT JOIN dbo.Napravlenie AS nap ON nap.OsmotrFormID = pov.ID
		WHERE
			pov.PatID = @PatId
			AND (nap.FinanceSourceId = @FinanceSourceId OR nap.FinanceSourceId IS NULL)
END
