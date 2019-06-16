
Create Procedure [dbo].[CreateBill]
   @DocDate DateTime, 
   @StartDate DateTime, 
   @EndDate DateTime,
   @OrgId int,
   @DogId int,
   @Let nvarchar(250),
   @PatId int,
	@Use_ud int,
	@Use_n int,
	@Use_n_ignore_done int,	
	@Use_b int,
	@FilterProg int
AS 
BEGIN
 Set NOCOUNT On
 
--- 
declare @ct table (Dog int, NewDog int, contractnumber nvarchar(50), newcontractNumber nvarchar(50), beg_date datetime, end_date datetime)

insert into @ct
select id,id,contractnumber,contractnumber,beg_date,end_date
from contracts c

declare @c int
set @c=0

while ((select count(*) from @ct)-@c)>0
begin
	set @c=(select count(*) from @ct)
	insert @ct
	select ct1.dog,ct2.dog,ct1.contractnumber,ct2.contractnumber,case when ct1.end_date<ct2.beg_date then ct2.beg_date else ct1.end_date end,ct2.end_date
	from @ct ct1, @ct ct2, contracts c1, contracts c2
	where ct1.dog=c1.id and ct2.dog=c2.id and c2.MasterId=c1.MasterID and c1.id<>c2.id and c2.end_date>c1.end_date
		and c1.nextdog=c2.id
		and c2.id not in
		(select newdog from @ct ct3 where ct3.dog=ct1.dog)
end
----
declare @attId int
if @Patid is not null
begin
	if IsNull(@OrgId,-1)=-1 
		select @OrgId=[off] from attachment where masterid=@PatId and LetResult=@Let
	if IsNull(@DogId,0)=0
		select @DogId=dog from attachment where masterid=@PatId and LetResult=@Let and ([off]=@OrgId or @OrgId=-1)
	select @attid=id from attachment where masterid=@PatId and LetResult=@Let and ([off]=@OrgId or @orgId=-1) and (@DogId=dog or @DogId is null)
	select @StartDate=IsNull(beg_date,@StartDate), @EndDate=IsNull(end_date,@EndDate) from attachment where id=@attid
end
 
