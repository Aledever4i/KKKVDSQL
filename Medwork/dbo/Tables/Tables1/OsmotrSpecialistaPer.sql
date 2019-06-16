﻿CREATE TABLE [dbo].[OsmotrSpecialistaPer] (
    [ID]                       INT            NOT NULL,
    [PatID]                    INT            NULL,
    [Data]                     DATETIME       NULL,
    [VremyaOsmotra]            DATETIME       NULL,
    [Vrach]                    NVARCHAR (50)  NULL,
    [AnamnesisiMorbi]          NTEXT          NULL,
    [Zhalobi]                  NTEXT          NULL,
    [AnamnesisVitae]           NTEXT          NULL,
    [EpidAnamnez]              NTEXT          NULL,
    [EkspertniyAnamnez]        NVARCHAR (50)  NULL,
    [FrontovoyAnamnez]         NVARCHAR (50)  NULL,
    [StatusPraesensCommunis]   NTEXT          NULL,
    [OrganiDihaniya]           NTEXT          NULL,
    [OrganiKrovoobrasheniya]   NTEXT          NULL,
    [OrganiPishevareniya]      NTEXT          NULL,
    [OrganiVideleniya]         NTEXT          NULL,
    [NervnayaSistema]          NTEXT          NULL,
    [Klindiagnoz]              NTEXT          NULL,
    [PlanObsledovaniya]        NTEXT          NULL,
    [PlanLecheniya]            NTEXT          NULL,
    [LechashiyVrach]           NVARCHAR (50)  NULL,
    [DiagnozOsnovnoy]          NVARCHAR (50)  NULL,
    [DiagnozSoputstvuyushiy1]  NTEXT          NULL,
    [DiagnozSoputstvuyushiy]   NVARCHAR (50)  NULL,
    [Zhalobi1]                 NVARCHAR (255) NULL,
    [NervnayaSistema1]         NVARCHAR (50)  NULL,
    [StatusPraesensCommunis1]  NVARCHAR (50)  NULL,
    [OrganiVideleniya1]        NVARCHAR (50)  NULL,
    [OrganiDihaniya1]          NVARCHAR (50)  NULL,
    [OrganiKrovoobrasheniya1]  NVARCHAR (50)  NULL,
    [OrganiPishevareniya1]     NVARCHAR (50)  NULL,
    [EpidAnamnes1]             NVARCHAR (50)  NULL,
    [Kurenie]                  NVARCHAR (50)  NULL,
    [Alcogol]                  NVARCHAR (50)  NULL,
    [UpotreblenieNarkotikov]   NVARCHAR (50)  NULL,
    [AnamnezZhizni]            NTEXT          NULL,
    [AnamnezZhizni1]           NTEXT          NULL,
    [AnamnezZhizni2]           NTEXT          NULL,
    [Inektsii]                 NVARCHAR (1)   NULL,
    [Operatsii]                NVARCHAR (1)   NULL,
    [LechenieUStomatologa]     NVARCHAR (1)   NULL,
    [Transfuzii]               NVARCHAR (1)   NULL,
    [Allergic1]                NVARCHAR (255) NULL,
    [Allergic]                 NTEXT          NULL,
    [Inektsii2]                NTEXT          NULL,
    [Operatsii2]               NTEXT          NULL,
    [LechenieUStomatologa2]    NTEXT          NULL,
    [Transfuzii2]              NTEXT          NULL,
    [Data1]                    DATETIME       NULL,
    [Specalist]                NVARCHAR (50)  NULL,
    [DanOsmPerv1]              NVARCHAR (50)  NULL,
    [DanOsmPerv]               NTEXT          NULL,
    [Obsheesost1]              NVARCHAR (50)  NULL,
    [Temper1]                  FLOAT (53)     NULL,
    [sist1]                    INT            NULL,
    [diast1]                   INT            NULL,
    [Rost3]                    INT            NULL,
    [Ves3]                     INT            NULL,
    [DiagnozOsnovnoy1]         NTEXT          NULL,
    [DiagnozOsnovnoy15]        NVARCHAR (50)  NULL,
    [DiagnozSoputstvuyushiy15] NVARCHAR (50)  NULL,
    [DiagCode]                 NVARCHAR (50)  NULL,
    [DiagCode1]                NVARCHAR (50)  NULL,
    [Recomendacii]             NTEXT          NULL,
    [Vrach2]                   INT            NULL,
    [EpidAnamnes]              NTEXT          NULL,
    [NoAllergy]                BIT            NULL,
    [Allergic2]                NTEXT          NULL,
    [Allergic3]                NVARCHAR (255) NULL,
    [Allergic4]                NTEXT          NULL,
    [Allergic5]                NVARCHAR (255) NULL,
    [Allergic6]                NVARCHAR (255) NULL,
    [DocTime]                  DATETIME       NULL,
    [Rekom]                    NVARCHAR (50)  NULL,
    [SmokeYears]               NVARCHAR (50)  NULL,
    [SmokePerDay]              NVARCHAR (50)  NULL,
    [dieta]                    VARCHAR (50)   NULL,
    [PlanLech2]                NVARCHAR (255) NULL,
    [planlech1]                NVARCHAR (50)  NULL,
    [Planobsl]                 NVARCHAR (50)  NULL,
    [Planobsl1]                NVARCHAR (50)  NULL,
    [TREAT1_DT1]               DATETIME       NULL,
    [TREAT2_DT1]               DATETIME       NULL,
    [RETURN_DATE_LPU]          DATETIME       NULL,
    [TREAT1_DT2]               DATETIME       NULL,
    [TREAT2_DT2]               DATETIME       NULL,
    [TREAT3_DT1]               DATETIME       NULL,
    [TREAT3_DT2]               DATETIME       NULL,
    [PlanObsl2]                NVARCHAR (50)  NULL,
    CONSTRAINT [OsmotrSpecialistaPerPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [OsmotrSpecialistaPerToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);


GO

Create Trigger PervichnyOsmotr_InsertDiag
On OsmotrSpecialistaPer
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
		exec AddZaklDiag 'OsmotrSpecialistaPer',	@SourceId, @DocDateTime, @DoctorID, @PatId, 0,	0, @Diag,	@UserId

end

