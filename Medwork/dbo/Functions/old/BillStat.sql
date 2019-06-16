
create FUNCTION [dbo].[BillStat](@BillID INT)
RETURNS VARCHAR(20)
BEGIN
	return(select dbo.fnBillStat(@BillID))
END
