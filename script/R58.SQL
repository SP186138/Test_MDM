.logon $TDPID/$TDUSER,$TDPWD
 
.SET ERROROUT STDOUT ;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
.SET SESSION CHARSET 'UTF8' ;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.GOTO $Step

.LABEL L1

REPLACE VIEW MDM.WS_CAMPAIGN_SGMNT_CNSMR
(	
 MKTNG_PGM_NBR,
  REGIS_PRSNA_ID,
 REGIS_CNSMR_ID_VAL,
 DATA_SRCE_NBR ,
 CAMPAIGN_LEAD_KEY,
 SYS_TARGET_ID,
 SYS_AUTH_ID,
 SYS_SOURCE,
 SYS_CREATED_BY,
 SYS_CREATION_DATE,
 SYS_ENT_STATE,
 SYS_LAST_MODIFIED_BY,
 SYS_LAST_MODIFIED_DATE,
 SYS_NC_TYPE,
 SYS_ERR_CODE,
 SYS_ERR_SVRTY 
) 
AS
LOCKING ROW FOR ACCESS 
SELECT
B.MKTNG_PGM_NBR, 
B.REGIS_PRSNA_ID,
B.REGIS_CNSMR_ID_VAL,
B.DATA_SRCE_NBR,
A.CAMPAIGN_LEAD_KEY,
NULL (INTEGER) 		AS  SYS_TARGET_ID,
NULL (VARCHAR(1000)) 	AS SYS_AUTH_ID,
NULL (VARCHAR(256)) 	AS SYS_SOURCE,
NULL (VARCHAR(70)) 	AS SYS_CREATED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_CREATION_DATE,
NULL  (VARCHAR(25)) 	AS  SYS_ENT_STATE,
NULL (VARCHAR(70)) 	AS SYS_LAST_MODIFIED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_LAST_MODIFIED_DATE, 
NULL (VARCHAR(25)) 	AS SYS_NC_TYPE,
NULL (VARCHAR(10000)) 	AS SYS_ERR_CODE,
NULL (VARCHAR(30)) 	AS SYS_ERR_SVRTY
FROM MDM.CAMPAIGN_SGMNT_CNSMR A
INNER JOIN MDM.REGIS_PRSNA B
ON A.MKTNG_PGM_NBR=B.MKTNG_PGM_NBR
AND A.REGIS_PRSNA_ID=B.REGIS_PRSNA_ID;

 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L2

REPLACE	VIEW MDM.WS_OPT_STATUS
(
 MKTNG_PGM_NBR,
 REGIS_PRSNA_ID,
 REGIS_CNSMR_ID_VAL,
 DATA_SRCE_NBR,
 SUBSCRPTN_OPT_NBR, 
 SUBSCRPTN_OPT_IND, 
 CNTCT_POINT_CATEG_CODE,
 CNSMR_CHCE_DATETM,
 SYS_TARGET_ID,
 SYS_AUTH_ID,
 SYS_SOURCE,
 SYS_CREATED_BY,
 SYS_CREATION_DATE,
 SYS_ENT_STATE,
 SYS_LAST_MODIFIED_BY,
 SYS_LAST_MODIFIED_DATE,
 SYS_NC_TYPE,
 SYS_ERR_CODE,
 SYS_ERR_SVRTY ) 
