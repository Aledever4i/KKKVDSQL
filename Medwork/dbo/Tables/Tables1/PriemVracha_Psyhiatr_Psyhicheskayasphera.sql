CREATE TABLE [dbo].[PriemVracha_Psyhiatr_Psyhicheskayasphera] (
    [ID]              INT           NOT NULL,
    [PatID]           INT           NULL,
    [kontaktnostMemo] NTEXT         NULL,
    [Orientacia]      NVARCHAR (50) NULL,
    [OrientaciaMemo]  NTEXT         NULL,
    CONSTRAINT [PriemVracha_Psyhiatr_PsyhicheskayaspheraPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_Psyhiatr_PsyhicheskayaspheraToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

