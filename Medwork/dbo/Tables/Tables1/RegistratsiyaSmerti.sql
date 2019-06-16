CREATE TABLE [dbo].[RegistratsiyaSmerti] (
    [ID]          INT          NOT NULL,
    [PatID]       INT          NULL,
    [DataSmerti]  DATETIME     NULL,
    [SmertNaDomu] NVARCHAR (1) NULL,
    [Diagnoz]     INT          NULL,
    [Vrach]       INT          NULL,
    CONSTRAINT [RegistratsiyaSmertiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [RegistratsiyaSmertiToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

