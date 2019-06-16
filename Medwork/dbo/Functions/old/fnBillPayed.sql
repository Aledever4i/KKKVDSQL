
CREATE FUNCTION fnBillPayed(@Nomer INTEGER)
RETURNS FLOAT
BEGIN
  RETURN (SELECT SUM(Summa) FROM Payment WITH (NOLOCK) WHERE NomerScheta=@Nomer and IsNull(DocNumber,'')<>'')
END

