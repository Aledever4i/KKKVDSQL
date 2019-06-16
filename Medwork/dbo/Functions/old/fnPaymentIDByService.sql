CREATE FUNCTION fnPaymentIDByService(@ServiceGUID nvarchar(32))
RETURNS int
begin
	return (
			SELECT top 1 paymentid from billservice 
			where
				GUID=@ServiceGUID
				and paymentid is not null
				and exists (select id from payment where id = paymentid and IsNull(DocNumber,'')<>'' and (isnull(Summa,0)>0))
		)
end
