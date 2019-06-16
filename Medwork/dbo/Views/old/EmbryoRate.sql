CREATE VIEW EmbryoRate
AS

select
 f.id

,case when f.ECO in (0,1) and ed0.ID is not null
and not (isnull(ed0.Action,0) in (1,4)) -- upd20120913 не заморожен и не погиб на 0 день
then 1 else null end
 [инсеминирован] --проставлен статус ЭКО или ИКСИ в 0 день

,case when f.ECO=1 and ed0.ID is not null
and not (isnull(ed0.Action,0) in (1,4)) -- upd20120913 не заморожен и не погиб на 0 день
then 1 else null end
 [ЭКО] --проставлен статус ЭКО в 0 день
,case when f.ECO=0 and ed0.ID is not null
and not (isnull(ed0.Action,0) in (1,4)) -- upd20120913 не заморожен и не погиб на 0 день
then 1 else null end
 [ИКСИ] --проставлен статус ИКСИ в 0 день

,case when (ed1.PronucleusCount=2 and ed1.FertilizEstim like 'pn%')
	or (ed2.PronucleusCount=2 and ed2.FertilizEstim like 'pn%')
	then 1 else null end
	[2 pN] --эмбрион 1-го дня и иногда 2-го дня, имеющих оценку оплодотворения 2pN, 2pN11, 2pN12, 2pN21, 2pN22, 2pNfaint.

,case when (ed1.PronucleusCount>2 and ed1.FertilizEstim like 'pn%')
	or (ed2.PronucleusCount>2 and ed2.FertilizEstim like 'pn%')
	then 1 else null end
 [>2pN] --эмбрион 1-го дня и иногда 2-го дня, имеющих оценку оплодотворения 3pN и больше (4,5..)


-- update 20120903
--у меня было написано так - Кол-во эмбрионов, изменивших стадию развития с "Зигота" на "Эмбрион" на 2-3 день развития.
--А должно быть - Кол-во эмбрионов 1-го дня и иногда 2-го дня, имеющих оценку оплодотворения 2pN, 2pN11, 2pN12, 2pN21, 
--2pN22, 2pNfaint, изменивших стадию развития с "Зигота" на "Эмбрион" на 2-3 день развития.
--И в число эмбрионов 5-го дня, число Bl и число Bl хорошего качества должны попадать только такие эмбрионы (1-го дня и иногда 2-го дня, имеющих оценку оплодотворения 2pN, 2pN11, 2pN12, 2pN21, 2pN22, 2pNfaint). 
,case when 
	((ed1.Stage=2 and ed2.Stage=4) or (ed2.Stage=2 and ed3.stage=4)) --stage 2 >> 4 --изменивший стадию развития с "Зигота" на "Эмбрион" на 2-3 день развития.
	and ((ed1.PronucleusCount=2 and ed1.FertilizEstim like 'pn%') or (ed2.PronucleusCount=2 and ed2.FertilizEstim like 'pn%')) --эмбрион 1-го дня и иногда 2-го дня, имеющих оценку оплодотворения 2pN, 2pN11, 2pN12, 2pN21, 2pN22, 2pNfaint
 then 1 else null end
 [дробящийся на 3 день] 

,case when ed5.ID is not null and isnull(ed5.Action,0)<>4 -- есть запись 5 дня и не умер на 5 день
	and isnull(ed4.Action,0)<>4 and isnull(ed3.Action,0)<>4 and isnull(ed2.Action,0)<>4 
	and isnull(ed1.Action,0)<>4 and isnull(ed0.Action,0)<>4 -- не умер на 0-4 день
	then 1 else null end [эмбрион 5 дня] --живой на 5й день развития

,case when (ed4.Stage=3 or ed5.Stage=3 or ed6.Stage=3 or ed7.Stage=3)
	and ((ed1.PronucleusCount=2 and ed1.FertilizEstim like 'pn%') or (ed2.PronucleusCount=2 and ed2.FertilizEstim like 'pn%')) --эмбрион 1-го дня и иногда 2-го дня, имеющих оценку оплодотворения 2pN, 2pN11, 2pN12, 2pN21, 2pN22, 2pNfaint
	then 1 else null end
 [Bl] --Стадия развития -Бластоциста; эмбрион со стадией развития "Бластоциста" на 4-7 день развития

