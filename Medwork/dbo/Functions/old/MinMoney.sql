
create function [dbo].[MinMoney](@x Money, @y Money)
returns Money
as
begin
	if(@x is null)return null
	if(@y is null)return null
	if(@x<=@y)return @x
	return @y
end
