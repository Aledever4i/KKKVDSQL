
create PROCEDURE [dbo].[FarmacyRestsReportIntParty]
@StartDate DATETIME, @FinishDate DATETIME, @WareID INT
AS
select case when m.NodeType='FOLDER' then m.id else m.Parent end as MaterialID,
	case when h.OperationType in (1/*, 4*/) then op.Quantity else 0 end as PurchasingQuantity,
	Round(Cast(isnull(isnull(nullif(op.PriceWithNDS,0),op.PurchasingPrice*(1+IsNULL(op.TaxRate,0)/100)),op.RetailPrice) as money),2) as [PurchasingPrice],
  --op.PurchasingPrice, op.RetailPrice, op.PurchasingPrice as SpisPrice,
  op.RetailPrice, Round(Cast(isnull(nullif(op.PriceWithNDS,0),op.PurchasingPrice*(1+IsNULL(op.TaxRate,0)/100)) as money),2) as [SpisPrice],  
	case when h.AccountCategory='Розничный' and h.OperationType in (2/*,3,5*/,7) then op.Quantity else 0 end as RetailQuantity,
	case when (h.AccountCategory='Внутренний' or h.AccountCategory is null) and h.OperationType in (2/*,3,5*/,7) then op.Quantity else 0 end as InternalQuantity,
	case when h.OperationType in (3) then op.Quantity else 0 end as SpisQuantity,
	IsNull(op.TaxRate, 0) as TaxRate,
	case when h.AccountCategory='Продажа сотрудникам' and h.OperationType in (2/*,3,5*/,7) then op.Quantity else 0 end as SotrQuantity,
	isnull(op.DiscountPercent,0), isnull(op.NacenkaPN,0) as SellNacenka

from StorageOperations op
	left join StorageDocument h on op.MasterID=h.id
	left join Material m on m.ID=op.Article
where h.OperationType in (1/*, 4*/, 2, 3/*, 5*/, 7)
	and h.Confirmation=1
	and h.StorageDate>=@StartDate
	and h.StorageDate<=@FinishDate
	and (@WareID is null or case when m.NodeType='FOLDER' then m.id else m.Parent end=@WareID)
