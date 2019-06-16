CREATE TABLE [dbo].[Oksalaturiya] (
    [ID]                     INT        NOT NULL,
    [PatID]                  INT        NULL,
    [NomerAnaliza]           INT        NULL,
    [DataProvedeniyaAnaliza] DATETIME   NULL,
    [Oksalaturiya]           FLOAT (53) NULL,
    [SutochniyBelok]         FLOAT (53) NULL,
    [SutochniySahar]         FLOAT (53) NULL,
    [UdelniyVes]             FLOAT (53) NULL,
    [Vrach]                  INT        NULL,
    CONSTRAINT [OksalaturiyaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [OksalaturiyaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

