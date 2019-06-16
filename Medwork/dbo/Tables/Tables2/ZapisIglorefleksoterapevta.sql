CREATE TABLE [dbo].[ZapisIglorefleksoterapevta] (
    [ID]                  INT          NOT NULL,
    [PatID]               INT          NULL,
    [ProtseduraVipolnena] NVARCHAR (1) NULL,
    [Data]                DATETIME     NULL,
    [Vrach]               INT          NULL,
    [Rezultat]            NTEXT        NULL,
    CONSTRAINT [ZapisIglorefleksoterapevtaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ZapisIglorefleksoterapevtaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

