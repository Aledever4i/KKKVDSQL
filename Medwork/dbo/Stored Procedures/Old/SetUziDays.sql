create procedure [dbo].[SetUziDays]
     @ECFStimID int,
     @UziDaysBitMask int
as
     declare @i int
     set @i=0
     delete UziDays where MasterID=@ECFStimID
     while @i<=30
     begin
          declare @newid int
          select @newid=ISNULL(max(id),0)+1 from UziDays
          if((cast(@UziDaysBitMask/cast(POWER(2,@i) as int) as int) % 2)=1)
               insert UziDays(id, MasterID, DayNumber)
               values (@newid, @ECFStimID, @i+1)
          set @i=@i+1
     end
