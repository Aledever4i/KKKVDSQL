
CREATE PROCEDURE dbo.SP_AccByPlat @AccID int
 AS

	select MA.Num from MainPersonalAccount MA (nolock)
			left join OplataAvansom OA (nolock) on (MA.ID = OA.AccountID)
	where OA.ID = @AccID
