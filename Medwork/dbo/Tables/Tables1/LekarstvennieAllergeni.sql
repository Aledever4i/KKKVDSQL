CREATE TABLE [dbo].[LekarstvennieAllergeni] (
    [ID]       INT           NOT NULL,
    [PatID]    INT           NULL,
    [MasterID] INT           NULL,
    [Rezultat] FLOAT (53)    NULL,
    [Preparat] NVARCHAR (50) NULL,
    CONSTRAINT [LekarstvennieAllergeniPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [LekarstvennieAllergeniToLeykolizisSLekarstvennimiAllergenami] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[LeykolizisSLekarstvennimiAllergenami] ([ID]) ON DELETE CASCADE
);

