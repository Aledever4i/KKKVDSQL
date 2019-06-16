﻿CREATE TABLE [dbo].[StatusOculorum] (
    [ID]                                  INT           NOT NULL,
    [PatID]                               INT           NULL,
    [Data]                                DATETIME      NULL,
    [Vrach]                               NVARCHAR (50) NULL,
    [ZrenieVSvoihOchkahKontaktnihLinzah]  NVARCHAR (50) NULL,
    [ZrenieBezKorrektsii]                 NVARCHAR (50) NULL,
    [ZrenieVSvoihOchkahKontaktnihLinzah1] NVARCHAR (50) NULL,
    [ZrenieBezKorrektsii1]                NVARCHAR (50) NULL,
    [ZrenieSKorrektsiey]                  NVARCHAR (50) NULL,
    [ZrenieSKorrektsiey1]                 NVARCHAR (50) NULL,
    [SUzkimZrachkom]                      NTEXT         NULL,
    [Tsikloplegiya]                       NTEXT         NULL,
    [SUzkimZrachkom1]                     NTEXT         NULL,
    [Tsikloplegiya1]                      NTEXT         NULL,
    [Pahimetriya]                         NTEXT         NULL,
    [Keratometriya]                       NTEXT         NULL,
    [DopolnitelnieMetodiIssledovaniya]    NTEXT         NULL,
    [Pahimetriya1]                        NTEXT         NULL,
    [Keratometriya1]                      NTEXT         NULL,
    [Pzo]                                 NTEXT         NULL,
    [Pzo1]                                NTEXT         NULL,
    [DopolnitelnieMetodiIssledovaniya1]   NTEXT         NULL,
    CONSTRAINT [StatusOculorumPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [StatusOculorumToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);
