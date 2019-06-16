CREATE TABLE [dbo].[InstrDiag_Ophtalmolog_Refraktometriya] (
    [ID]          INT           NOT NULL,
    [PatID]       INT           NULL,
    [Data]        DATETIME      NULL,
    [Vrach]       NVARCHAR (50) NULL,
    [SPHD]        FLOAT (53)    NULL,
    [CYLD]        FLOAT (53)    NULL,
    [AXD]         INT           NULL,
    [CYLS]        FLOAT (53)    NULL,
    [AXS]         INT           NULL,
    [SPHS]        FLOAT (53)    NULL,
    [Primechanie] NTEXT         NULL,
    [RecNo]       INT           NULL,
    [RecNo1]      INT           NULL,
    [ExportTime]  DATETIME      NULL,
    [ExportTime1] DATETIME      NULL,
    CONSTRAINT [InstrDiag_Ophtalmolog_RefraktometriyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [InstrDiag_Ophtalmolog_RefraktometriyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

