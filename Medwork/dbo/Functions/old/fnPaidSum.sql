
CREATE FUNCTION dbo.fnPaidSum (@PatID int, @Date1 datetime, @Date2 datetime, @Resource int)
RETURNS MONEY
AS
BEGIN
 return
 (
 isNull((
 select sum(summa) from
 (select
 case when exists (select top 1 id from billservice where masterid=bb.ID and PaymentID is not null)
 --новый формат оплат - за услугу
 then (case when isNull(p.summa,0)>0 --вся услуга оплачена в этот период
              or (b.PaymentID is null and dbo.fnBillPayed(bb.ID)>=bb.ItogoKOplate --услуга не оплачена, но счет был полностью оплачен в этот период
              and exists (select * from payment where (DataOplati>=@Date1 or @Date1 is null) and (DataOplati<=@Date2 or @Date2 is null) and NomerScheta=bb.ID))
  --     then (b.Summa/nullif(b.Quant,0))*a.Quant*((100-isNull(bb.SkidkaV,0))/100)
       then b.Summa*((100-isNull(bb.SkidkaV,0))/100)
       when isNull(p.summa,0)<0 --за услугу вернули деньги - не работает, если и оплата и возврат попали в этот период
  --     then -(b.Summa/nullif(b.Quant,0))*a.Quant*((100-isNull(bb.SkidkaV,0))/100)
       then -b.Summa*((100-isNull(bb.SkidkaV,0))/100)
       else 0 end)
 --старый формат оплат - за весь счет, считаем долю оплаты в счете
 else --p2.summa*b.Summa*((100-isNull(bb.SkidkaV,0))/100)/bb.ItogoKOplate end summa   
      --заменил на подзапрос и убрал лишнию таблицу в From, для ускорения работы всей функции в целом
      (select sum(p2.summa) from payment p2
            where (p2.NomerScheta=bb.ID) and (p2.DataOplati>=@Date1 or @Date1 is null) and (p2.DataOplati<=@Date2 or @Date2 is null)
            group by NomerScheta)*b.Summa*((100-isNull(bb.SkidkaV,0))/100)/bb.ItogoKOplate end summa
 from billservice b
 left join (select id,summa from payment where (DataOplati>=@Date1 or @Date1 is null) and (DataOplati<=@Date2 or @Date2 is null)) p on p.id=b.PaymentID
 left join bill bb on bb.ID=b.masterid
 --left join (select NomerScheta,sum(summa) summa from payment
 --           where (DataOplati>=@Date1 or @Date1 is null) and (DataOplati<=@Date2 or @Date2 is null)
 --           group by NomerScheta) p2 on p2.NomerScheta=bb.ID
 left join appointmentservice a on a.guid=b.guid
 where (bb.PaymentType=3 or bb.PaymentType=4)
   and (bb.PatID=@PatID or @PatID is null)
   and (isNull(a.Resource,b.Resource)=@Resource or @Resource is null)
 ) s
 ),0)
 )
END
