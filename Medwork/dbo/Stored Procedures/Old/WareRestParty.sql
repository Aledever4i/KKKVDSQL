
CREATE PROCEDURE [dbo].[WareRestParty]
@WareID INT, @CalcDate DATETIME, @Rest FLOAT OUTPUT
AS
begin
declare @t table(
	MaterialID int,
	PurchasingQuantity float,
	PurchasingPrice money,
	RetailPrice money,
	SpisPrice money,
	RetailQuaintity float,
	InternalQuaintity float,
	SpisQuantity float,
	TaxRate float,
	SotrQuantity money,
	DiscountPercent money,
	NacenkaPN money
)
	declare @CalcDate2 datetime
	select @CalcDate2=dateadd(day, -1, @CalcDate)

	insert @t exec FarmacyRestsReportIntParty '1901-01-01', @CalcDate2, @WareID
	
	select @Rest=IsNull((select SUM(IsNull(PurchasingQuantity,0)-IsNull(RetailQuaintity,0)-IsNull(InternalQuaintity,0)-ISNULL(SotrQuantity,0)) from @t), 0)
end
