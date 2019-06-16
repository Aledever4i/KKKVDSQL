CREATE PROCEDURE sp_delete_patform
	@f_id  int = -1
AS
set nocount on
declare @lev int
set @lev=0
--drop table ##id_list
create table ##id_list (
lev int,
f_id int
)
insert into ##id_list values (@lev, @f_id)
while (@@rowcount<>0)
begin
 set @lev=@lev+1
 insert ##id_list
   select @lev, id from patform where
     parentid in (select f_id from ##id_list where lev=@lev-1)
end
