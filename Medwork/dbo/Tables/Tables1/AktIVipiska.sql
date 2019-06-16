CREATE TABLE [dbo].[AktIVipiska] (
    [ID]          INT            NOT NULL,
    [PatID]       INT            NULL,
    [Pacient]     NVARCHAR (150) NULL,
    [s]           DATETIME       NULL,
    [po]          DATETIME       NULL,
    [Zhalob]      NTEXT          NULL,
    [Anam]        NTEXT          NULL,
    [Dannie]      NTEXT          NULL,
    [Rezul]       NTEXT          NULL,
    [SopDiag]     NTEXT          NULL,
    [SopDiagDict] NVARCHAR (50)  NULL,
    [SopDiagCode] NVARCHAR (6)   NULL,
    CONSTRAINT [AktIVipiskaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AktIVipiskaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

