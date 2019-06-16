CREATE TABLE [dbo].[NapravlenieNaMsek] (
    [ID]                           INT           NOT NULL,
    [PatID]                        INT           NULL,
    [PatsientNapravlyaetsyaNaMsek] NVARCHAR (1)  NULL,
    [Data]                         DATETIME      NULL,
    [Vrach]                        NVARCHAR (50) NULL,
    [Kuda]                         NVARCHAR (50) NULL,
    [ProytiDo]                     DATETIME      NULL,
    CONSTRAINT [NapravlenieNaMsekPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

