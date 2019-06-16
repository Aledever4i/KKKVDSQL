
CREATE PROCEDURE [dbo].[OutcomeByMaterialType]	@DocID int, @MatType int, @MatCount int, @MatStorage int, @IsRetailPrice int
AS
BEGIN
declare
  @SOID int,
  @Article int,
  @CreateDate smalldatetime,
  @AuthorID int,
  @CountPackTaking int,
  @MatName nvarchar(255), 
  @Series nvarchar(50), 
  @InputDate datetime,
  @UseDate datetime,
  @RetailPrice money, 
  @Position nvarchar(50),
  @NDS money
set @CreateDate = convert(smalldatetime,GetDate(),104)
set @AuthorID = (select Author from StorageDocument where ID = @DocID)



declare UPD Cursor For
  select MaterialID, CountPackTaking 
  from fnMakeSeriesByMaterialType(@MatType,@MatCount,@MatStorage)
open UPD

Fetch Next From UPD into @Article, @CountPackTaking --выбираем первую строчку

while @@Fetch_Status=0
BEGIN --while begin
  select top 1 @MatName=m.fullname, @Series=m.Series, @InputDate=m.CreateDate 
  from material m 
  where id=@Article
 
  select @SOID = ISNULL(Max(Id)+1,1) From StorageOperations
 
  select top 1 @RetailPrice = case when @IsRetailPrice=0 then isnull(nullif(p.PriceWithNDS,0),p.PurchasingPrice*(1+(isnull(p.TaxRate,0)/100)))
                                   else p.RetailPrice end, 
               @NDS=p.TaxRate, 
               @Position=p.Position,
               @UseDate=p.UseDate                
  from StorageOperations p join Material m on p.ID=m.OperationId 
  where m.ID=@Article

  insert into StorageOperations (ID,MasterID,Article,Quantity,Author,
                                 CreateDate,MaterialStr,Series,InputDate,PurchasingPrice,
                                 RetailPrice,TaxRate,SumNDS,SumPos,Position,UseDate)  
		                      select @SOID,@DocID,@Article,@CountPackTaking,@AuthorID,
                                 @CreateDate,@MatName,@Series,@InputDate,@RetailPrice,
                                 @RetailPrice,@NDS,@RetailPrice*@CountPackTaking*@NDS/100,@RetailPrice*@CountPackTaking,@Position,@UseDate
 
 
  Fetch Next From UPD into @Article, @CountPackTaking --выбираем следующую строчку
END --while end
Close UPD 
Deallocate UPD
END

