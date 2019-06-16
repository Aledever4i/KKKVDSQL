CREATE TABLE [dbo].[GlikemicheskiyProfil] (
    [ID]                     INT        NOT NULL,
    [PatID]                  INT        NULL,
    [NomerAnaliza]           INT        NULL,
    [DataProvedeniyaAnaliza] DATETIME   NULL,
    [I]                      FLOAT (53) NULL,
    [II]                     FLOAT (53) NULL,
    [III]                    FLOAT (53) NULL,
    [IV]                     FLOAT (53) NULL,
    [Vrach]                  INT        NULL,
    CONSTRAINT [GlikemicheskiyProfilPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [GlikemicheskiyProfilToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