AS LOCKING ROW FOR ACCESS  
SELECT 
B.MKTNG_PGM_NBR,
B.REGIS_PRSNA_ID,
B.REGIS_CNSMR_ID_VAL,
B.DATA_SRCE_NBR,
A.SUBSCRPTN_OPT_NBR, 
A.SUBSCRPTN_OPT_IND, 
A.CNTCT_POINT_CATEG_CODE,
A.CNSMR_CHCE_DATETM,
NULL (INTEGER) 		AS  SYS_TARGET_ID,
NULL (VARCHAR(1000)) 	AS SYS_AUTH_ID,
NULL (VARCHAR(256)) 	AS SYS_SOURCE,
NULL (VARCHAR(70)) 	AS SYS_CREATED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_CREATION_DATE,
NULL  (VARCHAR(25)) 	AS  SYS_ENT_STATE,
NULL (VARCHAR(70)) 	AS SYS_LAST_MODIFIED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_LAST_MODIFIED_DATE, 
NULL (VARCHAR(25)) 	AS SYS_NC_TYPE,
NULL (VARCHAR(10000)) 	AS SYS_ERR_CODE,
NULL (VARCHAR(30)) 	AS SYS_ERR_SVRTY   
FROM MDM.REGIS_PRSNA_EMAIL_ADDR A
INNER JOIN MDM.REGIS_PRSNA B
ON A.MKTNG_PGM_NBR=B.MKTNG_PGM_NBR
AND A.REGIS_PRSNA_ID=B.REGIS_PRSNA_ID
WHERE A.SUBSCRPTN_OPT_NBR IS NOT NULL
UNION ALL
SEL
B.MKTNG_PGM_NBR,
B.REGIS_PRSNA_ID, 
B.REGIS_CNSMR_ID_VAL,
B.DATA_SRCE_NBR,
A.SUBSCRPTN_OPT_NBR, 
A.SUBSCRPTN_OPT_IND, 
A.CNTCT_POINT_CATEG_CODE,
A.CNSMR_CHCE_DATETM,
NULL (INTEGER) 		AS  SYS_TARGET_ID,
NULL (VARCHAR(1000)) 	AS SYS_AUTH_ID,
NULL (VARCHAR(256)) 	AS SYS_SOURCE,
NULL (VARCHAR(70)) 	AS SYS_CREATED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_CREATION_DATE,
NULL  (VARCHAR(25)) 	AS  SYS_ENT_STATE,
NULL (VARCHAR(70)) 	AS SYS_LAST_MODIFIED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_LAST_MODIFIED_DATE, 
NULL (VARCHAR(25)) 	AS SYS_NC_TYPE,
NULL (VARCHAR(10000)) 	AS SYS_ERR_CODE,
NULL (VARCHAR(30)) 	AS SYS_ERR_SVRTY  
FROM MDM.REGIS_PRSNA_POSTL_ADDR A
INNER JOIN MDM.REGIS_PRSNA B
ON A.MKTNG_PGM_NBR=B.MKTNG_PGM_NBR
AND A.REGIS_PRSNA_ID=B.REGIS_PRSNA_ID
WHERE A.SUBSCRPTN_OPT_NBR IS NOT NULL
UNION ALL
SEL
B.MKTNG_PGM_NBR,
B.REGIS_PRSNA_ID, 
B.REGIS_CNSMR_ID_VAL,
B.DATA_SRCE_NBR,
A.SUBSCRPTN_OPT_NBR, 
A.SUBSCRPTN_OPT_IND, 
A.CNTCT_POINT_CATEG_CODE,
A.CNSMR_CHCE_DATETM ,
NULL (INTEGER) 		AS  SYS_TARGET_ID,
NULL (VARCHAR(1000)) 	AS SYS_AUTH_ID,
NULL (VARCHAR(256)) 	AS SYS_SOURCE,
NULL (VARCHAR(70)) 	AS SYS_CREATED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_CREATION_DATE,
NULL (VARCHAR(25)) 	AS  SYS_ENT_STATE,
NULL (VARCHAR(70)) 	AS SYS_LAST_MODIFIED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_LAST_MODIFIED_DATE, 
NULL (VARCHAR(25)) 	AS SYS_NC_TYPE,
NULL (VARCHAR(10000)) 	AS SYS_ERR_CODE,
NULL (VARCHAR(30)) 	AS SYS_ERR_SVRTY 
FROM MDM.REGIS_PRSNA_PHONE A
INNER JOIN MDM.REGIS_PRSNA B
ON A.MKTNG_PGM_NBR=B.MKTNG_PGM_NBR
AND A.REGIS_PRSNA_ID=B.REGIS_PRSNA_ID
WHERE A.SUBSCRPTN_OPT_NBR IS NOT NULL
UNION ALL
SEL
B.MKTNG_PGM_NBR,
B.REGIS_PRSNA_ID, 
B.REGIS_CNSMR_ID_VAL,
B.DATA_SRCE_NBR,
A.SUBSCRPTN_OPT_NBR, 
A.SUBSCRPTN_OPT_IND, 
A.CNTCT_POINT_CATEG_CODE,
A.CNSMR_CHCE_DATETM,
NULL (INTEGER) 		AS  SYS_TARGET_ID,
NULL (VARCHAR(1000)) 	AS SYS_AUTH_ID,
NULL (VARCHAR(256)) 	AS SYS_SOURCE,
NULL (VARCHAR(70)) 	AS SYS_CREATED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_CREATION_DATE,
NULL  (VARCHAR(25)) 	AS  SYS_ENT_STATE,
NULL (VARCHAR(70)) 	AS SYS_LAST_MODIFIED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_LAST_MODIFIED_DATE, 
NULL (VARCHAR(25)) 	AS SYS_NC_TYPE,
NULL (VARCHAR(10000)) 	AS SYS_ERR_CODE,
NULL (VARCHAR(30)) 	AS SYS_ERR_SVRTY  
FROM MDM.REGIS_PRSNA_SOC_NET_ACCT A
INNER JOIN MDM.REGIS_PRSNA B
ON A.MKTNG_PGM_NBR=B.MKTNG_PGM_NBR
AND A.REGIS_PRSNA_ID=B.REGIS_PRSNA_ID
WHERE A.SUBSCRPTN_OPT_NBR IS NOT NULL
;

 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L3
 
