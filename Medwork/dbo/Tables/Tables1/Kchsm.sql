CREATE TABLE [dbo].[Kchsm] (
    [ID]                INT           NOT NULL,
    [PatID]             INT           NULL,
    [KCHSMD]            INT           NULL,
    [KCHSMS]            INT           NULL,
    [kchsm_zakluchenie] NVARCHAR (20) NULL,
    [RecNo]             INT           NULL,
    [ExportTime]        DATETIME      NULL,
    CONSTRAINT [KchsmPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [KchsmToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

