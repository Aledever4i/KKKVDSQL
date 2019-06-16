CREATE TABLE [dbo].[Route] (
    [ID]           INT           NOT NULL,
    [PatID]        INT           NULL,
    [Date]         DATETIME      NULL,
    [PriceType]    INT           NULL,
    [DiagCode]     NVARCHAR (4)  NULL,
    [DeptID]       INT           NULL,
    [ServicesList] NVARCHAR (10) NULL,
    CONSTRAINT [RoutePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [RouteToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