REPLACE	VIEW  MDM.WS_MATCHD_CNSMR_PRSNA_TRT 
(MKTNG_PGM_NBR, 
REGIS_PRSNA_ID,
 REGIS_CNSMR_ID_VAL,
 DATA_SRCE_NBR,
 MATCHD_CNSMR_PRSNA_ID, 
 TRT_NAME,
 MATCHD_PRSNA_TRT_TXT,
 MATCHD_PRSNA_TRT_DATE,
 SYS_TARGET_ID,
 SYS_AUTH_ID,
 SYS_SOURCE,
 SYS_CREATED_BY,
 SYS_CREATION_DATE,
 SYS_ENT_STATE,
 SYS_LAST_MODIFIED_BY,
 SYS_LAST_MODIFIED_DATE,
 SYS_NC_TYPE,
 SYS_ERR_CODE,
 SYS_ERR_SVRTY ) 
AS   
SELECT 
B.MKTNG_PGM_NBR,
B.REGIS_PRSNA_ID, 
B.REGIS_CNSMR_ID_VAL,
B.DATA_SRCE_NBR,
A.MATCHD_CNSMR_PRSNA_ID, 
C.TRT_NAME,
A.MATCHD_PRSNA_TRT_TXT,
A.MATCHD_PRSNA_TRT_DATE,
NULL (INTEGER) 		AS  SYS_TARGET_ID,
NULL (VARCHAR(1000)) 	AS SYS_AUTH_ID,
NULL (VARCHAR(256)) 	AS SYS_SOURCE,
NULL (VARCHAR(70)) 	AS SYS_CREATED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_CREATION_DATE,
NULL (VARCHAR(25)) 	AS  SYS_ENT_STATE,
NULL (VARCHAR(70)) 	AS SYS_LAST_MODIFIED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_LAST_MODIFIED_DATE, 
NULL (VARCHAR(25)) 	AS SYS_NC_TYPE,
NULL (VARCHAR(10000)) 	AS SYS_ERR_CODE,
NULL (VARCHAR(30)) 	AS SYS_ERR_SVRTY   
FROM MDM.MATCHD_CNSMR_PRSNA_TRT A
INNER JOIN MDM.REGIS_PRSNA B
ON A.LEGAL_ENT_NBR=B.LEGAL_ENT_NBR
AND A.MATCHD_CNSMR_PRSNA_ID=B.MATCHD_CNSMR_PRSNA_ID
INNER JOIN MDM.TRT C
ON A.TRT_NBR=C.TRT_NBR;

 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L4

