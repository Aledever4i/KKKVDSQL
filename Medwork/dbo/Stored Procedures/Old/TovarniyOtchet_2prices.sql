
create procedure [dbo].[TovarniyOtchet_2prices](@StartDate datetime, @FinishDate datetime)
as

select 1 as DisplayOrder, '' as Name2, 'Остаток на '+convert(nvarchar(50),@StartDate,104) as Name1, null as DocDate, null as DocNum, 
IsNull(SUM(case when h.OperationType in(1,4) then IsNull(p.RetailPrice*p.Quantity*(1.0-isnull(p.DiscountPercent,0.0)/100.0),0) 
when h.OperationType in (2,3,7) then -(IsNull(pp.RetailPrice*p.Quantity*(1.0-isnull(p.DiscountPercent,0.0)/100.0),0)) end),0) as Summ, null
,SUM(case when h.OperationType in(1,4) then p.PurchasingPrice*p.Quantity else -p.PurchasingPrice*p.Quantity end*(1+isnull(p.TaxRate,0)/100))
, 0 as flag1
	from StorageDocument h
		left join StorageOperations p on p.MasterID=h.id
		left join material m on m.ID=p.Article
		left join StorageOperations pp on pp.ID=m.OperationId
	where h.OperationType in (1,4,2,3,7)
		and h.StorageDate<@StartDate
		and h.Confirmation=1
union all
select 2 as DisplayOrder, '' as Name2, 'Приход', null, null, null, null,null, 0 as flag1
union all
select 2.5 as DisplayOrder, h.Provider, '', h.StorageDate, h.Num, SUM(IsNull(p.RetailPrice*p.Quantity*(1.0-isnull(p.DiscountPercent,0.0)/100.0),0)), null
,SUM(p.PurchasingPrice*p.Quantity*(1+isnull(p.TaxRate,0)/100))
, 0 as flag1
	from StorageDocument h 
		left join StorageOperations p on p.MasterID=h.id
		left join material m on m.ID=p.Article
		left join StorageOperations pp on pp.ID=m.OperationId
	where h.OperationType in (1,4)
		and h.StorageDate>=@StartDate and h.StorageDate<=@FinishDate
		and h.Confirmation=1
group by h.Provider, h.StorageDate, h.Num
union all
select 3 as DisplayOrder,  '', 'Итого', null, null as DocNum, SUM(IsNull(p.RetailPrice*p.Quantity*(1.0-isnull(p.DiscountPercent,0.0)/100.0),0)), null
,SUM(p.PurchasingPrice*p.Quantity*(1+isnull(p.TaxRate,0)/100))
, 0 as flag1
	from StorageDocument h 
		left join StorageOperations p on p.MasterID=h.id
		left join material m on m.ID=p.Article
		left join StorageOperations pp on pp.ID=m.OperationId
	where h.OperationType in (1,4)
		and h.StorageDate>=@StartDate and h.StorageDate<=@FinishDate
		and h.Confirmation=1
union all
select 4 as DisplayOrder, '', 'Приход с остатком', null, null as DocNum, IsNull(SUM(case when h.OperationType in(1,4) then IsNull(p.RetailPrice*p.Quantity*(1.0-isnull(p.DiscountPercent,0.0)/100.0),0) when h.OperationType in (2,3,7) then -(IsNull(pp.RetailPrice*p.Quantity*(1.0-isnull(p.DiscountPercent,0.0)/100.0),0)) end),0), null
,SUM(case when h.OperationType in(1,4) then p.PurchasingPrice*p.Quantity else -p.PurchasingPrice*p.Quantity end*(1+isnull(p.TaxRate,0)/100))
, 0 as flag1
	from StorageDocument h 
		left join StorageOperations p on p.MasterID=h.id
		left join material m on m.ID=p.Article
		left join StorageOperations pp on pp.ID=m.OperationId
	where ((h.OperationType in (1,4,2,3,7) and h.StorageDate<@StartDate)
		or (h.OperationType in (1,4) and h.StorageDate<=@FinishDate))
		and h.Confirmation=1
union all
select 5 as DisplayOrder, '', 'Расход', null, null, null, null,null, 0 as flag1
union all
select 6 as DisplayOrder, h.Provider, '', h.StorageDate, h.Num, SUM(IsNull(
isnull(p.RetailPrice,pp.RetailPrice*(1+isnull(p.TaxRate,0)/100))
*p.Quantity*(1.0-isnull(p.DiscountPercent,0.0)/100.0),0)), null
,SUM(p.PurchasingPrice*p.Quantity*(1+isnull(p.TaxRate,0)/100))
, 0 as flag1
	from StorageDocument h 
		left join StorageOperations p on p.MasterID=h.id
		left join material m on m.ID=p.Article
		left join StorageOperations pp on pp.ID=m.OperationId
	where h.OperationType in (2,3,7)
		and h.StorageDate>=@StartDate and h.StorageDate<=@FinishDate
		--and h.Provider is not null and h.Provider<>'' 
		and h.AccountCategory<>'Розничный'
		and h.AccountCategory<>'Продажа сотрудникам'
		and h.Confirmation=1
group by h.Provider, h.StorageDate, h.Num
union all
select 6 as DisplayOrder, 'Розница', '', 
cast(cast(
h.StorageDate 
as int) as datetime)
, '', SUM(IsNull(p.RetailPrice*p.Quantity*(1.0-isnull(p.DiscountPercent,0.0)/100.0),0)), null
,SUM(p.PurchasingPrice*p.Quantity*(1+isnull(p.TaxRate,0)/100))
, -1 as flag1
	from StorageDocument h
		left join StorageOperations p on p.MasterID=h.id
		left join material m on m.ID=p.Article
		left join StorageOperations pp on pp.ID=m.OperationId
	where h.OperationType in (2,3,7)
		and h.StorageDate>=@StartDate and h.StorageDate<=@FinishDate
		--and (h.Provider is null or h.Provider='') 
		and (h.AccountCategory='Розничный' or h.AccountCategory='Продажа сотрудникам')
		and h.Confirmation=1
