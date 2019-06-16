CREATE TABLE [dbo].[hgOccupation] (
    [ID]           INT           NOT NULL,
    [UplinkID]     INT           NULL,
    [UplinkTarget] NVARCHAR (64) NULL,
    [Patid]        INT           NULL,
    [Status]       INT           NULL,
    [Caption]      NVARCHAR (50) NULL,
    [HStart]       DATETIME      NULL,
    [HEnd]         DATETIME      NULL,
    [RoomIndex]    INT           NULL,
    [ParentID]     INT           NULL,
    [BedProfile]   INT           NULL,
    [TimeS]        DATETIME      NULL,
    [TimePo]       DATETIME      NULL
);


GO

CREATE TRIGGER [dbo].[OccupationUpdTr]
    ON [dbo].[hgOccupation]
    AFTER UPDATE
    AS BEGIN
	SET NOCOUNT ON;
	declare @ID int
	declare @uplinkID int
	declare @d1 datetime
	declare @d2 datetime
	declare @uplinkName varchar(255)
	select @ID=ID, @d1=hstart, @d2=hend, @uplinkID=uplinkID, @uplinkName=uplinkTarget from inserted
	declare @s nvarchar(4000)
	if (cast(@d1 as int)=cast(@d2 as int))
	begin
	    declare @id001 int
	    set @id001=0
	    if @uplinkName like 'PatientLocation'
	    begin
			select @id001=isnull(ID001,0) from PatientLocation where id=@uplinkID
		end	
	    if @id001>0
	    begin
			set @s='delete hgOccupation where id='+cast(@ID as varchar(16))
			exec sp_executesql @s
	    end else begin
			set @s='delete '+@uplinkName+' where id='+cast(@uplinkID as varchar(16))
			exec sp_executesql @s
	    end
	end
END
