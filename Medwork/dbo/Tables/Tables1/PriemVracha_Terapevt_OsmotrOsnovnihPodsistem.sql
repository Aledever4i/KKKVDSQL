CREATE TABLE [dbo].[PriemVracha_Terapevt_OsmotrOsnovnihPodsistem] (
    [ID]    INT NOT NULL,
    [PatID] INT NULL,
    CONSTRAINT [PriemVracha_Terapevt_OsmotrOsnovnihPodsistemPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_Terapevt_OsmotrOsnovnihPodsistemToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

