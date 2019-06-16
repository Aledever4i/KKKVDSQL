
CREATE PROCEDURE [dbo].[FarmacyRestsReportInt]
@StartDate DATETIME, @FinishDate DATETIME, @WareID INT
AS
select case when m.NodeType='FOLDER' then m.id else m.Parent end as MaterialID, --m.FullName, 
	case when h.OperationType in (1/*, 4*/) then op.Quantity else 0 end as PurchasingQuantity,
  op.PurchasingPrice, op.RetailPrice, op.PurchasingPrice as SpisPrice,
	case when h.AccountCategory='Розничный' and h.OperationType in (2/*,3,5*/,7) then op.Quantity else 0 end as RetailQuantity,
	case when (h.AccountCategory<>'Розничный' or h.AccountCategory is null) and h.OperationType in (2/*,3,5*/,7) then op.Quantity else 0 end as InternalQuantity,
	case when h.OperationType in (3) then op.Quantity else 0 end as SpisQuantity
into #t2
from StorageOperations op
	left join StorageDocument h on op.MasterID=h.id
	left join Material m on m.ID=op.Article
where h.OperationType in (1/*, 4*/, 2, 3/*, 5*/, 7)
	and h.Confirmation=1
	and h.StorageDate>=@StartDate
	and h.StorageDate<=@FinishDate
	and (@WareID is null or (m.NodeType='FOLDER' and m.id=@WareID) or (m.NodeType<>'FOLDER' and m.Parent=@WareID))

insert #t2(MaterialID)
select distinct m.id 
	from material m 
	where m.ID not in (select MaterialID from #t2)
		and m.NodeType='FOLDER'
	and (@WareID is null or (m.NodeType='FOLDER' and m.id=@WareID) or (m.NodeType<>'FOLDER' and m.Parent=@WareID))

select * from #t2
