CREATE TABLE [dbo].[AnalizFormiNaAgregatsiyuTrombotsitov] (
    [ID]                   INT      NOT NULL,
    [PatID]                INT      NULL,
    [agregaciatrombocitov] INT      NULL,
    [Vrach2]               INT      NULL,
    [Data1]                DATETIME NULL,
    CONSTRAINT [AnalizFormiNaAgregatsiyuTrombotsitovToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

