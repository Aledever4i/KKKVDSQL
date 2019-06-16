CREATE  function altcoolfu2 (@id int,@mid int,@code int)

Returns  Varchar (255)

AS

BEGIN
Declare @name varchar (255)
Declare @fid int
Declare @fu int

IF @mid is not null and @code is not null
BEGIN 
 set @fu=(select id from paidservice where @mid=id)
 Set @fid =(select id from paidservice where @fu=masterid and code is null)
 If @fid is not null 
  begin
  set @name = (select servicename from paidservice where id=@mid)
  end



END
 


return @name 
END
