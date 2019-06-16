CREATE TABLE [dbo].[UgolKosoglaziya] (
    [ID]                          INT           NOT NULL,
    [PatID]                       INT           NULL,
    [ObektivniUgolGorizont]       INT           NULL,
    [ObektivniUgolVertikali]      INT           NULL,
    [ObektivniUgolPrizmDioptriy]  NVARCHAR (2)  NULL,
    [ObektivniUgolPrizmDioptriy2] NVARCHAR (4)  NULL,
    [SubektivniUgolGorizont]      INT           NULL,
    [SubektivniUgoVertikali]      INT           NULL,
    [SubektivniUgoPrizmDioptriy]  NVARCHAR (2)  NULL,
    [SubektivniUgoPrizmDioptriy2] NVARCHAR (4)  NULL,
    [Cikloforiy]                  NVARCHAR (2)  NULL,
    [CikloforiyPrizmDioptriy]     NVARCHAR (10) NULL,
    [Cikloforiy2]                 INT           NULL,
    [NalicieSliyni]               NVARCHAR (4)  NULL,
    [Polozhitelnie]               INT           NULL,
    [Otrizatelnie]                INT           NULL,
    [Prim]                        NTEXT         NULL,
    CONSTRAINT [UgolKosoglaziyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [UgolKosoglaziyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

