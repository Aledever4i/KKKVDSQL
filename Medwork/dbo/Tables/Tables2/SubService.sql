﻿CREATE TABLE [dbo].[SubService] (
    [ID]              INT             NOT NULL,
    [MasterID]        INT             NULL,
    [Measure]         NVARCHAR (50)   NULL,
    [Code]            NVARCHAR (255)  NULL,
    [ServiceName]     NVARCHAR (1024) NULL,
    [ServOrMat]       NVARCHAR (50)   NULL,
    [FakeService]     NVARCHAR (50)   NULL,
    [Price]           MONEY           NULL,
    [FormaOsmotra]    NVARCHAR (50)   NULL,
    [tablename]       NVARCHAR (50)   NULL,
    [ObjectID]        INT             NULL,
    [Resource]        INT             NULL,
    [Reference]       BIT             NULL,
    [ebSection]       NVARCHAR (1)    NULL,
    [ebUETDoctor]     FLOAT (53)      NULL,
    [ebUETSister]     FLOAT (53)      NULL,
    [quant]           INT             NULL,
    [AssignFrequency] FLOAT (53)      NULL,
    [ODD]             FLOAT (53)      NULL,
    [EKD]             FLOAT (53)      NULL,
    [OddUnit]         NVARCHAR (50)   NULL,
    [EkdUnit]         NVARCHAR (50)   NULL,
    [ServiceLPU]      INT             NULL,
    [AverageQuantity] FLOAT (53)      NULL,
    [ServiceLpuName]  NVARCHAR (50)   NULL,
    [PosGroup]        NVARCHAR (50)   NULL,
    CONSTRAINT [SubServicePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [SubServiceToService] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Service] ([ID]) ON DELETE CASCADE
);

