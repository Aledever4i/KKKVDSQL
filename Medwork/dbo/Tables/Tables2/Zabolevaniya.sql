CREATE TABLE [dbo].[Zabolevaniya] (
    [ID]                   INT           NOT NULL,
    [PatID]                INT           NULL,
    [MasterID]             INT           NULL,
    [Zabolevanie]          NVARCHAR (50) NULL,
    [Data]                 DATETIME      NULL,
    [TyazhestProyavleniya] NVARCHAR (50) NULL,
    CONSTRAINT [ZabolevaniyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

