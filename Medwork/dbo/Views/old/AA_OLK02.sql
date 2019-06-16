CREATE VIEW AA_OLK02
AS
SELECT 
 nullif(bs.KODREL,'') [KODREL]
,left(p.cardnum,8) [NOMAMB] --nvarchar(8)
,left(dbo.fnPatBriefName(p.id),20) [FAM]
,isNull(olk.DATUSL,bs.DATUSL) [DATUSL]
,IsNull(left(olk.MEDKATU,1),left(bs.kateg,1)) [MEDKATU] 
,left(bs.kateg,1) [KODKATU]
,left(bs.PatStatus,1) [PP] --nvarchar(1) --первичный/повторный
,left(olk.EYE,1) [EYE]
,right('      ' + isnull(nullif(
	case when dog.KODFORM='01' and pm1.id is null then '09' else b.HozDog end
,''),'32799') , 6) [NXD] --nvarchar(6) --  5 номер хоздоговора (dog.dbf)
,dbo.fnAge(p.birthdate, getdate()) [VZR] --int
,case when p.sex='F' then 'ж' else 'м' end [POL] --nvarchar(1)
,substring(bs.service,1,2) [KODRAZ] --nvarchar(2)
,substring(bs.service,3,2) [KODUSL] --nvarchar(2)
,nullif(olk.[PD1],'') [PD1]
,nullif(olk.[PD2],'') [PD2]
,nullif(olk.[PD3],'') [PD3]
,nullif(olk.[PD4],'') [PD4]
,nullif(olk.[POP1],'') [POP1]
,nullif(olk.[POP2],'') [POP2]
,nullif(olk.[POP3],'') [POP3]
,nullif(olk.[POP4],'') [POP4]
,nullif(right('    ' + cast(olk.KODISPDL as nvarchar),4),'    ') [KODISPDL]
,nullif(right('    ' + cast(olk.KODOPERD as nvarchar),4),'    ') [KODOPERD]
,nullif(olk.[D1],'') [D1]
,nullif(olk.[D2],'') [D2]
,nullif(olk.[D3],'') [D3]
,nullif(olk.[D4],'') [D4]
,nullif(olk.[OP1],'') [OP1]
,nullif(olk.[OP2],'') [OP2]
,nullif(olk.[OP3],'') [OP3]
,nullif(olk.[OP4],'') [OP4]
,olk.[STADGL]--,'') [STADGL]
--,isnull(olk.[DIOL],'') [DIOL] -- может быть стоит вернуть isnull... в ним были проблемы
,nullif(olk.[DIOL],'') [DIOL]
--,isnull(olk.[TL],'') [TL]
,nullif(olk.[TL],'') [TL]
,nullif(olk.[PROT],'') [PROT]
,nullif(right('    ' + cast(olk.KODAN as nvarchar),4),'    ') [KODAN]
,nullif(right('    ' + cast(olk.KODANSII as nvarchar),3),'   ') [KODANSII]
,nullif(right('    ' + cast(olk.KODANOP as nvarchar),4),'    ') [KODANOP]
,nullif(right('    ' + cast(olk.KODANSIO as nvarchar),3),'   ') [KODANSIO]
,olk.[KODRISK]
,olk.[AMBST]
,nullif(right('    ' + cast(olk.SI as nvarchar),4),'    ') [SI]
,nullif(right('    ' + cast(olk.SA as nvarchar),4),'    ') [SA]
,nullif(right('  ' + cast(olk.KODBRIG as nvarchar),2),'  ') [KODBRIG]
,nullif(right('    ' + cast(olk.KODOPOS as nvarchar),3),'   ') [KODOPOS]
,nullif(right('    ' + cast(olk.KODOPERV as nvarchar),4),'    ') [KODOPERV]
,olk.[VIS2]
,olk.[SPH2]
,olk.[CYL2]
,olk.[AX2]
,olk.[VISK2]
,olk.[PZ2]
,nullif(right('    ' + cast(olk.[VR] as nvarchar),4),'    ') [VR]
,olk.[DNO]
,olk.[SET]
,olk.[TRN]
,olk.[TON]
,olk.[ISOLK]
,olk.[OKACH]
,olk.[PRSNI]
,olk.[OK]
,olk.[WHYOK]
,olk.[DATOTCH]
,nullif(right('    ' + cast(olk.VROLK as nvarchar),4),'    ') [VROLK]
,nullif(right('    ' + cast(olk.KODOPERO as nvarchar),4),'    ') [KODOPERO]
,olk.[DATVNOLK]
,olk.[ProtNum]
,olk.[STimeOp]
,olk.[ETimeOp]
,nullif(right('    ' + cast(olk.SOPERS as nvarchar),4),'    ') [SOPERS]
from billservice bs with (nolock) 
left join DanniePoOperacii olk with (nolock) ON (olk.ID=bs.patformID)
left join bill b with (nolock) on b.id=bs.masterid
left join patient p with (nolock) on p.id=b.patid
left join Payment pm1 with (nolock) on pm1.id=(select top 1 ps1i.PaymentID from PaymentService ps1i with (nolock) where ps1i.ServiceID=bs.ID and ps1i.Summa>0) -- юяырЄр
left join mntk_dog dog with (nolock) on dog.id = (select top 1 id from mntk_dog d2 with (nolock) where ltrim(rtrim(d2.nxd))=ltrim(rtrim(b.hozdog)))
where ((pm1.id is not null or dog.KODFORM<>'01' or bs.PaymentID is not null or bs.datusl>=41378 /*16.04.2013*/)) and bs.Service like '02%'