REPLACE	VIEW  MDM.WS_PROD_ITEM_HIER_ASSOC
(
 SECTOR_CODE           ,   
 SECTOR_NAME,
 SUB_SECTOR_CODE               ,
 SUB_SECTOR_NAME,
 CATEG_CODE                    ,
 CATEG_NAME,
 SEG_CODE                      ,
 SEG_NAME,
 SUB_BRAND_CODE                ,
 SUB_BRAND_NAME,
 BRAND_CODE                    ,
 BRAND_NAME,
 ITEM_VERS_CODE                ,
 GLOBAL_FORM_CODE              ,
 PROD_ITEM_UPC                 ,
 PROD_ITEM_NAME ,
 SYS_TARGET_ID,
 SYS_AUTH_ID,
 SYS_SOURCE,
 SYS_CREATED_BY,
 SYS_CREATION_DATE,
 SYS_ENT_STATE,
 SYS_LAST_MODIFIED_BY,
 SYS_LAST_MODIFIED_DATE,
 SYS_NC_TYPE,
 SYS_ERR_CODE,
 SYS_ERR_SVRTY ) 
AS LOCKING ROW FOR ACCESS
SELECT
A.SECTOR_CODE           ,   
G.SECTOR_NAME,
A.SUB_SECTOR_CODE               ,
D.SUB_SECTOR_NAME,
A.CATEG_CODE                    ,
B.CATEG_NAME,
A.SEG_CODE                      ,
C.SEG_NAME,
A.SUB_BRAND_CODE                ,
F.SUB_BRAND_NAME,
A.BRAND_CODE                    ,
E.BRAND_NAME,
A.ITEM_VERS_CODE                ,
A.GLOBAL_FORM_CODE              ,
A.PROD_ITEM_UPC                 ,
H.PROD_ITEM_NAME,
NULL (INTEGER) 		AS  SYS_TARGET_ID,
NULL (VARCHAR(1000)) 	AS SYS_AUTH_ID,
NULL (VARCHAR(256)) 	AS SYS_SOURCE,
NULL (VARCHAR(70)) 	AS SYS_CREATED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_CREATION_DATE,
NULL  (VARCHAR(25)) 	AS  SYS_ENT_STATE,
NULL (VARCHAR(70)) 	AS SYS_LAST_MODIFIED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_LAST_MODIFIED_DATE, 
NULL (VARCHAR(25)) 	AS SYS_NC_TYPE,
NULL (VARCHAR(10000)) 	AS SYS_ERR_CODE,
NULL (VARCHAR(30)) 	AS SYS_ERR_SVRTY   
FROM 
MDM.PROD_ITEM_HIER_ASSOC A
LEFT JOIN MDM.CATEG B
ON A.CATEG_CODE=B.CATEG_CODE
LEFT JOIN MDM.SEG C
ON A.SEG_CODE=C.SEG_CODE
LEFT JOIN MDM.SUB_SECTOR D
ON A.SUB_SECTOR_CODE=D.SUB_SECTOR_CODE
LEFT JOIN MDM.BRAND E
ON A.BRAND_CODE=E.BRAND_CODE
LEFT JOIN MDM.SUB_BRAND F
ON A.SUB_BRAND_CODE=F.SUB_BRAND_CODE
LEFT JOIN MDM.SECTOR G
ON A.SECTOR_CODE=G.SECTOR_CODE
LEFT JOIN MDM.PROD_ITEM H
ON A.PROD_ITEM_UPC=H.PROD_ITEM_UPC 
;

 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L5

CREATE SET TABLE MDM.WS_CNSMR_DEL ,NO FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO
     (
      MKTNG_PGM_NBR INTEGER NOT NULL,
      REGIS_CNSMR_ID_VAL VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC NOT NULL,
      SOURCE_ID INTEGER,
      SYS_SOURCE VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_TARGET_ID INTEGER,
      SYS_AUTH_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_CREATED_BY VARCHAR(70) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_CREATION_DATE TIMESTAMP(0),
      SYS_LAST_MODIFIED_DATE TIMESTAMP(0),
      SYS_ENT_STATE VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC  DEFAULT 'ACTIVE',
      SYS_LAST_MODIFIED_BY VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_NC_TYPE VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_ERR_CODE VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_ERR_SVRTY VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC )
PRIMARY INDEX CNSMR_DEL_NUPI ( MKTNG_PGM_NBR ,REGIS_CNSMR_ID_VAL ,
SOURCE_ID );

 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L6

