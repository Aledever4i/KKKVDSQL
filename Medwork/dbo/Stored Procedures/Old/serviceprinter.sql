CREATE procedure serviceprinter
as
declare @FName varchar (255)
declare @SFName varchar (255)
declare @SName varchar (255)
 WHILE (Select id from paidservice)<= @@ROWCOUNT
BEGIN
set @Fname = (select servicename from paidservice where (code is null) and (masterid is null))
set @SFname = (select servicename from paidservice where (code is null))
set @Sname = (select servicename from paidservice where (code is not null))

END




 

--execute   serviceprinter

