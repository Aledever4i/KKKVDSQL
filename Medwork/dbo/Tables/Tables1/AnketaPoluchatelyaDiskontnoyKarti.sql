CREATE TABLE [dbo].[AnketaPoluchatelyaDiskontnoyKarti] (
    [ID]                INT           NOT NULL,
    [PatID]             INT           NULL,
    [Pochte]            BIT           NULL,
    [EMailll]           BIT           NULL,
    [Sms]               BIT           NULL,
    [PolzyetsaYclygami] NVARCHAR (50) NULL,
    [NomerKarti]        INT           NULL,
    [SkidkaPoKarte]     NVARCHAR (50) NULL,
    [BlankEvent]        INT           NULL,
    [EventDate]         DATETIME      NULL,
    [DateYslyg]         DATETIME      NULL,
    CONSTRAINT [AnketaPoluchatelyaDiskontnoyKartiPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [AnketaPoluchatelyaDiskontnoyKartiToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

