CREATE function [dbo].[ServicePayPercent](@AppointmentServiceID int, @sDate datetime, @eDate datetime)
returns float 
begin
declare @result float
select @result=sum(p.Summa)/b.ItogoKOplate
from AppointmentService aps
join Bill b on b.ID=(select top 1 bs.MasterID from BillService bs where bs.GUID=aps.guid)
join Payment p on (p.NomerScheta=b.id and p.docnumber is not null and p.docnumber<>''/*нажато "вставить номер и сохранить*/)
where aps.ID=@AppointmentServiceID and
(
(p.DataOplati>=aps.date and p.DataOplati>=@sDate and p.DataOplati<=@eDate) --сумма оплат по счёту за период отчёта после даты оказания
or
(aps.date>=@sDate and aps.Date<=@eDate /*and p.DataOplati>=@sDate*/ and p.DataOplati<=@eDate)
) --при формировании отчета в день простановки отметки об оказании, должны учитываться и предшествующие выплаты
group by b.id, b.ItogoKOplate
return isnull(@result,0)
end


