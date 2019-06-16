
CREATE PROCEDURE AddZaklDiag
	@source nvarchar(256),
	@SourceId int, 
	@date DateTime,
	@DoctorID int,
	@PatId int,
	@isFirst BIT,
	@isProf BIT,
	@Diag nvarchar(7),
	@UserId int
AS
begin

	Declare @PatFormId int, @id int
	
	Set @PatFormId=(select top 1 id from patform with (nolock) where PatId=@PatId and FormId=3754)
	
	if @PatFormId is null
	begin
		Set @PatFormId = IsNull((Select Max(ID)+1 From PatForm),1)
		Insert Into PatForm (PatID, FormID, FormNo, AuthorId, CreateTime, UpdateTime, Security, ID)
		Values (@PatId, 3754, 0, @UserId, GetDate(), GetDate(), 0, @PatFormId)	
		
		Insert Into ListZaklDiag (ID, PatID)
		Values (@PatFormId, @PatId)
	end
	else
		update patform
		set UpdateTime=GetDate()
		where id=@PatFormId
		
	set @id = (select top 1 id from ZaklDiag with (nolock) where SourceId=@SourceId and source=@source)
	
	if @id is null
	begin
		set @id=IsNull((select max(id)+1 from ZaklDiag),1)
		insert into ZaklDiag
		(id, [PatID], [MasterID], [Vrach], [Data], [first], [prof], [DiagCode], source, sourceId, AddToZaklDiag)
		Values
		(@id, @PatId, @PatFormId, @DoctorId, @date, @isFirst, @isProf, @Diag, @source, @sourceId, 1)
	end
	else
		update ZaklDiag
		set [Vrach]=@DoctorId, [Data]=@date, [first]=@isFirst, [prof]=@isProf, [DiagCode]=@Diag
		where id=@id
	
end
