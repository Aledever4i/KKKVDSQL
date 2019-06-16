CREATE TABLE [dbo].[HirurgOperation] (
    [ID]              INT           NOT NULL,
    [MasterID]        INT           NULL,
    [Code]            NVARCHAR (10) NULL,
    [Date]            DATETIME      NULL,
    [Time]            DATETIME      NULL,
    [DoctorId]        INT           NULL,
    [anaesthesia]     INT           NULL,
    [anaesthesiaDied] BIT           NULL,
    [HT]              BIT           NULL,
    [Endoskop]        BIT           NULL,
    [Lazer]           BIT           NULL,
    [Kriogen]         BIT           NULL,
    [Operation]       INT           NULL,
    CONSTRAINT [HirurgOperationPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [HirurgOperationTof066] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[f066] ([ID]) ON DELETE CASCADE
);

