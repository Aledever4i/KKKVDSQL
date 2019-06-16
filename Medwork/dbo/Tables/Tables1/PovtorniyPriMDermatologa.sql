CREATE TABLE [dbo].[PovtorniyPriMDermatologa] (
    [ID]                     INT      NOT NULL,
    [PatID]                  INT      NULL,
    [Data]                   DATETIME NULL,
    [Vrach]                  INT      NULL,
    [KozhniePokrovi]         NTEXT    NULL,
    [VidimieSlizistie]       NTEXT    NULL,
    [SostoyanieNogtey]       NTEXT    NULL,
    [VolosistayaChastGolovi] NTEXT    NULL,
    [StatusSpecialis]        NTEXT    NULL,
    CONSTRAINT [PovtorniyPriMDermatologaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PovtorniyPriMDermatologaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

