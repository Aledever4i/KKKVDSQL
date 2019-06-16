CREATE TABLE [dbo].[PatolZakl] (
    [ID]                     INT           NOT NULL,
    [PatID]                  INT           NULL,
    [AOsnovnoy1]             NVARCHAR (50) NULL,
    [BOslozhnenieOsnovnogo1] NVARCHAR (50) NULL,
    [VSoputstvuyushiy1]      NVARCHAR (50) NULL,
    [DictCombo1]             NVARCHAR (50) NULL,
    CONSTRAINT [PatolZaklPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PatolZaklToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

