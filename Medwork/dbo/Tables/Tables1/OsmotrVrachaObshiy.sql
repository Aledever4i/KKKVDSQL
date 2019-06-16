CREATE TABLE [dbo].[OsmotrVrachaObshiy] (
    [ID]            INT           NOT NULL,
    [PatID]         INT           NULL,
    [Data]          DATETIME      NULL,
    [Vrach]         NVARCHAR (50) NULL,
    [DannieOsmotra] NTEXT         NULL,
    [Vivodi]        NTEXT         NULL,
    CONSTRAINT [OsmotrVrachaObshiyPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [OsmotrVrachaObshiyToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

