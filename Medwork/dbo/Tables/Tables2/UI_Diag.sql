CREATE TABLE [dbo].[UI_Diag] (
    [id]             INT          IDENTITY (1, 1) NOT NULL,
    [pid]            INT          NULL,
    [code]           VARCHAR (50) NULL,
    [isNotRegister]  BIT          NULL,
    [isFirst]        TINYINT      NULL,
    [FirstCandition] INT          NULL,
    [isHronikus]     TINYINT      NULL,
    [isOff]          TINYINT      NULL,
    [Tr]             INT          NULL,
    [san]            BIT          NULL,
    [oneVisit]       BIT          NULL,
    [Creator]        INT          NULL,
    [CreateDate]     DATETIME     NULL,
    [Updater]        INT          NULL,
    [UpdateDate]     DATETIME     NULL,
    [isProf]         TINYINT      NULL,
    [Final]          BIT          NULL,
    CONSTRAINT [PK__UI_Diag__66F85F9E] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE NONCLUSTERED INDEX [idxUI_Diag_pid]
    ON [dbo].[UI_Diag]([pid] ASC, [isNotRegister] ASC, [code] ASC);


GO
CREATE NONCLUSTERED INDEX [idxUI_Diag_code]
    ON [dbo].[UI_Diag]([isNotRegister] ASC, [code] ASC, [pid] ASC);


GO

Create Trigger UI_Diag_BD
On UI_Diag
For Delete
AS
	Delete from UI_Service where UI_Service.pid in (select d.id from deleted d)

GO

Create Trigger UI_Diag_InsertDiag
On UI_Diag
After Insert, Update
AS begin
	declare 	@SourceId int, 
	@date DateTime,
	@DoctorID int,
	@PatId int,
	@Diag nvarchar(7),
	@UserId int,
	@isFirst BIT,
	@isProf BIT
	
	select top 1 @SourceId=i.id, @date=p.date, @PatId=p.PatId, @DoctorID=p.DoctorId, 	@Diag=i.Code,	@UserId=IsNull(p.Updater,p.Creator),
			@isFirst=i.isFirst,	@isProf=i.isProf
	from inserted i left join UD_patient p on p.id=i.pid
	where isnotRegister=1
	
	if IsNull(@Diag,'')<>''
		exec AddZaklDiag 'UI_Diag',	@SourceId, @date,	@DoctorID, @PatId, @isFirst, @isProf, @Diag,	@UserId

end
