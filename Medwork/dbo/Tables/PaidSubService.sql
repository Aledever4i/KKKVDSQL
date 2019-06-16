﻿CREATE TABLE [dbo].[PaidSubService] (
    [ID]                                INT             NOT NULL,
    [MasterID]                          INT             NULL,
    [Price]                             MONEY           NULL,
    [Quant]                             INT             NULL,
    [Measure]                           NVARCHAR (50)   NULL,
    [ServiceName]                       NVARCHAR (1024) NULL,
    [Service]                           NVARCHAR (20)   NULL,
    [ServOrMat]                         NVARCHAR (50)   NULL,
    [ObjectID]                          INT             NULL,
    [tablename]                         NVARCHAR (50)   NULL,
    [UET]                               FLOAT (53)      NULL,
    [UETSister]                         FLOAT (53)      NULL,
    [FormaOsmotra]                      NVARCHAR (50)   NULL,
    [Resource]                          INT             NULL,
    [AutoRefresh]                       BIT             NULL,
    [Price1]                            MONEY           NULL,
    [Price2]                            MONEY           NULL,
    [Price3]                            MONEY           NULL,
    [Price4]                            MONEY           NULL,
    [Price5]                            MONEY           NULL,
    [Price6]                            MONEY           NULL,
    [Price7]                            MONEY           NULL,
    [Price8]                            MONEY           NULL,
    [Price9]                            MONEY           NULL,
    [KolichestvoRazVDen]                INT             NULL,
    [Noch]                              NVARCHAR (1)    NULL,
    [NochTimeBeg]                       DATETIME        NULL,
    [NochTimeEnd]                       DATETIME        NULL,
    [Vecher]                            NVARCHAR (1)    NULL,
    [VecherTimeBeg]                     DATETIME        NULL,
    [VecherTimeEnd]                     DATETIME        NULL,
    [Den]                               NVARCHAR (1)    NULL,
    [DenTimeBeg]                        DATETIME        NULL,
    [DenTimeEnd]                        DATETIME        NULL,
    [Utro]                              NVARCHAR (1)    NULL,
    [UtroTimeBeg]                       DATETIME        NULL,
    [UtroTimeEnd]                       DATETIME        NULL,
    [TakeConditions]                    NVARCHAR (50)   NULL,
    [OtklonenieOtGrafikaPriemaVSluchae] NTEXT           NULL,
    [DniPriema]                         INT             NULL,
    [Period]                            INT             NULL,
    [Place]                             NVARCHAR (50)   NULL,
    [ShowInSched]                       BIT             NULL,
    [Duration]                          INT             NULL,
    [Days]                              INT             NULL,
    [OtklonenieOtGrafikaPrieMa]         NVARCHAR (1)    NULL,
    [Doza]                              FLOAT (53)      NULL,
    [Kontsentratsiya]                   NVARCHAR (50)   NULL,
    [ShowedPreparat]                    NVARCHAR (80)   NULL,
    [EdIzm]                             NVARCHAR (12)   NULL,
    [feepercent]                        FLOAT (53)      NULL,
    [Cost]                              MONEY           NULL,
    [Fee]                               MONEY           NULL,
    [Kateg]                             INT             NULL,
    [BezTseni]                          NVARCHAR (1)    NULL,
    [KtoOkazyvaet]                      INT             NULL,
    CONSTRAINT [PaidSubServicePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PaidSubServiceToPaidService] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[PaidService] ([ID]) ON DELETE CASCADE
);