REPLACE	VIEW  MDM.WS_CNTNT_ELEM 
(MKTNG_PGM_NBR, 
 CNTNT_ELEM_ID,
 CNTNT_NAME,
 SYS_TARGET_ID,
 SYS_AUTH_ID,
 SYS_SOURCE,
 SYS_CREATED_BY,
 SYS_CREATION_DATE,
 SYS_ENT_STATE,
 SYS_LAST_MODIFIED_BY,
 SYS_LAST_MODIFIED_DATE,
 SYS_NC_TYPE,
 SYS_ERR_CODE,
 SYS_ERR_SVRTY ) 
AS   
SELECT 
B.MKTNG_PGM_NBR, 
B.CNTNT_ELEM_ID,
B.CNTNT_NAME,
NULL (INTEGER) 		AS  SYS_TARGET_ID,
NULL (VARCHAR(1000)) 	AS SYS_AUTH_ID,
NULL (VARCHAR(256)) 	AS SYS_SOURCE,
NULL (VARCHAR(70)) 	AS SYS_CREATED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_CREATION_DATE,
NULL  (VARCHAR(25)) 	AS  SYS_ENT_STATE,
NULL (VARCHAR(70)) 	AS SYS_LAST_MODIFIED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_LAST_MODIFIED_DATE, 
NULL (VARCHAR(25)) 	AS SYS_NC_TYPE,
NULL (VARCHAR(10000)) 	AS SYS_ERR_CODE,
NULL (VARCHAR(30)) 	AS SYS_ERR_SVRTY   
FROM MDM.CNTNT_ELEM B;

 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L7

REPLACE	VIEW  MDM.WS_INCTV 
(MKTNG_PGM_NBR, 
 INCTV_NBR,
 INCTV_NAME,
 INCTV_START_DATE,
 INCTV_END_DATE,
 BRAND_CODE,
 SYS_TARGET_ID,
 SYS_AUTH_ID,
 SYS_SOURCE,
 SYS_CREATED_BY,
 SYS_CREATION_DATE,
 SYS_ENT_STATE,
 SYS_LAST_MODIFIED_BY,
 SYS_LAST_MODIFIED_DATE,
 SYS_NC_TYPE,
 SYS_ERR_CODE,
 SYS_ERR_SVRTY ) 
AS   
SELECT 
B.MKTNG_PGM_NBR, 
B.INCTV_NBR,
B.INCTV_NAME,
B.INCTV_START_DATE,
B.INCTV_END_DATE,
C.BRAND_CODE,
NULL (INTEGER) 		AS  SYS_TARGET_ID,
NULL (VARCHAR(1000)) 	AS SYS_AUTH_ID,
NULL (VARCHAR(256)) 	AS SYS_SOURCE,
NULL (VARCHAR(70)) 	AS SYS_CREATED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_CREATION_DATE,
NULL (VARCHAR(25)) 	AS  SYS_ENT_STATE,
NULL (VARCHAR(70)) 	AS SYS_LAST_MODIFIED_BY,
NULL (TIMESTAMP(0)) 	AS SYS_LAST_MODIFIED_DATE, 
NULL (VARCHAR(25)) 	AS SYS_NC_TYPE,
NULL (VARCHAR(10000)) 	AS SYS_ERR_CODE,
NULL (VARCHAR(30)) 	AS SYS_ERR_SVRTY   
FROM MDM.INCTV B
LEFT JOIN MDM.BRAND C
ON B.BRAND_NAME=C.BRAND_NAME;

 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L8

