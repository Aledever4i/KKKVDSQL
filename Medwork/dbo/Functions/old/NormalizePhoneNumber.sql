
create FUNCTION [dbo].[NormalizePhoneNumber]
(
	@num varchar(100)
)
RETURNS VARCHAR(100)
BEGIN
  set @num=REPLACE(@num,'-','')
  set @num=REPLACE(@num,' ','')
  set @num=REPLACE(@num,'(','')
  set @num=REPLACE(@num,')','')
  return @num
END
