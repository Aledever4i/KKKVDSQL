CREATE TABLE [dbo].[RezultatiKeratometrii] (
    [ID]         INT           NOT NULL,
    [PatID]      INT           NULL,
    [DateBox1]   DATETIME      NULL,
    [DictCombo1] NVARCHAR (50) NULL,
    [OD]         NVARCHAR (50) NULL,
    [OD1]        NVARCHAR (50) NULL,
    [OD2]        NVARCHAR (50) NULL,
    [OS]         NVARCHAR (50) NULL,
    [OS2]        NVARCHAR (50) NULL,
    [OS1]        NVARCHAR (50) NULL,
    [OD3]        NVARCHAR (50) NULL,
    [OS3]        NVARCHAR (50) NULL,
    CONSTRAINT [RezultatiKeratometriiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [RezultatiKeratometriiToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

