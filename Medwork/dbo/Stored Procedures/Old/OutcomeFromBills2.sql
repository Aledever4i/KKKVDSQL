
CREATE PROCEDURE [dbo].[OutcomeFromBills2]	@DatStart smalldatetime,@DatStop smalldatetime,@DocID int, @Storage int
AS
declare
	@SOID int,
	@Article int,
	@Quantity int,
	@CreateDate smalldatetime,
	@AuthorID int,
	@MaterialID int,
	@CountPackTaking int,
	@CHID int,
	@CHRest	int, 
	@OLDParent int,
	@CPT int,
	@NameMat nvarchar(80),
	@Parent int,
  @SGUID nvarchar(32),  --#2363
  @OLDGUID nvarchar(32),  --#2363
  @OstatokNaSklade int,  --#2363
  @DobavlenoVRashod int,  --#2363
  @RestStatus int, -- показывает сколько товара определенного типа
                  -- уже добавили в текущую расходную накладную
  @ArticleRestStatus int, -- показывает сколько товара из конкретной партии
                  -- уже добавили в текущую расходную накладную
  @UseDate datetime,
  @Position nvarchar(255)                

set @CreateDate = convert(smalldatetime,GetDate(),104)
set @AuthorID = (select Author from StorageDocument where ID = @DocID)

declare @RetailPrice money
declare @NDS money

declare UPD Cursor For
	select MaterialID, 
         CountPackTaking,
		     GUID,  --#2363
         CHID,
		     CHRest,
		     Parent,
         OstatokNaSklade
	from
	(
	select 
		t1.MaterialID,
		convert(float,t1.SummaryTaking) - convert(float,t1.DobavlenoVRashod) CountPackTaking,
		t1.GUID  --#2363
	from
	(
		select distinct
			lnn.id, 
			lnn.Service as MaterialID,
			lnn.Quant SummaryTaking,
			lnn.GUID,
      (select isnull(sum(SO.Quantity),0) 
       from StorageOperations SO 
       where SO.ServGUID = lnn.GUID) as [DobavlenoVRashod]
		from 
			BillService lnn 
				--join Material m2 on (lnn.ServOrMat='Препарат/Материал из номенклатуры' and m2.id=cast(lnn.Service as int))  --#2363
			join Bill b on b.id=lnn.MasterID
		where
			b.DataScheta>=@DatStart
			and b.DataScheta<=@DatStop
			and (b.PaymentType=3 or b.PaymentType=4)
      and lnn.ServOrMat='Препарат/Материал из номенклатуры'  --#2363            
			--and lnn.GUID not in (select isnull(ServGUID,''),* from StorageOperations)  --#2363
            --and (select isnull(sum(SO.Quantity),0) from StorageOperations SO where SO.ServGUID = lnn.GUID) < lnn.Quant
		) t1
	--group by t1.MaterialID, t1.GUID  --#2363
	) a left join --#2363
	(
	select
		ID CHID,
		Rest CHRest,
		Parent,
		CreateDate,
    (select isnull(sum(mm2.rest),0) 
     from material mm2
     where mm2.parent = mm.parent and mm2.Storage = mm.Storage) as [OstatokNaSklade]
	from material mm
	where mm.rest is not null and mm.Storage = @Storage
	) b on cast(a.MaterialID as int)=b.Parent 
	where CHID is not null and CountPackTaking > 0
	order by Parent, GUID, CreateDate, MaterialID, CHID asc, CountPackTaking

open UPD
--set @RestStatus = 0 
--set @OLDParent=-1
--set @OLDGUID=''
--set @CPT=0
set @NameMat=''
set @Quantity = 0 


Fetch Next From UPD into @MaterialID,@CountPackTaking, @SGUID, @Article, @CHRest, @Parent, @OstatokNaSklade --выбираем первую строчку

--select @OstatokNaSklade = isnull(sum(rest),0) from material where parent = @parent and Storage = @Storage
select @RestStatus = isnull(sum(Quantity),0) from StorageOperations where article in (select id from material where parent = @parent) and masterid = @DocId
--set @OstatokNaSklade = @OstatokNaSklade - @RestStatus
select @CPT = isnull(sum(Quantity),0) from StorageOperations where ServGUID = @SGUID and masterid = @DocId

set @OLDParent = @Parent
set @OLDGUID = @SGUID

