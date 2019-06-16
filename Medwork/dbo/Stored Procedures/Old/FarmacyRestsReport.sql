

CREATE PROCEDURE [dbo].[FarmacyRestsReport]
@StartDate DATETIME, @FinishDate DATETIME
AS
declare @t table(
	MaterialID int,
	PurchasingQuantity float,
	PurchasingPrice money,
	RetailPrice money,
	SpisPrice money,
	RetailQuantity float,
	InternalQuantity float,
	SpisQuantity float,
	TaxRate float,
	SotrQuantity money,
	DiscountPercent money,
	NacenkaPN money
)

--select 0, getdate()

insert @t exec FarmacyRestsReportIntParty @StartDate, @FinishDate, null

--select 1, getdate()

if OBJECT_ID('tempdb..#t') is not null
  drop table #t 

select t.MaterialID, (select m.FullName from Material m where m.ID=t.MaterialID) as FullName,
	cast(0 as money) as RestStart,
	
	Round(case when SUM(t.PurchasingQuantity)<>0 then sum(t.PurchasingPrice*t.PurchasingQuantity)/SUM(t.PurchasingQuantity) else 0 end,2) as BuyPrice,
	IsNull(SUM(t.PurchasingQuantity),0) as BuyKol,
	Round(sum(t.PurchasingPrice*t.PurchasingQuantity),2) as BuySum,
	
	Round(case when SUM(t.RetailQuantity)<>0 then sum(t.RetailPrice*t.RetailQuantity)/SUM(t.RetailQuantity) else 0 end,2) as SellPrice,
	IsNull(SUM(t.RetailQuantity),0) as SellKol, 
	Round(sum(t.RetailPrice*t.RetailQuantity),2) as SellSum,
	sum(t.NacenkaPN) as SellNacenka,
	
	Round(case when SUM(t.SotrQuantity)<>0 then sum(t.RetailPrice*t.SotrQuantity)/SUM(t.SotrQuantity) else 0 end,2) as SotrPrice,
	IsNull(SUM(t.SotrQuantity),0) as SotrKol,
	Round(sum(t.RetailPrice*t.SotrQuantity),2) as SotrSum,
	
	Round(case when SUM(t.InternalQuantity)<>0 then sum(t.PurchasingPrice*t.InternalQuantity)/SUM(t.InternalQuantity) else 0 end,2) as IntPrice,
	IsNull(sum(t.InternalQuantity),0) IntKol,
	Round(sum(t.PurchasingPrice*t.InternalQuantity),2) as IntSum,
	
	Round(case when SUM(t.SpisQuantity)<>0 then sum(t.PurchasingPrice*t.SpisQuantity)/SUM(t.SpisQuantity) else 0 end,2) as SpisPrice,
	IsNull(sum(t.SpisQuantity),0) SpisKol,
	Round(sum(t.PurchasingPrice*t.SpisQuantity),2) as SpisSum,
	
	Round(sum(IsNull(t.PurchasingQuantity,0)-IsNull(t.RetailQuantity,0)-IsNull(t.InternalQuantity,0)-IsNull(t.SpisQuantity,0)-IsNull(t.SotrQuantity,0)),2) as RestFinish,
	
	--сумма проданного - кол-во проданного*закупочную цену
	--SellSum-SellKol*BuyPrice
	Round((sum(IsNull(t.RetailPrice*t.RetailQuantity,0))
		-SUM(IsNull(t.RetailQuantity,0))
		*(case when SUM(t.PurchasingQuantity)<>0 then sum(t.PurchasingPrice*t.PurchasingQuantity)/SUM(t.PurchasingQuantity) else 0 end)),2)
		as Margin
	
	into #t
	from @t t
	group by t.MaterialID

--select 2, getdate()

declare cr cursor for select MaterialID from #t
open cr
declare @MaterialID int
declare @rest float
fetch next from cr into @MaterialID
while	(@@FETCH_STATUS = 0) 
begin
	exec WareRestParty @MaterialID, @StartDate, @rest out
	update #t set RestStart=@rest, RestFinish=@rest+RestFinish where MaterialID=@MaterialID
	fetch next from cr into @MaterialID
end
close cr
deallocate cr

--select 3, getdate()

select
	MaterialID, FullName, RestStart, BuyPrice, BuyKol, BuySum, SellPrice, SellKol, SellSum, SellNacenka, SotrPrice, SotrKol, SotrSum, IntPrice, IntKol, IntSum, SpisPrice, SpisKol, SpisSum, RestFinish, Margin
from #t where RestStart<>0 or BuyKol<>0 or SellKol<>0 or IntKol<>0 or SotrKol<>0 or RestFinish<>0

union all

select Null as MaterialID, 'Итого' as FullName,
	Null as RestStart,
	
	Null as BuyPrice,
	Null as BuyKol,
	Round(sum(t.PurchasingPrice*t.PurchasingQuantity),2) as BuySum,
	
	Null as SellPrice,
	Null as SellKol, 
	Round(sum(t.RetailPrice*t.RetailQuantity),2) as SellSum,
	Round(sum(t.NacenkaPN),2) as SellNacenka,
	
	Null as SotrPrice,
	Null as SotrKol, 
	Round(sum(t.RetailPrice*t.SotrQuantity),2) as SotrSum,

	Null as IntPrice,
	Null as IntKol,
	Round(sum(t.PurchasingPrice*t.InternalQuantity),2) as IntSum,
	
	Null as SpisPrice,
	Null as SpisKol,
	Round(sum(t.PurchasingPrice*t.SpisQuantity),2) as SpisSum,
	
	Null as RestFinish,
	
	(select Round(SUM(Margin),2) from #t)
	as Margin
	from @t t
union all
select Null, 'Итого выручка по кассе за период (розница + продажа сотрудникам), руб. ',
	Null,
	Null,
	Null,
	Null,
	Round(isnull(SUM(IsNull(p.RetailPrice*p.Quantity,0)),0),2),
	Null as SellKol, 
	Null as SellSum,
	Null as SellNacenka,
	
	Null as SotrPrice,
	Null as SotrKol, 
	Null as SotrSum,

	Null as IntPrice,
	Null as IntKol,
	Null as IntSum,
	
	Null as SpisPrice,
	Null as SpisKol,
	Null as SpisSum,
	
	Null as RestFinish,
	Null as Margin
	from StorageDocument h 
		left join StorageOperations p on p.MasterID=h.id
		left join material m on m.ID=p.Article
		left join StorageOperations pp on pp.ID=m.OperationId
	where h.OperationType in (2)
		and h.StorageDate>=@StartDate and h.StorageDate<=@FinishDate
		and h.Confirmation=1
		and (h.AccountCategory='Розничный' or h.AccountCategory='Продажа сотрудникам')

/*union all
	select Null as MaterialID, 'Маржа' as FullName, 
	SUM(-t.PurchasingPrice*t.PurchasingQuantity
			+t.RetailPrice*t.RetailQuantity
			+t.RetailPrice*t.SotrQuantity) as RestState,
	Null as BuyPrice,
	Null as BuyKol,
	Null as BuySum,
	
	Null as SellPrice,
	Null as SellKol, 
	Null as SellSum,
	Null as SellNacenka,
	
	Null as SotrPrice,
	Null as SotrKol, 
	Null as SotrSum,

	Null as IntPrice,
	Null as IntKol,
	Null as IntSum,
	
	Null as SpisPrice,
	Null as SpisKol,
	Null as SpisSum,
	
	Null as RestFinish,
	Null as Margin
	from @t t
*/
