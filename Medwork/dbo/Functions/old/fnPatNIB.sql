
CREATE FUNCTION [dbo].[fnPatNIB](@PatientID INTEGER)
RETURNS VARCHAR(10)
BEGIN
	declare @CardNum nvarchar(10)
	set @CardNum= (SELECT TOP 1 CardNum FROM Patient WHERE ID = @PatientID)
	if IsNull(@CardNum,'')='' --[2008.10.02]
	begin
		set @CardNum=@PatientID
	end
	RETURN @CardNum
END
