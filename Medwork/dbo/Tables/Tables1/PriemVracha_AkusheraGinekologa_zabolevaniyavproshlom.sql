CREATE TABLE [dbo].[PriemVracha_AkusheraGinekologa_zabolevaniyavproshlom] (
    [ID]                            INT           NOT NULL,
    [PatID]                         INT           NULL,
    [GinekologicheskieZabolevaniya] NTEXT         NULL,
    [DiagVProshlom]                 NVARCHAR (50) NULL,
    [LechilasRanee]                 NVARCHAR (1)  NULL,
    [MetodiLecheniya]               NTEXT         NULL,
    [Effekt]                        NVARCHAR (25) NULL,
    [Retsidivi]                     NVARCHAR (25) NULL,
    [MKBCode]                       NVARCHAR (50) NULL,
    [MKBName]                       NVARCHAR (50) NULL,
    CONSTRAINT [PriemVracha_AkusheraGinekologa_zabolevaniyavproshlomPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_AkusheraGinekologa_zabolevaniyavproshlomToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

