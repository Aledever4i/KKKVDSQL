﻿CREATE TABLE [dbo].[KLADR_STREET] (
    [NAME] VARCHAR (255) NULL,
    [SOCR] VARCHAR (255) NULL,
    [CODE] VARCHAR (255) NULL
);


GO
CREATE NONCLUSTERED INDEX [kladr_street_code_name_socr]
    ON [dbo].[KLADR_STREET]([CODE] ASC, [NAME] ASC, [SOCR] ASC);


GO
CREATE NONCLUSTERED INDEX [idxKladr_StreetCode]
    ON [dbo].[KLADR_STREET]([CODE] ASC);
