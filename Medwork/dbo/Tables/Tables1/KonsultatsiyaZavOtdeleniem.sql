CREATE TABLE [dbo].[KonsultatsiyaZavOtdeleniem] (
    [ID]                            INT           NOT NULL,
    [PatID]                         INT           NULL,
    [Data]                          DATETIME      NULL,
    [ZavOtdeleniem]                 INT           NULL,
    [DannieOsmotra]                 NTEXT         NULL,
    [Diagnoz]                       NVARCHAR (50) NULL,
    [RekomendatsiiLechashemuVrachu] NTEXT         NULL,
    [s]                             DATETIME      NULL,
    [po]                            DATETIME      NULL,
    CONSTRAINT [KonsultatsiyaZavOtdeleniemPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [KonsultatsiyaZavOtdeleniemToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

