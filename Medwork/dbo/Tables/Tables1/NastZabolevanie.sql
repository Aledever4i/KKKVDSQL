CREATE TABLE [dbo].[NastZabolevanie] (
    [ID]                                    INT           NOT NULL,
    [PatID]                                 INT           NULL,
    [MasterID]                              INT           NULL,
    [ProvedenieLechebProfMeropriyatiy]      NVARCHAR (50) NULL,
    [Razvitie]                              NVARCHAR (50) NULL,
    [Techenie]                              NVARCHAR (50) NULL,
    [MeriPoVosstanovleniyuTrudosposobnosti] NVARCHAR (50) NULL,
    [Nachalo]                               DATETIME      NULL,
    [Obostrenie]                            DATETIME      NULL,
    CONSTRAINT [NastZabolevaniePrimKey] PRIMARY KEY CLUSTERED ([ID] ASC)
);

