CREATE TABLE [dbo].[SkritingTesti] (
    [ID]                            INT          NOT NULL,
    [PatID]                         INT          NULL,
    [NomerAnaliza]                  INT          NULL,
    [DataProvedeniyaAnaliza]        DATETIME     NULL,
    [ProbaSelivanovaPolozhitelnaya] NVARCHAR (1) NULL,
    [ProbaVelkaPolzhitelnaya]       NVARCHAR (1) NULL,
    [ProbaBialyaPolzhitelnaya]      NVARCHAR (1) NULL,
    [ProbaSulkovichaPolzhitelnaya]  NVARCHAR (1) NULL,
    [KsantanurinovayaKislota]       NVARCHAR (1) NULL,
    [Aminoazot]                     FLOAT (53)   NULL,
    [Ketokisloti]                   NVARCHAR (1) NULL,
    [GomogentizionovayaKislota]     NVARCHAR (1) NULL,
    [Glikozaminoglikati]            NVARCHAR (1) NULL,
    [Belok]                         FLOAT (53)   NULL,
    [Fku]                           NVARCHAR (1) NULL,
    [Vrach]                         INT          NULL,
    CONSTRAINT [SkritingTestiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [SkritingTestiToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

