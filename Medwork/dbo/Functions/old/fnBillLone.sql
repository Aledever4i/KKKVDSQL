

CREATE FUNCTION [dbo].[fnBillLone](@ID INTEGER)
RETURNS FLOAT
BEGIN
  RETURN (
    SELECT 
      --ISNULL(ItogoKOplate, 0) - ISNULL(dbo.fnBillPayed(@Nomer), 0) 
	  ISNULL(ItogoKOplate, 0) - ISNULL(dbo.fnBillPayed(ID), 0) 
    FROM 
      Bill WITH (NOLOCK)
    WHERE 
      ID=@ID
  )
END
