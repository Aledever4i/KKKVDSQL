
CREATE FUNCTION dbo.fnDoneSum (@PatID int, @Date1 datetime, @Date2 datetime, @Resource int)
RETURNS MONEY
AS
BEGIN
 return
 (
 isNull((
 select sum(isNull(isNull((b.Summa/nullif(b.Quant,0))*a.Quant*((100-isNull(bb.SkidkaV,0))/100),a.Summa),0))
 from appointmentservice a
 left join napravlenie aa on aa.ID=a.masterid
 left join billservice b on a.guid=b.guid
 left join bill bb on bb.ID=b.masterid
 where (aa.PaymentType=3 or aa.PaymentType=4)
   and a.done=1
   and (@PatID is null or aa.PatID=@PatID)
   and (@Date1 is null or a.Date>=@Date1)
   and (@Date2 is null or a.Date<=@Date2)
   and (@Resource is null or isNull(a.Resource,b.Resource)=@Resource)
 ),0)
 )
END
