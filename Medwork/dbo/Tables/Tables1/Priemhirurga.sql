CREATE TABLE [dbo].[Priemhirurga] (
    [ID]                               INT           NOT NULL,
    [PatID]                            INT           NULL,
    [Boli]                             NVARCHAR (50) NULL,
    [Combo1]                           NVARCHAR (50) NULL,
    [ZyabkostStop]                     NVARCHAR (1)  NULL,
    [SudorogiVMishtsahNog]             NVARCHAR (1)  NULL,
    [OtekiNogUsilivayusheesyaKVecheru] NVARCHAR (1)  NULL,
    [BoliVZhivote]                     NVARCHAR (1)  NULL,
    [Combo2]                           NVARCHAR (50) NULL,
    [RvotaKofeynoyGushey]              NVARCHAR (1)  NULL,
    [NeNarushena]                      NVARCHAR (1)  NULL,
    [SVspomogatelnimiSredstvami]       NVARCHAR (1)  NULL,
    [ObichnoyOkraski]                  NVARCHAR (1)  NULL,
    [Chistie]                          NVARCHAR (1)  NULL,
    [Blednie]                          NVARCHAR (1)  NULL,
    [Zheltushnie]                      NVARCHAR (1)  NULL,
    [Tsianotichnie]                    NVARCHAR (1)  NULL,
    CONSTRAINT [PriemhirurgaPrimKey] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [PriemhirurgaToPatForm] FOREIGN KEY ([ID]) REFERENCES [dbo].[PatForm] ([ID]) ON DELETE CASCADE
);

