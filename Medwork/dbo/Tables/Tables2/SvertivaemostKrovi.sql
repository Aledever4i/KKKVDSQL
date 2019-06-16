CREATE TABLE [dbo].[SvertivaemostKrovi] (
    [ID]                                     INT        NOT NULL,
    [PatID]                                  INT        NULL,
    [NomerAnaliza]                           INT        NULL,
    [DataProvedeniyaAnaliza]                 DATETIME   NULL,
    [VremyaSvertivaniyaKroviVenoznoy1]       INT        NULL,
    [VremyaKrovotecheniya]                   INT        NULL,
    [KolichestvoTrombotsitov]                INT        NULL,
    [RentilaznoeVremya]                      INT        NULL,
    [RastvorimieKompleksiFibrinmonomeraRkfm] FLOAT (53) NULL,
    [FibrinoliticheskayaAktivnost1]          INT        NULL,
    [AntiplazminovayaAktivnost]              INT        NULL,
    [ProduktiRaspadaFibrinogenaPrf]          FLOAT (53) NULL,
    [Vrach]                                  INT        NULL,
    CONSTRAINT [SvertivaemostKroviPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [SvertivaemostKroviToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

