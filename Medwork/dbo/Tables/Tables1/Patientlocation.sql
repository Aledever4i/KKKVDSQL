CREATE TABLE [dbo].[Patientlocation] (
    [ID]                             INT           NOT NULL,
    [PatID]                          INT           NULL,
    [DictCombo1]                     NVARCHAR (50) NULL,
    [PatsientLezhit]                 NVARCHAR (1)  NULL,
    [OtdId]                          INT           NULL,
    [MasterID]                       INT           NULL,
    [DictIshodObrasheniyaVOtdelenie] INT           NULL,
    [BedProfile]                     INT           NULL,
    [ShiftID]                        INT           NULL,
    [ID001]                          INT           NULL,
    [FromOtdId]                      INT           NULL,
    [ToOtdId]                        INT           NULL,
    [StartDate]                      DATETIME      NULL,
    [StartTime]                      DATETIME      NULL,
    [EndDate]                        DATETIME      NULL,
    [EndTime]                        DATETIME      NULL,
    CONSTRAINT [PatientlocationPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PatientlocationToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);


GO

CREATE TRIGGER [dbo].[tgPatientlocation_hgOccupation_OnDelete]
    ON [dbo].[Patientlocation]
    FOR DELETE
    AS DELETE hgOccupation  FROM   DELETED d, hgOccupation c  where   d.ID = c.UplinkID and   c.UplinkTarget = 'Patientlocation'
		delete patform from deleted d join patform f on d.id=f.id


GO
CREATE TRIGGER [dbo].[tgPatientlocation_OnDelete] ON [dbo].[Patientlocation]  FOR DELETE
AS
BEGIN

	DELETE hgOccupation
	FROM   DELETED d, hgOccupation c
	where   d.ID = c.UplinkID and   c.UplinkTarget = 'Patientlocation'


	declare @ptab table (id int)

	insert into @ptab
	select p.id from Patientlocation p, deleted d
	WHERE d.ID001 is NOT NULL
	and p.ID001=d.ID001 
	and p.enddate=d.startdate
	and p.endtime=d.starttime

	if (select count(*) from @ptab)<1 return

	update Patientlocation
	set enddate=NULL, endtime=NULL, ToOtdID=NULL
	where id in (select t.id from @ptab t)

	update patform set security=0, LockedByID=NULL
	where id in (select t.id from @ptab t)
	
END
