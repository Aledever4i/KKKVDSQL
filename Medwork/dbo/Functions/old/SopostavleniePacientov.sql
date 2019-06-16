-- функция сопоставления пациентов из неподтвержденных заявок из LabResults_Buffer и пациентов мв
CREATE FUNCTION [dbo].SopostavleniePacientov 
(
	@idResult int, @labName nvarchar(256), @ReqNum nvarchar(50),
	@ln nvarchar(100), @fn nvarchar(100), @sn nvarchar(100)
)
RETURNS nvarchar(50)
AS
BEGIN
-- сопоставление пациентов из результатов ЛИ с пациентами медворк
-- узнать тип лаборатории
declare @result nvarchar(50)
declare @reqPatId int
declare @reqId int
declare @lastname nvarchar(20)
declare @firstname nvarchar(20)
declare @secondname nvarchar(20)
declare @i int


declare @LabType int
SET @LabType = CASE
	WHEN (LOWER(@labName) LIKE '%ариадн%') or (LOWER(@labName) LIKE '%биохиммак%') then 9
	WHEN (LOWER(@labName) LIKE '%kdl%') or (LOWER(@labName) LIKE '%кдл%') then 10 --[#4571]
	WHEN (LOWER(@labName) LIKE '%ситилаб%') then 11 --[#4872]
	WHEN (LOWER(@labName) LIKE '%инвитро%') then 3 --[#6117]
END

-- если лаборатория не определилась - не соответствует
if (@LabType IN (9, 10, 11, 3)) --[#4571]
begin
	if (@ReqNum is NULL) or (@ReqNum = '')
	begin
		set @result = 'Нет номера заявки' -- не соответствует
	end
	else
	begin
		-- по лаборатории и номеру заявки - узнать йд и фио пациента из заявки
		select top 1 @reqPatId = PatId, @reqId = id from Requisition
		where ReqId = @ReqNum and Laboratory = @LabType
		order by id desc

		if (@reqId IS NULL)
		begin
			set @result = 'Нет заявки в MedWork'
		end
		else
		begin
			-- узнать фио пациента мв по йд
			select @i = id, @lastname = LastName, @firstname = FirstName, @secondname = SecondName
			from patient where id = @reqPatId

			-- если йд пациента нулл, то он был удален
			if (@i IS NULL)
			begin
				set @result = 'Пациент удален'
			end
			else
			begin
				-- по сравнению фио выдать заключение
				-- сравнение йд из результатов и заказа можно если потребуется приделать позже
				if	(LOWER(@lastname)=LOWER(@ln)) and 
					(LOWER(@firstname)=LOWER(@fn)) and
					(LOWER(@secondname)=LOWER(@sn))
				begin
					set @result = 'Пациент сопоставлен' --dbo.fnPatFullName(@i) -- какому пациенту полностью соответствует
				end
				else
				begin
					set @result = 'ФИО соответствует не полностью'
				end
			end
		end
	end
end
else
begin
	set @result = '' -- не анализируемая лаборатория
end

return @result

END
