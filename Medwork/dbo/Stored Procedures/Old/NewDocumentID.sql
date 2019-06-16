create procedure [dbo].[NewDocumentID]
as
declare @id int
begin
	insert DocumentID default values
	set @id=scope_identity()
	delete DocumentID where id=@id
	return @id
end
