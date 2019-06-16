CREATE TABLE [dbo].[SignalnieOtmetki] (
    [ID]                        INT            NOT NULL,
    [PatID]                     INT            NULL,
    [Data]                      DATETIME       NULL,
    [Vrach]                     NVARCHAR (50)  NULL,
    [GruppaKrovi]               NVARCHAR (50)  NULL,
    [Rh]                        NVARCHAR (50)  NULL,
    [Allergiya]                 NVARCHAR (50)  NULL,
    [TipReaktsii]               NVARCHAR (50)  NULL,
    [Reaktsiya]                 NVARCHAR (50)  NULL,
    [SaharniyDiabet]            NVARCHAR (100) NULL,
    [InfektsionnieZabolevaniya] NVARCHAR (200) NULL,
    CONSTRAINT [SignalnieOtmetkiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [SignalnieOtmetkiToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

