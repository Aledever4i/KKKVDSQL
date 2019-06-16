CREATE FUNCTION fnBillIDByService(@ServiceGUID nvarchar(32))
RETURNS int
begin
	return (SELECT top 1 masterid from billservice where GUID=@ServiceGUID)
end
