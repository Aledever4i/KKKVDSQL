CREATE TABLE [dbo].[Profosmotr] (
    [ID]                              INT           NOT NULL,
    [PatID]                           INT           NULL,
    [Usluga]                          NVARCHAR (50) NULL,
    [ZaklyucheniePoRezultatamOsmotra] NVARCHAR (50) NULL,
    [Kommentariy]                     NTEXT         NULL,
    [kod]                             NVARCHAR (12) NULL,
    [Vrach]                           INT           NULL,
    [DataZakl]                        DATETIME      NULL,
    [TimeZakl]                        DATETIME      NULL,
    [KabinetOrder]                    INT           NULL,
    [DictCombo1]                      NVARCHAR (50) NULL,
    [Image1]                          IMAGE         NULL,
    CONSTRAINT [ProfosmotrPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [ProfosmotrToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

