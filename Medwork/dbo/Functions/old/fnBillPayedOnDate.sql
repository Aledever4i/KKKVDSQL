CREATE FUNCTION fnBillPayedOnDate(@Nomer INTEGER,@sDate datetime=null,@eDate datetime=null)
RETURNS FLOAT
BEGIN
  RETURN IsNull((SELECT SUM(Summa) FROM Payment WITH (NOLOCK) WHERE NomerScheta=@Nomer and IsNull(DocNumber,'')<>''
   and (@eDate is null or @eDate>=DataOplati)
   and (@sDate is null or @sDate<=DataOplati)
   ),0)
END
