CREATE TABLE [dbo].[UziPlevralnoyPolosti] (
    [ID]                                                INT          NOT NULL,
    [PatID]                                             INT          NULL,
    [Data]                                              DATETIME     NULL,
    [NomerIssledovaniya]                                INT          NULL,
    [OpredelyaetsyaSvobodnayaZhidkostVKolichestve]      INT          NULL,
    [BezOsobennostey]                                   NVARCHAR (1) NULL,
    [SlevaBezOsobennostey]                              NVARCHAR (1) NULL,
    [SlevaOpredelyaetsyaSvobodnayaZhidkostVKolichestve] INT          NULL,
    [DopolnitelnieDannieUzi]                            NTEXT        NULL,
    [Zaklyuchenie]                                      INT          NULL,
    [Zakluchenie]                                       NTEXT        NULL,
    [Vrach]                                             INT          NULL,
    [Image]                                             IMAGE        NULL,
    CONSTRAINT [UziPlevralnoyPolostiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [UziPlevralnoyPolostiToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

