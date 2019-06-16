
CREATE VIEW [dbo].[ContractsOrg]
AS
select c.ContractNumber, c.id, CAST(o.[code] as nvarchar) ocode
from Contracts c, Organisations o where  c.[masterid]=o.id
