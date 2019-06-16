﻿CREATE TABLE [dbo].[PerenosimayaKorektsiyaDlyaBlizi] (
    [ID]    INT        NOT NULL,
    [PatID] INT        NULL,
    [VBK]   FLOAT (53) NULL,
    [SPH]   FLOAT (53) NULL,
    [CYL]   FLOAT (53) NULL,
    [AX]    FLOAT (53) NULL,
    [VSK]   FLOAT (53) NULL,
    [VBK1]  FLOAT (53) NULL,
    [SPH1]  FLOAT (53) NULL,
    [CYL1]  FLOAT (53) NULL,
    [AX1]   FLOAT (53) NULL,
    [VSK1]  FLOAT (53) NULL,
    [Prim]  NTEXT      NULL,
    CONSTRAINT [PerenosimayaKorektsiyaDlyaBliziPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PerenosimayaKorektsiyaDlyaBliziToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

