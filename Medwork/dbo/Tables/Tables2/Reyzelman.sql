CREATE TABLE [dbo].[Reyzelman] (
    [ID]          INT        NOT NULL,
    [PatID]       INT        NULL,
    [MasterID]    INT        NULL,
    [Chasy]       FLOAT (53) NULL,
    [UdelniyVes]  FLOAT (53) NULL,
    [Kolichestvo] FLOAT (53) NULL,
    CONSTRAINT [ReyzelmanPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ReyzelmanToAnalizMochiPoReyzelmanu] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[AnalizMochiPoReyzelmanu] ([ID]) ON DELETE CASCADE
);

