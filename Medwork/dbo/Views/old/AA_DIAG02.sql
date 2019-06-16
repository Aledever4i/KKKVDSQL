CREATE VIEW AA_DIAG02
AS
select
nullif(left(p.cardnum,8),'') [NOMAMB] --nvarchar(8)
,bs.DATUSL [DATUSL] --datetime
,nullif(left(bs.PatStatus,1),'') [PP] --nvarchar(1) 
,nullif(left(bs.EYE,1),'') [EYE]
,nullif(right('      ' + isnull(nullif(
	case when dog.KODFORM='01' and pm1.id is null then '09' else b.HozDog end
	,''),'32799') , 6),'      ') [NXD] --nvarchar(6) --  5 номер хоздоговора (dog.dbf)
,dbo.fnAge(p.birthdate, getdate()) [VZR] --int
,case when p.sex='F' then 'ж' else 'м' end [POL] --nvarchar(1)
,substring(service,1,2) [KODRAZ] --nvarchar(2)
,substring(service,3,2) [KODUSL] --nvarchar(2)
,left(bs.kateg,1) [KODKATU] --nvarchar(1)
,right(isnull(dog.kodkato,' 1'),2) [KODKATO] --nvarchar(2) -- для коммерческого KODKATO=1
,'01' [KODVAL] --nvarchar(2)
,bs.BasePrice [CENA] --ps.baseprice [CENA] --money
,nullif(right('  ' + cast(pm2.PrVozvrCode as nvarchar),2),'  ') [KODPRVOZ]
,nullif(right('    ' + cast(bs.KODISP as nvarchar),4),'    ') [KODISP]
,nullif(right('    ' + cast(bs.KODOPER as nvarchar),4),'    ') [KODOPER]
,nullif(right('  ' + cast(bs.KODBRIG as nvarchar),2),'  ') [KODBRIG]
,right('      ' + b.nomerscheta,6) [NUMSCH] --nvarchar(6)
,left(dbo.fnPatBriefName(p.id),20) [FAM] --nvarchar(20)
,nullif(left(b.KodLgoti,2),'') [KODLG] --nvarchar(2)
,bs.DATOTCH [DATOTCH] --datetime
,case when dog.KODFORM<>'01' then NULL else bs.Summa end [NAL] --money
,pm1.dataoplati [DATNAL] --bs.createdate [DATNAL] --datetime
,case when (pm2.summa*-1)>bs.summa then bs.summa else (pm2.summa*-1) end [VOZVRNAL] --money
,pm2.dataoplati [DVNAL] --datetime
,case when dog.KODFORM<>'01' then bs.Summa else null end [BEZNAL] --money
,b.DATBEZN [DATBEZN] --datetime
,null [VOZVRBN] --money
,null [DVBEZN] --datetime
,right('    ' + cast(u.cardnum as nvarchar),4) [KODKASS] --nvarchar(4) --30 код кассира (kadr1.dbf)
,right('     '+pm2.DocNumber,5) [NUMRAORD] --nvarchar(5)
,case when dog.KODFORM<>'01' then
	right('00'+cast(DATEPART(Hh, bs.CreateDate) as nvarchar),2)+right('00'+cast(DATEPART(mi,bs.CreateDate) as nvarchar),2) 
	else null end [TIMBEZN] --nvarchar(4)
,nullif(bs.KODREL,'') [KODREL] --nvarchar(13)
,null [MECR] --nvarchar(2)
,null [MARK] --nvarchar(1)
,null [DATAGENT] --datetime
,null [KODAGENT] --nvarchar(4)
,bs.ID [IDBS]
from billservice bs with (nolock)
left join bill b with (nolock) on b.id=bs.masterid
left join patient p with (nolock) on p.id=b.patid
left join Payment pm1 with (nolock) on pm1.id=(select top 1 ps1i.PaymentID from PaymentService ps1i with (nolock) where ps1i.ServiceID=bs.ID and ps1i.Summa>0) -- оплата
left join Payment pm2 with (nolock) on pm2.id=(select top 1 ps2i.PaymentID from PaymentService ps2i with (nolock) where ps2i.ServiceID=bs.ID and ps2i.Summa<0) -- возврат
left join patform pf with (nolock) on pf.id=pm1.id
left join usr u with (nolock) on u.id=pf.creatorid --pm.prinyal
left join mntk_dog dog with (nolock) on dog.id = (select top 1 id from mntk_dog d2 with (nolock) where ltrim(rtrim(d2.nxd))=ltrim(rtrim(b.hozdog)))
where
(pm1.id is not null or dog.KODFORM<>'01' or bs.PaymentID is not null or datusl>=41378 /*16.04.2013*/) and bs.service<>''
