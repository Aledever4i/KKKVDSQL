CREATE TABLE [dbo].[NapravlenieVStatsionar] (
    [ID]                      INT            NOT NULL,
    [PatID]                   INT            NULL,
    [DataNapravleniya]        DATETIME       NULL,
    [NapravitelniyDiagnoz]    NVARCHAR (150) NULL,
    [PatsientNapravlyaetsyaV] NVARCHAR (50)  NULL,
    [Stselyu]                 NVARCHAR (50)  NULL,
    [vr]                      NVARCHAR (50)  NULL,
    [TechenieBolezni]         NVARCHAR (50)  NULL,
    [SostoyaniePriVipiske]    NVARCHAR (50)  NULL,
    CONSTRAINT [NapravlenieVStatsionarPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [NapravlenieVStatsionarToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