while @@Fetch_Status=0
BEGIN --while begin
  select @ArticleRestStatus = isnull(sum(Quantity),0) from StorageOperations where masterid = @DocId and Article = @Article
  set @OstatokNaSklade = @OstatokNaSklade - @Reststatus
  set @CountPackTaking = @CountPackTaking - @CPT
--  if @OstatokNaSklade > @RestStatus 
--    set @CPT = @CountPackTaking - @RestStatus
--  else
--    set @CPT = @CountPackTaking
  set @CHRest = @CHRest - @ArticleRestStatus 

  if @CountPackTaking > @CHRest
	  set @Quantity = @CHRest
  else
 	  set @Quantity = @CountPackTaking

  if @Quantity > @OstatokNaSklade
	  set @Quantity = @OstatokNaSklade

  declare @MatName1 varchar(255), @Series varchar(50), @InputDate datetime
	
  select top 1 @MatName1=m.fullname, @Series=m.Series, @InputDate=m.CreateDate from material m where id=@Article

--  select @Quantity as [Quantity],@CPT as [CPT],@CountPackTaking as [CountPackTaking],@RestStatus as [RestStatus],  @OstatokNaSklade as [OstatokNaSklade], @Parent as [parent], @oldparent as [old]                            

  if @Quantity > 0 and @CountPackTaking > 0	--and @OstatokNaSklade >= 0
  begin
    set @SOID = (select ISNULL(Max(Id)+1,1) From StorageOperations)
	  select @RetailPrice = p.RetailPrice,
           @NDS         = p.TaxRate, 
           @Position    = p.Position,
           @UseDate     = p.UseDate               
    from StorageOperations p join Material m on p.ID=m.OperationId 
    where m.ID=@Article
	  --set @NDS        = (select TaxRate     from StorageOperations p join Material m on p.ID=m.OperationId where m.ID=@Article)
	  insert into StorageOperations (ID,MasterID,Article, Quantity,Author,CreateDate,MaterialStr,
	                                 Series,InputDate,RetailPrice,TaxRate,SumNDS,SumPos,ServGUID,Position,UseDate)
				                    select @SOID,@DocID,@Article,@Quantity,@AuthorID,@CreateDate,@MatName1,
				                           @Series,@InputDate,@RetailPrice,@NDS,@RetailPrice*@Quantity*@NDS/100,@RetailPrice*@Quantity,@SGUID,@Position,@UseDate
  end 
 
  --set @OstatokNaSklade = @OstatokNaSklade - @RestStatus - @Quantity

  if @CountPackTaking > 0 and @OstatokNaSklade - @Quantity <= 0 -- если есть остаток препарата и при этом данного препарата нет на складе
  begin
	  set @NameMat=@NameMat+'|'+(select top 1 fullname from material where parent=@parent)
	  declare @VarName varchar(50)
	  declare @MaterialName varchar(255)
    set @VarName = @SGUID + 'BillErrorMaterial'
    set @MaterialName = (select top 1 fullname from material where parent=@parent) + ' - не добавлено: '+cast(@CPT as nvarchar(5))
    exec dbo.spSetVariable @VarName, @MaterialName --#2363 если материала на складе оказалось меньше, то фиксируем ошибку
  end

  Fetch Next From UPD into @MaterialID,@CountPackTaking, @SGUID, @Article, @CHRest, @Parent, @OstatokNaSklade --выбираем следующую строчку

  if @Parent = @OLDParent --если тот же препарат
  begin
    set @RestStatus = @RestStatus + @Quantity
	if @CPT > 0  -- если есть остаток предыдущего препарата
	  set @NameMat = @NameMat+'|'+(select top 1 fullname from material where parent=@parent)
  end
  else	
  begin
	set @OLDParent = @Parent
    select @RestStatus = isnull(sum(Quantity),0) from StorageOperations where article in (select id from material where parent = @parent) and masterid = @DocId 
  end

  if @OLDGUID = @SGUID and (@OstatokNaSklade - @RestStatus) > 0  --если препарат из той же услуги
    set @CPT = @CPT + @Quantity
  else                                           --если препарат из другой услуги
  begin
    set @OLDGUID = @SGUID
    select @CPT = isnull(sum(Quantity),0) from StorageOperations where ServGUID = @SGUID and masterid = @DocId
  end  

  
  --select @RestStatus = isnull(sum(Quantity),0) from StorageOperations where article in (select id from material where parent = @parent) and masterid = @DocId
  --set @OstatokNaSklade = @OstatokNaSklade - @RestStatus

END --while end
Close UPD 
Deallocate UPD
