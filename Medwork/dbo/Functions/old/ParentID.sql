
create function [dbo].[ParentID](@docID int)
returns int
begin
	return (select ParentID from patform where id=@DocID)
end
