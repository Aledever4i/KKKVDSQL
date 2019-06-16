CREATE TABLE [dbo].[NaNizhnihKonechnostyah] (
    [ID]       INT           NOT NULL,
    [PatID]    INT           NULL,
    [MasterID] INT           NULL,
    [data]     NTEXT         NULL,
    [Refleks]  NVARCHAR (50) NULL,
    CONSTRAINT [NaNizhnihKonechnostyahPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [NaNizhnihKonechnostyahToNevrologicheskoeIssledovanie] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[NevrologicheskoeIssledovanie] ([ID]) ON DELETE CASCADE
);

