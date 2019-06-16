CREATE TABLE [dbo].[DanniePriPostuplenii] (
    [ID]                                 INT      NOT NULL,
    [PatID]                              INT      NULL,
    [DiagnozZaklyuchitelniy]             NTEXT    NULL,
    [SoputsvuyushieBolezniIOslozhneniya] NTEXT    NULL,
    [DiagnozKlinicheskiy]                NTEXT    NULL,
    [DiagnozPriPostuplenii]              NTEXT    NULL,
    [OtkudaPostupil]                     NTEXT    NULL,
    [LechVrach]                          INT      NULL,
    [LechVrach1]                         INT      NULL,
    [RegDate]                            DATETIME NULL,
    CONSTRAINT [DanniePriPostupleniiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [DanniePriPostupleniiToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

