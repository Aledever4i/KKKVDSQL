CREATE TABLE [dbo].[KoagulogrammaSokrash] (
    [ID]                                                INT           NOT NULL,
    [PatID]                                             INT           NULL,
    [Data]                                              DATETIME      NULL,
    [Laborant]                                          NVARCHAR (50) NULL,
    [AktivirovannoeChastichnoeTromboplastinovoeVremya]  FLOAT (53)    NULL,
    [ProtrombinovoeVremya]                              FLOAT (53)    NULL,
    [ProtrombinoviyIndeks]                              FLOAT (53)    NULL,
    [Fibrinogen]                                        FLOAT (53)    NULL,
    [TrombinovoeVremya]                                 FLOAT (53)    NULL,
    [Mno]                                               FLOAT (53)    NULL,
    [AktivirovannoeChastichnoeTromboplastinovoeVremya1] NVARCHAR (50) NULL,
    [AktivirovannoeChastichnoeTromboplastinovoeVremya2] NVARCHAR (50) NULL,
    [ProtrombinoviyIndeks1]                             NVARCHAR (50) NULL,
    [Fibrinogen1]                                       NVARCHAR (50) NULL,
    [TrombinovoeVremya1]                                NVARCHAR (50) NULL,
    [Mno1]                                              NVARCHAR (50) NULL,
    CONSTRAINT [KoagulogrammaSokrashPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [KoagulogrammaSokrashToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

