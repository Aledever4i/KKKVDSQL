
---------------------------------------------------
-- Перегружкенная процедура с меньшим кол-вом параметров
-- Создаёт новый экземпляр документа на текущую дату
---------------------------------------------------

CREATE PROCEDURE ConvertServicesData;2 
	(@Source Nvarchar(16),  -- название источника 'ui', 'bill' или 'appointment'
	@SourceID int, -- идентификатор экземпляра источника
	@Target Nvarchar(16), -- название цели 'ui', 'bill' или 'appointment'
	@PatID int,-- id пациента для направления и счёта
	@UserID int -- id пользователя для направления и счёта	
	)
As begin
	Declare @d datetime
	Set @d = GetDate()
	exec ConvertServicesData @Source, @SourceID, @Target, -1, 0, @PatID, @UserID, @d, NULL, NULL, NULL,Null
end

