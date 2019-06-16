CREATE TABLE [dbo].[TitratsionnayaKislotnost] (
    [ID]                     INT      NOT NULL,
    [PatID]                  INT      NULL,
    [NomerAnaliza]           INT      NULL,
    [DataProvedeniyaAnaliza] DATETIME NULL,
    [TitracKislotnost]       INT      NULL,
    [Vrach]                  INT      NULL,
    CONSTRAINT [TitratsionnayaKislotnostPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [TitratsionnayaKislotnostToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

