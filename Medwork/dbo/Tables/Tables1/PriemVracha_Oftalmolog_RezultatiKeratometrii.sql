CREATE TABLE [dbo].[PriemVracha_Oftalmolog_RezultatiKeratometrii] (
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
    CONSTRAINT [PriemVracha_Oftalmolog_RezultatiKeratometriiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_Oftalmolog_RezultatiKeratometriiToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

