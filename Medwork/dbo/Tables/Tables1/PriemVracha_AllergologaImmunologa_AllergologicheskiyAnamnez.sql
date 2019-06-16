CREATE TABLE [dbo].[PriemVracha_AllergologaImmunologa_AllergologicheskiyAnamnez] (
    [ID]               INT           NOT NULL,
    [PatID]            INT           NULL,
    [Sezonnost]        NVARCHAR (80) NULL,
    [SvyazSfactorami]  NTEXT         NULL,
    [SvyazSNagruzkami] NTEXT         NULL,
    [Jivotnie]         NVARCHAR (80) NULL,
    [AllergAnamn]      NTEXT         NULL,
    CONSTRAINT [PriemVracha_AllergologaImmunologa_AllergologicheskiyAnamnezPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_AllergologaImmunologa_AllergologicheskiyAnamnezToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

