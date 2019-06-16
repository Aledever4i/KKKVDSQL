CREATE VIEW AA_F0110
AS
SELECT P.cardnum AS NOMAMB, B.DATUSL,
       A.DPKD, A.TXD, A.DGLD, A.DPKS, A.TXS, A.DGLS, A.NDSOD, A.NDSOS, A.TXTOD, A.TXTOS
FROM [UltrazvukovayaBiometriyaEhografiyaAMetod] A
INNER JOIN [billservice] B ON (A.ID=B.patformID)
INNER JOIN patient P ON A.patid=P.ID
WHERE (LEFT(B.Service,4) = '0110')
