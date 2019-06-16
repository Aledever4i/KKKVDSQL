CREATE TABLE [dbo].[StressEhoKgSVem] (
    [ID]          INT      NOT NULL,
    [PatID]       INT      NULL,
    [PT]          INT      NULL,
    [zaklychenie] NTEXT    NULL,
    [Data1]       DATETIME NULL,
    [Vrach2]      INT      NULL,
    CONSTRAINT [StressEhoKgSVemToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

