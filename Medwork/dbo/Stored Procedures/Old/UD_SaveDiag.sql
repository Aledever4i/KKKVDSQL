
CREATE  PROCEDURE UD_SaveDiag
	@OldId int,
	@pid int,
	@code Varchar(50),
	@isNotRegister int,
	@isFirst int,
	@FirstCandition int,
	@isHronikus int,
	@isOff int,
	@Tr int,
	@san int,
	@oneVisit int,
	@Final bit
AS
begin
	declare @id int, @isProf int
	if upper(SUBSTRING(@code,1,1))='Z' set @isProf=1 else set @isProf=0
	set @id=(select top 1 id from UI_Diag where pid=@pid and code=@code)
	if @OldId>0
	begin
		if (@id is null) or (@id=@oldId)
			set @id=@oldId
		else
		begin
			update UI_service set pid=@id where pid=@oldid
			delete from UI_Diag where id=@oldId
		end
	end
	if @id is null begin
		insert into UI_Diag (pid,  code, isNotRegister, isFirst, FirstCandition, isHronikus, isOff, Tr, san, oneVisit, isProf, Final) 
		values (@pid,  @code, @isNotRegister, @isFirst, @FirstCandition, @isHronikus, @isOff, @Tr, @san, @oneVisit, @isProf, @Final)
		set @id=SCOPE_IDENTITY()
	end else begin
		update UI_Diag 
		set pid=@pid, code=@code, isNotRegister=@isNotRegister, isFirst=@isFirst, FirstCandition=@FirstCandition, isHronikus=@isHronikus, isOff=@isOff, 
			Tr=@Tr, san=@san, oneVisit=@oneVisit, isProf=@isProf, Final=@Final
		where id=@id
	end
	select @id
end
