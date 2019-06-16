CREATE TABLE [dbo].[Tromboelastogramma] (
    [ID]                      INT        NOT NULL,
    [PatID]                   INT        NULL,
    [NomerAnaliza]            INT        NULL,
    [DataProvedeniyaAnaliza]  DATETIME   NULL,
    [RVremyaReaktsiiOt]       INT        NULL,
    [E]                       FLOAT (53) NULL,
    [AmAmplitudaMaksimalnaya] INT        NULL,
    [KVremyaKoagulyatsiiOt]   INT        NULL,
    [RVremyaReaktsiiDo]       INT        NULL,
    [KVremyaKoagulyatsiiDo]   INT        NULL,
    [Vrach]                   INT        NULL,
    CONSTRAINT [TromboelastogrammaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [TromboelastogrammaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

