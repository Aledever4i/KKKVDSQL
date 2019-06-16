CREATE TABLE [dbo].[Lechenie_ProtokolLazernogoLecheniyaVarikoznihVen] (
    [ID]         INT           NOT NULL,
    [PatID]      INT           NULL,
    [ParamProc]  NVARCHAR (50) NULL,
    [zakluch]    NTEXT         NULL,
    [Vrach2]     INT           NULL,
    [NazvProced] NVARCHAR (70) NULL,
    CONSTRAINT [Lechenie_ProtokolLazernogoLecheniyaVarikoznihVenPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [Lechenie_ProtokolLazernogoLecheniyaVarikoznihVenToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

