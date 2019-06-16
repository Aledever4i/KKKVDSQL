CREATE TABLE [dbo].[OsmoticheskayaRezistentnostEritrotsitov] (
    [ID]                     INT      NOT NULL,
    [PatID]                  INT      NULL,
    [NomerAnaliza]           INT      NULL,
    [DataProvedeniyaAnaliza] DATETIME NULL,
    [Min]                    INT      NULL,
    [Max]                    INT      NULL,
    [Vrach]                  INT      NULL,
    CONSTRAINT [OsmoticheskayaRezistentnostEritrotsitovPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [OsmoticheskayaRezistentnostEritrotsitovToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

