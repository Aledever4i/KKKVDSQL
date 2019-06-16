CREATE TABLE [dbo].[IssledovanieZritelnihVizvannihPotentsialovZvp] (
    [ID]        INT NOT NULL,
    [PatID]     INT NULL,
    [AmplVspOS] INT NULL,
    [LatVspOD]  INT NULL,
    [AmplVspOD] INT NULL,
    [LatVspOS]  INT NULL,
    [AmplPatOD] INT NULL,
    [AmplPatOS] INT NULL,
    [LatPatOD]  INT NULL,
    [LatPatOS]  INT NULL,
    CONSTRAINT [IssledovanieZritelnihVizvannihPotentsialovZvpPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [IssledovanieZritelnihVizvannihPotentsialovZvpToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

