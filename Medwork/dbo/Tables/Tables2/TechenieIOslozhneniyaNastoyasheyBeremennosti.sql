CREATE TABLE [dbo].[TechenieIOslozhneniyaNastoyasheyBeremennosti] (
    [ID]                   INT           NOT NULL,
    [PatID]                INT           NULL,
    [Data]                 DATETIME      NULL,
    [Vrach]                NVARCHAR (50) NULL,
    [TechenieBeremennosti] NTEXT         NULL,
    CONSTRAINT [TechenieIOslozhneniyaNastoyasheyBeremennostiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [TechenieIOslozhneniyaNastoyasheyBeremennostiToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

