CREATE TABLE [dbo].[SpravkaVApteku] (
    [ID]                  INT           NOT NULL,
    [PatID]               INT           NULL,
    [Ot]                  DATETIME      NULL,
    [Boleet]              NVARCHAR (50) NULL,
    [NomerApteki]         INT           NULL,
    [ZamNachalnikaOktgvv] NVARCHAR (50) NULL,
    [LechashiyVrach]      NVARCHAR (50) NULL,
    [Onkolog]             NVARCHAR (50) NULL,
    [Rp]                  NTEXT         NULL,
    [PredsedatelKek]      NVARCHAR (50) NULL,
    CONSTRAINT [SpravkaVAptekuPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [SpravkaVAptekuToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

