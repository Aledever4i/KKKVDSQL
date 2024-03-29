﻿CREATE TABLE [dbo].[Immunogramma] (
    [ID]                     INT        NOT NULL,
    [PatID]                  INT        NULL,
    [Leykotsiti]             FLOAT (53) NULL,
    [Limfotsiti]             FLOAT (53) NULL,
    [AbsLimfotsiti]          FLOAT (53) NULL,
    [TLimfotsiti]            FLOAT (53) NULL,
    [AbsTLimfotsiti]         FLOAT (53) NULL,
    [VLimfotsiti]            FLOAT (53) NULL,
    [AbsVLimfotsiti]         FLOAT (53) NULL,
    [OKletki]                FLOAT (53) NULL,
    [THelperi]               FLOAT (53) NULL,
    [THelTSup]               FLOAT (53) NULL,
    [FzOt]                   FLOAT (53) NULL,
    [FzDo]                   FLOAT (53) NULL,
    [FiOt]                   FLOAT (53) NULL,
    [FiDo]                   FLOAT (53) NULL,
    [Izf]                    FLOAT (53) NULL,
    [Tsik]                   FLOAT (53) NULL,
    [N202]                   FLOAT (53) NULL,
    [TSupressori]            FLOAT (53) NULL,
    [NomerAnaliza1]          INT        NULL,
    [DataProvedeniyaAnaliza] DATETIME   NULL,
    [Vrach]                  INT        NULL,
    CONSTRAINT [ImmunogrammaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ImmunogrammaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

