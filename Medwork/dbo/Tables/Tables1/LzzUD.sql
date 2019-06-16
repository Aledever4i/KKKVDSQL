CREATE TABLE [dbo].[LzzUD] (
    [ID]                                             INT           NOT NULL,
    [PatID]                                          INT           NULL,
    [MasterID]                                       INT           NULL,
    [Data]                                           DATETIME      NULL,
    [ZaklyuchitelniyUtochnenniyDiagnoz]              NVARCHAR (50) NULL,
    [VpervieUstanovlenniyDiagnozOtmetit]             NVARCHAR (50) NULL,
    [VTomChisleUstanovlVperviePriProfosmotreOtmetit] NVARCHAR (50) NULL,
    [Vrach]                                          NVARCHAR (50) NULL,
    CONSTRAINT [LzzUDPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

