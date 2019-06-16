CREATE TABLE [dbo].[PansionatPatientBuffer] (
    [ID]                      INT            IDENTITY (1, 1) NOT NULL,
    [MasterId]                INT            NOT NULL,
    [LASTNAME]                NVARCHAR (20)  NULL,
    [FIRSTNAME]               NVARCHAR (20)  NULL,
    [SECONDNAME]              NVARCHAR (20)  NULL,
    [BIRTHDATE]               DATETIME       NULL,
    [CARD_NUM]                NVARCHAR (50)  NULL,
    [SEX]                     NVARCHAR (1)   NULL,
    [FULLADRESS]              NVARCHAR (100) NULL,
    [TELEPHONE]               NVARCHAR (30)  NULL,
    [JOB_TELEPHONE]           NVARCHAR (30)  NULL,
    [POLICY]                  NVARCHAR (20)  NULL,
    [BEG_DATE]                DATETIME       NULL,
    [END_DATE]                DATETIME       NULL,
    [PROGRAM_MEDSERVICE]      NVARCHAR (100) NULL,
    [JOB_LOCATION]            NVARCHAR (100) NULL,
    [POST]                    NVARCHAR (50)  NULL,
    [REGISTER_CHECK_RESULT]   INT            NULL,
    [ATTACHMENT_CHECK_RESULT] INT            NULL,
    [PATIENT_ID]              INT            NULL,
    [IS_CHECKED]              BIT            NULL,
    [IS_REGISTERED]           BIT            NULL,
    [IS_ATTACHED]             BIT            NULL,
    [ShiftID]                 INT            NULL,
    [PatID]                   INT            NULL,
    [Uchrezhdenie1]           NVARCHAR (100) NULL,
    [CardNum]                 NVARCHAR (50)  NULL,
    [Otmetka]                 NVARCHAR (50)  NULL,
    [Primechanie]             NTEXT          NULL,
    [DataPerevoda]            DATETIME       NULL,
    [NomerTelefona]           NVARCHAR (20)  NULL,
    [AddPatAddress]           NVARCHAR (200) NULL,
    [Дата]                    DATETIME       NULL,
    [Время]                   DATETIME       NULL,
    [Uchrezhdenie]            NVARCHAR (50)  NULL,
    [IshodObrasheniya]        INT            NULL,
    [IshodObrasheniya1]       NVARCHAR (50)  NULL,
    [NeBilGospitalizirovan]   INT            NULL,
    [OtkazVPriMe]             NVARCHAR (50)  NULL,
    [PrichinaIPrinyatieMeri]  NTEXT          NULL,
    [Datasoob]                DATETIME       NULL,
    [PatAddress]              NVARCHAR (100) NULL,
    [Otdelenie]               INT            NULL,
    [Автор]                   INT            NULL,
    [DiagNapravl]             NVARCHAR (6)   NULL,
    [PutevkaNum]              NVARCHAR (50)  NULL,
    [DiagNapravlDict]         NVARCHAR (50)  NULL,
    [Avtor]                   INT            NULL,
    [Data]                    DATETIME       NULL,
    [Arrived]                 BIT            NULL,
    [domtelefon]              NVARCHAR (20)  NULL,
    [DataCheckOut]            DATETIME       NULL,
    [KategoriyaLgotnosti]     INT            NULL,
    [BezOtrivaOtProizvodstva] BIT            NULL,
    [PutevkaSeria]            NVARCHAR (50)  NULL,
    [CheckOutTime]            DATETIME       NULL,
    [PaymentType]             INT            NULL,
    [PaymentCode]             INT            NULL,
    [AttProgram]              INT            NULL,
    [AttName]                 NVARCHAR (60)  NULL,
    CONSTRAINT [PK_PansionatPatientBuffer] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_PansionatPatientBuffer_shifts] FOREIGN KEY ([ShiftID]) REFERENCES [dbo].[shifts] ([ID])
);


GO

CREATE TRIGGER [dbo].[tgPansionatPatientBuffer_OnDelete]
    ON [dbo].[PansionatPatientBuffer]
    FOR DELETE
    AS 
begin
	declare @IDs table (ID int)
	insert into @IDs select ID from deleted
  delete from ReserveStacionar where RecID in (select * from @IDs)
  delete from @IDs
  insert into @IDs select p.ID from PatientLocation p join deleted d on d.PatID=p.PatID and d.ShiftID=p.ShiftID
  delete from Patientlocation where ID in (select * from @IDs)
end

