
CREATE FUNCTION fnFeeReportServices (@sDate DateTime, @eDate DateTime, @DefaultFee float)
RETURNS @result TABLE (
	 [DoneDate] [datetime]
	,[LastPayDate] [datetime]
	,[Time] [datetime]
	,[ResourceName] [nvarchar](60)
	,[ResourceID] [int]
	,[dolgnName] [nvarchar](80)
	,[KtoNaznachilName] [nvarchar](60)
	,[KtoNaznachil] [int]
	,[Kateg] [varchar](32)
	,[Service] [nvarchar](50)
	,[ServiceName] [nvarchar](250)
	,[PatID] [int]
	,[PatBriefName] [varchar](50)
	,[BasePrice] [money]
	,[Quant] [int]
	,[Sum] [money]
	,[SumPrice] [money]
	,[ServiceDiscount] [float]
	,[BillDiscount] [float]
--	,[BillPayPercent] [float] -- new
	,[FeePercent] [float]
	,[FeeService] [money]
	,[AppointmentFeePercent] [float]
	,[AppointmentFee] [money]
	,[PaidFromAccount] [varchar](1)
	,[PaymentSum] [float]
	,[Fee] [money]
	,[AppointmentFeeSum] [money]
	)
AS
begin

insert into @result
select 
*
,isnull(
	 			 [PaymentSum]*([FeePercent]/100)                               -- сумма к распределению * на % выплат
	 			,[Quant]*FeeService*((100-[ServiceDiscount])/100)*((100-[BillDiscount])/100)
	 				--*([BillPayPercent]/100)
 				 -- или выплата в рублях * на скидку на услугу * скидку в счете --* процент оплаченности счета
	 			)	[Fee]
,isnull(([PaymentSum]*[AppointmentFeePercent]/100)
	,[Quant]*[AppointmentFee]
	--*([BillPayPercent]/100)
	) [AppointmentFeeSum]
from
(
select
*
,[Sum]
		*((100-[ServiceDiscount])/100)
		*((100-[BillDiscount])/100) 
		--*([BillPayPercent]/100) --*процент оплаченности счета
		as [PaymentSum] --Сумма к распределению
from
(
select
 s.date as [DoneDate] --Дата
,isnull(pm.DataOplati,dbo.fnBillLastPayDate(b.id)) [LastPayDate]
,case when s.Date=n.DataPriema then VremyaPriema else null end as [Time] --Время
,rv.Name as [ResourceName] --Врач/ресурс
,rv.ID as [ResourceID]
,d.Name as [dolgnName] --Должность сотрудника
,u2.Name as [KtoNaznachilName]
,s.KtoNaznachil as [KtoNaznachil]
,nullif(nullif(s.Kateg,'0'),'') as [Kateg] --Категория услуги
,s.Service --Код услуги
,s.ServiceName --Наименование услуги
,n.PatID -- № клиента
,dbo.fnPatBriefName(n.PatID) [PatBriefName] -- ФИО пациента
,s.BasePrice --Цена
,s.Quant --Количество
,s.BasePrice*s.Quant as [Sum] --Сумма
,ps.BasePrice*s.Quant as [SumPrice] --Сумма по прайсу
,isnull(s.SkidkaV,0) as [ServiceDiscount] --Скидка на услугу (%)
,isnull(b.SkidkaV,0) as [BillDiscount] --Скидка в счете (%)
--,100 [BillPayPercent]--,isnull(dbo.fnBillPayedOnDate(dbo.fnBillIDByService(s.GUID),@sDate,@eDate)/nullif(b.ItogoKOplate,0)*100,0) as [BillPayPercent]-- процент оплаченности счета за период
,case when ps.UseUsrFeePercent=1 then isnull(u.FeePercent,0) else isnull(s.feepercent,@DefaultFee) end as [FeePercent]
,isnull(s.fee,0) as [FeeService]
,case when u2.GetsAppFee=1 then ps.AppointmentFeePercent else 0 end as [AppointmentFeePercent]
,case when u2.GetsAppFee=1 then isnull(ps.AppointmentFee,0) else 0 end as [AppointmentFee]
,case when pm.PayType=0 then '+' else null end as [PaidFromAccount]
from AppointmentService s
left join napravlenie n on n.ID = s.MasterID
right join bill b on b.ID = dbo.fnBillIDByService(s.GUID)
left join ResourcesView rv on rv.ID = s.Resource
left join usr u on u.ID = s.Resource
left join dolgn d on d.ID = u.DoctorCodePost
left join usr u2 on u2.ID = s.KtoNaznachil
left join paidservice ps on ps.id = (select top 1 id from paidservice ps2 where ps2.code=s.service)
left join payment pm on pm.id=dbo.fnPaymentIDByService(s.GUID)
where 
s.done=1 --услуга оказана
and (-- дата оказания в выбранном диапазоне
      (s.Date >= @sDate and s.Date <= @eDate)
      -- или дата оплаты в выбранном диапазоне
      or (pm.DataOplati >= @sDate and pm.DataOplati <= @eDate
			      and s.Date <= @eDate -- добавлено 28.03.2012 - услуга д.б. уже оказана
      		)
    )
and (-- услуга оплачена (есть в документе оплата)
      (pm.ID is not null)
      -- или счет полностью оплачен
      or isnull(dbo.fnBillPayedOnDate(b.ID,null,@eDate),0) >= isnull(b.ItogoKOplate,0)
     )
) as q
--where
--(([DoneDate] >= @sDate and [DoneDate] <= @eDate) 
--or 
--([BillPayPercent]>0)
--) --([LastPayDate] >= @sDate and [LastPayDate] <= @eDate)
--and ([BillPayPercent]>0)
) as q2
order by resourcename,donedate,time

return
end