group by cast(h.StorageDate as int)
union all
select 7 as DisplayOrder, '', 'Итого расход (в ценах по расходным документам)', null, null as DocNum, SUM(IsNull(
isnull(p.RetailPrice,pp.RetailPrice)
*p.Quantity*(1.0-isnull(p.DiscountPercent,0.0)/100.0),0)), null
,SUM(p.PurchasingPrice*p.Quantity*(1+isnull(p.TaxRate,0)/100))
, 0 as flag1
	from StorageDocument h 
		left join StorageOperations p on p.MasterID=h.id
		left join material m on m.ID=p.Article
		left join StorageOperations pp on pp.ID=m.OperationId
	where h.OperationType in (2,3,7)
		and h.StorageDate>=@StartDate and h.StorageDate<=@FinishDate
		and h.Confirmation=1
union all
select 7.2 as DisplayOrder, '', 'Итого расход (в ценах склада)', null, null as DocNum, SUM(IsNull(pp.RetailPrice*p.Quantity*(1.0-isnull(p.DiscountPercent,0.0)/100.0),0)), null
,null
, 0 as flag1
	from StorageDocument h 
		left join StorageOperations p on p.MasterID=h.id
		left join material m on m.ID=p.Article
		left join StorageOperations pp on pp.ID=m.OperationId
	where h.OperationType in (2,3,7)
		and h.StorageDate>=@StartDate and h.StorageDate<=@FinishDate
		and h.Confirmation=1
union all
select 7.3 as DisplayOrder, '', 'Итого по кассе (розница + продажа сотрудникам)', null, null as DocNum, SUM(IsNull(p.RetailPrice*p.Quantity*(1.0-isnull(p.DiscountPercent,0.0)/100.0),0)), null
,null
, 0 as flag1
	from StorageDocument h 
		left join StorageOperations p on p.MasterID=h.id
		left join material m on m.ID=p.Article
		left join StorageOperations pp on pp.ID=m.OperationId
	where h.OperationType in (2)
		and h.StorageDate>=@StartDate and h.StorageDate<=@FinishDate
		and h.Confirmation=1
		and (h.AccountCategory='Розничный' or h.AccountCategory='Продажа сотрудникам')
union all
select 8 as DisplayOrder, '', 'Остаток на '+convert(nvarchar(50),@FinishDate,104), null, null as DocNum, 

--SUM(IsNull(p.SumPos,0)*case when h.OperationType in(1,4) then 1 when h.OperationType in (2,3,7) then -1 end), 
SUM(case when h.OperationType in(1,4) then IsNull(p.RetailPrice*p.Quantity*(1.0-isnull(p.DiscountPercent,0.0)/100.0),0) when h.OperationType in (2,3,7) then IsNull(-1*pp.RetailPrice*p.Quantity*(1.0-isnull(p.DiscountPercent,0.0)/100.0),0) end), 
null
,SUM(case when h.OperationType in(1,4) then p.PurchasingPrice*p.Quantity else -p.PurchasingPrice*p.Quantity end*(1+isnull(p.TaxRate,0)/100))
, 0 as flag1
	from StorageDocument h 
		left join StorageOperations p on p.MasterID=h.id
		left join material m on m.ID=p.Article
		left join StorageOperations pp on pp.ID=m.OperationId
	where h.OperationType in (1,4,2,3,7)
		and h.StorageDate<=@FinishDate
		and h.Confirmation=1
union all
select 9 as DisplayOrder, '', null, null, null, null, null,null, 0 as flag1
union all
select 10 as DisplayOrder, '', 'Приложение: '+cast(
(select count(*) from (
select 1 as qwe from StorageDocument h
		left join StorageOperations p on p.MasterID=h.id
		left join material m on m.ID=p.Article
		left join StorageOperations pp on pp.ID=m.OperationId
	where h.OperationType in (1,4,2,3,7)
		and h.StorageDate>=@StartDate and h.StorageDate<=@FinishDate
		and h.AccountCategory<>'Розничный'
		and h.AccountCategory<>'Продажа сотрудникам'
		and h.Confirmation=1
group by h.Provider, h.StorageDate, h.Num
) as qwe) as varchar(20))+' ('+dbo.NumPhrase((select count(*) from (
select 1 as qwe from StorageDocument h
		left join StorageOperations p on p.MasterID=h.id
		left join material m on m.ID=p.Article
		left join StorageOperations pp on pp.ID=m.OperationId
	where h.OperationType in (1,4,2,3,7)
		and h.StorageDate>=@StartDate and h.StorageDate<=@FinishDate
		and h.AccountCategory<>'Розничный'
		and h.AccountCategory<>'Продажа сотрудникам'
		and h.Confirmation=1
group by h.Provider, h.StorageDate, h.Num
) as qwe), 1)+') документов', null, null, null, null,null, 0 as flag1
union all
select 11 as DisplayOrder, '', null, null, null, null, null, null, 0 as flag1
union all
select 12 as DisplayOrder, '', 'Отчет с документами принял и проверил', null, null, null, '_________',null, 0 as flag1
union all
select 13 as DisplayOrder, '', null, null, '', null, null,null, 0 as flag1
union all
select 14 as DisplayOrder, '', 'Материально-ответственное лицо', null, null, null, '_________',null, 0 as flag1
order by DisplayOrder, flag1, DocDate, DocNum