REPLACE VIEW MDM.REGIS_PRSNA_EMAIL_ADDR (
REGIS_PRSNA_ID
,MKTNG_PGM_NBR
,LEGAL_ENT_NBR
,CNTCT_POINT_CATEG_CODE
,SUBSCRPTN_OPT_NBR
,SUBSCRPTN_OPT_IND
,CNSMR_CHCE_DATETM
,PREF_CNTCT_POINT_IND
,EMAIL_ADDR_TXT
,EMAIL_ADDR_TXT_HASH           
,EMAIL_FORMT_CODE
,VALID_CNTCT_POINT_IND
,GUARDN_NAME
,GUARDN_EMAIL_ADDR_TXT
,GUARDN_CNSNT_IND
,ACNLGMT_DATE
,EMAIL_STATUS_CODE
,DATA_SRCE_NBR
,SYS_SOURCE
,SYS_TARGET_ID
,SYS_AUTH_ID
,SYS_CREATED_BY
,SYS_CREATION_DATE
,SYS_LAST_MODIFIED_DATE
,SYS_ENT_STATE
,SYS_LAST_MODIFIED_BY
,SYS_NC_TYPE
,SYS_ERR_CODE
,SYS_ERR_SVRTY
,LAST_RTN_DATETM
) AS LOCKING ROW FOR ACCESS SEQUENCED  TRANSACTIONTIME SELECT
REGIS_PRSNA_ID
,MKTNG_PGM_NBR
,LEGAL_ENT_NBR
,CNTCT_POINT_CATEG_CODE
,SUBSCRPTN_OPT_NBR
,SUBSCRPTN_OPT_IND
,CNSMR_CHCE_DATETM
,PREF_CNTCT_POINT_IND
,EMAIL_ADDR_TXT
,EMAIL_ADDR_TXT_HASH  
,EMAIL_FORMT_CODE
,VALID_CNTCT_POINT_IND
,GUARDN_NAME
,GUARDN_EMAIL_ADDR_TXT
,GUARDN_CNSNT_IND
,ACNLGMT_DATE
,EMAIL_STATUS_CODE
,DATA_SRCE_NBR
,SYS_SOURCE
,SYS_TARGET_ID
,SYS_AUTH_ID
,SYS_CREATED_BY
,SYS_CREATION_DATE
,SYS_LAST_MODIFIED_DATE
,SYS_ENT_STATE
,SYS_LAST_MODIFIED_BY
,SYS_NC_TYPE
,SYS_ERR_CODE
,SYS_ERR_SVRTY
,LAST_RTN_DATETM
FROM iCRM_TBL.REGIS_PRSNA_EMAIL_ADDR;

 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L9

REPLACE VIEW MDM.REGIS_PRSNA_PHONE (
REGIS_PRSNA_ID
,MKTNG_PGM_NBR
,LEGAL_ENT_NBR
,CNTCT_POINT_CATEG_CODE
,SUBSCRPTN_OPT_NBR
,SUBSCRPTN_OPT_IND
,CNSMR_CHCE_DATETM
,PREF_CNTCT_POINT_IND
,PHONE_CNTRY_NBR
,PHONE_AREA_NBR
,PHONE_EXCHG_NBR
,PHONE_LINE_NBR
,PHONE_EXTSN_NUM
,FULL_PHONE_NUM
,FULL_PHONE_NUM_HASH
,SMS_PREFR_IND
,SMS_AVAIL_START_TIME
,SMS_AVAIL_END_TIME
,VALID_CNTCT_POINT_IND
,GUARDN_NAME
,GUARDN_EMAIL_ADDR_TXT
,GUARDN_CNSNT_IND
,ACNLGMT_DATE
,PHONE_STATUS_CODE
,DATA_SRCE_NBR
,SYS_SOURCE
,SYS_TARGET_ID
,SYS_AUTH_ID
,SYS_CREATED_BY
,SYS_CREATION_DATE
,SYS_LAST_MODIFIED_DATE
,SYS_ENT_STATE
,SYS_LAST_MODIFIED_BY
,SYS_NC_TYPE
,SYS_ERR_CODE
,SYS_ERR_SVRTY
,LAST_RTN_DATETM
) AS LOCKING ROW FOR ACCESS SEQUENCED  TRANSACTIONTIME SELECT
REGIS_PRSNA_ID
,MKTNG_PGM_NBR
,LEGAL_ENT_NBR
,CNTCT_POINT_CATEG_CODE
,SUBSCRPTN_OPT_NBR
,SUBSCRPTN_OPT_IND
,CNSMR_CHCE_DATETM
,PREF_CNTCT_POINT_IND
,PHONE_CNTRY_NBR
,PHONE_AREA_NBR
,PHONE_EXCHG_NBR
,PHONE_LINE_NBR
,PHONE_EXTSN_NUM
,FULL_PHONE_NUM
,FULL_PHONE_NUM_HASH
,SMS_PREFR_IND
,SMS_AVAIL_START_TIME
,SMS_AVAIL_END_TIME
,VALID_CNTCT_POINT_IND
,GUARDN_NAME
,GUARDN_EMAIL_ADDR_TXT
,GUARDN_CNSNT_IND
,ACNLGMT_DATE
,PHONE_STATUS_CODE
,DATA_SRCE_NBR
,SYS_SOURCE
,SYS_TARGET_ID
,SYS_AUTH_ID
,SYS_CREATED_BY
,SYS_CREATION_DATE
,SYS_LAST_MODIFIED_DATE
,SYS_ENT_STATE
,SYS_LAST_MODIFIED_BY
,SYS_NC_TYPE
,SYS_ERR_CODE
,SYS_ERR_SVRTY
,LAST_RTN_DATETM
FROM iCRM_TBL.REGIS_PRSNA_PHONE;

 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L10

