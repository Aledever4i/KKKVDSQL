CREATE TRIGGER dbo.ScheduleBlock
ON dbo.SchedulingBlock
FOR INSERT
AS
BEGIN
	DECLARE 
		@RecordId int,
		@HasBan bit
	
	SELECT
		@RecordId = i.ID,
		@HasBan = CASE WHEN gr.Id IS NOT NULL THEN 1 ELSE 0 END
		FROM inserted AS i 
		JOIN dbo.GrantedBans AS gr ON gr.UserId = i.UserID
		WHERE gr.BanId = 1

	IF (@HasBan = 1)
	BEGIN
		DELETE FROM dbo.SchedulingBlock WHERE ID = @RecordId
	END
END