CREATE TABLE [dbo].[inostranci] (
    [ID]              INT           NOT NULL,
    [PatID]           INT           NULL,
    [lepra]           NVARCHAR (50) NULL,
    [hlamidii]        NVARCHAR (50) NULL,
    [sifilis]         NVARCHAR (50) NULL,
    [SpravkaNomer]    NVARCHAR (50) NULL,
    [Vrach]           INT           NULL,
    [probirka]        NVARCHAR (50) NULL,
    [TipSpravki]      NVARCHAR (50) NULL,
    [ProshelLechenie] NVARCHAR (1)  NULL,
    [DataVidachi]     DATETIME      NULL,
    [DataZabora]      DATETIME      NULL,
    CONSTRAINT [inostranciPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [inostranciToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

