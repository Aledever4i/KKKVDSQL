CREATE TABLE [dbo].[KonsultatsiyaAllergologa] (
    [ID]       INT           NOT NULL,
    [PatID]    INT           NULL,
    [Data]     DATETIME      NULL,
    [Gistamin] NVARCHAR (50) NULL,
    [Kontrol]  NVARCHAR (50) NULL,
    [Vrach]    NVARCHAR (50) NULL,
    CONSTRAINT [KonsultatsiyaAllergologaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [KonsultatsiyaAllergologaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

