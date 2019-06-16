CREATE TABLE [dbo].[VizometriyaSDiafragmoy] (
    [ID]     INT           NOT NULL,
    [PatID]  INT           NULL,
    [VISNOD] FLOAT (53)    NULL,
    [SPHOD]  FLOAT (53)    NULL,
    [Param]  NVARCHAR (17) NULL,
    [CYLOD]  FLOAT (53)    NULL,
    [AXOD]   FLOAT (53)    NULL,
    [VISOD]  FLOAT (53)    NULL,
    [VISNOS] FLOAT (53)    NULL,
    [SPHOS]  FLOAT (53)    NULL,
    [CYLOS]  FLOAT (53)    NULL,
    [AXOS]   FLOAT (53)    NULL,
    [VISOS]  FLOAT (53)    NULL,
    [Prim]   NTEXT         NULL,
    CONSTRAINT [VizometriyaSDiafragmoyPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [VizometriyaSDiafragmoyToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

