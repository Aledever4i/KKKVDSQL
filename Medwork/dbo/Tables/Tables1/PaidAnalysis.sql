CREATE TABLE [dbo].[PaidAnalysis] (
    [ID]           INT            NOT NULL,
    [MasterID]     INT            NULL,
    [Uet]          FLOAT (53)     NULL,
    [FullName]     NVARCHAR (255) NULL,
    [Code]         NVARCHAR (20)  NULL,
    [NodeType]     NVARCHAR (12)  NULL,
    [Biomaterial]  INT            NULL,
    [BasePrice]    FLOAT (53)     NULL,
    [AnalysisKind] INT            NULL,
    [ResultType]   INT            NULL,
    [DictURL]      NVARCHAR (50)  NULL,
    [ValueList]    NTEXT          NULL,
    [Reference]    NTEXT          NULL,
    [Measure]      NVARCHAR (50)  NULL,
    [FormID]       INT            NULL,
    [FormName]     NVARCHAR (70)  NULL,
    [DictPath]     NVARCHAR (50)  NULL,
    [Caption]      NVARCHAR (50)  NULL
);


GO

CREATE TRIGGER [dbo].[UpdateService_PaidAnalysis] 
ON [dbo].[PaidAnalysis] 
AFTER UPDATE
AS
set nocount on
	update SubService set Price=i.BasePrice, ServiceName=i.FullName
	from  inserted i
	where SubService.code=i.code and SubService.Reference=1
	update service set Price=Price-
	(
		select sum(ps.BasePrice*ss.Quant)
		from SubService ss, deleted ps
		where ss.code=ps.code and service.id=ss.MasterId and ss.Reference=1
	)+
	(
		select sum(ps.BasePrice*ss.Quant)
		from SubService ss, inserted ps
		where ss.code=ps.code and service.id=ss.MasterId and ss.Reference=1
	)
	where AutoRefresh=1
