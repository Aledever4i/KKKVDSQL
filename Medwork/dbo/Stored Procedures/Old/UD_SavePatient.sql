
CREATE PROCEDURE UD_SavePatient
	@OldId int, 
	@date DateTime,
	@DoctorID int,
	@PatId int,
	@isList int,
	@isHome int,
	@isObject int,
	@isOrgonize int,
	@VisitTime DateTime,
	@FirstTime int,
	@UserId int,
	@VisitType int,
	@Treatment int,
	@VisitResult int,
	@isNotVisit int,
	@AttId int,
	@Org int,
	@Dog int
AS
begin
	Declare @id int, @PatFormId int
	Set @id = (Select top 1 id From UD_Patient Where date=@date and DoctorID=@DoctorID and patid=@patid and @isList=0)
	if @OldId>0
	begin
		if (@id is null) or (@isList=1) or (@id=@oldId)
			set @id=@OldId
		else
		begin
			update UI_Diag set pid=@id where pid=@oldId
			delete from ud_patient where id=@oldid
		end
	end
	if (@id is null) or ((@isList=1) and (@OldId<=0)) begin
		Set @id=(Select IsNull((Select max(id)+1 From UD_Patient),1))
		Insert Into UD_Patient (id, date, DoctorID, PatId, isList, isHome, isObject, isOrgonize, VisitTime, FirstTime, creator, createdate,
			VisitType, Treatment, VisitResult, IsNotVisit, AttId,	Org, Dog)--[21122006] 
		Values (@id, @date, @DoctorID, @PatId, @isList, @isHome, @isObject, @isOrgonize, @VisitTime, @FirstTime, @userID, getdate(),
			@VisitType, @Treatment, @VisitResult, @IsNotVisit, @AttId, @Org, @Dog)--[21122006]
		-- [20112006] Сохранение в карте пациента
		if @PatId<>-1 begin -- -1 - признак листового пациента
			Set @PatFormId = IsNull((Select Max(ID)+1 From PatForm),1)
			Insert Into PatForm (PatID, FormID, FormNo, AuthorId, CreateTime, UpdateTime, Security, ID)
			Values (@PatId, 10246, 0, @UserId, @date, @date, 0, @PatFormId)
			Insert Into StatisticheskiyDokument (ID, PatID, UniDocId)
			Values (@PatFormId, @PatId, @id)
		end
	end else begin
		update UD_Patient 
		set date=@date, DoctorID=@DoctorID, PatId=@PatId, isList=@isList, isHome=@isHome, isObject=@isObject, isOrgonize=@isOrgonize, 
			visitTime=@visitTime, FirstTime=@FirstTime, updater=@userID, updatedate=getdate(), 
			VisitType=@VisitType, Treatment=@Treatment, VisitResult=@VisitResult, --[21122006]
			isNotVisit=@isNotVisit, AttId=@AttId,	Org=@Org,	Dog=@Dog
		where id=@id
		
		update PatForm
		set PatId=@PatId
		from StatisticheskiyDokument sd
		where sd.id=PatForm.id and sd.UniDocId=@id
	end
	Select @id
end
