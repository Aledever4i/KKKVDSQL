CREATE TABLE [dbo].[PriemVracha_Urolog_Osmotr] (
    [ID]                   INT           NOT NULL,
    [PatID]                INT           NULL,
    [pokolachivaniamemo1]  NTEXT         NULL,
    [pokolachivaniamemo2]  NTEXT         NULL,
    [pokolachivaniamemo3]  NTEXT         NULL,
    [pokolachivaniamemo4]  NTEXT         NULL,
    [pokolachivaniamemo5]  NTEXT         NULL,
    [diafanoskopia]        NVARCHAR (50) NULL,
    [razmeriprostati]      NVARCHAR (50) NULL,
    [poverhnost]           NVARCHAR (50) NULL,
    [razmeriprostatiMemo]  NTEXT         NULL,
    [konsistencia]         NVARCHAR (50) NULL,
    [boleznennostprostati] NVARCHAR (50) NULL,
    [RubcovieVtyazhenia]   NVARCHAR (50) NULL,
    [MezhdolevayaBorozdka] NVARCHAR (50) NULL,
    [ZaSchetStoroni]       NVARCHAR (50) NULL,
    CONSTRAINT [PriemVracha_Urolog_OsmotrPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemVracha_Urolog_OsmotrToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

