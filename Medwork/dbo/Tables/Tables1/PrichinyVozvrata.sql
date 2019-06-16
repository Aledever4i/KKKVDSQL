CREATE TABLE [dbo].[PrichinyVozvrata] (
    [ID]      INT            NOT NULL,
    [Code]    NVARCHAR (4)   NULL,
    [PrVozvr] NVARCHAR (255) NULL,
    CONSTRAINT [PrichinyVozvrataPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

