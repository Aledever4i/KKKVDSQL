CREATE TABLE [dbo].[Consultacia] (
    [ID]                INT            NOT NULL,
    [PatID]             INT            NULL,
    [MasterID]          INT            NULL,
    [Memo1]             NTEXT          NULL,
    [Memo2]             NTEXT          NULL,
    [DateBox2]          DATETIME       NULL,
    [DictCombo2]        NVARCHAR (50)  NULL,
    [DiagnozPoMkb10]    NVARCHAR (80)  NULL,
    [KodPoMkb10]        NVARCHAR (10)  NULL,
    [FIO]               NVARCHAR (100) NULL,
    [Vozrast]           INT            NULL,
    [PlanLecObsKon]     NTEXT          NULL,
    [Data1]             DATETIME       NULL,
    [Specialist]        NVARCHAR (50)  NULL,
    [DiagnozOsnovnoy15] NVARCHAR (255) NULL,
    [DiagCode]          NVARCHAR (255) NULL,
    [DannyeOsmKon]      NTEXT          NULL,
    [Vrach]             NVARCHAR (50)  NULL,
    CONSTRAINT [ConsultaciaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ConsultaciaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

