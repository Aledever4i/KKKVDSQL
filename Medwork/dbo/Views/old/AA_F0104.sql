CREATE VIEW AA_F0104
AS
SELECT P.cardnum AS NOMAMB, B.DATUSL,
       A.VGDD, A.VGDS
FROM [InstrDiag_Ophtalmolog_Tonometria_Po_Maklakovu] A
INNER JOIN [billservice] B ON (A.ID=B.patformID)
INNER JOIN patient P ON A.patid=P.ID
WHERE (LEFT(B.Service,4) = '0104')
