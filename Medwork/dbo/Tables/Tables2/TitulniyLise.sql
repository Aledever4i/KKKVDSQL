CREATE TABLE [dbo].[TitulniyLise] (
    [ID]                 INT            NOT NULL,
    [PatID]              INT            NULL,
    [EditBox1]           NVARCHAR (50)  NULL,
    [fulname]            NVARCHAR (50)  NULL,
    [Combo1]             NVARCHAR (50)  NULL,
    [nomerput]           NVARCHAR (50)  NULL,
    [srokputs]           DATETIME       NULL,
    [srokputpo]          DATETIME       NULL,
    [DiagCode]           NVARCHAR (50)  NULL,
    [DiagnozOsnovnoy15]  NVARCHAR (255) NULL,
    [sempol]             NVARCHAR (50)  NULL,
    [Diagnozpripostup15] NVARCHAR (255) NULL,
    [DiagCode1]          NVARCHAR (50)  NULL,
    [EditBox2]           NVARCHAR (50)  NULL,
    [pitanie]            NVARCHAR (50)  NULL,
    [kurenie]            NVARCHAR (50)  NULL,
    [alkogol]            NVARCHAR (50)  NULL,
    [Zhalobi]            NTEXT          NULL,
    [zhalobi1]           NVARCHAR (50)  NULL,
    [AnamnesisiMorbi]    NTEXT          NULL,
    [EditBox3]           NVARCHAR (50)  NULL,
    [AnamnesisVitae]     NTEXT          NULL,
    [soputstvuyshii]     NTEXT          NULL,
    [seria]              NVARCHAR (50)  NULL,
    [familia]            NVARCHAR (50)  NULL,
    [imia]               NVARCHAR (50)  NULL,
    [otchestvo]          NVARCHAR (50)  NULL,
    [dieta]              NVARCHAR (50)  NULL,
    [age]                NVARCHAR (50)  NULL,
    [Mestoraboty]        NVARCHAR (50)  NULL,
    [dolzhnost]          NVARCHAR (50)  NULL,
    [CardNum]            NVARCHAR (50)  NULL,
    [Datazap]            DATETIME       NULL,
    [vrach]              NVARCHAR (50)  NULL,
    [DiagSoput3]         NVARCHAR (50)  NULL,
    [DiagSoput3Cb]       NVARCHAR (255) NULL,
    [DiagSoput4]         NVARCHAR (50)  NULL,
    [DiagSoput4Cb]       NVARCHAR (255) NULL,
    [DocDate]            DATETIME       NULL,
    [VrachID]            INT            NULL,
    CONSTRAINT [TitulniyLisePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [TitulniyLiseToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);


GO

CREATE Trigger [dbo].[TitulniyLise_InsertDiag]
On [dbo].[TitulniyLise]
After Insert, Update
AS begin
	declare @SourceId int,
	@date DateTime,
	@DocTime DateTime,
	@DoctorID int,
	@PatId int,
	@Diag nvarchar(7),
	@DiagSoput nvarchar(7),
	@DiagSoput2 nvarchar(7),	
	@DiagInput nvarchar(7),		
	@UserId int,
	@DocDateTime datetime
	
	select top 1 @SourceId=i.id, @DoctorID=i.VrachID, @date=i.DocDate, @DocTime=null, @PatId=i.PatId,	@Diag=i.DiagCode1, @DiagSoput=DiagSoput3, 
								@DiagSoput2=DiagSoput4, @DiagInput=DiagCode, @UserId=p.AuthorId
	from inserted i left join patform p on i.id=p.id

	set @DocDateTime=@date --convert(datetime, convert(decimal(25, 10), @date) +convert(decimal(25, 10), @DocTime), 102)

	if IsNull(@Diag,'')<>''
		exec AddZaklDiag 'TitulniyLise',	@SourceId, @DocDateTime, @DoctorID, @PatId, 0,	0, @Diag,	@UserId
	
	if IsNull(@DiagSoput,'')<>''
		exec AddZaklDiag 'TitulniyLise2',	@SourceId, @DocDateTime, @DoctorID, @PatId, 0,	0, @DiagSoput,	@UserId
		
  if IsNull(@DiagInput,'')<>''
		exec AddZaklDiag 'TitulniyLise3',	@SourceId, @DocDateTime, @DoctorID, @PatId, 0,	0, @DiagInput,	@UserId
	
	if IsNull(@DiagSoput2,'')<>''
		exec AddZaklDiag 'TitulniyLise4',	@SourceId, @DocDateTime, @DoctorID, @PatId, 0,	0, @DiagSoput2,	@UserId	
end
