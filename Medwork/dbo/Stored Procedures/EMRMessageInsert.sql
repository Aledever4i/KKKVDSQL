CREATE PROCEDURE dbo.EMRMessageInsert
	@MessageId uniqueidentifier,
	@Body varchar(MAX)
AS
BEGIN
	-- Запись сформированного сообщения
	INSERT INTO dbo.EMRMessages (
		MessageId,
		Body
		)
		VALUES (
			@MessageId,
			@Body
		)
END 