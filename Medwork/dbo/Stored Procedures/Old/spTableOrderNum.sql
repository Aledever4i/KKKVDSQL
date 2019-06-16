CREATE PROCEDURE [dbo].[spTableOrderNum]
		(@tablename nvarchar(255))
as
BEGIN
	set nocount on
	declare @i int
	set @i = (select IsNull(max(num),0)+1 from TableOrderNum where tablename=@tablename)
	if @i>1
		update TableOrderNum set num=@i
		where tablename=@tablename
	else
		insert into TableOrderNum
		select @tableName, @i
	return @i
END
