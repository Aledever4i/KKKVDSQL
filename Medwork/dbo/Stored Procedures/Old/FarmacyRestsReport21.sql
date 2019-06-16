
CREATE PROCEDURE [dbo].[FarmacyRestsReport21]
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
	SpisQuantity float
)

--select 0, getdate()

insert @t exec FarmacyRestsReportInt @StartDate, @FinishDate, null

--select 1, getdate()

select t.MaterialID, (select m.FullName from Material m where m.ID=t.MaterialID) as FullName,
	0 as RestStart,
	
	case when SUM(t.PurchasingQuantity)<>0 then sum(t.PurchasingPrice*t.PurchasingQuantity)/SUM(t.PurchasingQuantity) else 0 end as BuyPrice,
	IsNull(SUM(t.PurchasingQuantity),0) as BuyKol,
	sum(t.PurchasingPrice*t.PurchasingQuantity) as BuySum,
	
	case when SUM(t.RetailQuantity)<>0 then sum(t.RetailPrice*t.RetailQuantity)/SUM(t.RetailQuantity) else 0 end as SellPrice,
	IsNull(SUM(t.RetailQuantity),0) as SellKol, 
	sum(t.RetailPrice*t.RetailQuantity) as SellSum,
	
	case when SUM(t.InternalQuantity)<>0 then sum(t.PurchasingPrice*t.InternalQuantity)/SUM(t.InternalQuantity) else 0 end as IntPrice,
	IsNull(sum(t.InternalQuantity),0) IntKol,
	sum(t.PurchasingPrice*t.InternalQuantity) as IntSum,
	
	case when SUM(t.SpisQuantity)<>0 then sum(t.PurchasingPrice*t.SpisQuantity)/SUM(t.SpisQuantity) else 0 end as SpisPrice,
	IsNull(sum(t.SpisQuantity),0) SpisKol,
	sum(t.PurchasingPrice*t.SpisQuantity) as SpisSum,
	
	sum(IsNull(t.PurchasingQuantity,0)-IsNull(t.RetailQuantity,0)-IsNull(t.InternalQuantity,0)-IsNull(t.SpisQuantity,0)) as RestFinish
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
	exec WareRest @MaterialID, @StartDate, @rest out
	update #t set RestStart=@rest, RestFinish=@rest+RestFinish where MaterialID=@MaterialID
	fetch next from cr into @MaterialID
end
close cr
deallocate cr

--select 3, getdate()

select * from #t where RestStart<>0 or BuyKol<>0 or SellKol<>0 or IntKol<>0 or RestFinish<>0
