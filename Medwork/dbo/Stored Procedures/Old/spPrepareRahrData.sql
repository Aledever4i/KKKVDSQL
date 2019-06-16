CREATE PROCEDURE spPrepareRahrData
  @sDate datetime,
  @eDate datetime
AS

IF OBJECT_ID('tempdb..##RahrTreatCycles') IS NOT NULL drop table ##RahrTreatCycles
IF OBJECT_ID('tempdb..##RahrInsem') IS NOT NULL drop table ##RahrInsem

select
 *
,[Инфекция]+[Кровотечения] [Осложнения пункции фолликулов]
,case when [Число перенесенных эмбрионов ВСЕГО]=1 then 1 else 0 end [перенесенных эмбрионов 1]
,case when [Число перенесенных эмбрионов ВСЕГО]=2 then 1 else 0 end [перенесенных эмбрионов 2]
,case when [Число перенесенных эмбрионов ВСЕГО]=3 then 1 else 0 end [перенесенных эмбрионов 3]
,case when [Число перенесенных эмбрионов ВСЕГО]=4 then 1 else 0 end [перенесенных эмбрионов 4]
,case when [Число перенесенных эмбрионов ВСЕГО]>=5 then 1 else 0 end [перенесенных эмбрионов 5]
,case when [ДО]=1 and [Переносов] > 0 and [Число перенесенных эмбрионов ВСЕГО]>0 then 1 else 0 end [перенесенных эмбрионов ДО]
,case when [СМ]=1 and [Переносов] > 0 and [Число перенесенных эмбрионов ВСЕГО]>0 then 1 else 0 end [перенесенных эмбрионов СМ]
,case when [Переносов] > 0 and [Число перенесенных эмбрионов ВСЕГО]>0 then 1 else 0 end [Перенос состоялся]
into ##RahrTreatCycles
from
(
select 
 e.id
,e.ExecDate
--,e.PatID
,dbo.fnPatFullName(e.PatID) [ФИО]
,dbo.fnAge(p.BirthDate,e.ExecDate) [Возраст]
--в эмбр протоколе НЕ отмечено ИКСИ и не отмечено ПГД
,case when isnull(e.PGDPlan,0)=0 and (not exists 
  (select top 1 Id from ECFEmbr em where 
  em.Id in (select id from patform where ParentId=e.Id)
  and exists (select top 1 id from OFate f where f.MasterID=em.Id and f.ECO=0)
  ))
  and e.Stim<>'с донорскими ооцитами'
  and (not exists (select top 1 id from ECFTrans et where et.Id in (select id from patform where ParentId=e.Id)
--		and (isnull(et.QtyUncryo,0)>0 or isnull(et.QtyCryo,0)>0)
		and (nullif(nullif(DonorNum,''),'-1') is not null)))
	--([ДО]=0) and ([СМ]=0) and ([РЭ]=0) and ([ПГД]=0)
	and not exists (select top 1 id from ECFTrans et where et.Id in (select id from patform where ParentId=e.Id) and et.SurMother is not null)
  then 1 else 0 end [ЭКО]
--в эмбр протоколе отмечен хотя бы один ооцит ИКСИ и не отмечено ПГД
,case when isnull(e.PGDPlan,0)=0 and (exists 
  (select top 1 Id from ECFEmbr em where 
  em.Id in (select id from patform where ParentId=e.Id)
  and exists (select top 1 id from OFate f where f.MasterID=em.Id and f.ECO=0)
  ))
  and e.Stim<>'с донорскими ооцитами'
  and (not exists (select top 1 id from ECFTrans et where et.Id in (select id from patform where ParentId=e.Id)
--		and (isnull(et.QtyUncryo,0)>0 or isnull(et.QtyCryo,0)>0)
		and (nullif(nullif(DonorNum,''),'-1') is not null)))
	--([ДО]=0) and ([СМ]=0) and ([РЭ]=0) and ([ПГД]=0)
	and not exists (select top 1 id from ECFTrans et where et.Id in (select id from patform where ParentId=e.Id) and et.SurMother is not null)
  then 1 else 0 end [ИКСИ]
--все документы "Криоперенос", за исключением ДО
,0 [РЭ] 
/*
case when (select count(*) from ECFTrans et where 
et.Id in (select id from patform where ParentId=e.Id) -- возможно, следует заменить на фильтр по датам
and et.ExecDate>= @sDate and et.ExecDate <=@eDate
--and et.PatID = e.PatID
and (isnull(et.QtyUncryo,0)>0 or isnull(et.QtyCryo,0)>0)
and (nullif(nullif(DonorNum,''),'-1') is null)
and e.Stim<>'с донорскими ооцитами'
and not exists (select top 1 id from ECFTrans et where et.Id in (select id from patform where ParentId=e.Id) and et.SurMother is not null) 
and isnull(e.PGDPlan,0)=0
) > 0 then 1 else 0 end [РЭ]
*/
--программы ЭКО,где отмечено "с донорскими ооцитами"
,case when e.Stim='с донорскими ооцитами' then 1 else 0 end [ДО]
--в "программе" отмечено "планируется ПГД"
,case when e.PGDPlan=1 then 1 else 0 end [ПГД]
,case when exists (select top 1 id from ECFTrans et where et.Id in (select id from patform where ParentId=e.Id) and et.SurMother is not null) 
	then 1 else 0 end [СМ]
,(select COUNT(*) from ECFPunc ep where ep.Id in (select id from patform where ParentId=e.Id)) 
 [Пункций]
,(select count(*) from ECFTrans et where 
et.Id in (select id from patform where ParentId=e.Id) 
and (isnull(et.QtyUncryo,0)=0 or isnull(et.QtyCryo,0)=0)
--and (nullif(nullif(DonorNum,''),'-1') is null)
) [Переносов]

,(select count(*) from EcoARTResult er where 
er.Id in (select id from patform where ParentId=e.Id)
and er.PregType in ('биохимическая','клиническая')
-- отсеиваем результаты по криопереносам
and (not exists (select top 1 id from ECFTrans t where t.id in 
	(Trans1ID,Trans2ID) and ((nullif(nullif(t.DonorNum,''),'-1') is null) and (t.SurMother is null)) and ((isnull(t.QtyUncryo,0)>0 or isnull(t.QtyCryo,0)>0))))
) [Беременностей]
,(select count(*) from EcoARTResult er where 
er.Id in (select id from patform where ParentId=e.Id)
and (PretermBirth='да' or UrgentBirth='да')
-- отсеиваем результаты по криопереносам
and (not exists (select top 1 id from ECFTrans t where t.id in 
	(Trans1ID,Trans2ID) and ((nullif(nullif(t.DonorNum,''),'-1') is null) and (t.SurMother is null)) and ((isnull(t.QtyUncryo,0)>0 or isnull(t.QtyCryo,0)>0))))
) [Родов]
,(select count(*) from EcoARTResult er where 
er.Id in (select id from patform where ParentId=e.Id)
and isnull(er.PretermBirthAge,0) between 20 and 27
-- отсеиваем результаты по криопереносам
and (not exists (select top 1 id from ECFTrans t where t.id in 
	(Trans1ID,Trans2ID) and ((nullif(nullif(t.DonorNum,''),'-1') is null) and (t.SurMother is null)) and ((isnull(t.QtyUncryo,0)>0 or isnull(t.QtyCryo,0)>0))))
) [Срок родов 20-27]
,(select count(*) from EcoARTResult er where 
er.Id in (select id from patform where ParentId=e.Id)
and isnull(er.PretermBirthAge,0) between 28 and 36
-- отсеиваем результаты по криопереносам
and (not exists (select top 1 id from ECFTrans t where t.id in 
	(Trans1ID,Trans2ID) and ((nullif(nullif(t.DonorNum,''),'-1') is null) and (t.SurMother is null)) and ((isnull(t.QtyUncryo,0)>0 or isnull(t.QtyCryo,0)>0))))
) [Срок родов 28-36]
,(select count(*) from EcoARTResult er where 
er.Id in (select id from patform where ParentId=e.Id)
and isnull(er.PretermBirthAge,0) between 28 and 32
-- отсеиваем результаты по криопереносам
and (not exists (select top 1 id from ECFTrans t where t.id in 
	(Trans1ID,Trans2ID) and ((nullif(nullif(t.DonorNum,''),'-1') is null) and (t.SurMother is null)) and ((isnull(t.QtyUncryo,0)>0 or isnull(t.QtyCryo,0)>0))))
) [Срок родов 28-32]
,(select count(*) from EcoARTResult er where 
er.Id in (select id from patform where ParentId=e.Id)
and isnull(er.PretermBirthAge,0) between 33 and 36
-- отсеиваем результаты по криопереносам
and (not exists (select top 1 id from ECFTrans t where t.id in 
	(Trans1ID,Trans2ID) and ((nullif(nullif(t.DonorNum,''),'-1') is null) and (t.SurMother is null)) and ((isnull(t.QtyUncryo,0)>0 or isnull(t.QtyCryo,0)>0))))
) [Срок родов 33-36]
,(select count(*) from EcoARTResult er where 
er.Id in (select id from patform where ParentId=e.Id)
and (UrgentBirth='да')
-- отсеиваем результаты по криопереносам
and (not exists (select top 1 id from ECFTrans t where t.id in 
	(Trans1ID,Trans2ID) and ((nullif(nullif(t.DonorNum,''),'-1') is null) and (t.SurMother is null)) and ((isnull(t.QtyUncryo,0)>0 or isnull(t.QtyCryo,0)>0))))
) [Срок родов более 37 недель]
,(select count(*) from EcoARTResult er where 
er.Id in (select id from patform where ParentId=e.Id)
and ((isnull(er.PretermBirthAge,0) >= 28) or (UrgentBirth='да'))
-- отсеиваем результаты по криопереносам
and (not exists (select top 1 id from ECFTrans t where t.id in 
	(Trans1ID,Trans2ID) and ((nullif(nullif(t.DonorNum,''),'-1') is null) and (t.SurMother is null)) and ((isnull(t.QtyUncryo,0)>0 or isnull(t.QtyCryo,0)>0))))
) [Срок родов 28 и более]
,(select count(*) from EcoARTResult er where 
er.Id in (select id from patform where ParentId=e.Id)
and isnull(er.UrgentBirthAge,0) between 37 and 41
-- отсеиваем результаты по криопереносам
and (not exists (select top 1 id from ECFTrans t where t.id in 
	(Trans1ID,Trans2ID) and ((nullif(nullif(t.DonorNum,''),'-1') is null) and (t.SurMother is null)) and ((isnull(t.QtyUncryo,0)>0 or isnull(t.QtyCryo,0)>0))))
) [Срок родов 37-41]
,(select count(*) from EcoARTResult er where 
er.Id in (select id from patform where ParentId=e.Id)
and isnull(er.UrgentBirthAge,0) >= 42
-- отсеиваем результаты по криопереносам
and (not exists (select top 1 id from ECFTrans t where t.id in 
	(Trans1ID,Trans2ID) and ((nullif(nullif(t.DonorNum,''),'-1') is null) and (t.SurMother is null)) and ((isnull(t.QtyUncryo,0)>0 or isnull(t.QtyCryo,0)>0))))
) [Срок родов 42]


,(select count(*) from EcoARTResult er where 
er.Id in (select id from patform where ParentId=e.Id)
and (select count(*) from EcoARTResultChild where masterid=er.id)=1
-- отсеиваем результаты по криопереносам
and (not exists (select top 1 id from ECFTrans t where t.id in 
	(Trans1ID,Trans2ID) and ((nullif(nullif(t.DonorNum,''),'-1') is null) and (t.SurMother is null)) and ((isnull(t.QtyUncryo,0)>0 or isnull(t.QtyCryo,0)>0))))
) [Родов Одним плодом]
,(select count(*) from EcoARTResult er where 
er.Id in (select id from patform where ParentId=e.Id)
and (select count(*) from EcoARTResultChild where masterid=er.id)=2
-- отсеиваем результаты по криопереносам
and (not exists (select top 1 id from ECFTrans t where t.id in 
	(Trans1ID,Trans2ID) and ((nullif(nullif(t.DonorNum,''),'-1') is null) and (t.SurMother is null)) and ((isnull(t.QtyUncryo,0)>0 or isnull(t.QtyCryo,0)>0))))
) [Родов двойней]
,(select count(*) from EcoARTResult er where 
er.Id in (select id from patform where ParentId=e.Id)
and (select count(*) from EcoARTResultChild where masterid=er.id)>2
-- отсеиваем результаты по криопереносам
and (not exists (select top 1 id from ECFTrans t where t.id in 
	(Trans1ID,Trans2ID) and ((nullif(nullif(t.DonorNum,''),'-1') is null) and (t.SurMother is null)) and ((isnull(t.QtyUncryo,0)>0 or isnull(t.QtyCryo,0)>0))))
) [Родов тройней и более]
,case when (select count(*) from EcoARTResult er where er.Id in (select id from patform where ParentId=e.Id)
	-- отсеиваем результаты по криопереносам
	and (not exists (select top 1 id from ECFTrans t where t.id in 
		(Trans1ID,Trans2ID) and ((nullif(nullif(t.DonorNum,''),'-1') is null) and (t.SurMother is null)) and ((isnull(t.QtyUncryo,0)>0 or isnull(t.QtyCryo,0)>0))))
	)=0 then 1 else 0 end 
	[Нет сведений об исходе беременностей]
,(select count(*) from EcoARTResult er where 
er.Id in (select id from patform where ParentId=e.Id)
and (isnull(er.PregType,'не наступила') = 'не наступила')
-- отсеиваем результаты по криопереносам
and (not exists (select top 1 id from ECFTrans t where t.id in 
	(Trans1ID,Trans2ID) and ((nullif(nullif(t.DonorNum,''),'-1') is null) and (t.SurMother is null)) and ((isnull(t.QtyUncryo,0)>0 or isnull(t.QtyCryo,0)>0))))
) [Беременность не наступила]

,(select count(*) from EcoARTResult er where 
er.Id in (select id from patform where ParentId=e.Id)
and er.PregType ='клиническая'
-- отсеиваем результаты по криопереносам
and (not exists (select top 1 id from ECFTrans t where t.id in 
	(Trans1ID,Trans2ID) and ((nullif(nullif(t.DonorNum,''),'-1') is null) and (t.SurMother is null)) and ((isnull(t.QtyUncryo,0)>0 or isnull(t.QtyCryo,0)>0))))
) [Клиническая беременность]
,(select count(*) from EcoARTResult er where 
er.Id in (select id from patform where ParentId=e.Id)
and (NonDevelopingPregnancy='да' or Miscarriage='да' or Abortion='да' or ClinicPregType='внематочная')
-- отсеиваем результаты по криопереносам
and (not exists (select top 1 id from ECFTrans t where t.id in 
	(Trans1ID,Trans2ID) and ((nullif(nullif(t.DonorNum,''),'-1') is null) and (t.SurMother is null)) and ((isnull(t.QtyUncryo,0)>0 or isnull(t.QtyCryo,0)>0))))
) [Потери беременностей (всего)]
,(select count(*) from EcoARTResult er where 
er.Id in (select id from patform where ParentId=e.Id)
and (NonDevelopingPregnancy='да' or Miscarriage='да' or Abortion='да')
-- отсеиваем результаты по криопереносам
and (not exists (select top 1 id from ECFTrans t where t.id in 
	(Trans1ID,Trans2ID) and ((nullif(nullif(t.DonorNum,''),'-1') is null) and (t.SurMother is null)) and ((isnull(t.QtyUncryo,0)>0 or isnull(t.QtyCryo,0)>0))))
) [Аборты до 20 недель]
,(select count(*) from EcoARTResult er where 
er.Id in (select id from patform where ParentId=e.Id)
and (ClinicPregType='внематочная')
-- отсеиваем результаты по криопереносам
and (not exists (select top 1 id from ECFTrans t where t.id in 
	(Trans1ID,Trans2ID) and ((nullif(nullif(t.DonorNum,''),'-1') is null) and (t.SurMother is null)) and ((isnull(t.QtyUncryo,0)>0 or isnull(t.QtyCryo,0)>0))))
) [Внематочные беременности]
--!!
,isnull((select sum(isnull(QtyFresh,0)+isnull(QtyCryo,0)) from ECFTrans et where et.ExecDate>= @sDate and et.ExecDate <=@eDate 
	and et.Id in (select id from patform where ParentId=e.Id)
	and ((isnull(et.QtyUncryo,0)=0 and isnull(et.QtyCryo,0)=0)) -- только свежие переносы
	),0)
	[Число перенесенных эмбрионов ВСЕГО]

,0 --isnull((select sum(isnull(QtyUnCryo,0)) from ECFTrans et where et.Id in (select id from patform where ParentId=e.Id)),0)
	[Число РЭ]
,0 --isnull((select sum(isnull(QtyCryo,0)) from ECFTrans et where et.Id in (select id from patform where ParentId=e.Id)),0)
	[Число перенесенных РЭ]
--!!
,0/*(select count(*) from EcoARTResult 
	where (Trans1ID in (select id from ECFTrans t where t.Id in (select id from patform where ParentId=e.Id) and t.QtyCryo > 0)
	or Trans2ID in (select id from ECFTrans t where t.Id in (select id from patform where ParentId=e.Id) and t.QtyCryo > 0))
	and PregType in ('биохимическая','клиническая')
	)*/ [Беременностей РЭ]

,0/*(select count(*) from EcoARTResult 
	where (Trans1ID in (select id from ECFTrans t where t.Id in (select id from patform where ParentId=e.Id) and t.QtyCryo > 0)
	or Trans2ID in (select id from ECFTrans t where t.Id in (select id from patform where ParentId=e.Id) and t.QtyCryo > 0))
	and (PretermBirth='да' or UrgentBirth='да')
	)*/ [Родов РЭ]

,(select count(*) from EcoARTResult er where 
er.Id in (select id from patform where ParentId=e.Id)
-- отсеиваем результаты по криопереносам
and (not exists (select top 1 id from ECFTrans t where t.id in 
	(Trans1ID,Trans2ID) and ((nullif(nullif(t.DonorNum,''),'-1') is null) and (t.SurMother is null)) and ((isnull(t.QtyUncryo,0)>0 or isnull(t.QtyCryo,0)>0))))
and (SurgicalReduction='да')) [Редукция числа плодов]

,(select count(*) from ECFPunc ep where
ep.Id in (select id from patform where ParentId=e.Id)
and (CancelTransId=14))
+(select count(*) from EcoARTResult er where 
er.Id in (select id from patform where ParentId=e.Id)
-- отсеиваем результаты по криопереносам
and (not exists (select top 1 id from ECFTrans t where t.id in 
	(Trans1ID,Trans2ID) and ((nullif(nullif(t.DonorNum,''),'-1') is null) and (t.SurMother is null)) and ((isnull(t.QtyUncryo,0)>0 or isnull(t.QtyCryo,0)>0))))
and (isnull(OHS,'нет')<>'нет')) [СГЯ]

,(select count(*) from ECFPunc ep where
ep.Id in (select id from patform where ParentId=e.Id)
and (Seq_Infection=1)) [Инфекция]
,(select count(*) from ECFPunc ep where
ep.Id in (select id from patform where ParentId=e.Id)
and (Seq_blood=1)) [Кровотечения]

from ECF e
left join Patient p on p.ID = e.PatId
where
e.ExecDate >= @sDate and e.ExecDate <=@eDate
and
e.Stim in (
'в стимулированном цикле'
--,'в естественном цикле'
,'с минимальной стимуляцией'
,'с донорскими ооцитами'
,'с СМ'
,'с донорскими эмбрионами'
)
-- отсеиваем программы, в которых есть только криопререносы
and not 
(
	(select COUNT(*) from ECFTrans et 
		where et.Id in (select id from patform where ParentId=e.Id) 
		and (isnull(et.QtyUncryo,0)>0 or isnull(et.QtyCryo,0)>0)
		and (nullif(nullif(et.DonorNum,''),'-1') is null)
		and (et.SurMother is null))
	=
	(select COUNT(*) from ECFTrans et
		where et.Id in (select id from patform where ParentId=e.Id))
)

union all

select
 et.[Id]
,[ExecDate]
,dbo.fnPatFullName(et.PatID) [ФИО]
,dbo.fnAge(p.BirthDate,et.ExecDate) [Возраст]
,0 [ЭКО]
,0 [ИКСИ]
,1 [РЭ]
,0 [ДО]
,0 [ПГД]
,0 [СМ]
,0 [Пункций]
,1 [Переносов]
,case when er.PregType in ('биохимическая','клиническая') then 1 else 0 end [Беременностей]
,case when (er.PretermBirth='да' or er.UrgentBirth='да') then 1 else 0 end  [Родов]
,case when isnull(er.PretermBirthAge,0) between 20 and 27 then 1 else 0 end [Срок родов 20-27]
,case when isnull(er.PretermBirthAge,0) between 28 and 36 then 1 else 0 end  [Срок родов 28-36]
,case when isnull(er.PretermBirthAge,0) between 28 and 32 then 1 else 0 end  [Срок родов 28-32]
,case when isnull(er.PretermBirthAge,0) between 33 and 36 then 1 else 0 end  [Срок родов 33-36]
,case when (er.UrgentBirth='да') then 1 else 0 end  [Срок родов более 37 недель]
,case when ((isnull(er.PretermBirthAge,0) >= 28) or (er.UrgentBirth='да')) then 1 else 0 end  [Срок родов 28 и более]
,case when isnull(er.UrgentBirthAge,0) between 37 and 41 then 1 else 0 end  [Срок родов 37-41]
,case when isnull(er.UrgentBirthAge,0) >= 42 then 1 else 0 end  [Срок родов 42]
,case when (select count(*) from EcoARTResultChild where masterid=er.id)=1 then 1 else 0 end  [Родов Одним плодом]
,case when (select count(*) from EcoARTResultChild where masterid=er.id)=2 then 1 else 0 end  [Родов двойней]
,case when (select count(*) from EcoARTResultChild where masterid=er.id)>2 then 1 else 0 end  [Родов тройней и более]
,case when er.ID is null then 1 else 0 end  [Нет сведений об исходе беременностей]
,case when (isnull(er.PregType,'не наступила') = 'не наступила') then 1 else 0 end  [Беременность не наступила]
,case when er.PregType ='клиническая' then 1 else 0 end  [Клиническая беременность]
,case when (NonDevelopingPregnancy='да' or Miscarriage='да' or Abortion='да' or ClinicPregType='внематочная') then 1 else 0 end  [Потери беременностей (всего)]
,case when (NonDevelopingPregnancy='да' or Miscarriage='да' or Abortion='да') then 1 else 0 end  [Аборты до 20 недель]
,case when (ClinicPregType='внематочная') then 1 else 0 end  [Внематочные беременности]
,isnull(QtyFresh,0)+isnull(QtyCryo,0) [Число перенесенных эмбрионов ВСЕГО]
,isnull(QtyUnCryo,0) [Число РЭ]
,isnull(QtyCryo,0) [Число перенесенных РЭ]
,case when er.PregType in ('биохимическая','клиническая') then 1 else 0 end [Беременностей РЭ]
,case when (er.PretermBirth='да' or er.UrgentBirth='да') then 1 else 0 end  [Родов РЭ]
,case when (SurgicalReduction='да') then 1 else 0 end  [Редукция числа плодов]
,case when (isnull(er.OHS,'нет')<>'нет') then 1 else 0 end [СГЯ]
,case when 0=1 then 1 else 0 end  [Инфекция]
,case when 0=1 then 1 else 0 end  [Кровотечения]
from
ECFTrans et 
left join Patient p on p.ID = et.PatId
left join EcoARTResult er on er.ID=(select top 1 id from EcoARTResult er2 where 
										et.id=er2.Trans1ID or et.id=er2.Trans2ID)
where 
et.ExecDate >= @sDate and et.ExecDate <=@eDate
and (isnull(et.QtyUncryo,0)>0 or isnull(et.QtyCryo,0)>0)
and (nullif(nullif(et.DonorNum,''),'-1') is null)
and (et.SurMother is null)
) as q

