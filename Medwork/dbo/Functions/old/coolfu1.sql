CREATE function coolfu1(@id int,@mid int,@code int)

Returns  Varchar (255)

AS

BEGIN
Declare @name varchar (255)
Declare @fid int
Declare @fu int

IF @mid is null 
BEGIN
set @name=(Select servicename from paidservice  where  @id = id and @mid is null) 
END

ELSE
BEGIN 
IF @code is not null  
 BEGIN
         set @fu= (select masterid from paidservice where id=@mid) 
 
 END
 
IF @fu is not null  
BEGIN
set @name = (select servicename from paidservice where id=@fu)
END
ELSE
BEGIN
set   @name = (select servicename from paidservice where id=@mid) 
END
END
return @name

END
 
