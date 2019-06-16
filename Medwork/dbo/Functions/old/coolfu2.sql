CREATE  function coolfu2 (@id int,@mid int,@code int)

Returns  Varchar (255)

AS

BEGIN
Declare @name varchar (255)
Declare @fid int
Declare @fu int

IF @mid is not null 
BEGIN 
set @fu=(select id from paidservice where @mid=id)

  set @name = (select servicename from paidservice where id=@fu)




END
ELSE 
BEGIN
  set @name = (select servicename from paidservice where id=@id)
END


return @name 
END
