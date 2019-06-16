CREATE TABLE [dbo].[Analysis] (
    [ID]            INT           NOT NULL,
    [PatID]         INT           NULL,
    [Date]          DATETIME      NULL,
    [Vrach]         INT           NULL,
    [SystemComment] NVARCHAR (50) NULL,
    CONSTRAINT [PK_Analysis] PRIMARY KEY CLUSTERED ([ID] ASC)
);

