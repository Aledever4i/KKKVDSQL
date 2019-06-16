CREATE TABLE [dbo].[LeykolizisSLekarstvennimiAllergenami] (
    [ID]                     INT      NOT NULL,
    [PatID]                  INT      NULL,
    [NomerAnaliza]           INT      NULL,
    [DataProvedeniyaAnaliza] DATETIME NULL,
    [Vrach]                  INT      NULL,
    CONSTRAINT [LeykolizisSLekarstvennimiAllergenamiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [LeykolizisSLekarstvennimiAllergenamiToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

