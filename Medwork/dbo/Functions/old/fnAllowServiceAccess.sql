
CREATE FUNCTION fnAllowServiceAccess 
	(@tablename nvarchar(32), 
	@guid nvarchar(32))
RETURNS int
AS
BEGIN

declare @s as int
set @s = 0

if lower(@tablename) <> 'udp_billspec' 
begin
	set @s = @s + (select top 1 count(1) from UDP_BillSpec where guid = @guid)
end

if lower(@tablename) <> 'ui_service' 
begin
	set @s = @s + (select top 1 count(1) from ui_service where guid = @guid)
end

if lower(@tablename) <> 'appointmentservice' 
begin
	set @s = @s + (select top 1 count(1) from AppointmentService where guid = @guid)
end

if lower(@tablename) <> 'billservice' 
begin
	set @s = @s + (select top 1 count(1) from billservice where guid = @guid)
end


return @s
END
