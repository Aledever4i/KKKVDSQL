CREATE TABLE [dbo].[GemolizatAgregirovanniyTest] (
    [ID]                     INT      NOT NULL,
    [PatID]                  INT      NULL,
    [NomerAnaliza]           INT      NULL,
    [DataProvedeniyaAnaliza] DATETIME NULL,
    [VaVremyaAgregatsii]     INT      NULL,
    [VrVremyaRazvedeniya]    INT      NULL,
    [Vrach]                  INT      NULL,
    CONSTRAINT [GemolizatAgregirovanniyTestPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [GemolizatAgregirovanniyTestToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

