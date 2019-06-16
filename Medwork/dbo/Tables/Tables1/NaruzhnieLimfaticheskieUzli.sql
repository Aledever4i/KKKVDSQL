CREATE TABLE [dbo].[NaruzhnieLimfaticheskieUzli] (
    [ID]                          INT           NOT NULL,
    [MasterID]                    INT           NULL,
    [NaruzhnieLimfaticheskieUzli] NVARCHAR (50) NULL,
    [Velichina]                   NVARCHAR (50) NULL,
    [Razmer]                      NVARCHAR (50) NULL,
    [Boleznennost]                NVARCHAR (50) NULL,
    [Podvizhnost]                 NVARCHAR (50) NULL,
    CONSTRAINT [NaruzhnieLimfaticheskieUzliPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [NaruzhnieLimfaticheskieUzliToObsheeObsledovanie] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[ObsheeObsledovanie] ([ID]) ON DELETE CASCADE
);

