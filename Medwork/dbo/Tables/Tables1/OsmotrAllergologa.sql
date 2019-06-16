CREATE TABLE [dbo].[OsmotrAllergologa] (
    [ID]              INT           NOT NULL,
    [PatID]           INT           NULL,
    [rodstvenniki]    NTEXT         NULL,
    [Allergicheskie]  NVARCHAR (50) NULL,
    [DataIspolneniya] DATETIME      NULL,
    [DictCombo1]      NVARCHAR (50) NULL,
    CONSTRAINT [OsmotrAllergologaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [OsmotrAllergologaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