,case when (ed4.Stage=3 or ed5.Stage=3 or ed6.Stage=3 or ed7.Stage=3)
	and ((ed1.PronucleusCount=2 and ed1.FertilizEstim like 'pn%') or (ed2.PronucleusCount=2 and ed2.FertilizEstim like 'pn%')) --эмбрион 1-го дня и иногда 2-го дня, имеющих оценку оплодотворения 2pN, 2pN11, 2pN12, 2pN21, 2pN22, 2pNfaint
	and (  ed4.DevEstimBl in ('Bl Aa','Bl Ab','Bl Ba','Bl Bb')
		or ed5.DevEstimBl in ('Bl Aa','Bl Ab','Bl Ba','Bl Bb')
		or ed6.DevEstimBl in ('Bl Aa','Bl Ab','Bl Ba','Bl Bb')
		or ed7.DevEstimBl in ('Bl Aa','Bl Ab','Bl Ba','Bl Bb')
	) then 1 else null end [Bl хор.кач-ва] --Стадия развития - Бластоциста, поле "Оценка развития (бластоциста)"; 
--стадия развития "Бластоциста" на 4-7 день развития, 
--со значением поля "Оценка развития (бластоциста)" Bl.Aa, Bl.Ab, Bl.Ba, Bl.Bb,
-- независимо от поля "Оценка развития - качество" (неправильно названо)

,case when ed0.Action=3 or ed1.Action=3 or ed2.Action=3 or ed3.Action=3 or ed4.Action=3 or ed5.Action=3 or ed6.Action=3 or ed7.Action=3
then 1 else null end 
[Перенен на 0-7 день] --перенос/эмбриологический протокол; ; Наличие в эмбриологическом протоколе эмбрионов со статусом 
--"Перенесен" без статуса "Заморожен", чтобы исключить учет переносов размороженных эмбрионов

,case when ed0.Action=1 or ed1.Action=1 or ed2.Action=1 or ed3.Action=1 or ed4.Action=1 or ed5.Action=1 or ed6.Action=1 or ed7.Action=1
then 1 else null end 
[Заморожен на 0-7 день]

,(select name from usr where id = ed0.OperId) [Эмбриолог в 0 день] --Развитие эмбриона, Фамилия эмбриолога в поле "Врач-эмбриолог" в День 0 ;
--В зависомости от перенесенных эмбрионов проставляется фамилия эмбриолога, 
--которая отмечена в "День 0" именно перенесенного эмбриона (т.е. того, кто делал ИКСИ или ЭКО и чья фамилия потом выводится напротив каждого эмбриона)
from OFate f
left join EmbrionDevelopment ed0 on ed0.id=(select top 1 id from EmbrionDevelopment where MasterID=f.Id and DayNumber=0 and (RecDate-f.ExecDate)=0 order by id desc)
left join EmbrionDevelopment ed1 on ed1.id=(select top 1 id from EmbrionDevelopment where MasterID=f.Id and DayNumber=1 and (RecDate-f.ExecDate)=1 order by id desc)
left join EmbrionDevelopment ed2 on ed2.id=(select top 1 id from EmbrionDevelopment where MasterID=f.Id and DayNumber=2 and (RecDate-f.ExecDate)=2 order by id desc)
left join EmbrionDevelopment ed3 on ed3.id=(select top 1 id from EmbrionDevelopment where MasterID=f.Id and DayNumber=3 and (RecDate-f.ExecDate)=3 order by id desc)
left join EmbrionDevelopment ed4 on ed4.id=(select top 1 id from EmbrionDevelopment where MasterID=f.Id and DayNumber=4 and (RecDate-f.ExecDate)=4 order by id desc)
left join EmbrionDevelopment ed5 on ed5.id=(select top 1 id from EmbrionDevelopment where MasterID=f.Id and DayNumber=5 and (RecDate-f.ExecDate)=5 order by id desc)
left join EmbrionDevelopment ed6 on ed6.id=(select top 1 id from EmbrionDevelopment where MasterID=f.Id and DayNumber=6 and (RecDate-f.ExecDate)=6 order by id desc)
left join EmbrionDevelopment ed7 on ed7.id=(select top 1 id from EmbrionDevelopment where MasterID=f.Id and DayNumber=7 and (RecDate-f.ExecDate)=7 order by id desc)
