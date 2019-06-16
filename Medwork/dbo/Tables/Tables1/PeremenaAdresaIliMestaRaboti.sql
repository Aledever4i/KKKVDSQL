CREATE TABLE [dbo].[PeremenaAdresaIliMestaRaboti] (
    [ID]          INT            NOT NULL,
    [PatID]       INT            NULL,
    [MasterID]    INT            NULL,
    [DateChange]  DATETIME       NULL,
    [AdresRabota] NVARCHAR (100) NULL,
    CONSTRAINT [PeremenaAdresaIliMestaRabotiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PeremenaAdresaIliMestaRabotiToForma025U] FOREIGN KEY ([MasterID]) REFERENCES [dbo].[Forma025U] ([ID]) ON DELETE CASCADE
);

