CREATE TABLE [dbo].[AnaliziPoZimn] (
    [ID]          INT        NOT NULL,
    [PatID]       INT        NULL,
    [MasterID]    INT        NULL,
    [Chasy]       FLOAT (53) NULL,
    [UdelniyVes]  FLOAT (53) NULL,
    [Kolichestvo] FLOAT (53) NULL,
    CONSTRAINT [AnaliziPoZimnPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AnaliziPoZimnToAnalizMochiPoZimnitskomuP] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[AnalizMochiPoZimnitskomuP] ([ID]) ON DELETE CASCADE
);

