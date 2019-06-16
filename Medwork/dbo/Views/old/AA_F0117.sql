CREATE VIEW AA_F0117
AS
SELECT P.cardnum AS NOMAMB, B.DATUSL, 
	A.KCHSMD, A.KCHSMS, 
	C.PNORD, C.PNORS, C.PNEZD, C.PNEZS, C.PUMED, C.PUMES, C.PZNAD, C.PZNAS, C.PGRUD, C.PGRUS,
	C.LNORD, C.LNORS, C.LNEZD, C.LNEZS, C.LUMED, C.LUMES, C.LZNAD, C.LZNAS, C.LGRUD, C.LGRUS
FROM [Kchsm] A
INNER JOIN [billservice] B ON (A.ID=B.patformID)
INNER JOIN patient P ON A.patid=P.ID
LEFT JOIN [OpredelenieElektrochuvstvitelnostiIElektrolabilnostiEchIElSetchatki] C on (C.patid = a.patid) and exists (select datusl from billservice bs2 where bs2.patformid=c.id and bs2.datusl=B.datusl)
