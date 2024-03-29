﻿CREATE VIEW AA_OSL02
AS
SELECT NULLIF(A.[OSLPR],'') [OSLPR]
 ,NULLIF(A.[OSLISH],'') [OSLISH]
 ,NULLIF(A.[OSLSUR],'') [OSLSUR]
 ,A.[KODREL] [KODREL]
 ,A.[NOMAMB] [NOMAMB]
 ,A.[DATUSL] [DATUSL]
 ,A.[EYE] [EYE]
 ,NULLIF(A.[OP1],'') [OP1]
 ,NULLIF(A.[KODOPOS],'') [OSL]
FROM [DanniePoOperacii] A with (nolock)
where (nullif(A.OSLPR,'') IS NOT NULL)
