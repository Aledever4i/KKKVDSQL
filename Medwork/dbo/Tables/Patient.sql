CREATE TABLE [dbo].[Patient] (
    [ID]                        INT              CONSTRAINT [DF__Patient__ID__67A95F59] DEFAULT ((0)) NOT NULL,
    [DeptID]                    INT              CONSTRAINT [DF__Patient__DeptID__689D8392] DEFAULT ((0)) NULL,
    [FirstName]                 NVARCHAR (50)    NULL,
    [SecondName]                NVARCHAR (50)    NULL,
    [LastName]                  NVARCHAR (50)    NULL,
    [Sex]                       NVARCHAR (1)     NULL,
    [BirthDate]                 DATETIME         NULL,
    [RegDate]                   DATETIME         NULL,
    [LastDate]                  DATETIME         NULL,
    [UserLocked]                SMALLINT         CONSTRAINT [DF__Patient__UserLoc__6991A7CB] DEFAULT ((0)) NULL,
    [LockTime]                  DATETIME         NULL,
    [AdresIndeks]               NVARCHAR (20)    NULL,
    [AdresStrana]               NVARCHAR (50)    NULL,
    [AdresDom]                  NVARCHAR (10)    NULL,
    [AdresKorpus]               NVARCHAR (10)    NULL,
    [AdresKvartira]             NVARCHAR (10)    NULL,
    [SeriyaPasporta]            NVARCHAR (6)     NULL,
    [NomerPasporta]             NVARCHAR (25)    NULL,
    [KemVidanPasport]           NVARCHAR (80)    NULL,
    [KogdaVidanPasport]         DATETIME         NULL,
    [Registrator]               INT              NULL,
    [Email]                     NVARCHAR (100)   NULL,
    [NIB]                       INT              NULL,
    [AdresGorod]                NVARCHAR (100)   NULL,
    [AdresUlitsa]               NVARCHAR (70)    NULL,
    [LechVrach]                 INT              NULL,
    [Mestoraboti]               NVARCHAR (200)   NULL,
    [AdresStroenie]             NVARCHAR (8)     NULL,
    [AdresRegion]               NVARCHAR (50)    NULL,
    [TipDocumenta]              INT              NULL,
    [OtkudaUznali]              NVARCHAR (40)    NULL,
    [Natsionalnost]             NVARCHAR (50)    NULL,
    [KategoriyaLgotnosti]       INT              NULL,
    [DomTelefon]                NVARCHAR (50)    NULL,
    [MobTelefon]                NVARCHAR (50)    NULL,
    [RabTelefon]                NVARCHAR (50)    NULL,
    [CardNum]                   NVARCHAR (50)    NULL,
    [isMoscow]                  INT              NULL,
    [C_T]                       NVARCHAR (3)     NULL,
    [DOM]                       NVARCHAR (7)     NULL,
    [KOR]                       NVARCHAR (5)     NULL,
    [STR]                       NVARCHAR (3)     NULL,
    [KV]                        NVARCHAR (5)     NULL,
    [Q]                         NVARCHAR (2)     NULL,
    [D_TYPE]                    NVARCHAR (1)     NULL,
    [DRR]                       DATETIME         NULL,
    [RN]                        NVARCHAR (18)    NULL,
    [GOR]                       NVARCHAR (25)    NULL,
    [UL]                        NVARCHAR (22)    NULL,
    [snils]                     NVARCHAR (50)    NULL,
    [dolznost]                  NVARCHAR (100)   NULL,
    [b_karta_zavedena]          TINYINT          NULL,
    [b_karta_sdana]             TINYINT          NULL,
    [b_karta_perenesena]        TINYINT          NULL,
    [dpi]                       SMALLINT         NULL,
    [pdi]                       SMALLINT         NULL,
    [dispanser]                 SMALLINT         NULL,
    [uchebnaya_spravka]         SMALLINT         NULL,
    [KodOrganizatsii]           INT              NULL,
    [PobochnoeDeystvieLekarstv] NTEXT            NULL,
    [AdresRaion]                NVARCHAR (50)    NULL,
    [NasPunkt]                  INT              NULL,
    [UL_CODE]                   INT              NULL,
    [C_A]                       INT              NULL,
    [Q_GOR]                     NVARCHAR (20)    NULL,
    [Q_NAME]                    NVARCHAR (20)    NULL,
    [CG]                        INT              NULL,
    [SemeynoePolozhenie]        NVARCHAR (50)    NULL,
    [Adres]                     NVARCHAR (200)   NULL,
    [Another]                   BIT              NULL,
    [Veteran]                   BIT              NULL,
    [Inval]                     BIT              NULL,
    [KategoriyaInval]           INT              NULL,
    [SerInval]                  NVARCHAR (9)     NULL,
    [NumInval]                  NVARCHAR (10)    NULL,
    [DateInval]                 DATETIME         NULL,
    [KemVidanInval]             NVARCHAR (50)    NULL,
    [OsnovInval]                NVARCHAR (50)    NULL,
    [DocTypeInval]              NVARCHAR (20)    NULL,
    [KategoriyaVetBD]           INT              NULL,
    [SerBD]                     NVARCHAR (4)     NULL,
    [NumBD]                     NVARCHAR (8)     NULL,
    [DateBD]                    DATETIME         NULL,
    [KemVidanBD]                NVARCHAR (50)    NULL,
    [OsnovBD]                   NVARCHAR (50)    NULL,
    [SerAnother]                NVARCHAR (9)     NULL,
    [NumAnother]                NVARCHAR (10)    NULL,
    [DateAnother]               DATETIME         NULL,
    [KemVidanAnother]           NVARCHAR (50)    NULL,
    [OsnovAnother]              NVARCHAR (50)    NULL,
    [AdresRaionCenter]          BIT              NULL,
    [OldCardNum]                NVARCHAR (50)    NULL,
    [SerBD1]                    NVARCHAR (4)     NULL,
    [NumBD1]                    NVARCHAR (8)     NULL,
    [DateBD1]                   DATETIME         NULL,
    [KemVidanBD1]               NVARCHAR (50)    NULL,
    [OffType]                   NVARCHAR (50)    NULL,
    [Off]                       BIT              NULL,
    [Section]                   INT              NULL,
    [SectionSDate]              DATETIME         NULL,
    [AdresStranaFakt]           NVARCHAR (50)    NULL,
    [AdresIndeksFakt]           INT              NULL,
    [AdresRegionFakt]           NVARCHAR (50)    NULL,
    [NasPunkt1]                 INT              NULL,
    [AdresGorodFakt]            NVARCHAR (100)   NULL,
    [AdresRaionFakt]            NVARCHAR (50)    NULL,
    [AdresRaionCenterFakt]      BIT              NULL,
    [AdresStreetFakt]           NVARCHAR (70)    NULL,
    [AdresDomFakt]              NVARCHAR (10)    NULL,
    [AdresKorpusFakt]           NVARCHAR (10)    NULL,
    [AdresStroenieFakt]         NVARCHAR (8)     NULL,
    [AdresKvartiraFakt]         NVARCHAR (10)    NULL,
    [AdresUlitsaFakt]           NVARCHAR (70)    NULL,
    [CT]                        NVARCHAR (3)     NULL,
    [ULCODE]                    INT              NULL,
    [CA]                        INT              NULL,
    [QGOR]                      NVARCHAR (20)    NULL,
    [QNAME]                     NVARCHAR (20)    NULL,
    [AdresRegionDict]           NVARCHAR (10)    NULL,
    [AdresStreetDict]           NVARCHAR (70)    NULL,
    [Guid]                      UNIQUEIDENTIFIER CONSTRAINT [DF__patient__Guid__618A6A62] DEFAULT (newid()) NOT NULL,
    [AdresNasPunkt]             NVARCHAR (50)    NULL,
    [DateOfLastChange]          DATETIME         NULL,
    [SrokDo]                    DATETIME         NULL,
    [AdresRaionReg]             NVARCHAR (50)    NULL,
    [AdresRaionRegDict]         NVARCHAR (10)    NULL,
    [AdresGorodDict]            NVARCHAR (10)    NULL,
    [AdresNasPunktDict]         NVARCHAR (10)    NULL,
    [AdresUlitsaDict]           NVARCHAR (10)    NULL,
    [AdresRaionRegFakt]         NVARCHAR (50)    NULL,
    [AdresNasPunktFakt]         NVARCHAR (50)    NULL,
    [RegionCodeEditBoxFakt]     NVARCHAR (10)    NULL,
    [RaionCodeEditBoxFakt]      NVARCHAR (10)    NULL,
    [GorodCodeEditBoxFakt]      NVARCHAR (10)    NULL,
    [NPCodeEditBoxFakt]         NVARCHAR (10)    NULL,
    [RegionCodeEditBox]         NVARCHAR (10)    NULL,
    [RaionCodeEditBox]          NVARCHAR (10)    NULL,
    [GorodCodeEditBox]          NVARCHAR (10)    NULL,
    [NPCodeEditBox]             NVARCHAR (10)    NULL,
    [OldCardLocation]           INT              NULL,
    [b_karta_aktualna]          TINYINT          NULL,
    [b_karta_reg]               TINYINT          NULL,
    [b_karta_pat]               TINYINT          NULL,
    [b_karta_vrach]             TINYINT          NULL,
    [b_karta_ArPlace]           NVARCHAR (100)   NULL,
    [b_karta_CreateDate]        DATETIME         NULL,
    [AdresOther]                NVARCHAR (200)   NULL,
    [LastChange]                NVARCHAR (100)   NULL,
    [PersonalAccountBalance]    MONEY            NULL,
    [SpecialNotes]              NVARCHAR (50)    NULL,
    [b_karta_Resource]          INT              NULL,
    [b_karta_state]             INT              NULL,
    [GruppaKrovi]               INT              NULL,
    [RezusFaktor]               INT              NULL,
    [IstochnikReklamy]          INT              NULL,
    [SocStatus]                 INT              NULL,
    [skype]                     VARCHAR (50)     NULL,
    [Primechanie]               NTEXT            NULL,
    [StatusID]                  INT              NULL,
    [Updatetime]                DATETIME         NULL,
    [AdresStranaDict]           NVARCHAR (10)    NULL,
    [UlCodeEditBox]             NVARCHAR (17)    NULL,
    [useKLADR]                  BIT              NULL,
    [AdresStrana1]              NVARCHAR (50)    NULL,
    [AdresRegion1]              NVARCHAR (50)    NULL,
    [AdresGorod1]               NVARCHAR (100)   NULL,
    [AdresUlitsa1]              NVARCHAR (70)    NULL,
    [AdresKvartira1]            NVARCHAR (10)    NULL,
    [AdresKorpus1]              NVARCHAR (10)    NULL,
    [AdresStroenie1]            NVARCHAR (8)     NULL,
    [AdresDom1]                 NVARCHAR (10)    NULL,
    [Updatetime1]               DATETIME         NULL,
    [AdresRegionDict1]          NVARCHAR (10)    NULL,
    [AdresStranaDict1]          NVARCHAR (10)    NULL,
    [RegionCodeEditBox1]        NVARCHAR (10)    NULL,
    [RaionCodeEditBox1]         NVARCHAR (10)    NULL,
    [GorodCodeEditBox1]         NVARCHAR (10)    NULL,
    [useKLADR1]                 BIT              NULL,
    [AdresRaionReg1]            NVARCHAR (50)    NULL,
    [AnonimniyPriem]            NVARCHAR (1)     NULL,
    [AdresRaionGor]             NVARCHAR (50)    NULL,
    [AdresRaionGorFakt]         NVARCHAR (50)    NULL,
    [NomerPolisa]               NVARCHAR (25)    NULL,
    [TFOMS]                     INT              NULL,
    [SMO]                       INT              NULL,
    [ven_karta_Resource]        INT              NULL,
    [ven_karta_state]           INT              NULL,
    [ven_karta_ArPlace]         NVARCHAR (100)   NULL,
    [TabelNomer]                NVARCHAR (100)   NULL,
    [Ceh]                       NVARCHAR (100)   NULL,
    [AgreeSpam]                 BIT              NULL,
    [Proizv_name]               NVARCHAR (100)   NULL,
    [CehCod]                    INT              NULL,
    [kosm_karta_Resource]       INT              NULL,
    [kosm_karta_state]          INT              NULL,
    [kosm_karta_ArPlace]        NVARCHAR (100)   NULL,
    [kosm_karta_num]            INT              NULL,
    [IsChild]                   AS               (case when datediff(year,[BirthDate],getdate())<(14) then (1) else (0) end),
    [Anon]                      INT              NULL,
    [PolicyTypeId]              INT              NULL,
    [TerrainId]                 AS               (case when right([AdresGorodFakt],(2))=' г' OR right([AdresGorodFakt],(4))=' пгт' then (1) when [AdresGorodFakt] IS NOT NULL AND [AdresGorodFakt]<>'' then (2)  end),
    [SeriyaPolisa]              NVARCHAR (6)     NULL,
    [PoliceComment]             NVARCHAR (150)   NULL,
    [EstPrikreplenie]           NVARCHAR (1)     NULL,
    CONSTRAINT [aaaaaPatient_PK] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [FIO]
    ON [dbo].[Patient]([LastName] ASC, [FirstName] ASC, [SecondName] ASC);


GO
CREATE NONCLUSTERED INDEX [idxPatient_isMoscow]
    ON [dbo].[Patient]([isMoscow] ASC);


GO
CREATE NONCLUSTERED INDEX [idxPatient_CardNum]
    ON [dbo].[Patient]([CardNum] ASC);


GO
CREATE NONCLUSTERED INDEX [idxPatientBirthDateAndId]
    ON [dbo].[Patient]([BirthDate] ASC, [ID] ASC)
    INCLUDE([FirstName], [SecondName], [LastName], [Sex], [LastDate], [SeriyaPasporta], [NomerPasporta], [CardNum]);


GO
CREATE NONCLUSTERED INDEX [idxPatient_UpdateTime]
    ON [dbo].[Patient]([Updatetime] ASC);


GO
CREATE NONCLUSTERED INDEX [idxPatientUserLocked]
    ON [dbo].[Patient]([UserLocked] ASC)
    INCLUDE([LockTime]);


GO
CREATE NONCLUSTERED INDEX [anon]
    ON [dbo].[Patient]([Anon] ASC);


GO
Create Trigger Patient_ChangeCardLocation
On dbo.Patient
After Insert, Update
AS begin
	set nocount on
	declare @t table (id int identity(1,1), Patid int, Location nvarchar(100), SDate datetime)
	insert into @t
		(Patid, Location, SDate)
		select ID, dbo.fnPatCardLocation(ID), SectionSDate
		from inserted
		where dbo.fnPatCardLocation(ID) is not null
		
	declare @CurrDate datetime
	set @CurrDate=convert(datetime,convert(nvarchar,GetDate(),102),102)
	delete from dbo.CardLocation where ID in
		(
		select CardLocation.ID
		from dbo.CardLocation, @t as t, dbo.CardLocation cl2
		where
			t.Patid=CardLocation.MasterID
			and (CardLocation.CurrentLocation<>1 or CardLocation.CurrentLocation is null)
			and IsNull(t.SDate, @CurrDate)<=CardLocation.SDate
			and t.Location=CardLocation.Location
			and cl2.MasterID=CardLocation.MasterID
			and cl2.SDate<CardLocation.SDate
		)
	delete from CardLocation where ID in
		(
		select CardLocation.ID
		from CardLocation, @t as t
		where
			t.Patid=CardLocation.MasterID
			and (CardLocation.CurrentLocation<>1 or CardLocation.CurrentLocation is null)
			and IsNull(t.SDate, @CurrDate)<=CardLocation.SDate
			and t.Location<>CardLocation.Location
		)
	update CardLocation
		set SDate= null
		from @t as t
		where
			t.Patid=CardLocation.MasterID
			and CardLocation.CurrentLocation=1
			and t.SDate<=CardLocation.SDate
			and t.Location=CardLocation.Location
	update CardLocation
		set SDate= IsNull(IsNull(t.SDate, CardLocation.SDate), @CurrDate)
		from @t as t
		where
			t.Patid=CardLocation.MasterID
			and t.Location=CardLocation.Location
			and CardLocation.SDate=
			(
				select max(SDate)
				from CardLocation cl2
				where cl2.MasterID=CardLocation.MasterID
			)
	delete from @t
		where id in
		(
			select t.id
			from @t as t, CardLocation
			where t.Patid=CardLocation.MasterID and t.Location=CardLocation.Location and CardLocation.SDate=
			(
				select max(SDate)
				from CardLocation cl2
				where cl2.MasterID=CardLocation.MasterID
			)
		)
	insert into CardLocation
		(id, MasterID, Location, SDate)
		select id+IsNull((select max(ID) from dbo.CardLocation),1), Patid, Location, IsNull(SDate,@CurrDate)
		from @t

end
GO

CREATE TRIGGER [dbo].[CHANGETRACKING] 
ON dbo.Patient 
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON

	UPDATE dbo.Patient
		SET
			DateOfLastChange = GETDATE(),
			b_karta_aktualna = 0 
		WHERE ID IN (
			SELECT
				i.ID
				FROM INSERTED as i, deleted p
				where
					p.ID = i.ID
					AND (
						i.LastName <> p.LastName
						OR i.FirstName <> p.FirstName
						OR i.SecondName<>p.SecondName
						or i.CardNum <> p.CardNum
						or i.Section <> p.Section
						or i.BirthDate <> p.BirthDate
					)
		)
END
GO