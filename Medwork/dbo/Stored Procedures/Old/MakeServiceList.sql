CREATE PROC dbo.MakeServiceList
@GR1 nvarchar(255),
@GR2 nvarchar(255),
@Code nvarchar(20),
@Name nvarchar(255),
@Price float    
AS 
Declare 
@Id Int,
@MId int,
@Fid int,
@SFmid int,
@SFid int 
 
 
set @Fid= (select Id from PaidService where servicename = @GR1  )
 IF @FID is NULL 
  BEGIN
  set @Fid = (select ISNULL(max(id),0)+1 from PaidService )
 Insert Into PaidService Values (@fid,null,@Gr1,Null,null,'FOLDER')
  END

IF @GR2<>'-1'
 BEGIN
  set @SFid= (select Id from PaidService where servicename = @GR2  ) 
 
        If @Sfid Is Null
	Begin
          set @SFid = (select ISNULL(max(id),0)+1 from PaidService )
	  set @SFmid=@Fid
	  Insert Into PaidService Values (@Sfid,null,@Gr2,Null,@SFmid,'FOLDER')	
	End
  set @Mid=@SFid  
 END
ELSE  
 BEGIN

  set @Mid=@Fid   
 END
 Set @Id = (select ISNULL(max(id),0)+1 from PaidService )
INSERT INTO PAIDSERVICE Values (@id,@Code,@Name,@Price,@Mid,'Service')
