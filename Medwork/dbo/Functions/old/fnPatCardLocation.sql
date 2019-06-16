
create function fnPatCardLocation(@PatId int)
returns nvarchar(100)
as 
begin
	return (select Top 1 [Section] from patient where id=@PatId)
end
