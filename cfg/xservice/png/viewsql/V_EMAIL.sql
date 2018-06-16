REPLACE VIEW MDM.V_EMAIL 
                AS LOCKING ROW FOR ACCESS 

                SELECT
                EM.REGIS_PRSNA_ID
                ,EM.SUBSCRPTN_OPT_IND
                ,EM.CNSMR_CHCE_DATETM
                ,EM.PREF_CNTCT_POINT_IND
                ,EM.EMAIL_ADDR_TXT
                ,EM.CNTCT_POINT_CATEG_CODE
                ,EM.SUBSCRPTN_OPT_NBR
                ,EM.MKTNG_PGM_NBR
                ,EM.LEGAL_ENT_NBR
                ,SO.SUBSCRPTN_OPT_NAME
                ,SO.SUBSCRPTN_OPT_STMT_TXT
                ,NULL (INTEGER)   AS  SYS_TARGET_ID
                ,NULL (VARCHAR(25))  AS SYS_AUTH_ID
                ,NULL (VARCHAR(25))  AS SYS_SOURCE
                ,NULL (VARCHAR(70))  AS SYS_CREATED_BY
                ,NULL (TIMESTAMP(0))  AS SYS_CREATION_DATE
                ,'ACTIVE'  (VARCHAR(25))  AS  SYS_ENT_STATE
                ,NULL (VARCHAR(70))  AS SYS_LAST_MODIFIED_BY
                ,NULL (TIMESTAMP(0))  AS SYS_LAST_MODIFIED_DATE
                ,NULL (VARCHAR(25))  AS SYS_NC_TYPE
                ,NULL (VARCHAR(10000))  AS SYS_ERR_CODE
                ,NULL (VARCHAR(30))  AS SYS_ERR_SVRTY   
                FROM MDM.REGIS_PRSNA_EMAIL_ADDR EM
                LEFT JOIN         
              (SEL * FROM  MDM.SUBSCRPTN_OPT )SO
                ON
                EM.MKTNG_PGM_NBR=SO.MKTNG_PGM_NBR
                AND 
                EM.LEGAL_ENT_NBR=SO.LEGAL_ENT_NBR
                AND
                EM.SUBSCRPTN_OPT_NBR=SO.SUBSCRPTN_OPT_NBR;