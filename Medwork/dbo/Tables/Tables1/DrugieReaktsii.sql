CREATE TABLE [dbo].[DrugieReaktsii] (
    [ID]       INT           NOT NULL,
    [PatID]    INT           NULL,
    [MasterID] INT           NULL,
    [Vid]      NVARCHAR (50) NULL,
    [NaChto]   NVARCHAR (50) NULL,
    [Data]     DATETIME      NULL,
    CONSTRAINT [DrugieReaktsiiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [DrugieReaktsiiToOsmotrAllergologa] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[OsmotrAllergologa] ([ID]) ON DELETE CASCADE
);

