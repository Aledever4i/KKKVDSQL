CREATE TABLE [dbo].[RegistratsiyaPatsientaNaUchastke] (
    [ID]                         INT          NOT NULL,
    [PatID]                      INT          NULL,
    [DataRegistratsiiNaUchastke] DATETIME     NULL,
    [NomerUchastka]              INT          NULL,
    [DataSnyatiya]               DATETIME     NULL,
    [Vibil]                      DATETIME     NULL,
    [Vrach]                      INT          NULL,
    [NeTransportabelniy]         NVARCHAR (1) NULL,
    CONSTRAINT [RegistratsiyaPatsientaNaUchastkePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [RegistratsiyaPatsientaNaUchastkeToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

