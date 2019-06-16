CREATE TABLE [dbo].[Oplatapobeznalu] (
    [ID]          INT           NOT NULL,
    [PatID]       INT           NULL,
    [Prinyal]     INT           NULL,
    [Summa]       FLOAT (53)    NULL,
    [NomerScheta] NVARCHAR (30) NULL,
    [DataOplati]  DATETIME      NULL,
    [Memo]        NTEXT         NULL,
    CONSTRAINT [OplatapobeznaluPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [OplatapobeznaluToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);


GO
 
CREATE TRIGGER RegProgramDeleteUpdaterForBeznal ON dbo.oplatapobeznalu
FOR  DELETE
AS
 SET NOCOUNT ON

DECLARE  @Sum Float    
DECLARE  @N nvarchar(30)  
 
	declare mycursor cursor for 
	select nomerscheta from deleted
	open mycursor     
fetch next  from mycursor into @N
 while  @@FETCH_STATUS  =0 
   begin 
     set @Sum= ( select isnull (deleted.summa,0) from deleted )       
       
UPDATE RegProgram  
    
   set  RegProgram.Credit= IsNull(RegProgram.Credit,0) - @Sum
   where RegProgram.Cardno = @N
   

   fetch next  from mycursor into @N
 

  end 

close mycursor 
deallocate mycursor



GO

 
CREATE TRIGGER RegProgramUpdateUpdaterForBeznal ON dbo.oplatapobeznalu
FOR  UPDATE
AS
 SET NOCOUNT ON

DECLARE  @Sum Float   
DECLARE  @N nvarchar(30)  
 declare mycursor cursor for 
	select nomerscheta from inserted
	open mycursor    
fetch next  from mycursor into @N
 while  @@FETCH_STATUS  =0 
   begin 
     set @Sum= ( select isnull(inserted.summa,0) from inserted )       
       
UPDATE RegProgram  
    
   set  RegProgram.Credit= IsNull(RegProgram.Credit,0) + @Sum
   where RegProgram.Cardno = @N
   

   fetch next  from mycursor into @N
 

  end 

close mycursor 
deallocate mycursor

