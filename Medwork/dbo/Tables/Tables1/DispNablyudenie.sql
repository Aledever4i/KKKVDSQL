CREATE TABLE [dbo].[DispNablyudenie] (
    [ID]                                      INT           NOT NULL,
    [MasterID]                                INT           NULL,
    [NomerPP]                                 NVARCHAR (50) NULL,
    [DiagnozPoMkb10]                          NVARCHAR (80) NULL,
    [KodPoMkb11]                              NVARCHAR (10) NULL,
    [DataPostanovkiNaDispansernoeNablyudenie] DATETIME      NULL,
    [Vrach]                                   NVARCHAR (50) NULL,
    [Podpis]                                  NVARCHAR (50) NULL,
    [DataSnyatiyaSDispansernogoNablyudeniya]  DATETIME      NULL,
    [Podpis1]                                 NVARCHAR (50) NULL,
    [Vrach1]                                  NVARCHAR (50) NULL,
    CONSTRAINT [DispNablyudeniePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [DispNablyudenieToZabolevaniyaPodlezhashieDispansernomuNablyudeniyu] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[ZabolevaniyaPodlezhashieDispansernomuNablyudeniyu] ([ID]) ON DELETE CASCADE
);