-- ВМИ
select *
,case when [Возраст]<40 then 1 else 0 end [Возраст <40]
,case when [Возраст]>=40 then 1 else 0 end [Возраст >=40]
,case when ([ДС] is null) then 0 else 1 end [Сперма донора]
,case when ([ДС] is null) then 1 else 0 end [Сперма мужа]
into ##RahrInsem
from
(
select 
 i.Id
,dbo.fnPatFullName(i.PatID) [ФИО]
,dbo.fnAge(p.BirthDate,i.ExecDate) [Возраст]
,nullif(nullif(DonorNum,''),'-1') [ДС]
,case when r.PregType ='клиническая' then 1 else 0 end [Клиническая беременность]
,case when (PretermBirth='да' or UrgentBirth='да') then 1 else 0 end
	[Родов]
,case when isnull(r.PretermBirthAge,0) between 20 and 27 then 1 else 0 end 
	[Срок родов 20-27]
,case when ((isnull(r.PretermBirthAge,0) >= 28) or (r.UrgentBirth='да')) then 1 else 0 end 
	[Срок родов 28 и более]
,case when (select count(*) from EcoARTResultChild where masterid=r.id)=1 then 1 else 0 end
	[Родов Одним плодом]
,case when (select count(*) from EcoARTResultChild where masterid=r.id)=2 then 1 else 0 end
	[Родов двойней]
,case when (select count(*) from EcoARTResultChild where masterid=r.id)>2 then 1 else 0 end
	[Родов тройней и более]
from MInsem i
left join Patient p on p.ID=i.PatId
left join EcoARTResult r on r.MInsemID=i.Id
where
i.ExecDate >= @sDate and i.ExecDate <=@eDate
) as q