REPLACE VIEW MDM.REGIS_PRSNA_SOC_NET_ACCT (
  REGIS_PRSNA_ID
 ,MKTNG_PGM_NBR
 ,LEGAL_ENT_NBR
 ,CNTCT_POINT_CATEG_CODE
 ,SUBSCRPTN_OPT_NBR
 ,SUBSCRPTN_OPT_IND
 ,CNSMR_CHCE_DATETM
 ,PREF_CNTCT_POINT_IND
 ,SOCIAL_NETWK_ACCT_ID_VAL
 ,SOCIAL_NETWK_ACCT_ID_VAL_HASH
 ,VALID_CNTCT_POINT_IND
 ,GUARDN_NAME
 ,GUARDN_EMAIL_ADDR_TXT
 ,GUARDN_CNSNT_IND
 ,ACNLGMT_DATE
 ,SOC_NET_STATUS_CODE
 ,DATA_SRCE_NBR
 ,SYS_SOURCE
 ,SYS_TARGET_ID
 ,SYS_AUTH_ID
 ,SYS_CREATED_BY
 ,SYS_CREATION_DATE
 ,SYS_LAST_MODIFIED_DATE
 ,SYS_ENT_STATE
 ,SYS_LAST_MODIFIED_BY
 ,SYS_NC_TYPE
 ,SYS_ERR_CODE
 ,SYS_ERR_SVRTY
  ,LAST_RTN_DATETM
) AS LOCKING ROW FOR ACCESS SEQUENCED  TRANSACTIONTIME SELECT
  REGIS_PRSNA_ID
 ,MKTNG_PGM_NBR
 ,LEGAL_ENT_NBR
 ,CNTCT_POINT_CATEG_CODE
 ,SUBSCRPTN_OPT_NBR
 ,SUBSCRPTN_OPT_IND
 ,CNSMR_CHCE_DATETM
 ,PREF_CNTCT_POINT_IND
 ,SOCIAL_NETWK_ACCT_ID_VAL
 ,SOCIAL_NETWK_ACCT_ID_VAL_HASH
 ,VALID_CNTCT_POINT_IND
 ,GUARDN_NAME
 ,GUARDN_EMAIL_ADDR_TXT
 ,GUARDN_CNSNT_IND
 ,ACNLGMT_DATE
 ,SOC_NET_STATUS_CODE
 ,DATA_SRCE_NBR
 ,SYS_SOURCE
 ,SYS_TARGET_ID
 ,SYS_AUTH_ID
 ,SYS_CREATED_BY
 ,SYS_CREATION_DATE
 ,SYS_LAST_MODIFIED_DATE
 ,SYS_ENT_STATE
 ,SYS_LAST_MODIFIED_BY
 ,SYS_NC_TYPE
 ,SYS_ERR_CODE
 ,SYS_ERR_SVRTY
  ,LAST_RTN_DATETM
FROM iCRM_TBL.REGIS_PRSNA_SOC_NET_ACCT;

 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L11

REPLACE VIEW MDM.CAMPAIGN AS LOCKING ROW FOR ACCESS SELECT * FROM ICRM_TBL.CAMPAIGN;

 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L12

REPLACE VIEW mdm.REGIS_PRSNA_RPLNSH_INST 
(RPLNSH_INST_ID,
 MKTNG_PGM_NBR,
 DATA_SRCE_NBR,
 REGIS_PRSNA_ID,
 RPLNSH_ID,
 PROD_ITEM_UPC,
 LYLTY_ACCT_NUM,
 LYLTY_PGM_NBR,
 REGIS_CNSMR_ID_VAL,
 CREATE_DATETM,
 NEXT_ORDER_DATE,
 RPLNSH_INST_STATUS_CODE,
 RPLNSH_INST_STATUS_DATETM,
 FREQ_DAYS,
 PROD_ITEM_QTY,
 ORIG_ORDER_ID,
 CNCLTN_RSN_CODE,
 LOG_SOURCE_ID,
 LOG_LOAD_ID,
 LOG_UPDATE_USER)
