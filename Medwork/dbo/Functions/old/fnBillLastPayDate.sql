CREATE FUNCTION fnBillLastPayDate(@BillID INTEGER)
RETURNS datetime
BEGIN
  RETURN (SELECT max(DataOplati) FROM Payment WITH (NOLOCK) WHERE NomerScheta=@BillID and IsNull(DocNumber,'')<>'' and Summa>0)
END
