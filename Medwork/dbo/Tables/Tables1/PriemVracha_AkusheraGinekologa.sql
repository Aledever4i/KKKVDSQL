CREATE TABLE [dbo].[PriemVracha_AkusheraGinekologa] (
    [ID]                       INT           NOT NULL,
    [PatID]                    INT           NULL,
    [zhivot_memo]              NTEXT         NULL,
    [Jivot]                    NVARCHAR (50) NULL,
    [Zhivot]                   NVARCHAR (50) NULL,
    [PriPalpatsiiBoleznennost] NVARCHAR (50) NULL,
    [ssb]                      NVARCHAR (50) NULL,
    [ZhivotOsmotr]             NVARCHAR (1)  NULL,
    CONSTRAINT [PriemVracha_AkusheraGinekologaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_AkusheraGinekologaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