AS LOCKING ROW FOR ACCESS SEQUENCED  TRANSACTIONTIME SELECT
 RPLNSH_INST_ID,
 MKTNG_PGM_NBR,
 DATA_SRCE_NBR,
 REGIS_PRSNA_ID,
 RPLNSH_ID,
 PROD_ITEM_UPC,
 LYLTY_ACCT_NUM,
 LYLTY_PGM_NBR,
 REGIS_CNSMR_ID_VAL,
 CREATE_DATETM,
 NEXT_ORDER_DATE,
 RPLNSH_INST_STATUS_CODE,
 RPLNSH_INST_STATUS_DATETM,
 FREQ_DAYS,
 PROD_ITEM_QTY,
 ORIG_ORDER_ID,
 CNCLTN_RSN_CODE,
 LOG_SOURCE_ID,
 LOG_LOAD_ID,
 LOG_UPDATE_USER
FROM ICRM_TBL.REGIS_PRSNA_RPLNSH_INST;

 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L13

REPLACE VIEW MDM.DATA_SRCE_MKTNG_PGM AS LOCKING ROW FOR ACCESS SELECT * FROM iCRM_TBL.DATA_SRCE_MKTNG_PGM;


 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
  .LABEL L14
  
  INS ATTRIBUTE_types
  (ATTRIBUTE_TYPE_ID             ,
  ATTRIBUTE_TYPE                ,
  DISPLAY_NAME                  ,
  DATA_TYPE                     ,
  DATA_FORMAT                   ,
  DATA_LENGTH                   ,
  SELECTION_METHOD              ,
  AV_CODE_FLAG                  ,
  AV_SHORT_NAME_FLAG            ,
  USER_MANAGED_FLAG             ,
  API                           ,
  SYS_TARGET_ID                 ,
  SYS_AUTH_ID                   ,
  SYS_SOURCE                    ,
  SYS_CREATED_BY                ,
  SYS_CREATION_DATE             ,
  SYS_ENT_STATE                 ,
  SYS_LAST_MODIFIED_BY          ,
  SYS_LAST_MODIFIED_DATE        ,
  SYS_NC_TYPE                   ,
  SYS_ERR_CODE                  ,
  SYS_ERR_SVRTY                 )
  SEL
  MAX(attribute_type_id)+1,
  'Channel Hash',
  'Channel Hash',
  'Text',
  'YYYY-MM-DD',
  5,
  'Default',
  'Y',
  'Y',
  'C',
  NULL,
  NULL,
  NULL,
  'BackEnd',
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL,
  NULL
  FROM ATTRIBUTE_types;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 
  .LABEL L15
 
INSERT INTO MDM.ATTRIBUTE_VALUES 
SEL A2.AV_ID+ROW_NUMBER() OVER (PARTITION BY 1 ORDER BY A.LEGAL_ENT_NBR),
(SEL ATTRIBUTE_TYPE_ID FROM ATTRIBUTE_TYPES WHERE ATTRIBUTE_TYPE='CHANNEL HASH'),
'Y','Channel Hash for LE '||TRIM(A.LEGAL_ENT_NBR),TRIM(A.LEGAL_ENT_NBR),'LE '||TRIM(A.LEGAL_ENT_NBR),
NULL,NULL,'BackEnd','Rel 5.8',CURRENT_DATE,'ACTIVE',NULL,NULL,NULL,NULL,NULL 
FROM LEGAL_ENT A
INNER JOIN (SEL MAX(av_id) AV_ID FROM ATTRIBUTE_VALUES) A2
ON 1=1;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

  .LABEL L16
 
 UPDATE MDM.ID_SQR
 FROM (SEL MAX(AV_ID)+1 AS SEQ_NBR FROM MDM.ATTRIBUTE_VALUES) B
 SET SEQ_NR=B.SEQ_NBR
 WHERE DOC_NAME='AVID_SEQ_ID'
  ;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;