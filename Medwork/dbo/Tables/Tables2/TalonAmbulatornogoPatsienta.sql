﻿CREATE TABLE [dbo].[TalonAmbulatornogoPatsienta] (
    [ID]                                   INT           NOT NULL,
    [PatID]                                INT           NULL,
    [Data]                                 DATETIME      NULL,
    [vidoplati]                            NVARCHAR (50) NULL,
    [mesto]                                NVARCHAR (50) NULL,
    [tsel]                                 NVARCHAR (50) NULL,
    [Sluchay]                              NVARCHAR (50) NULL,
    [Napravlen]                            NVARCHAR (50) NULL,
    [coduslugi]                            NVARCHAR (50) NULL,
    [harackter]                            NVARCHAR (50) NULL,
    [dispuchet]                            NVARCHAR (50) NULL,
    [travma]                               NVARCHAR (50) NULL,
    [travma1]                              NVARCHAR (50) NULL,
    [DataRegistratsiiIzmenyaemogoDiagnoza] DATETIME      NULL,
    [coduslugi1]                           NVARCHAR (50) NULL,
    [harackter1]                           NVARCHAR (50) NULL,
    [dispuchet1]                           NVARCHAR (50) NULL,
    [DVN]                                  NVARCHAR (50) NULL,
    [prichina]                             NVARCHAR (50) NULL,
    [pouhodu]                              NVARCHAR (50) NULL,
    [zhitel]                               NVARCHAR (50) NULL,
    [vrach]                                NVARCHAR (50) NULL,
    [medsestra]                            NVARCHAR (50) NULL,
    [cod1]                                 NVARCHAR (10) NULL,
    [cod]                                  NVARCHAR (50) NULL,
    [cod2]                                 NVARCHAR (10) NULL,
    [Diagnoz]                              NVARCHAR (80) NULL,
    [Diagnoz2]                             NVARCHAR (80) NULL,
    [Diagnoz1]                             NVARCHAR (80) NULL,
    CONSTRAINT [TalonAmbulatornogoPatsientaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [TalonAmbulatornogoPatsientaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);
