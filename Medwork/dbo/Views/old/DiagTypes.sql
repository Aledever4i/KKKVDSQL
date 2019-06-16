CREATE VIEW [dbo].[DiagTypes]
AS
select distinct d1.code, d1.text from dict d1 join dict d2 on d1.MasterID=d2.id where d2.[Column]='DiagType'

