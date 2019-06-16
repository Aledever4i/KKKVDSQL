CREATE PROCEDURE dbo.FOMSImportHReport
    @Xml xml
AS
BEGIN
    EXEC dbo.FOMSReportHClear

    DECLARE 
        @ZapXml xml = NULL,
        @SLXml xml = NULL,
        @USLXml xml = NULL,
        @ZapId int = NULL,
        @SLId int = NULL

    INSERT INTO dbo.FOMS_H_SCHET (
        CODE,
        CODE_MO,
        [YEAR],
        [MONTH],
        NSCHET,
        DSCHET,
        PLAT,
        SUMMAV,
        COMENTS,
        SUMMAP,
        SANK_MEK,
        SANK_MEE,
        SANK_EKMP
        )
        SELECT
	        a.value('CODE[1]', 'int') AS CODE,
	        a.value('CODE_MO[1]', 'varchar(6)') AS CODE_MO,
	        a.value('YEAR[1]', 'int') AS [YEAR],
	        a.value('MONTH[1]', 'int') AS [MONTH],
	        a.value('NSCHET[1]', 'varchar(15)') AS NSCHET,
	        a.value('DSCHET[1]', 'date') AS DSCHET,
	        a.value('PLAT[1]', 'varchar(5)') AS PLAT,
	        a.value('SUMMAV[1]', 'decimal') AS SUMMAV,
	        a.value('COMENTS[1]', 'varchar(250)') AS COMENTS,
	        a.value('SUMMAP[1]', 'decimal') AS SUMMAP,
	        a.value('SANK_MEK[1]', 'decimal') AS SANK_MEK,
	        a.value('SANK_MEE[1]', 'decimal') AS SANK_MEE,
	        a.value('SANK_EKMP[1]', 'decimal') AS SANK_EKMP
	        FROM @Xml.nodes('ZL_LIST/SCHET') AS zl(a)

    DECLARE zap_cursor CURSOR FOR   
	    SELECT
		    a.query('(ZAP)')
		    FROM @Xml.nodes('ZL_LIST') AS zl(a)
    OPEN zap_cursor  

    FETCH NEXT FROM zap_cursor INTO @ZapXml
    WHILE @@FETCH_STATUS = 0  
    BEGIN
	    SET @SLXml = NULL
        SET @ZapId = NULL

        INSERT INTO dbo.FOMS_H_ZAP (
            N_ZAP,
            PR_NOV
            )
	        SELECT
		        a.value('N_ZAP[1]', 'int') AS N_ZAP,
		        a.value('PR_NOV[1]', 'int') AS PR_NOV
		        FROM @ZapXml.nodes('ZAP') AS zap(a)

        SET @ZapId = SCOPE_IDENTITY()

        INSERT INTO dbo.FOMS_H_PACIENT (
            ZapId,
            ID_PAC,
            VPOLIS,
            SPOLIS,
            NPOLIS,
            ST_OKATO,
            SMO,
            SMO_OGRN,
            SMO_OK,
            SMO_NAM,
            INV,
            MSE,
            NOVOR,
            VNOV_D
            )
	        SELECT
                @ZapId,
		        a.value('ID_PAC[1]', 'varchar(36)') AS ID_PAC,
		        a.value('VPOLIS[1]', 'int') AS VPOLIS,
		        a.value('SPOLIS[1]', 'varchar(10)') AS SPOLIS,
		        a.value('NPOLIS[1]', 'varchar(20)') AS NPOLIS,
		        a.value('ST_OKATO[1]', 'varchar(5)') AS ST_OKATO,
		        a.value('SMO[1]', 'varchar(5)') AS SMO,
		        a.value('SMO_OGRN[1]', 'varchar(15)') AS SMO_OGRN,
		        a.value('SMO_OK[1]', 'varchar(5)') AS SMO_OK,
		        a.value('SMO_NAM[1]', 'varchar(100)') AS SMO_NAM,
		        a.value('INV[1]', 'varchar(10)') AS INV, -- определить тип
		        a.value('MSE[1]', 'varchar(10)') AS MSE, -- определить тип
		        a.value('NOVOR[1]', 'varchar(9)') AS NOVOR,
		        a.value('VNOV_D[1]', 'int') AS VNOV_D
		        FROM @ZapXml.nodes('ZAP/PACIENT') AS p(a)

        INSERT INTO dbo.FOMS_H_Z_SL (
            ZapId,
            IDCASE,
            USL_OK,
            VIDPOM,
            FOR_POM,
            NPR_MO,
            NPR_DATE,
            LPU,
            DATE_Z_1,
            DATE_Z_2,
            KD_Z,
            VNOV_M,
            RSLT,
            ISHOD,
            OS_SLUCH,
            VB_P,
            IDSP,
            SUMV,
            OPLATA,
            SUMP,
            SANK_IT
            )
	        SELECT
                @ZapId,
		        a.value('IDCASE[1]', 'int') AS IDCASE,
		        a.value('USL_OK[1]', 'int') AS USL_OK,
		        a.value('VIDPOM[1]', 'int') AS VIDPOM,
		        a.value('FOR_POM[1]', 'int') AS FOR_POM,
		        a.value('NPR_MO[1]', 'varchar(6)') AS NPR_MO,
		        a.value('NPR_DATE[1]', 'date') AS NPR_DATE,
		        a.value('LPU[1]', 'varchar(6)') AS LPU,
		        a.value('DATE_Z_1[1]', 'date') AS DATE_Z_1,
		        a.value('DATE_Z_2[1]', 'date') AS DATE_Z_2,
		        a.value('KD_Z[1]', 'varchar(10)') AS KD_Z, -- определить тип
		        a.value('VNOV_M[1]', 'int') AS VNOV_M,
		        a.value('RSLT[1]', 'int') AS RSLT,
		        a.value('ISHOD[1]', 'int') AS ISHOD,
		        a.value('OS_SLUCH[1]', 'int') AS OS_SLUCH,
		        a.value('VB_P[1]', 'varchar(10)') AS VB_P, -- определить тип
		        a.value('IDSP[1]', 'int') AS IDSP,
		        a.value('SUMV[1]', 'decimal') AS SUMV,
		        a.value('OPLATA[1]', 'decimal') AS OPLATA,
		        a.value('SUMP[1]', 'decimal') AS SUMP,
		        a.value('SANK_IT[1]', 'decimal') AS SANK_IT
		        FROM @ZapXml.nodes('ZAP/Z_SL') AS zsl(a)

	    DECLARE sl_cursor CURSOR FOR
		    SELECT
			    a.query('(SL)')
			    FROM @ZapXml.nodes('ZAP/Z_SL') AS z(a)
			
	    OPEN sl_cursor
	    FETCH NEXT FROM sl_cursor INTO @SLXml
	    WHILE @@FETCH_STATUS = 0  
	    BEGIN
            SET @SLId = NULL

            INSERT INTO dbo.FOMS_H_SL (
                ZapId,
                SL_ID,
                LPU_1,
                PODR,
                PROFIL,
                PROFIL_K,
                DET,
                P_CEL,
                NHISTORY,
                P_PER,
                DATE_1,
                DATE_2,
                KD,
                DS0,
                DS1,
                DS2,
                DS3,
                DN,
                CODE_MES1,
                CODE_MES2,
                REAB,
                PRVS,
                VERS_SPEC,
                IDDOKT,
                ED_COL,
                TARIF,
                SUM_M,
                COMENTSL
                )
		        SELECT
                    @ZapId,
			        a.value('SL_ID[1]', 'varchar(36)') AS SL_ID,
			        a.value('LPU_1[1]', 'varchar(8)') AS LPU_1,
			        a.value('PODR[1]', 'int') AS PODR,
			        a.value('PROFIL[1]', 'int') AS PROFIL,
			        a.value('PROFIL_K[1]', 'int') AS PROFIL_K, -- определить тип
			        a.value('DET[1]', 'int') AS DET,
			        a.value('P_CEL[1]', 'varchar(20)') AS P_CEL, -- определить тип
			        a.value('NHISTORY[1]', 'varchar(50)') AS NHISTORY,
			        a.value('P_PER[1]', 'int') AS P_PER, -- определить тип
			        a.value('DATE_1[1]', 'date') AS DATE_1,
			        a.value('DATE_2[1]', 'date') AS DATE_2,
			        a.value('KD[1]', 'varchar(20)') AS KD, -- определить тип
			        a.value('DS0[1]', 'varchar(10)') AS DS0,
			        a.value('DS1[1]', 'varchar(10)') AS DS1,
			        a.value('DS2[1]', 'varchar(10)') AS DS2,
			        a.value('DS3[1]', 'varchar(10)') AS DS3,
			        a.value('DN[1]', 'varchar(20)') AS DN, -- определить тип
			        a.value('CODE_MES1[1]', 'varchar(20)') AS CODE_MES1,
			        a.value('CODE_MES2[1]', 'varchar(20)') AS CODE_MES2,
			        a.value('REAB[1]', 'varchar(20)') AS REAB, -- определить тип
			        a.value('PRVS[1]', 'int') AS PRVS,
			        a.value('VERS_SPEC[1]', 'varchar(4)') AS VERS_SPEC,
			        a.value('IDDOKT[1]', 'varchar(25)') AS IDDOKT,
			        a.value('ED_COL[1]', 'decimal') AS ED_COL,
			        a.value('TARIF[1]', 'decimal') AS TARIF,
			        a.value('SUM_M[1]', 'decimal') AS SUM_M,
			        a.value('COMENTSL[1]', 'varchar(250)') AS COMENTSL
			        FROM @SLXml.nodes('SL') AS sl(a)

            SET @SLId = SCOPE_IDENTITY()

            INSERT INTO dbo.FOMS_H_KSG_KPG (
                SlId,
                N_KSG,
                VER_KSG,
                KSG_PG,
                N_KPG,
                KOEF_Z,
                KOEF_UP,
                BZTSZ,
                KOEF_D,
                KOEF_U,
                DKK1,
                DKK2,
                SL_K,
                IT_SL
                )
		        SELECT
                    @SLId,
			        a.value('N_KSG[1]', 'varchar(36)') AS N_KSG,
			        a.value('VER_KSG[1]', 'int') AS VER_KSG, -- определить тип
			        a.value('KSG_PG[1]', 'int') AS KSG_PG, -- определить тип
			        a.value('N_KPG[1]', 'varchar(20)') AS N_KPG, -- определить тип
			        a.value('KOEF_Z[1]', 'decimal') AS KOEF_Z, -- определить тип
			        a.value('KOEF_UP[1]', 'decimal') AS KOEF_UP, -- определить тип
			        a.value('BZTSZ[1]', 'decimal') AS BZTSZ, -- определить тип
			        a.value('KOEF_D[1]', 'decimal') AS KOEF_D, -- определить тип
			        a.value('KOEF_U[1]', 'decimal') AS KOEF_U, -- определить тип
			        a.value('DKK1[1]', 'varchar(20)') AS DKK1, -- определить тип
			        a.value('DKK2[1]', 'varchar(20)') AS DKK2, -- определить тип
			        a.value('SL_K[1]', 'int') AS SL_K, -- определить тип
			        a.value('IT_SL[1]', 'varchar(20)') AS IT_SL -- определить тип
			        FROM @SLXml.nodes('SL/KSG_KPG') AS ksg(a)

            INSERT INTO dbo.FOMS_H_SANK (
                SlId,
                S_CODE,
                S_SUM,
                S_TIP,
                S_OSN,
                S_COM,
                S_IST
                )
		        SELECT
                    @SLId,
			        a.value('S_CODE[1]', 'varchar(36)') AS S_CODE,
			        a.value('S_SUM[1]', 'decimal') AS S_SUM,
			        a.value('S_TIP[1]', 'int') AS S_TIP,
			        a.value('S_OSN[1]', 'int') AS S_OSN,
			        a.value('S_COM[1]', 'varchar(250)') AS S_COM,
			        a.value('S_IST[1]', 'int') AS S_IST
			        FROM @SLXml.nodes('SL/SANK') AS sank(a)
	
            INSERT INTO dbo.FOMS_H_USL (
                SlId,
                IDSERV,
                LPU,
                LPU_1,
                PODR,
                PROFIL,
                VID_VME,
                DET,
                DATE_IN,
                DATE_OUT,
                DS,
                CODE_USL,
                KOL_USL,
                TARIF,
                SUMV_USL,
                PRVS,
                CODE_MD,
                NPL,
                COMENTU
                )
		        SELECT
                    @SLId,
			        a.value('IDSERV[1]', 'varchar(36)') AS IDSERV,
			        a.value('LPU[1]', 'varchar(6)') AS LPU,
			        a.value('LPU_1[1]', 'varchar(8)') AS LPU_1,
			        a.value('PODR[1]', 'int') AS PODR,
			        a.value('PROFIL[1]', 'int') AS PROFIL,
			        a.value('VID_VME[1]', 'varchar(15)') AS VID_VME,
			        a.value('DET[1]', 'int') AS DET,
			        a.value('DATE_IN[1]', 'date') AS DATE_IN,
			        a.value('DATE_OUT[1]', 'date') AS DATE_OUT,
			        a.value('DS[1]', 'varchar(10)') AS DS,
			        a.value('CODE_USL[1]', 'varchar(20)') AS CODE_USL,
			        a.value('KOL_USL[1]', 'decimal') AS KOL_USL,
			        a.value('TARIF[1]', 'decimal') AS TARIF,
			        a.value('SUMV_USL[1]', 'decimal') AS SUMV_USL,
			        a.value('PRVS[1]', 'int') AS PRVS,
			        a.value('CODE_MD[1]', 'varchar(20)') AS CODE_MD,
			        a.value('NPL[1]', 'varchar(20)') AS NPL, -- определить тип
			        a.value('COMENTU[1]', 'varchar(100)') AS COMENTU
			        FROM @SLXml.nodes('SL/USL') AS u(a)

		    FETCH NEXT FROM sl_cursor INTO @SLXml
	    END

	    CLOSE sl_cursor
	    DEALLOCATE sl_cursor
		
	    FETCH NEXT FROM zap_cursor INTO @ZapXml
    END

    CLOSE zap_cursor
    DEALLOCATE zap_cursor
END