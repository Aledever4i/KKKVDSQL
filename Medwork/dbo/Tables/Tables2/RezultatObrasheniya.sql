CREATE TABLE [dbo].[RezultatObrasheniya] (
    [ID]               INT      NOT NULL,
    [PatID]            INT      NULL,
    [MasterID]         INT      NULL,
    [Data]             DATETIME NULL,
    [IshodObrasheniya] INT      NULL,
    [Vrach]            INT      NULL,
    CONSTRAINT [RezultatObrasheniyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

