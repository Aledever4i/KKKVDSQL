CREATE TABLE [dbo].[Dispanser] (
    [ID]        INT            NOT NULL,
    [PatID]     INT            NULL,
    [DiagCode]  NVARCHAR (6)   NULL,
    [beg_date]  DATETIME       NULL,
    [end_date]  DATETIME       NULL,
    [lechenie]  NVARCHAR (300) NULL,
    [reabil]    NVARCHAR (300) NULL,
    [Inval]     NVARCHAR (50)  NULL,
    [PsArtrit]  NVARCHAR (50)  NULL,
    [PASIindex] NVARCHAR (50)  NULL,
    [VnutOrgan] NTEXT          NULL,
    CONSTRAINT [DispanserPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [DispanserToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

