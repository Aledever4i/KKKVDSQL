CREATE PROCEDURE dbo.AddZaklDiag
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
	
	Set @PatFormId=(select top 1 ID from dbo.PatForm with (nolock) where PatID=@PatId and FormID=3754)
	
	if (@PatFormId IS NULL)
	BEGIN
		Set @PatFormId = IsNull((Select MAX(ID) + 1 From PatForm), 1)
		INSERT INTO dbo.PatForm (PatID, FormID, FormNo, AuthorID, CreateTime, UpdateTime, Security, ID)
			Values (@PatId, 3754, 0, @UserId, GETDATE(), GETDATE(), 0, @PatFormId)	
		
		Insert Into dbo.ListZaklDiag (ID, PatID)
			Values (@PatFormId, @PatId)
	END
	ELSE
	BEGIN
		UPDATE dbo.PatForm SET UpdateTime = GETDATE() WHERE ID = @PatFormId
	END
		
	set @id = (select top 1 ID from dbo.ZaklDiag with (nolock) where sourceId=@SourceId and source=@source)
	
	if @id is null
	begin
		set @id=IsNull((select max(ID)+1 from dbo.ZaklDiag),1)

		insert into dbo.ZaklDiag
		(ID, [PatID], [MasterID], [Vrach], [Data], [first], [prof], [DiagCode], source, sourceId, AddToZaklDiag)
		Values
		(@id, @PatId, @PatFormId, @DoctorID, @date, @isFirst, @isProf, @Diag, @source, @sourceId, 1)
	end
	else
		update dbo.ZaklDiag
			set [Vrach] = @DoctorID, [Data] = @date, [first] = @isFirst, [prof] = @isProf, [DiagCode] = @Diag
			where ID=@id
	
end
