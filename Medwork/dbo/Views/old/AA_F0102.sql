CREATE VIEW AA_F0102
AS
SELECT P.cardnum AS NOMAMB, B.DATUSL,
       A.SPHD, A.CYLD, A.AXD, A.SPHS, A.CYLS, A.AXS
FROM [InstrDiag_Ophtalmolog_Refraktometriya] A
INNER JOIN [billservice] B ON (A.ID=B.patformID)
INNER JOIN patient P ON A.patid=P.ID
WHERE (LEFT(B.Service,4) = '0102')
