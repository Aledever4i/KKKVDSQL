CREATE TABLE [dbo].[OpredelenieFunktsiiZhelchnogoPuzirya] (
    [ID]                                                      INT           NOT NULL,
    [PatID]                                                   INT           NULL,
    [Obem]                                                    INT           NULL,
    [CherezChasPoslePriemaDvuhSirihZheltkovObemSokratilsyaNa] INT           NULL,
    [DopolnitelnieDannieUzi]                                  NTEXT         NULL,
    [Zaklyuchenie]                                            INT           NULL,
    [Vrach]                                                   NVARCHAR (50) NULL,
    [Data]                                                    DATETIME      NULL,
    [NomerIssledovaniya]                                      INT           NULL,
    [DannieNaPechat]                                          NTEXT         NULL,
    CONSTRAINT [OpredelenieFunktsiiZhelchnogoPuziryaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [OpredelenieFunktsiiZhelchnogoPuziryaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

