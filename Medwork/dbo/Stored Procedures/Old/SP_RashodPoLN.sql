CREATE PROCEDURE [dbo].[SP_RashodPoLN]	@DatStart smalldatetime,@DatStop smalldatetime,@DocID int
AS
declare
	@SOID int,
	@Status_Cursor int,
	@Article int,
	@Quantity money,
	@CreateDate smalldatetime,
	@AuthorID int,
	@MaterialID int,
	@CountPackTaking money,
	@CHID int,
	@CHRest	int, 
	@MIDOLD int,
	@CPT money,
	@NameMat varchar(80),
	@Parent int

set @CreateDate = convert(smalldatetime,GetDate(),104)
set @AuthorID = (select Author from StorageDocument where ID = @DocID)

declare @RetailPrice money
declare @NDS money

declare UPD Insensitive Cursor For
	select * 
	from
	(
	select 
		t1.MaterialID,
		sum(convert(float,t1.SummaryTaking)/case when m.Fraction=0 then 1 else IsNull(m.Fraction,1) end) CountPackTaking --
	from
		(
		select distinct
			lnn.id, 
			lnn.Service as MaterialID,
			(
			select count(*)
			from 
				LN_OtmetkaOPrieme lnoop
			where 
				lnoop.MasterID= lnn.ID
				and lnoop.Date>=@DatStart
				and lnoop.Date<=@DatStop
				and Status=1
			)*IsNull(lnn.Doza,1) SummaryTaking
		from 
			LN_Naznacheniya lnn
		where
			lnn.ServType='Препарат/Материал из номенклатуры'
		) t1,
		Material m 
	where m.ID=t1.MaterialID 
	group by t1.MaterialID
	) a inner join 
	(
	select
		ID CHID,
		Rest CHRest,
		Parent
	from material
	where rest>0 
	) b on	a.MaterialID=b.Parent
	order by MaterialID,CHID asc	

open UPD
set @Status_Cursor=0
set @MIDOLD=0
set @CPT=0
set @NameMat=''
while (@Status_Cursor=0)
	begin
	Fetch Next From UPD into @MaterialID,@CountPackTaking,@Article,@CHRest,@Parent
	--select @MaterialID,@CountPackTaking,@Article,@CHRest,@Parent
	if @MaterialID<>@MIDOLD --если первая партия материала 
	begin
		if @CPT > 0  -- если есть остаток предыдущего препарата
		begin
			set @NameMat=@NameMat+'|'+(select top 1 fullname from material where id=@MIDOLD)
		end
		
		set @CPT=@CountPackTaking 
	end

	if @CPT >= @CHRest
	begin
		set @Quantity=@CHRest
	end else
	begin
		set @Quantity=@CPT
	end
	
	declare @MatName1 varchar(255), @Series varchar(50), @InputDate datetime
	
	select @MatName1 = (select top 1 m.fullname from material m where id=@Article)
	select @Series = (select top 1 m.Series from material m where id=@Article)
	select @InputDate = (select top 1 m.CreateDate from material m where id=@Article)
	--select 'qwe', @Article, @MatName1, @Series, @InputDate
	
	select @Status_Cursor=@@Fetch_Status
	if ( @CPT > 0 ) and ( @@Fetch_Status = 0)  	
		begin
			set @SOID = (select ISNULL(Max(Id)+1,1) From StorageOperations)
			set @RetailPrice=(select PurchasingPrice from StorageOperations p join Material m on p.ID=m.OperationId where m.ID=@Article)
			set @NDS=(select TaxRate from StorageOperations p join Material m on p.ID=m.OperationId where m.ID=@Article)
			insert into StorageOperations (ID,MasterID,Article, Quantity,Author,CreateDate,MaterialStr,Series,InputDate,RetailPrice,TaxRate,SumNDS,SumPos)
				select @SOID,@DocID,@Article,@Quantity,@AuthorID,@CreateDate,@MatName1,@Series,@InputDate,@RetailPrice,@NDS,@RetailPrice*@Quantity*@NDS/100,@RetailPrice*@Quantity

		end 

	set @CPT=@CPT-@Quantity
	set @MIDOLD=@MaterialID
	end

if @CPT > 0  -- если есть остаток предыдущего препарата
	begin
	set @NameMat=@NameMat+'|'+(select top 1 fullname from material where id=@MIDOLD)
	end

Close UPD 
Deallocate UPD

exec dbo.spSetVariable 'LNErrorMaterial',@NameMat
