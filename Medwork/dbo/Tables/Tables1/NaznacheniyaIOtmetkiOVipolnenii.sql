CREATE TABLE [dbo].[NaznacheniyaIOtmetkiOVipolnenii] (
    [ID]        INT           NOT NULL,
    [PatID]     INT           NULL,
    [FirstDate] NVARCHAR (50) NULL,
    CONSTRAINT [NaznacheniyaIOtmetkiOVipolneniiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