Declare 
	@newID int,
	@newNum int,
	@newNum2 int,
	@ok int,
	@CardNum varchar(100), 
	@DoctorId int, 
	@Diag varchar(50), 
	@Service varchar(250), 
	@ServiceName varchar(255), 
	@Quant int, 
	@Price float, 
	@subId int,
	@Summa float,
	@Discont float,
	@byActs float,
	@PreSumm float,
	@Summ float,
	@ProgramCodesFilter int
	
	declare @ProgramCodes table (Code int, prCode int) -- [#5059]
	insert into @ProgramCodes (Code, prCode) -- [#5059]
		select ID, Code from insuranceprogram where Code in 
			(select cast(code as int) code from DictMultiselect where groupID=@FilterProg and Checked=1)
	set @ProgramCodesFilter=(select count(*) from @ProgramCodes)

	set @ok=(
		Select 
			Count(1) 
		From 
			UD_Patient p, UI_Diag d, UI_Service s, attachment a, @ct ct
  	Where
   		p.id=d.pid and
   		d.id=s.pid and 
  		p.attid=a.id and
			p.dog=ct.dog and ct.newdog =@dogid and p.date>=ct.beg_date and p.date<=ct.end_date 
   		and ((@PatId is null and p.Date>=@StartDate and p.Date<=@EndDate) or (@PatId=PatId and @attid=AttID)) and @Use_ud=1
			and (@ProgramCodesFilter=0 or a.AttProgram in (select code from @ProgramCodes))
  )+(
		Select 
			Count(1) 
		From 
			napravlenie n, AppointmentService aps, attachment a, @ct ct
  	Where
  		n.id=aps.MasterID and
  		n.paymenttype=2 and
  		n.paymentcode=a.id and
			a.dog=ct.dog and ct.newdog =@dogid and IsNull(aps.Date,n.DataNapravleniya)>=ct.beg_date and IsNull(aps.Date,n.DataNapravleniya)<=ct.end_date 
   		and ((@PatId is null and IsNull(aps.Date,n.DataNapravleniya)>=@StartDate and IsNull(aps.Date,n.DataNapravleniya)<=@EndDate) or (@PatId=PatId and @attid=a.ID))
   		and @Use_n=1 and (@Use_n_ignore_done=1 or aps.Done=1)
			and (@ProgramCodesFilter=0 or a.AttProgram in (select code from @ProgramCodes))
  )+(
		Select 
			Count(1) 
		From 
			bill b, BillService bs, attachment a, @ct ct
  	Where
  		b.id=bs.MasterID and
  		b.paymenttype=2 and
  		b.paymentcode=a.id and
			a.dog=ct.dog and ct.newdog =@dogid and b.DataScheta>=ct.beg_date and b.DataScheta<=ct.end_date 
   		and ((@PatId is null and b.DataScheta>=@StartDate and b.DataScheta<=@EndDate) or (@PatId=PatId and @attid=a.ID)) and @Use_b=1
			and (@ProgramCodesFilter=0 or a.AttProgram in (select code from @ProgramCodes))
  )
  
  if @ok=0
  	return -2
  	
  set @ok=(
  	select 
  		count(*) 
  	from 
  		UDP_bill b
  	where 
  		b.EndDate>=@StartDate and 
  		b.StartDate<=@EndDate and 
  		b.[Firm]=@OrgId and 
  		b.Dog=@DogId and (
  		@ProgramCodesFilter=0 or
  		(select count(*) from UDP_Prog where BillID=b.ID)=0 or
  		(select count(*) from UDP_Prog p1 inner join @ProgramCodes p2 on p1.Prog=p2.prCode where p1.BillID=b.ID)>0 -- [#5059]
  		)
  )
  
  if @ok>0 and @PatId is null
  	return -1
  
 	--if @ok>0 begin
		
		--[28.10.2008]
		if OBJECT_ID('tempdb..#tempBillSpec') is not null
	 		drop table #tempBillSpec 

		Create Table #tempBillSpec (
			PatId int, 
			CardNum nvarchar(50), --[#6083]
			DoctorId int,
			diag varchar(250), 
			Service varchar(250), 
			ServiceName varchar(255), 
			quant int,
			price float,
			PDate DateTime,
			LetResult nvarchar(250),
			Policy nvarchar(100),
			GUID varchar(32),
			id int IDENTITY(1,1))

		Insert Into #tempBillSpec
		Select 
			p.PatId, 
			pp.CardNum, 
			p.DoctorId, 
			d.Code [diag], 
			s.code [Service], 
			s.name [ServiceName], 
			Sum(count) [quant],
			s.price, 
			p.Date,
			a.LetResult,
			a.Policy,
			s.GUID
		From UD_Patient p left join attachment a on a.id=p.attid, UI_Diag d, UI_Service s, Patient pp, @ct ct
		Where
			p.id=d.pid and
	 		d.id=s.pid and
 			p.Patid=pp.id and
			p.dog=ct.dog and ct.newdog =@dogid and p.date>=ct.beg_date and p.date<=ct.end_date
   		and ((@PatId is null and p.Date>=@StartDate and p.Date<=@EndDate) or (@PatId=PatId and @attid=AttID))
   		and @Use_ud=1
			and (@ProgramCodesFilter=0 or a.AttProgram in (select code from @ProgramCodes))
		Group by p.Date, p.PatId, pp.CardNum, p.DoctorId, d.Code, s.code, s.name, s.price,a.LetResult,a.Policy, s.GUID
		
		Insert Into #tempBillSpec
		Select 
			pp.Id, 
			pp.CardNum, 
			case when IsNull(aps.Resource,0)=0 then n.Resource else aps.Resource end, 
			n.DiagCode [diag], 
			aps.Service [Service], 
			aps.Servicename [ServiceName], 
			Sum(aps.[quant]) [quant],
			aps.price, 
			IsNull(aps.Date,n.DataNapravleniya),
			a.LetResult,
			a.Policy,
			aps.GUID
		From 
			napravlenie n, AppointmentService aps, attachment a, @ct ct, Patient pp
  	Where
  		n.id=aps.MasterID and
  		n.paymenttype=2 and
  		n.paymentcode=a.id and
  		n.PatId=pp.id and
			a.dog=ct.dog and ct.newdog =@dogid and IsNull(aps.Date,n.DataNapravleniya)>=ct.beg_date and IsNull(aps.Date,n.DataNapravleniya)<=ct.end_date 
   		and ((@PatId is null and IsNull(aps.Date,n.DataNapravleniya)>=@StartDate and IsNull(aps.Date,n.DataNapravleniya)<=@EndDate) or (@PatId=PatId and @attid=a.ID))
  		and @Use_n=1 and (@Use_n_ignore_done=1 or aps.Done=1) and aps.GUID not in (select GUID from #tempBillSpec)
			and (@ProgramCodesFilter=0 or a.AttProgram in (select code from @ProgramCodes))
		Group by IsNull(aps.Date,n.DataNapravleniya), pp.Id, pp.CardNum, case when IsNull(aps.Resource,0)=0 then n.Resource else aps.Resource end, n.DiagCode,
								aps.Service, aps.Servicename, aps.price,a.LetResult,a.Policy, aps.GUID

		Insert Into #tempBillSpec
		Select 
			pp.Id, 
			pp.CardNum, 
			bs.Resource, 
			--null [diag], 
			(select (case when not min(nullif(n.DiagCode,'')) is null and min(n.DiagCode)<>max(n.DiagCode) then min(n.DiagCode)+'; ' else '' end)+max(n.DiagCode)+(case when count(NullIf(n.DiagCode,''))>2 then '...' else '' end) from Napravlenie n join AppointmentService aps on aps.MasterID=n.ID where aps.GUID=bs.GUID group by aps.GUID) [diag],
			bs.Service [Service], 
			bs.Servicename [ServiceName], 
			Sum(bs.[quant]) [quant],
			bs.price, 
			bs.DATUSL, --#5651
			a.LetResult,
			a.Policy,
			bs.GUID
		From 
			bill b, BillService bs, attachment a, @ct ct, Patient pp
  	Where
  		b.id=bs.MasterID and
  		b.paymenttype=2 and
  		b.paymentcode=a.id and
  		b.PatId=pp.id and
			a.dog=ct.dog and ct.newdog =@dogid and b.DataScheta>=ct.beg_date and b.DataScheta<=ct.end_date 
   		and ((@PatId is null and b.DataScheta>=@StartDate and b.DataScheta<=@EndDate) or (@PatId=PatId and @attid=a.ID))
			and @Use_b=1 and bs.GUID not in (select GUID from #tempBillSpec)
			and (@ProgramCodesFilter=0 or a.AttProgram in (select code from @ProgramCodes))
		Group by b.DataScheta, bs.DATUSL, pp.Id, pp.CardNum, bs.Resource, bs.Service, bs.Servicename, bs.price,a.LetResult,a.Policy, bs.GUID --#5651
		
		select @StartDate=IsNull(@StartDate,min(PDate)), @EndDate=IsNull(@EndDate,max(PDate)) from #tempBillSpec
		
  	Set @newID=(IsNull((select max(id)+1 From UDP_Bill),1))
  	Set @newNum=(IsNull((select max(DocNum)+1 From UDP_Bill where id=(select max(id) From UDP_Bill where DocNum is not null)),1))
  	if (select count(*) from organisations where code=@OrgId and Type='Физическое лицо')>0
  		Set @newNum=null--[16.09.2008]
  	Set @newNum2=(IsNull((select max(Doc2Num)+1 From UDP_Bill where id=(select max(id) From UDP_Bill where Doc2Num is not null)),1))
  	Set @Discont=(Select sum(d.DiscountPercent) From ContractDiscount d Where d.MasterId=@DogId and @EndDate>=d.BeginDate and @StartDate-1<d.EndDate and DiscountType<>4748)
	
		Insert Into UDP_Bill ([DocNum], [DocDate], [Doc2Num], [Doc2Date], [EndDate], [StartDate], [Firm], [Dog], [ID], [Discont]) 
		Values (@newNum, @DocDate, @newNum2, @endDate, @endDate, @StartDate, @orgId, @DogId, @newId, @Discont)
		
		Insert Into UDP_Prog (BillId, Prog) select @newId, prCode from @ProgramCodes -- [#5059]

		Set @subId=isnull((Select max(id) From UDP_BillSpec),1)

		Insert Into UDP_BillSpec (ID, Doctor, Quant, Summa, Diag, Service, GUID, Price, MasterID, ServiceName, CardNum, PatID, PDate, DiscontPassive, LetNum, Policy)
		Select 
			min(id)+@subId,
	 		DoctorId,
 			sum(Quant),
 			sum(Quant)*price,
	 		Diag,
 			Service,
 			GUID,
 			Price,
	 		@newId,
 			ServiceName,
			CardNum,
 			PatId,
 			PDate,
 			(Select sum(d.DiscountPercent) From ContractDiscount d Where d.MasterId=@DogId and PDate>=d.BeginDate and PDate-1<d.EndDate and DiscountType=4748),
 			LetResult,
 			Policy
		From #tempBillSpec
		group by PatId, CardNum, DoctorId,
			diag, Service, GUID, ServiceName, quant,
			price, PDate,	LetResult,Policy
  
		Drop Table #tempBillSpec

		-- акты экспертизы...

		Insert Into BillActs 
		Select
			isnull((Select max(id)+1 From BillActs),1),
 			@newID,
  		a.id 
 		From 
  		AddDeed a 
 		Where 
  		a.dog=@DogId and (not (a.id in (Select b.act From BillActs b))) 


		-- считаем суммы...
 		Set @byActs=isnull((select sum(a.Amount) from BillActs b, AddDeed a where b.act=a.id and b.MasterID=@newID),0)
	 	Set @PreSumm=(select sum(cast(price*(1-isnull(DiscontPassive,0)/100) as numeric(20,0))*quant) from UDP_BillSpec where MasterID=@newId)
 		Set @Summ=(@PreSumm*(1-isnull(@Discont,0)/100) - @byActs )

	 	Update UDP_Bill set byAct=@byActs, PreSumm=@PreSumm, Summ=@Summ  where id=@NewId
 	
--  end
		return 0

end

