CREATE FUNCTION [dbo].[FOMSGetHMReport](@ReportId int)
RETURNS varchar(MAX)
AS
BEGIN
	-- Функция расчитывает файл HM и возвращает интегрированную информацию в виде XML строки
	
	--Добавить SD_Z - количество пациентов в этом талоне, количество талонов скорее
	--Серию полиса уже можно убрать
	--V015 в VERS_SPEC



	DECLARE
		@HM xml,
		@CODE_MO int = 250145, -- Код ГАУЗ КККВД
		@CODE varchar(100), -- Уникальный код выгрузки поликлинники.
		@DSCHET date = GETDATE(), -- Дата выставления счёта
		@SUMMAV decimal(15, 2) = 0.0, -- Сумма на оплату, заполняется мед организацией -- На текущий момент не расчитываем
		@ReportName varchar(26),
		@ReportDate date,
		@RequestCount int
		
	SELECT
		@RequestCount = COUNT(*)
		FROM dbo.FOMSRequests AS req
		WHERE req.ReportId = @ReportId
		
	SELECT
		@ReportName = dbo.FOMSGetReportName(rep.ID),
		@ReportDate = rep.ReportDate,
		@CODE =
			'175'
			+ CAST(RIGHT(DATEPART(YEAR, @ReportDate), 1) AS varchar) 
			+ RIGHT('0' + CAST(DATEPART(MM, @ReportDate) AS varchar), 2)
			+ RIGHT('0' + CAST(DATEPART(DD, @ReportDate) AS varchar), 2)
		FROM dbo.FOMSReports AS rep
		WHERE rep.ID = @ReportId

	SELECT @HM = (
		SELECT
			(
				SELECT
					'2.1' AS "VERSION",
					CAST(CONVERT(varchar, GETDATE(), 121) AS varchar(10)) AS "DATA",
					'H' + @ReportName AS "FILENAME",
					@RequestCount AS "SD_Z"
					FOR XML PATH ('ZGLV'), type
			),
			(
				SELECT
					@CODE AS "CODE",
					@CODE_MO AS "CODE_MO",
					DATEPART(YEAR, @ReportDate) AS "YEAR",
					DATEPART(MONTH, @ReportDate) AS "MONTH",
					@CODE AS "NSCHET",
					CAST(CONVERT(varchar, @DSCHET, 121) AS varchar(10)) AS "DSCHET",
					0.00 AS "SUMMAV"
					FOR XML PATH ('SCHET'), type
			),
			(
				SELECT
					r.ID AS "N_ZAP", -- Уникальный номер записи в таблице заявок в ФОМС
					0 AS "PR_NOV",	-- 0 – сведения об оказанной медицинской помощи передаются впервые; -- 1 – запись передается повторно после исправления
					(
						SELECT
							p.ID AS "ID_PAC",
							p.PolicyTypeId AS "VPOLIS", -- 3 - Полис ОМС единого образца -- НАДО СДЕЛАТЬ ПОЛЕ ТИП ПОЛИСА, создать таблицу справочник.
							CASE WHEN p.SeriyaPolisa IS NULL OR p.SeriyaPolisa = '' THEN NULL ELSE p.SeriyaPolisa END AS "SPOLIS", -- Серия полиса
							p.NomerPolisa AS "NPOLIS", -- Для полисов единого образца указывается ЕНП При этом поле VPOLIS - тип ДПФС по ОМС, имеет значение «3» в соответствии со справочником F008. В случае отсутствия у детей в возрасте до трех месяцев полиса обязательного медицинского   страхования, заполняется номер страхового полиса ОМС матери (отца).
							CASE WHEN p.SMO IS NULL OR p.SMO = 0 THEN NULL ELSE p.SMO END AS "SMO", -- Заполняется в соответствии со справочником F002. При отсутствии сведений может не заполняться.
							0 AS "NOVOR" -- Признак новорожденного, надо добавить поле в таблицу пациент. Сделать логику подставновки.
							FOR XML PATH ('PACIENT'), type
					),
					(
						SELECT
							r.ID AS "IDCASE", -- Уникальный номер записи в таблице заявок в ФОМС
							3 AS "USL_OK", -- Условия оказания медицинской помощи -- HelpConditions.IDUMP
							MedicalHelpType.IDVMP AS "VIDPOM", -- Тип медицинской помощи
							MedicalHelp.IDVMP AS "FOR_POM", -- Классификатор форм оказания медицинской помощи.
							r.HospitalizationId AS "EXTR", -- Битовое поле 1 – плановая; 2 – экстренная (Госпитализация)
							@CODE_MO AS "LPU", -- Код МО, МО лечения, указывается в соответствии с реестром F003. Обязательный
							175 AS "PODR", -- Не обязательный. dbo.FOMSDEPARTS
							r.ProfileHelpId AS "PROFIL", -- Обязательный. Каждой болезни выдать определенное значение.
							p.IsChild AS "DET", -- Признак детского профиля	0-нет, 1-да. Заполняется в зависимости от профиля оказанной медицинской помощи. 14 - лет
							p.cardnum AS "NHISTORY", -- Тут надо еще проанализировать тщательнее
							r.HealingStartDate AS "DATE_1", -- Дата начала лечения
							r.HealingEndDate AS "DATE_2", -- Дата окончания лечения
							r.PreviewSickDictId AS "DS0", -- Диагноз первичный
							r.FinalSickDictId AS "DS1", -- Диагноз основной
							r.BonusSickDictId AS "DS2", -- Диагноз сопутствующего заболевания
							0290153 AS "CODE_MES1", -- Код МЭС. Классификатор МЭС. (Региональный справочник случаев лечения заболевания).
							ResoltResult.IDRMP AS "RSLT", -- Результат обращения/ госпитализации	Классификатор результатов обращения за медицинской помощью V009.
							DiseaseOutcome.IDIZ AS "ISHOD", -- Исход заболевания	Классификатор исходов заболевания  V012.
							DoctorSpecTypes.CODE AS "PRVS", -- Специальность лечащего врача/ врача, закрывшего талон.
							'V015' AS "VERS_SPEC",
							CAST(@CODE_MO AS varchar(6)) + '-' + CAST(dp.K_SP AS varchar(10)) + Doctors.CardNum AS "IDDOKT", --тип приема определяем по возрасту на момент приема Код врача, закрывшего талон/историю болезни
							'000-000-000-00' AS "IDDOKT",
							--CASE 
							--	WHEN LEN(Doctors.CardNum) = 3 AND LEFT(Doctors.CardNum, 1) = 3 THEN '250432-' --ussur
							--	ELSE  '250175-' --vlad
							--	END
							--	+ CASE WHEN p.IsChild = 1 THEN '185' ELSE '22' END
							--	+ CAST(Doctors.CardNum AS varchar) AS "IDDOKT",
							0 AS "OS_SLUCH", -- Особые случаи при регистрации, у нас такого не бывает
							17 AS "IDSP", -- Код способа оплаты медицинской помощи	Классификатор способов оплаты медицинской помощи V010. 13 - Стандарт медицинской помощи в стационаре (включая ВМП)
							'1.99' AS "SUMV", --	Сумма, выставленная к оплате
							(
								SELECT
									serv.ID AS "IDSERV", --Номер записи в реестре услуг,	Уникален в пределах случая
									@CODE_MO AS "LPU", -- Код МО, МО лечения, указывается в соответствии с реестром F003.
									@CODE_MO AS "LPU_1", -- Подразделение МО, Подразделение МО лечения из регионального справочника
									serv.DepartamentId AS "PODR", -- Код отделения, Отделение МО лечения из регионального справочника DEPARTS
									serv.HelpProfileId AS "PROFIL", -- Профиль, Классификатор V002.
									serv.IsChild AS "DET", -- Признак детского профиля	0-нет, 1-да., Заполняется в зависимости от профиля оказанной медицинской помощи.
									serv.DateStart AS "DATE_IN", -- Дата начала оказания услуги	В формате ГГГГ-ММ-ДД
									serv.DateEnd AS "DATE_OUT", -- Дата окончания оказания услуги	В формате ГГГГ-ММ-ДД
									mkb.KOD AS "DS",-- Диагноз	Код из справочника МКБ до уровня подрубрики
									st.CD_USL AS "CODE_USL", -- Код услуги	Территориальный классификатор услуг.
									serv.ServiceCount AS "KOL_USL",	-- Количество услуг (кратность услуги)	
									'0.00' AS "TARIF", -- Тариф 	
									'0.00' AS "SUMV_USL", -- Стоимость мед. услуги, принятая к оплате (руб.)	
									usr.FOMSV015Id AS "PRVS",-- Специальность медработника, выполнившего услугу	В соответствии с федеральным справочником V015
									'000-000-000-00' AS "CODE_MD",-- 432-уссур полик, 175 - влад полик Код медицинского работника, оказавшего медицинскую услугу	Личный код врача из внутреннего справочника медицинской организации 
									serv.Comment AS "COMENTU" -- Служебное поля
									FROM dbo.FOMSServices AS serv
									LEFT JOIN dbo.FOMSServiceTypes AS st ON st.ID = serv.ServiceCodeId
									LEFT JOIN dbo.mkb10 AS mkb ON mkb.ID = serv.DiagnosisId
									LEFT JOIN dbo.Usr AS usr ON usr.ID = serv.DoctorId
									WHERE serv.StatTalon = r.ID
									FOR XML PATH ('USL'), type -- Сведения об услуге, Описывает услуги, оказанные в рамках данного случая
							)
							FOR XML PATH ('SLUCH'), type
					)
					FROM dbo.FOMSReports AS rep
					JOIN dbo.FOMSRequests AS r ON r.ReportId = rep.ID -- Общая таблица больных для ФОМС
					LEFT JOIN dbo.Usr AS Doctors ON Doctors.ID = r.DoctorId
					LEFT JOIN dbo.FOMSV015 AS DoctorSpecTypes ON DoctorSpecTypes.RecId = Doctors.FOMSV015Id
					LEFT JOIN dbo.FOMSDoctorProfessions AS dp ON dp.RecId = Doctors.FOMSProfessionId
					LEFT JOIN dbo.Patient AS p ON p.ID = r.PatID -- Таблица пациентов
					LEFT JOIN dbo.PatPolices AS pp ON pp.PatientId = p.ID -- Полис больного
					LEFT JOIN dbo.FOMSF002 AS Ins ON Ins.RecId = pp.CompanyId -- Страховые компании
					LEFT JOIN dbo.FOMSV008 AS MedicalHelp ON MedicalHelp.RecId = r.MedicalHelpId -- Таблица Тип помощи V008
					LEFT JOIN dbo.FOMSV008 AS MedicalHelpType ON MedicalHelpType.RecId = r.MedicalHelpTypeId -- Таблица Тип помощи V008
					LEFT JOIN dbo.FOMSV009 AS ResoltResult ON ResoltResult.RecId = r.ResoltResultId -- Таблица результатов обращения V009
					LEFT JOIN dbo.FOMSV012 AS DiseaseOutcome ON DiseaseOutcome.RecId = r.DiseaseOutcomeId -- Таблица исходов заболеваня V012
					WHERE 
						rep.ID = @ReportId
						AND rep.IsClose = 0 -- ФОМС подтвердил
						AND rep.IsActive = 1 -- Талон активный
					FOR XML PATH ('ZAP'), type
			)
			FOR XML PATH('ZL_LIST')
	)
	
	RETURN CONVERT(varchar(MAX), @HM)
END