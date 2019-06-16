CREATE TABLE [dbo].[KartaLechashegosyaVFto] (
    [ID]                           INT            NOT NULL,
    [PatID]                        INT            NULL,
    [Vrach]                        NVARCHAR (50)  NULL,
    [LastName]                     NVARCHAR (50)  NULL,
    [FirstName]                    NVARCHAR (50)  NULL,
    [SecondName]                   NVARCHAR (50)  NULL,
    [Sex]                          NVARCHAR (50)  NULL,
    [Zhaloby]                      NTEXT          NULL,
    [CardNum]                      INT            NULL,
    [Date]                         DATETIME       NULL,
    [ProcName]                     NVARCHAR (100) NULL,
    [Amount]                       INT            NULL,
    [Duration]                     FLOAT (53)     NULL,
    [Doza]                         NVARCHAR (100) NULL,
    [ProcPlace]                    NVARCHAR (50)  NULL,
    [VidiLechenpomimoFizioterapii] NTEXT          NULL,
    [Epikriz]                      NTEXT          NULL,
    CONSTRAINT [KartaLechashegosyaVFtoPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [KartaLechashegosyaVFtoToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

