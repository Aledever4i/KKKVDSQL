CREATE TABLE [dbo].[OsmotrSpetsialistaPovtorniy] (
    [ID]                       INT            NOT NULL,
    [PatID]                    INT            NULL,
    [Data]                     DATETIME       NULL,
    [VremyaOsmotra]            DATETIME       NULL,
    [Vrach]                    NVARCHAR (50)  NULL,
    [AnamnesisiMorbi]          NTEXT          NULL,
    [Zhalobi]                  NTEXT          NULL,
    [StatusPraesensCommunis]   NTEXT          NULL,
    [OrganiDihaniya]           NTEXT          NULL,
    [OrganiKrovoobrasheniya]   NTEXT          NULL,
    [OrganiPishevareniya]      NTEXT          NULL,
    [OrganiVideleniya]         NTEXT          NULL,
    [DiagnozOsnovnoy1]         NTEXT          NULL,
    [PlanObsledovaniya]        NTEXT          NULL,
    [PlanLecheniya]            NTEXT          NULL,
    [LechashiyVrach]           NVARCHAR (50)  NULL,
    [DiagnozOsnovnoy]          NVARCHAR (50)  NULL,
    [DiagnozSoputstvuyushiy1]  NTEXT          NULL,
    [DiagnozSoputstvuyushiy]   NVARCHAR (50)  NULL,
    [Zhalobi1]                 NVARCHAR (50)  NULL,
    [StatusPraesensCommunis1]  NVARCHAR (50)  NULL,
    [OrganiDihaniya1]          NVARCHAR (50)  NULL,
    [OrganiKrovoobrasheniya1]  NVARCHAR (50)  NULL,
    [OrganiPishevareniya1]     NVARCHAR (50)  NULL,
    [OrganiVideleniya1]        NVARCHAR (50)  NULL,
    [DiagnozOsnovnoy15]        NVARCHAR (50)  NULL,
    [Data1]                    DATETIME       NULL,
    [Specialist]               NVARCHAR (50)  NULL,
    [Recomendacii]             NTEXT          NULL,
    [IzmenenieLO]              NTEXT          NULL,
    [DinamikaSostPat]          NVARCHAR (50)  NULL,
    [DiagCode]                 NVARCHAR (50)  NULL,
    [Vrach2]                   INT            NULL,
    [DiagCode1]                NVARCHAR (255) NULL,
    [DiagnozSoputstvuyushiy15] NVARCHAR (255) NULL,
    [DocTime]                  DATETIME       NULL,
    [Exam]                     NTEXT          NULL,
    [Complains]                NTEXT          NULL,
    [PastTreatment]            NTEXT          NULL,
    CONSTRAINT [OsmotrSpetsialistaPovtorniyPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [OsmotrSpetsialistaPovtorniyToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);


GO

Create Trigger SecondExam_InsertDiag
On OsmotrSpetsialistaPovtorniy
After Insert, Update
AS begin
	declare 	@SourceId int, 
	@date DateTime,
	@DocTime DateTime,
	@DoctorID int,
	@PatId int,
	@Diag nvarchar(7),
	@UserId int,
	@DocDateTime datetime
	
	select top 1 @SourceId=i.id, @DoctorID=Vrach2, @date=i.Data1, @DocTime=i.DocTime, @PatId=i.PatId,	@Diag=i.DiagCode,	@UserId=p.AuthorId
	from inserted i left join patform p on i.id=p.id

	set @DocDateTime=convert(datetime, convert(decimal(25, 10), @date)+convert(decimal(25, 10), @DocTime), 102)
	
	if IsNull(@Diag,'')<>''
		exec AddZaklDiag 'OsmotrSpetsialistaPovtorniy',	@SourceId, @DocDateTime, @DoctorID, @PatId, 0,	0, @Diag,	@UserId
end
