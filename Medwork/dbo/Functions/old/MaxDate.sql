
create function [dbo].[MaxDate](@x datetime, @y datetime)
returns datetime
as
begin
	if(@x is null)return null
	if(@y is null)return null
	if(@x>=@y)return @x
	return @y
end
