CREATE TABLE [dbo].[SutochnayaProteinuriya] (
    [ID]                        INT        NOT NULL,
    [PatID]                     INT        NULL,
    [NomerAnaliza]              INT        NULL,
    [DataProvedeniyaAnaliza]    DATETIME   NULL,
    [SutochnoeKolichestvoMochi] INT        NULL,
    [Belok]                     FLOAT (53) NULL,
    [UdelniyVes]                FLOAT (53) NULL,
    [Vrach]                     INT        NULL,
    CONSTRAINT [SutochnayaProteinuriyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [SutochnayaProteinuriyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

