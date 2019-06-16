CREATE TABLE [dbo].[DispanserizatsiyaDiagnozi] (
    [ID]                   INT          NOT NULL,
    [PatID]                INT          NULL,
    [MasterID]             INT          NULL,
    [DataPosesheniya]      DATETIME     NULL,
    [Status]               INT          NULL,
    [DataSleduyusheyYavki] DATETIME     NULL,
    [Vrach]                INT          NULL,
    [KodPoMkb10]           VARCHAR (10) NULL,
    [Diagnoz]              VARCHAR (80) NULL,
    CONSTRAINT [DispanserizatsiyaDiagnoziPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [DispanserizatsiyaDiagnoziToDispanserizatsiya] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Dispanserizatsiya] ([ID]) ON DELETE CASCADE
);

