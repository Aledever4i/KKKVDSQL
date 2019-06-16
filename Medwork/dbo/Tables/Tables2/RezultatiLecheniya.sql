CREATE TABLE [dbo].[RezultatiLecheniya] (
    [ID]                                                 INT           NOT NULL,
    [PatID]                                              INT           NULL,
    [Data]                                               DATETIME      NULL,
    [Vrach]                                              NVARCHAR (50) NULL,
    [VRezultateProvedennogoLecheniyaSostoyaniePatsienta] NVARCHAR (50) NULL,
    [Kommentarii]                                        NTEXT         NULL,
    CONSTRAINT [RezultatiLecheniyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

