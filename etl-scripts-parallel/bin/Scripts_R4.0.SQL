REPLACE VIEW MDM.V_PHONE 
AS LOCKING ROW FOR ACCESS
NONSEQUENCED TRANSACTIONTIME
SELECT
PH.REGIS_PRSNA_ID
,PH.SUBSCRPTN_OPT_IND
,PH.CNSMR_CHCE_DATETM
,PH.PREF_CNTCT_POINT_IND
,PH.FULL_PHONE_NUM
,PH.CNTCT_POINT_CATEG_CODE
,PH.SUBSCRPTN_OPT_NBR
,PH.MKTNG_PGM_NBR
,PH.LEGAL_ENT_NBR
,SO.SUBSCRPTN_OPT_NAME
,SO.SUBSCRPTN_OPT_STMT_TXT
,NULL (INTEGER) 		AS  SYS_TARGET_ID
,NULL (VARCHAR(25)) 	AS SYS_AUTH_ID
,NULL (VARCHAR(25)) 	AS SYS_SOURCE
,NULL (VARCHAR(70)) 	AS SYS_CREATED_BY
,NULL (TIMESTAMP(0)) 	AS SYS_CREATION_DATE
,'ACTIVE'  (VARCHAR(25)) 	AS  SYS_ENT_STATE
,NULL (VARCHAR(70)) 	AS SYS_LAST_MODIFIED_BY
,NULL (TIMESTAMP(0)) 	AS SYS_LAST_MODIFIED_DATE
,NULL (VARCHAR(25)) 	AS SYS_NC_TYPE
,NULL (VARCHAR(10000)) 	AS SYS_ERR_CODE
,NULL (VARCHAR(30)) 	AS SYS_ERR_SVRTY 
FROM ICRM_TBL.REGIS_PRSNA_PHONE PH
LEFT JOIN
MDM.SUBSCRPTN_OPT SO
ON
PH.MKTNG_PGM_NBR=SO.MKTNG_PGM_NBR
AND 
PH.LEGAL_ENT_NBR=SO.LEGAL_ENT_NBR
AND
PH.SUBSCRPTN_OPT_NBR=SO.SUBSCRPTN_OPT_NBR
QUALIFY RANK() OVER (PARTITION BY PH.MKTNG_PGM_NBR,REGIS_PRSNA_ID,CNTCT_POINT_CATEG_CODE,COALESCE(PH.SUBSCRPTN_OPT_NBR,0),COALESCE(CNSMR_CHCE_DATETM,CAST('1900-01-01 00:00:00.000000' AS TIMESTAMP(6))),COALESCE(SUBSCRPTN_OPT_IND,'')
ORDER BY PH.SYS_LAST_MODIFIED_DATE DESC,TEMPORAL_TIME DESC) = 1
;

REPLACE VIEW MDM.V_ADDRESS 
AS LOCKING ROW FOR ACCESS
NONSEQUENCED TRANSACTIONTIME
SELECT
AD.REGIS_PRSNA_ID
,AD.SUBSCRPTN_OPT_IND
,AD.CNSMR_CHCE_DATETM
,COALESCE(AD.ADDR_LINE_1_TXT,'') || COALESCE(AD.ADDR_LINE_2_TXT,'') || COALESCE(AD.CITY_NAME,'') || COALESCE(AD.POSTL_AREA_CODE,'') AS ADDR_LINE_1_TXT
,AD.ADDR_LINE_2_TXT
,AD.CITY_NAME
,AD.POSTL_AREA_CODE
,AD.CNTRY_CODE
,AD.CNTCT_POINT_CATEG_CODE
,AD.SUBSCRPTN_OPT_NBR
,AD.MKTNG_PGM_NBR
,AD.LEGAL_ENT_NBR
,SO.SUBSCRPTN_OPT_NAME
,SO.SUBSCRPTN_OPT_STMT_TXT
,NULL (INTEGER) 		AS  SYS_TARGET_ID
,NULL (VARCHAR(25)) 	AS SYS_AUTH_ID
,NULL (VARCHAR(25)) 	AS SYS_SOURCE
,NULL (VARCHAR(70)) 	AS SYS_CREATED_BY
,NULL (TIMESTAMP(0)) 	AS SYS_CREATION_DATE
,'ACTIVE'  (VARCHAR(25)) 	AS  SYS_ENT_STATE
,NULL (VARCHAR(70)) 	AS SYS_LAST_MODIFIED_BY
,NULL (TIMESTAMP(0)) 	AS SYS_LAST_MODIFIED_DATE
,NULL (VARCHAR(25)) 	AS SYS_NC_TYPE
,NULL (VARCHAR(10000)) 	AS SYS_ERR_CODE
,NULL (VARCHAR(30)) 	AS SYS_ERR_SVRTY                                                           
FROM ICRM_TBL.REGIS_PRSNA_POSTL_ADDR AD
LEFT JOIN
MDM.SUBSCRPTN_OPT SO
ON
AD.MKTNG_PGM_NBR=SO.MKTNG_PGM_NBR
AND 
AD.LEGAL_ENT_NBR=SO.LEGAL_ENT_NBR
AND
AD.SUBSCRPTN_OPT_NBR=SO.SUBSCRPTN_OPT_NBR
QUALIFY RANK() OVER (PARTITION BY AD.MKTNG_PGM_NBR,REGIS_PRSNA_ID,CNTCT_POINT_CATEG_CODE,COALESCE(AD.SUBSCRPTN_OPT_NBR,0),COALESCE(CNSMR_CHCE_DATETM,CAST('1900-01-01 00:00:00.000000' AS TIMESTAMP(6))),COALESCE(SUBSCRPTN_OPT_IND,'')
ORDER BY AD.SYS_LAST_MODIFIED_DATE DESC,TEMPORAL_TIME DESC) = 1
;

REPLACE VIEW MDM.V_EMAIL 
AS LOCKING ROW FOR ACCESS 
NONSEQUENCED TRANSACTIONTIME
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
,NULL (INTEGER) 		AS  SYS_TARGET_ID
,NULL (VARCHAR(25)) 	AS SYS_AUTH_ID
,NULL (VARCHAR(25)) 	AS SYS_SOURCE
,NULL (VARCHAR(70)) 	AS SYS_CREATED_BY
,NULL (TIMESTAMP(0)) 	AS SYS_CREATION_DATE
,'ACTIVE'  (VARCHAR(25)) 	AS  SYS_ENT_STATE
,NULL (VARCHAR(70)) 	AS SYS_LAST_MODIFIED_BY
,NULL (TIMESTAMP(0)) 	AS SYS_LAST_MODIFIED_DATE
,NULL (VARCHAR(25)) 	AS SYS_NC_TYPE
,NULL (VARCHAR(10000)) 	AS SYS_ERR_CODE
,NULL (VARCHAR(30)) 	AS SYS_ERR_SVRTY   
FROM ICRM_TBL.REGIS_PRSNA_EMAIL_ADDR EM
LEFT JOIN
MDM.SUBSCRPTN_OPT SO
ON
EM.MKTNG_PGM_NBR=SO.MKTNG_PGM_NBR
AND 
EM.LEGAL_ENT_NBR=SO.LEGAL_ENT_NBR
AND
EM.SUBSCRPTN_OPT_NBR=SO.SUBSCRPTN_OPT_NBR
QUALIFY RANK() OVER (PARTITION BY EM.MKTNG_PGM_NBR,REGIS_PRSNA_ID,CNTCT_POINT_CATEG_CODE,COALESCE(EM.SUBSCRPTN_OPT_NBR,0),COALESCE(CNSMR_CHCE_DATETM,CAST('1900-01-01 00:00:00.000000' AS TIMESTAMP(6))),COALESCE(SUBSCRPTN_OPT_IND,'')
ORDER BY EM.SYS_LAST_MODIFIED_DATE DESC,TEMPORAL_TIME DESC) = 1
;

REPLACE VIEW MDM.MDM_LOAD_CONTROL_OPTOUT
       AS
       LOCKING ROW FOR ACCESS
       SELECT A.LOAD_ID ,
       A.SOURCE_ID
       FROM ETL_CTRL.LOAD_CONTROL A
       LEFT OUTER JOIN ETL_CTRL.LOAD_CONTROL B
       ON A.LOAD_ID = B.LOAD_ID
       AND B.LOAD_TYPE = 'MDM'
       WHERE
       (B.LOAD_ID IS NULL OR B.LOADSTATUS = 'RESTART')
       AND A.LOAD_TYPE = 'ETL'
       AND A.LOADSTATUS = 'Success'
       AND A.FORMAT_ID IN  (34)
       AND A.MDM_PROCESS_DESC IN ('Completed','EPCompleted')
       AND A.TARGETCNT > 0
	   AND A.SOURCE_ID IN (1120)
 	  GROUP BY 1,2
;

CREATE MULTISET TABLE MDM.OPTOUT_TRIGGER ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO
     (
      OPTOUT_ID DECIMAL(18,0),
      ADDR_LINE_1_TXT VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      ADDR_LINE_2_TXT VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      ADDR_LINE_3_TXT VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      CITY_NAME VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      TERR_NAME VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      POSTL_AREA_CODE VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      CNTRY_NAME VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      LOAD_ID DECIMAL(18,0),
      LOAD_TS TIMESTAMP(0))
PRIMARY INDEX OPTOUT_TRIGGER_NUPI ( OPTOUT_ID,LOAD_ID );

ins attribute_values
	(AV_ID,	ATTRIBUTE_TYPE_ID,	ACTIVE_FLAG	,AV_DESCRIPTION,	AV_CODE)
values(224.00,	1.00,'Y'	,'State Validation',15);

ins terr_recode(terr,terr_recode) values('Alabama','AL');
ins terr_recode(terr,terr_recode) values('Alaska','AK');
ins terr_recode(terr,terr_recode) values('Arizona','AZ');
ins terr_recode(terr,terr_recode) values('Arkansas','AR');
ins terr_recode(terr,terr_recode) values('California','CA');
ins terr_recode(terr,terr_recode) values('Colorado','CO');
ins terr_recode(terr,terr_recode) values('Connecticut','CT');
ins terr_recode(terr,terr_recode) values('Delaware','DE');
ins terr_recode(terr,terr_recode) values('District of Columbia','DC');
ins terr_recode(terr,terr_recode) values('Florida','FL');
ins terr_recode(terr,terr_recode) values('Georgia','GA');
ins terr_recode(terr,terr_recode) values('Hawaii','HI');
ins terr_recode(terr,terr_recode) values('Idaho','ID');
ins terr_recode(terr,terr_recode) values('Illinois','IL');
ins terr_recode(terr,terr_recode) values('Indiana','IN');
ins terr_recode(terr,terr_recode) values('Iowa','IA');
ins terr_recode(terr,terr_recode) values('Kansas','KS');
ins terr_recode(terr,terr_recode) values('Kentucky','KY');
ins terr_recode(terr,terr_recode) values('Louisiana','LA');
ins terr_recode(terr,terr_recode) values('Maine','ME');
ins terr_recode(terr,terr_recode) values('Maryland','MD');
ins terr_recode(terr,terr_recode) values('Massachusetts','MA');
ins terr_recode(terr,terr_recode) values('Michigan','MI');
ins terr_recode(terr,terr_recode) values('Minnesota','MN');
ins terr_recode(terr,terr_recode) values('Mississippi','MS');
ins terr_recode(terr,terr_recode) values('Missouri','MO');
ins terr_recode(terr,terr_recode) values('Montana','MT');
ins terr_recode(terr,terr_recode) values('Nebraska','NE');
ins terr_recode(terr,terr_recode) values('Nevada','NV');
ins terr_recode(terr,terr_recode) values('New Hampshire','NH');
ins terr_recode(terr,terr_recode) values('New Jersey','NJ');
ins terr_recode(terr,terr_recode) values('New Mexico','NM');
ins terr_recode(terr,terr_recode) values('New York','NY');
ins terr_recode(terr,terr_recode) values('North Carolina','NC');
ins terr_recode(terr,terr_recode) values('North Dakota','ND');
ins terr_recode(terr,terr_recode) values('Ohio','OH');
ins terr_recode(terr,terr_recode) values('Oklahoma','OK');
ins terr_recode(terr,terr_recode) values('Oregon','OR');
ins terr_recode(terr,terr_recode) values('Pennsylvania','PA');
ins terr_recode(terr,terr_recode) values('Rhode Island','RI');
ins terr_recode(terr,terr_recode) values('South Carolina','SC');
ins terr_recode(terr,terr_recode) values('South Dakota','SD');
ins terr_recode(terr,terr_recode) values('Tennessee','TN');
ins terr_recode(terr,terr_recode) values('Texas','TX');
ins terr_recode(terr,terr_recode) values('Utah','UT');
ins terr_recode(terr,terr_recode) values('Vermont','VT');
ins terr_recode(terr,terr_recode) values('Virginia','VA');
ins terr_recode(terr,terr_recode) values('Washington','WA');
ins terr_recode(terr,terr_recode) values('West Virginia','WV');
ins terr_recode(terr,terr_recode) values('Wisconsin','WI');
ins terr_recode(terr,terr_recode) values('Wyoming','WY');
ins terr_recode(terr,terr_recode) values('American Samoa','AS');
ins terr_recode(terr,terr_recode) values('Guam','GU');
ins terr_recode(terr,terr_recode) values('Northern Mariana Islands','MP');
ins terr_recode(terr,terr_recode) values('Puerto Rico','PR');
ins terr_recode(terr,terr_recode) values('Virgin Islands','VI');



ins terr(terr_name,terr_code,cntry_code) values('Alabama','AL','USA');
ins terr(terr_name,terr_code,cntry_code) values('Alaska','AK','USA');
ins terr(terr_name,terr_code,cntry_code) values('Arizona','AZ','USA');
ins terr(terr_name,terr_code,cntry_code) values('Arkansas','AR','USA');
ins terr(terr_name,terr_code,cntry_code) values('California','CA','USA');
ins terr(terr_name,terr_code,cntry_code) values('Colorado','CO','USA');
ins terr(terr_name,terr_code,cntry_code) values('Connecticut','CT','USA');
ins terr(terr_name,terr_code,cntry_code) values('Delaware','DE','USA');
ins terr(terr_name,terr_code,cntry_code) values('District of Columbia','DC','USA');
ins terr(terr_name,terr_code,cntry_code) values('Florida','FL','USA');
ins terr(terr_name,terr_code,cntry_code) values('Georgia','GA','USA');
ins terr(terr_name,terr_code,cntry_code) values('Hawaii','HI','USA');
ins terr(terr_name,terr_code,cntry_code) values('Idaho','ID','USA');
ins terr(terr_name,terr_code,cntry_code) values('Illinois','IL','USA');
ins terr(terr_name,terr_code,cntry_code) values('Indiana','IN','USA');
ins terr(terr_name,terr_code,cntry_code) values('Iowa','IA','USA');
ins terr(terr_name,terr_code,cntry_code) values('Kansas','KS','USA');
ins terr(terr_name,terr_code,cntry_code) values('Kentucky','KY','USA');
ins terr(terr_name,terr_code,cntry_code) values('Louisiana','LA','USA');
ins terr(terr_name,terr_code,cntry_code) values('Maine','ME','USA');
ins terr(terr_name,terr_code,cntry_code) values('Maryland','MD','USA');
ins terr(terr_name,terr_code,cntry_code) values('Massachusetts','MA','USA');
ins terr(terr_name,terr_code,cntry_code) values('Michigan','MI','USA');
ins terr(terr_name,terr_code,cntry_code) values('Minnesota','MN','USA');
ins terr(terr_name,terr_code,cntry_code) values('Mississippi','MS','USA');
ins terr(terr_name,terr_code,cntry_code) values('Missouri','MO','USA');
ins terr(terr_name,terr_code,cntry_code) values('Montana','MT','USA');
ins terr(terr_name,terr_code,cntry_code) values('Nebraska','NE','USA');
ins terr(terr_name,terr_code,cntry_code) values('Nevada','NV','USA');
ins terr(terr_name,terr_code,cntry_code) values('New Hampshire','NH','USA');
ins terr(terr_name,terr_code,cntry_code) values('New Jersey','NJ','USA');
ins terr(terr_name,terr_code,cntry_code) values('New Mexico','NM','USA');
ins terr(terr_name,terr_code,cntry_code) values('New York','NY','USA');
ins terr(terr_name,terr_code,cntry_code) values('North Carolina','NC','USA');
ins terr(terr_name,terr_code,cntry_code) values('North Dakota','ND','USA');
ins terr(terr_name,terr_code,cntry_code) values('Ohio','OH','USA');
ins terr(terr_name,terr_code,cntry_code) values('Oklahoma','OK','USA');
ins terr(terr_name,terr_code,cntry_code) values('Oregon','OR','USA');
ins terr(terr_name,terr_code,cntry_code) values('Pennsylvania','PA','USA');
ins terr(terr_name,terr_code,cntry_code) values('Rhode Island','RI','USA');
ins terr(terr_name,terr_code,cntry_code) values('South Carolina','SC','USA');
ins terr(terr_name,terr_code,cntry_code) values('South Dakota','SD','USA');
ins terr(terr_name,terr_code,cntry_code) values('Tennessee','TN','USA');
ins terr(terr_name,terr_code,cntry_code) values('Texas','TX','USA');
ins terr(terr_name,terr_code,cntry_code) values('Utah','UT','USA');
ins terr(terr_name,terr_code,cntry_code) values('Vermont','VT','USA');
ins terr(terr_name,terr_code,cntry_code) values('Virginia','VA','USA');
ins terr(terr_name,terr_code,cntry_code) values('Washington','WA','USA');
ins terr(terr_name,terr_code,cntry_code) values('West Virginia','WV','USA');
ins terr(terr_name,terr_code,cntry_code) values('Wisconsin','WI','USA');
ins terr(terr_name,terr_code,cntry_code) values('Wyoming','WY','USA');
ins terr(terr_name,terr_code,cntry_code) values('American Samoa','AS','USA');
ins terr(terr_name,terr_code,cntry_code) values('Guam','GU','USA');
ins terr(terr_name,terr_code,cntry_code) values('Northern Mariana Islands','MP','USA');
ins terr(terr_name,terr_code,cntry_code) values('Puerto Rico','PR','USA');
ins terr(terr_name,terr_code,cntry_code) values('Virgin Islands','VI','USA');

ins tss_cntry_table_map (CNTRY_NAME,CLEANSE_INPUT_TAB_NAME,WINKEY_TAB_NAME,MATCH_INPUT_TAB_NAME,TRILLIUM_OUTPUT_TAB_NAME,TSS_CLEANSE_INPUT,TSSENVSET,INVOKE_ROUTE_CLEANSE,CNSMR_WINKEY_OUT_STG,MATCH_INPUT_CRM,TSSMATCH,TSS_MATCH_STG,PREV_LOAD_STATUS,CALL_BACK_DURATION) values('BRA','','','','','TSS_CLEANSE_INPUT_BRA.BAT','TSSEnvSet_BRA.BAT','invokeRouteCleanse_BRA','CNSMR_TSS_WINKEY_OUTPUT_STG_BRA.BAT','TSS_MATCH_INPUT_CRM_BRA.BAT','TSSMatch_BRA','TSS_MATCH_STG_BRA.BAT','previousLoadStatusBRA',10);
ins tss_cntry_table_map (CNTRY_NAME,CLEANSE_INPUT_TAB_NAME,WINKEY_TAB_NAME,MATCH_INPUT_TAB_NAME,TRILLIUM_OUTPUT_TAB_NAME,TSS_CLEANSE_INPUT,TSSENVSET,INVOKE_ROUTE_CLEANSE,CNSMR_WINKEY_OUT_STG,MATCH_INPUT_CRM,TSSMATCH,TSS_MATCH_STG,PREV_LOAD_STATUS,CALL_BACK_DURATION) values('LA','','','','','TSS_CLEANSE_INPUT_LA.BAT','TSSEnvSet_LA.BAT','invokeRouteCleanse_LA','CNSMR_TSS_WINKEY_OUTPUT_STG_LA.BAT','TSS_MATCH_INPUT_CRM_LA.BAT','TSSMatch_LA','TSS_MATCH_STG_LA.BAT','previousLoadStatusLA',10);
ins tss_cntry_table_map (CNTRY_NAME,CLEANSE_INPUT_TAB_NAME,WINKEY_TAB_NAME,MATCH_INPUT_TAB_NAME,TRILLIUM_OUTPUT_TAB_NAME,TSS_CLEANSE_INPUT,TSSENVSET,INVOKE_ROUTE_CLEANSE,CNSMR_WINKEY_OUT_STG,MATCH_INPUT_CRM,TSSMATCH,TSS_MATCH_STG,PREV_LOAD_STATUS,CALL_BACK_DURATION) values('USA','','','','','TSS_CLEANSE_INPUT_USA.BAT','TSSEnvSet_USA.BAT','invokeRouteCleanse_USA','CNSMR_TSS_WINKEY_OUTPUT_STG_USA.BAT','TSS_MATCH_INPUT_CRM_USA.BAT','TSSMatch_USA','TSS_MATCH_STG_USA.BAT','previousLoadStatusUSA',10);

CREATE SET TABLE MDM.WINKEY_TRIGGER_USA ,NO FALLBACK ,
	     NO BEFORE JOURNAL,
	     NO AFTER JOURNAL,
	     CHECKSUM = DEFAULT,
	     DEFAULT MERGEBLOCKRATIO
	     (
	      WINDOW_KEY_01 VARCHAR(30) CHARACTER SET UNICODE NOT CASESPECIFIC NOT NULL,
	      EMAIL_ADDR_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PHONE VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
	      LEGAL_ENT_NBR INTEGER,
	      SYS_TARGET_ID INTEGER,
	      SYS_AUTH_ID VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_SOURCE VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC DEFAULT 'BACKEND',
	      SYS_CREATED_BY VARCHAR(70) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_CREATION_DATE TIMESTAMP(0),
	      SYS_ENT_STATE VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC CHECK ( SYS_ENT_STATE  IN ('ACTIVE','INACTIVE','NEW','DELETED') ),
	      SYS_LAST_MODIFIED_BY VARCHAR(70) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_LAST_MODIFIED_DATE TIMESTAMP(0),
	      SYS_NC_TYPE VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_ERR_CODE VARCHAR(10000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_ERR_SVRTY VARCHAR(30) CHARACTER SET UNICODE NOT CASESPECIFIC CHECK ( SYS_ERR_SVRTY  IN ('SEVERE_ERROR','ERROR','WARNING') ))
	PRIMARY INDEX ( WINDOW_KEY_01 ,EMAIL_ADDR_TXT ,PHONE ,LEGAL_ENT_NBR );

CREATE SET TABLE MDM.TSS_MATCH_INPUT_USA ,NO FALLBACK ,
	     NO BEFORE JOURNAL,
	     NO AFTER JOURNAL,
	     CHECKSUM = DEFAULT,
	     DEFAULT MERGEBLOCKRATIO
	     (
	      LEGAL_ENT_NBR SMALLINT NOT NULL,
	      MKTNG_PGM_NBR INTEGER NOT NULL,
	      REGIS_CNSMR_ID_VAL VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC NOT NULL,
	      NAME_PREFX_TXT CHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      GVN_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      MID_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      FAMLY_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      NAME_SUFFX_TXT CHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      FULL_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      GENDR_IND CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      BRTH_DATE DATE FORMAT 'YY/MM/DD',
	      ADDR_LINE_1_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      ADDR_LINE_2_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      ADDR_LINE_3_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      STRET_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      STRET_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      APT_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PO_BOX_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      CITY_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      POSTL_AREA_CODE VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      TERR_CODE VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      CNTRY_CODE VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DPEND_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PET_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      WIN_KEY VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYNC_STATUS VARCHAR(15) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      CNSMR_USER_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      LANG_CODE CHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_SOURCE VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_NC_TYPE VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_CREATION_DATE TIMESTAMP(0),
	      EMAIL_ADDR_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PHONE_EXTSN_NUM VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
	      FULL_PHONE_NUM VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
	      PHONE_LINE_NBR INTEGER,
	      PHONE_AREA_NBR INTEGER,
	      PHONE_EXCHG_NBR INTEGER,
	      PHONE_CNTRY_NBR INTEGER,
	      REGIS_PRSNA_ID INTEGER,
	      LEGAL_ENT_PRSNA_ID INTEGER,
	      HSHLD_PRSNA_ID INTEGER)
	PRIMARY INDEX ( LEGAL_ENT_NBR ,MKTNG_PGM_NBR ,REGIS_CNSMR_ID_VAL );

CREATE MULTISET TABLE MDM.TRILLIUM_OUTPUT1_USA ,NO FALLBACK ,
	     NO BEFORE JOURNAL,
	     NO AFTER JOURNAL,
	     CHECKSUM = DEFAULT,
	     DEFAULT MERGEBLOCKRATIO
	     (
	      MKTNG_PGM_NBR INTEGER NOT NULL,
	      REGIS_CNSMR_ID_VAL VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_ALIAS_CONTACT VARCHAR(30) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_FIRST_NAME VARCHAR(30) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_MIDDLE_NAME VARCHAR(30) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_LAST_NAME VARCHAR(30) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_MRMRS VARCHAR(15) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_NAME_GENER VARCHAR(15) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_NAME_SUFFIX VARCHAR(15) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_NAME_GENDER CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_COUNTRY_NAME VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_REGION_NAME VARCHAR(40) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_CITY_NAME VARCHAR(30) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_POSTAL_CODE VARCHAR(15) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_STREET_NAME VARCHAR(60) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_HOUSE_NUMBER1 VARCHAR(15) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_HOUSE_NUMBER2 VARCHAR(15) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_POBOX_NUMBER VARCHAR(15) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_ADDRESS VARCHAR(150) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_ADDRESS2 VARCHAR(150) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_ADDRESS3 VARCHAR(150) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      CLEANSED_PHONE_1 VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      CLEANSED_EMAIL_1 VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PR_REV_GROUP VARCHAR(10) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      GOUT_MATCH_LEVEL CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      WINDOW_KEY_01 VARCHAR(30) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      REFERENCE_HOUSEHOLD_ID VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      REFERENCE_LEGALENTITYKEY VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      REFERENCE_REGISTRATIONKEY VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      LEGAL_ENT_NBR INTEGER,
	      BRTH_DATE DATE FORMAT 'YYYY-MM-DD',
	      LANG_CODE CHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      CNSMR_USER_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      STATUS VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      FULL_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DPEND_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PET_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PR_NAME_FORM_01 CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_ALIAS_ACCOUNT VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      REFERENCE_MATCHED_LEV1_PATTERN VARCHAR(3) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      REFERENCE_MATCHED_LEV2_PATTERN VARCHAR(3) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_BUSINESS_NAME VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      EMAIL_IND CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      REGIS_DATE VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
	      RECORD_IND VARCHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC,
	      RECENT_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
	      REGIS_PRSNA_ID INTEGER,
	      HH_FLAG VARCHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      LE_FLAG VARCHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_TARGET_ID INTEGER,
	      SYS_AUTH_ID VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_SOURCE VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC DEFAULT 'BACKEND',
	      SYS_CREATED_BY VARCHAR(70) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_CREATION_DATE TIMESTAMP(0),
	      SYS_ENT_STATE VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC CHECK ( SYS_ENT_STATE  IN ('ACTIVE','INACTIVE','NEW','DELETED') ),
	      SYS_LAST_MODIFIED_BY VARCHAR(70) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_LAST_MODIFIED_DATE TIMESTAMP(0),
	      SYS_NC_TYPE VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_ERR_CODE VARCHAR(10000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_ERR_SVRTY VARCHAR(30) CHARACTER SET UNICODE NOT CASESPECIFIC CHECK ( SYS_ERR_SVRTY  IN ('SEVERE_ERROR','ERROR','WARNING') ),
	      ADDRESS_CONTACT VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      ADDRESS_SUBSCRPTN VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PHONE_CONTACT VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PHONE_SUBSCRPTN VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      EMAIL_CONTACT VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      EMAIL_SUBSCRPTN VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC)
	PRIMARY INDEX ( MKTNG_PGM_NBR ,REGIS_CNSMR_ID_VAL ,SYS_SOURCE );


REPLACE VIEW MDM.TRILLIUM_OUTPUT_USA (                                              
	  MKTNG_PGM_NBR                                                                 
	 ,REGIS_CNSMR_ID_VAL                                                            
	 ,DR_ALIAS_CONTACT                                                              
	 ,DR_FIRST_NAME                                                                 
	 ,DR_MIDDLE_NAME                                                                
	 ,DR_LAST_NAME                                                                  
	 ,DR_MRMRS                                                                      
	 ,DR_NAME_GENER                                                                 
	 ,DR_NAME_SUFFIX                                                                
	 ,DR_NAME_GENDER                                                                
	 ,DR_COUNTRY_NAME                                                               
	 ,DR_REGION_NAME                                                                
	 ,DR_CITY_NAME                                                                  
	 ,DR_POSTAL_CODE                                                                
	 ,DR_STREET_NAME                                                                
	 ,DR_HOUSE_NUMBER1                                                              
	 ,DR_HOUSE_NUMBER2                                                              
	 ,DR_POBOX_NUMBER                                                               
	 ,DR_ADDRESS                                                                    
	 ,DR_ADDRESS2                                                                   
	 ,DR_ADDRESS3                                                            
	 ,PR_REV_GROUP                                                                  
	 ,GOUT_MATCH_LEVEL                                                              
	 ,WINDOW_KEY_01                                                                 
	 ,REFERENCE_HOUSEHOLD_ID                                                        
	 ,REFERENCE_LEGALENTITYKEY                                                      
	 ,REFERENCE_REGISTRATIONKEY                                                     
	 ,LEGAL_ENT_NBR                                                                 
	 ,BRTH_DATE                                                                     
	 ,LANG_CODE                                                                     
	 ,CNSMR_USER_NAME                                                               
	 ,STATUS                                                                        
	 ,FULL_NAME                                                                     
	 ,PR_NAME_FORM_01                                                               
	 ,DR_ALIAS_ACCOUNT                                                
	 ,DR_BUSINESS_NAME 
	 ,REGIS_DATE
	 ,RECORD_IND
	 ,RECENT_IND
	 ,REGIS_PRSNA_ID 
	 ,HH_FLAG
	 ,LE_FLAG
	 ,SYS_TARGET_ID                                                                 
	 ,SYS_AUTH_ID                                                                   
	 ,SYS_SOURCE                                                                    
	 ,SYS_CREATED_BY                                                                
	 ,SYS_CREATION_DATE                                                             
	 ,SYS_ENT_STATE                                                                 
	 ,SYS_LAST_MODIFIED_BY                                                          
	 ,SYS_LAST_MODIFIED_DATE                                                        
	 ,SYS_NC_TYPE                                                                   
	 ,SYS_ERR_CODE                                                                  
	 ,SYS_ERR_SVRTY              
	 ,ADDRESS_CONTACT
	 ,ADDRESS_SUBSCRPTN
	 ,EMAIL_CONTACT
	 ,EMAIL_SUBSCRPTN
	 ,PHONE_CONTACT
	,PHONE_SUBSCRPTN
	) AS LOCKING ROW FOR ACCESS SELECT  
	DISTINCT
	  MKTNG_PGM_NBR                                                                 
	 ,REGIS_CNSMR_ID_VAL                                                            
	 ,DR_ALIAS_CONTACT                                                              
	 ,DR_FIRST_NAME                                                                 
	 ,DR_MIDDLE_NAME                                                                
	 ,DR_LAST_NAME                                                                  
	 ,DR_MRMRS                                                                      
	 ,DR_NAME_GENER                                                                 
	 ,DR_NAME_SUFFIX                                                                
	 ,DR_NAME_GENDER                                                                
	 ,DR_COUNTRY_NAME                                                               
	 ,DR_REGION_NAME                                                                
	 ,DR_CITY_NAME                                                                  
	 ,DR_POSTAL_CODE                                                                
	 ,DR_STREET_NAME                                                                
	 ,DR_HOUSE_NUMBER1                                                              
	 ,DR_HOUSE_NUMBER2                                                              
	 ,DR_POBOX_NUMBER                                                               
	 ,DR_ADDRESS                                                                    
	 ,DR_ADDRESS2                                                                   
	 ,DR_ADDRESS3                                                                 
	 ,PR_REV_GROUP                                                                  
	 ,GOUT_MATCH_LEVEL                                                              
	 ,WINDOW_KEY_01                                                                 
	 ,REFERENCE_HOUSEHOLD_ID                                                        
	 ,REFERENCE_LEGALENTITYKEY                                                      
	 ,REFERENCE_REGISTRATIONKEY                                                     
	 ,LEGAL_ENT_NBR                                                                 
	 ,BRTH_DATE                                                                     
	 ,LANG_CODE                                                                     
	 ,CNSMR_USER_NAME                                                               
	 ,STATUS                                                                        
	 ,FULL_NAME                                                                     
	 ,PR_NAME_FORM_01                                                               
	 ,DR_ALIAS_ACCOUNT                                            
	 ,DR_BUSINESS_NAME  
	 ,REGIS_DATE
	 ,RECORD_IND
	 ,RECENT_IND 
	 ,REGIS_PRSNA_ID
	 ,HH_FLAG
	 ,LE_FLAG
	 ,SYS_TARGET_ID                                                                 
	 ,SYS_AUTH_ID                                                                   
	 ,SYS_SOURCE                                                                    
	 ,SYS_CREATED_BY                                                                
	 ,SYS_CREATION_DATE                                                             
	 ,SYS_ENT_STATE                                                                 
	 ,SYS_LAST_MODIFIED_BY                                                          
	 ,SYS_LAST_MODIFIED_DATE                                                        
	 ,SYS_NC_TYPE                                                                   
	 ,SYS_ERR_CODE                                                                  
	 ,SYS_ERR_SVRTY     
	 ,ADDRESS_CONTACT
	 ,ADDRESS_SUBSCRPTN
	 ,EMAIL_CONTACT
	 ,EMAIL_SUBSCRPTN
	 ,PHONE_CONTACT
	,PHONE_SUBSCRPTN
	FROM MDM.TRILLIUM_OUTPUT1_USA;

	CREATE SET TABLE MDM.TSS_CLEANSE_INPUT1_USA ,NO FALLBACK ,
	     NO BEFORE JOURNAL,
	     NO AFTER JOURNAL,
	     CHECKSUM = DEFAULT,
	     DEFAULT MERGEBLOCKRATIO
	     (
	      LEGAL_ENT_NBR SMALLINT NOT NULL,
	      MKTNG_PGM_NBR INTEGER NOT NULL,
	      REGIS_CNSMR_ID_VAL VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC NOT NULL,
	      NAME_PREFX_TXT CHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      GVN_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      MID_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      FAMLY_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      NAME_SUFFX_TXT CHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      FULL_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      GENDR_IND CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      BRTH_DATE DATE FORMAT 'YY/MM/DD',
	      ADDR_LINE_1_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      ADDR_LINE_2_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      ADDR_LINE_3_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      STRET_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      STRET_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      APT_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PO_BOX_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      CITY_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      POSTL_AREA_CODE VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      TERR_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      CNTRY_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DPEND_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PET_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      WIN_KEY VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYNC_STATUS VARCHAR(15) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      USER_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      LANG_CODE CHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_SOURCE VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_NC_TYPE VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_CREATION_DATE TIMESTAMP(0),
	      EMAIL_ADDR_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PHONE_EXTSN_NUM VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
	      FULL_PHONE_NUM VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
	      PHONE_LINE_NBR INTEGER,
	      PHONE_AREA_NBR INTEGER,
	      PHONE_EXCHG_NBR INTEGER,
	      PHONE_CNTRY_NBR INTEGER,
	      PRSNA_REG_DT TIMESTAMP(0) NOT NULL,
	      ADDRESS_CONTACT VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      ADDRESS_SUBSCRPTN VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PHONE_CONTACT VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PHONE_SUBSCRPTN VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      EMAIL_CONTACT VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      EMAIL_SUBSCRPTN VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_TARGET_ID INTEGER)
	PRIMARY INDEX ( LEGAL_ENT_NBR ,MKTNG_PGM_NBR ,REGIS_CNSMR_ID_VAL ,SYS_SOURCE ,SYS_NC_TYPE ,SYS_CREATION_DATE );

	REPLACE VIEW TSS_CLEANSE_INPUT_USA
	 AS
	 LOCKING ROW FOR ACCESS
	 SELECT
	LEGAL_ENT_NBR                 
	,MKTNG_PGM_NBR                 
	,REGIS_CNSMR_ID_VAL            
	,NAME_PREFX_TXT                
	,GVN_NAME                      
	,MID_NAME                      
	,FAMLY_NAME                    
	,NAME_SUFFX_TXT                
	,FULL_NAME                     
	,GENDR_IND                     
	,BRTH_DATE                     
	,ADDR_LINE_1_TXT               
	,ADDR_LINE_2_TXT               
	,ADDR_LINE_3_TXT               
	,STRET_NUM                     
	,STRET_NAME                    
	,APT_NUM                       
	,PO_BOX_NUM                    
	,CITY_NAME                     
	,POSTL_AREA_CODE               
	,TERR_NAME                     
	,CNTRY_NAME                    
	,DPEND_NAME                    
	,PET_NAME                      
	,WIN_KEY                       
	,SYNC_STATUS                   
	,USER_NAME                     
	,LANG_CODE                     
	,SYS_SOURCE                    
	,SYS_NC_TYPE                   
	,SYS_CREATION_DATE             
	,EMAIL_ADDR_TXT                
	,PHONE_EXTSN_NUM               
	,FULL_PHONE_NUM                
	,PHONE_LINE_NBR                
	,PHONE_AREA_NBR                
	,PHONE_EXCHG_NBR               
	,PHONE_CNTRY_NBR               
	,PRSNA_REG_DT                  
	,ADDRESS_CONTACT
	,ADDRESS_SUBSCRPTN
	,EMAIL_CONTACT
	,EMAIL_SUBSCRPTN
	,PHONE_CONTACT
	,PHONE_SUBSCRPTN
	,SYS_TARGET_ID
	FROM 
	TSS_CLEANSE_INPUT1_USA;

CREATE SET TABLE MDM.WINKEY_TRIGGER_LA ,NO FALLBACK ,
	     NO BEFORE JOURNAL,
	     NO AFTER JOURNAL,
	     CHECKSUM = DEFAULT,
	     DEFAULT MERGEBLOCKRATIO
	     (
	      WINDOW_KEY_01 VARCHAR(30) CHARACTER SET UNICODE NOT CASESPECIFIC NOT NULL,
	      EMAIL_ADDR_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PHONE VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
	      LEGAL_ENT_NBR INTEGER,
	      SYS_TARGET_ID INTEGER,
	      SYS_AUTH_ID VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_SOURCE VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC DEFAULT 'BACKEND',
	      SYS_CREATED_BY VARCHAR(70) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_CREATION_DATE TIMESTAMP(0),
	      SYS_ENT_STATE VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC CHECK ( SYS_ENT_STATE  IN ('ACTIVE','INACTIVE','NEW','DELETED') ),
	      SYS_LAST_MODIFIED_BY VARCHAR(70) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_LAST_MODIFIED_DATE TIMESTAMP(0),
	      SYS_NC_TYPE VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_ERR_CODE VARCHAR(10000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_ERR_SVRTY VARCHAR(30) CHARACTER SET UNICODE NOT CASESPECIFIC CHECK ( SYS_ERR_SVRTY  IN ('SEVERE_ERROR','ERROR','WARNING') ))
	PRIMARY INDEX ( WINDOW_KEY_01 ,EMAIL_ADDR_TXT ,PHONE ,LEGAL_ENT_NBR );

CREATE SET TABLE MDM.TSS_MATCH_INPUT_LA ,NO FALLBACK ,
	     NO BEFORE JOURNAL,
	     NO AFTER JOURNAL,
	     CHECKSUM = DEFAULT,
	     DEFAULT MERGEBLOCKRATIO
	     (
	      LEGAL_ENT_NBR SMALLINT NOT NULL,
	      MKTNG_PGM_NBR INTEGER NOT NULL,
	      REGIS_CNSMR_ID_VAL VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC NOT NULL,
	      NAME_PREFX_TXT CHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      GVN_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      MID_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      FAMLY_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      NAME_SUFFX_TXT CHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      FULL_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      GENDR_IND CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      BRTH_DATE DATE FORMAT 'YY/MM/DD',
	      ADDR_LINE_1_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      ADDR_LINE_2_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      ADDR_LINE_3_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      STRET_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      STRET_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      APT_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PO_BOX_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      CITY_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      POSTL_AREA_CODE VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      TERR_CODE VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      CNTRY_CODE VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DPEND_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PET_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      WIN_KEY VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYNC_STATUS VARCHAR(15) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      CNSMR_USER_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      LANG_CODE CHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_SOURCE VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_NC_TYPE VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_CREATION_DATE TIMESTAMP(0),
	      EMAIL_ADDR_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PHONE_EXTSN_NUM VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
	      FULL_PHONE_NUM VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
	      PHONE_LINE_NBR INTEGER,
	      PHONE_AREA_NBR INTEGER,
	      PHONE_EXCHG_NBR INTEGER,
	      PHONE_CNTRY_NBR INTEGER,
	      REGIS_PRSNA_ID INTEGER,
	      LEGAL_ENT_PRSNA_ID INTEGER,
	      HSHLD_PRSNA_ID INTEGER)
	PRIMARY INDEX ( LEGAL_ENT_NBR ,MKTNG_PGM_NBR ,REGIS_CNSMR_ID_VAL );

CREATE MULTISET TABLE MDM.TRILLIUM_OUTPUT1_LA ,NO FALLBACK ,
	     NO BEFORE JOURNAL,
	     NO AFTER JOURNAL,
	     CHECKSUM = DEFAULT,
	     DEFAULT MERGEBLOCKRATIO
	     (
	      MKTNG_PGM_NBR INTEGER NOT NULL,
	      REGIS_CNSMR_ID_VAL VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_ALIAS_CONTACT VARCHAR(30) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_FIRST_NAME VARCHAR(30) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_MIDDLE_NAME VARCHAR(30) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_LAST_NAME VARCHAR(30) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_MRMRS VARCHAR(15) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_NAME_GENER VARCHAR(15) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_NAME_SUFFIX VARCHAR(15) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_NAME_GENDER CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_COUNTRY_NAME VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_REGION_NAME VARCHAR(40) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_CITY_NAME VARCHAR(30) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_POSTAL_CODE VARCHAR(15) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_STREET_NAME VARCHAR(60) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_HOUSE_NUMBER1 VARCHAR(15) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_HOUSE_NUMBER2 VARCHAR(15) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_POBOX_NUMBER VARCHAR(15) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_ADDRESS VARCHAR(150) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_ADDRESS2 VARCHAR(150) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_ADDRESS3 VARCHAR(150) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      CLEANSED_PHONE_1 VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      CLEANSED_EMAIL_1 VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PR_REV_GROUP VARCHAR(10) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      GOUT_MATCH_LEVEL CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      WINDOW_KEY_01 VARCHAR(30) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      REFERENCE_HOUSEHOLD_ID VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      REFERENCE_LEGALENTITYKEY VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      REFERENCE_REGISTRATIONKEY VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      LEGAL_ENT_NBR INTEGER,
	      BRTH_DATE DATE FORMAT 'YYYY-MM-DD',
	      LANG_CODE CHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      CNSMR_USER_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      STATUS VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      FULL_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DPEND_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PET_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PR_NAME_FORM_01 CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_ALIAS_ACCOUNT VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      REFERENCE_MATCHED_LEV1_PATTERN VARCHAR(3) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      REFERENCE_MATCHED_LEV2_PATTERN VARCHAR(3) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_BUSINESS_NAME VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      EMAIL_IND CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      REGIS_DATE VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
	      RECORD_IND VARCHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC,
	      RECENT_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
	      REGIS_PRSNA_ID INTEGER,
	      HH_FLAG VARCHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      LE_FLAG VARCHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_TARGET_ID INTEGER,
	      SYS_AUTH_ID VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_SOURCE VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC DEFAULT 'BACKEND',
	      SYS_CREATED_BY VARCHAR(70) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_CREATION_DATE TIMESTAMP(0),
	      SYS_ENT_STATE VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC CHECK ( SYS_ENT_STATE  IN ('ACTIVE','INACTIVE','NEW','DELETED') ),
	      SYS_LAST_MODIFIED_BY VARCHAR(70) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_LAST_MODIFIED_DATE TIMESTAMP(0),
	      SYS_NC_TYPE VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_ERR_CODE VARCHAR(10000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_ERR_SVRTY VARCHAR(30) CHARACTER SET UNICODE NOT CASESPECIFIC CHECK ( SYS_ERR_SVRTY  IN ('SEVERE_ERROR','ERROR','WARNING') ),
	      ADDRESS_CONTACT VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      ADDRESS_SUBSCRPTN VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PHONE_CONTACT VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PHONE_SUBSCRPTN VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      EMAIL_CONTACT VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      EMAIL_SUBSCRPTN VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC)
	PRIMARY INDEX ( MKTNG_PGM_NBR ,REGIS_CNSMR_ID_VAL ,SYS_SOURCE );


REPLACE VIEW MDM.TRILLIUM_OUTPUT_LA (                                              
	  MKTNG_PGM_NBR                                                                 
	 ,REGIS_CNSMR_ID_VAL                                                            
	 ,DR_ALIAS_CONTACT                                                              
	 ,DR_FIRST_NAME                                                                 
	 ,DR_MIDDLE_NAME                                                                
	 ,DR_LAST_NAME                                                                  
	 ,DR_MRMRS                                                                      
	 ,DR_NAME_GENER                                                                 
	 ,DR_NAME_SUFFIX                                                                
	 ,DR_NAME_GENDER                                                                
	 ,DR_COUNTRY_NAME                                                               
	 ,DR_REGION_NAME                                                                
	 ,DR_CITY_NAME                                                                  
	 ,DR_POSTAL_CODE                                                                
	 ,DR_STREET_NAME                                                                
	 ,DR_HOUSE_NUMBER1                                                              
	 ,DR_HOUSE_NUMBER2                                                              
	 ,DR_POBOX_NUMBER                                                               
	 ,DR_ADDRESS                                                                    
	 ,DR_ADDRESS2                                                                   
	 ,DR_ADDRESS3                                                            
	 ,PR_REV_GROUP                                                                  
	 ,GOUT_MATCH_LEVEL                                                              
	 ,WINDOW_KEY_01                                                                 
	 ,REFERENCE_HOUSEHOLD_ID                                                        
	 ,REFERENCE_LEGALENTITYKEY                                                      
	 ,REFERENCE_REGISTRATIONKEY                                                     
	 ,LEGAL_ENT_NBR                                                                 
	 ,BRTH_DATE                                                                     
	 ,LANG_CODE                                                                     
	 ,CNSMR_USER_NAME                                                               
	 ,STATUS                                                                        
	 ,FULL_NAME                                                                     
	 ,PR_NAME_FORM_01                                                               
	 ,DR_ALIAS_ACCOUNT                                                
	 ,DR_BUSINESS_NAME 
	 ,REGIS_DATE
	 ,RECORD_IND
	 ,RECENT_IND
	 ,REGIS_PRSNA_ID 
	 ,HH_FLAG
	 ,LE_FLAG
	 ,SYS_TARGET_ID                                                                 
	 ,SYS_AUTH_ID                                                                   
	 ,SYS_SOURCE                                                                    
	 ,SYS_CREATED_BY                                                                
	 ,SYS_CREATION_DATE                                                             
	 ,SYS_ENT_STATE                                                                 
	 ,SYS_LAST_MODIFIED_BY                                                          
	 ,SYS_LAST_MODIFIED_DATE                                                        
	 ,SYS_NC_TYPE                                                                   
	 ,SYS_ERR_CODE                                                                  
	 ,SYS_ERR_SVRTY              
	 ,ADDRESS_CONTACT
	 ,ADDRESS_SUBSCRPTN
	 ,EMAIL_CONTACT
	 ,EMAIL_SUBSCRPTN
	 ,PHONE_CONTACT
	,PHONE_SUBSCRPTN
	) AS LOCKING ROW FOR ACCESS SELECT  
	DISTINCT
	  MKTNG_PGM_NBR                                                                 
	 ,REGIS_CNSMR_ID_VAL                                                            
	 ,DR_ALIAS_CONTACT                                                              
	 ,DR_FIRST_NAME                                                                 
	 ,DR_MIDDLE_NAME                                                                
	 ,DR_LAST_NAME                                                                  
	 ,DR_MRMRS                                                                      
	 ,DR_NAME_GENER                                                                 
	 ,DR_NAME_SUFFIX                                                                
	 ,DR_NAME_GENDER                                                                
	 ,DR_COUNTRY_NAME                                                               
	 ,DR_REGION_NAME                                                                
	 ,DR_CITY_NAME                                                                  
	 ,DR_POSTAL_CODE                                                                
	 ,DR_STREET_NAME                                                                
	 ,DR_HOUSE_NUMBER1                                                              
	 ,DR_HOUSE_NUMBER2                                                              
	 ,DR_POBOX_NUMBER                                                               
	 ,DR_ADDRESS                                                                    
	 ,DR_ADDRESS2                                                                   
	 ,DR_ADDRESS3                                                                 
	 ,PR_REV_GROUP                                                                  
	 ,GOUT_MATCH_LEVEL                                                              
	 ,WINDOW_KEY_01                                                                 
	 ,REFERENCE_HOUSEHOLD_ID                                                        
	 ,REFERENCE_LEGALENTITYKEY                                                      
	 ,REFERENCE_REGISTRATIONKEY                                                     
	 ,LEGAL_ENT_NBR                                                                 
	 ,BRTH_DATE                                                                     
	 ,LANG_CODE                                                                     
	 ,CNSMR_USER_NAME                                                               
	 ,STATUS                                                                        
	 ,FULL_NAME                                                                     
	 ,PR_NAME_FORM_01                                                               
	 ,DR_ALIAS_ACCOUNT                                            
	 ,DR_BUSINESS_NAME  
	 ,REGIS_DATE
	 ,RECORD_IND
	 ,RECENT_IND 
	 ,REGIS_PRSNA_ID
	 ,HH_FLAG
	 ,LE_FLAG
	 ,SYS_TARGET_ID                                                                 
	 ,SYS_AUTH_ID                                                                   
	 ,SYS_SOURCE                                                                    
	 ,SYS_CREATED_BY                                                                
	 ,SYS_CREATION_DATE                                                             
	 ,SYS_ENT_STATE                                                                 
	 ,SYS_LAST_MODIFIED_BY                                                          
	 ,SYS_LAST_MODIFIED_DATE                                                        
	 ,SYS_NC_TYPE                                                                   
	 ,SYS_ERR_CODE                                                                  
	 ,SYS_ERR_SVRTY     
	 ,ADDRESS_CONTACT
	 ,ADDRESS_SUBSCRPTN
	 ,EMAIL_CONTACT
	 ,EMAIL_SUBSCRPTN
	 ,PHONE_CONTACT
	,PHONE_SUBSCRPTN
	FROM MDM.TRILLIUM_OUTPUT1_LA;

	CREATE SET TABLE MDM.TSS_CLEANSE_INPUT1_LA ,NO FALLBACK ,
	     NO BEFORE JOURNAL,
	     NO AFTER JOURNAL,
	     CHECKSUM = DEFAULT,
	     DEFAULT MERGEBLOCKRATIO
	     (
	      LEGAL_ENT_NBR SMALLINT NOT NULL,
	      MKTNG_PGM_NBR INTEGER NOT NULL,
	      REGIS_CNSMR_ID_VAL VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC NOT NULL,
	      NAME_PREFX_TXT CHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      GVN_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      MID_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      FAMLY_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      NAME_SUFFX_TXT CHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      FULL_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      GENDR_IND CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      BRTH_DATE DATE FORMAT 'YY/MM/DD',
	      ADDR_LINE_1_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      ADDR_LINE_2_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      ADDR_LINE_3_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      STRET_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      STRET_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      APT_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PO_BOX_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      CITY_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      POSTL_AREA_CODE VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      TERR_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      CNTRY_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DPEND_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PET_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      WIN_KEY VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYNC_STATUS VARCHAR(15) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      USER_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      LANG_CODE CHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_SOURCE VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_NC_TYPE VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_CREATION_DATE TIMESTAMP(0),
	      EMAIL_ADDR_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PHONE_EXTSN_NUM VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
	      FULL_PHONE_NUM VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
	      PHONE_LINE_NBR INTEGER,
	      PHONE_AREA_NBR INTEGER,
	      PHONE_EXCHG_NBR INTEGER,
	      PHONE_CNTRY_NBR INTEGER,
	      PRSNA_REG_DT TIMESTAMP(0) NOT NULL,
	      ADDRESS_CONTACT VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      ADDRESS_SUBSCRPTN VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PHONE_CONTACT VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PHONE_SUBSCRPTN VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      EMAIL_CONTACT VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      EMAIL_SUBSCRPTN VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_TARGET_ID INTEGER)
	PRIMARY INDEX ( LEGAL_ENT_NBR ,MKTNG_PGM_NBR ,REGIS_CNSMR_ID_VAL ,SYS_SOURCE ,SYS_NC_TYPE ,SYS_CREATION_DATE );

	REPLACE VIEW TSS_CLEANSE_INPUT_LA
	 AS
	 LOCKING ROW FOR ACCESS
	 SELECT
	LEGAL_ENT_NBR                 
	,MKTNG_PGM_NBR                 
	,REGIS_CNSMR_ID_VAL            
	,NAME_PREFX_TXT                
	,GVN_NAME                      
	,MID_NAME                      
	,FAMLY_NAME                    
	,NAME_SUFFX_TXT                
	,FULL_NAME                     
	,GENDR_IND                     
	,BRTH_DATE                     
	,ADDR_LINE_1_TXT               
	,ADDR_LINE_2_TXT               
	,ADDR_LINE_3_TXT               
	,STRET_NUM                     
	,STRET_NAME                    
	,APT_NUM                       
	,PO_BOX_NUM                    
	,CITY_NAME                     
	,POSTL_AREA_CODE               
	,TERR_NAME                     
	,CNTRY_NAME                    
	,DPEND_NAME                    
	,PET_NAME                      
	,WIN_KEY                       
	,SYNC_STATUS                   
	,USER_NAME                     
	,LANG_CODE                     
	,SYS_SOURCE                    
	,SYS_NC_TYPE                   
	,SYS_CREATION_DATE             
	,EMAIL_ADDR_TXT                
	,PHONE_EXTSN_NUM               
	,FULL_PHONE_NUM                
	,PHONE_LINE_NBR                
	,PHONE_AREA_NBR                
	,PHONE_EXCHG_NBR               
	,PHONE_CNTRY_NBR               
	,PRSNA_REG_DT                  
	,ADDRESS_CONTACT
	,ADDRESS_SUBSCRPTN
	,EMAIL_CONTACT
	,EMAIL_SUBSCRPTN
	,PHONE_CONTACT
	,PHONE_SUBSCRPTN
	,SYS_TARGET_ID
	FROM 
	TSS_CLEANSE_INPUT1_LA;

CREATE SET TABLE MDM.WINKEY_TRIGGER_BRA ,NO FALLBACK ,
	     NO BEFORE JOURNAL,
	     NO AFTER JOURNAL,
	     CHECKSUM = DEFAULT,
	     DEFAULT MERGEBLOCKRATIO
	     (
	      WINDOW_KEY_01 VARCHAR(30) CHARACTER SET UNICODE NOT CASESPECIFIC NOT NULL,
	      EMAIL_ADDR_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PHONE VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
	      LEGAL_ENT_NBR INTEGER,
	      SYS_TARGET_ID INTEGER,
	      SYS_AUTH_ID VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_SOURCE VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC DEFAULT 'BACKEND',
	      SYS_CREATED_BY VARCHAR(70) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_CREATION_DATE TIMESTAMP(0),
	      SYS_ENT_STATE VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC CHECK ( SYS_ENT_STATE  IN ('ACTIVE','INACTIVE','NEW','DELETED') ),
	      SYS_LAST_MODIFIED_BY VARCHAR(70) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_LAST_MODIFIED_DATE TIMESTAMP(0),
	      SYS_NC_TYPE VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_ERR_CODE VARCHAR(10000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_ERR_SVRTY VARCHAR(30) CHARACTER SET UNICODE NOT CASESPECIFIC CHECK ( SYS_ERR_SVRTY  IN ('SEVERE_ERROR','ERROR','WARNING') ))
	PRIMARY INDEX ( WINDOW_KEY_01 ,EMAIL_ADDR_TXT ,PHONE ,LEGAL_ENT_NBR );

CREATE SET TABLE MDM.TSS_MATCH_INPUT_BRA ,NO FALLBACK ,
	     NO BEFORE JOURNAL,
	     NO AFTER JOURNAL,
	     CHECKSUM = DEFAULT,
	     DEFAULT MERGEBLOCKRATIO
	     (
	      LEGAL_ENT_NBR SMALLINT NOT NULL,
	      MKTNG_PGM_NBR INTEGER NOT NULL,
	      REGIS_CNSMR_ID_VAL VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC NOT NULL,
	      NAME_PREFX_TXT CHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      GVN_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      MID_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      FAMLY_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      NAME_SUFFX_TXT CHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      FULL_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      GENDR_IND CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      BRTH_DATE DATE FORMAT 'YY/MM/DD',
	      ADDR_LINE_1_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      ADDR_LINE_2_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      ADDR_LINE_3_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      STRET_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      STRET_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      APT_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PO_BOX_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      CITY_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      POSTL_AREA_CODE VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      TERR_CODE VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      CNTRY_CODE VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DPEND_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PET_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      WIN_KEY VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYNC_STATUS VARCHAR(15) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      CNSMR_USER_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      LANG_CODE CHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_SOURCE VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_NC_TYPE VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_CREATION_DATE TIMESTAMP(0),
	      EMAIL_ADDR_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PHONE_EXTSN_NUM VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
	      FULL_PHONE_NUM VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
	      PHONE_LINE_NBR INTEGER,
	      PHONE_AREA_NBR INTEGER,
	      PHONE_EXCHG_NBR INTEGER,
	      PHONE_CNTRY_NBR INTEGER,
	      REGIS_PRSNA_ID INTEGER,
	      LEGAL_ENT_PRSNA_ID INTEGER,
	      HSHLD_PRSNA_ID INTEGER)
	PRIMARY INDEX ( LEGAL_ENT_NBR ,MKTNG_PGM_NBR ,REGIS_CNSMR_ID_VAL );

CREATE MULTISET TABLE MDM.TRILLIUM_OUTPUT1_BRA ,NO FALLBACK ,
	     NO BEFORE JOURNAL,
	     NO AFTER JOURNAL,
	     CHECKSUM = DEFAULT,
	     DEFAULT MERGEBLOCKRATIO
	     (
	      MKTNG_PGM_NBR INTEGER NOT NULL,
	      REGIS_CNSMR_ID_VAL VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_ALIAS_CONTACT VARCHAR(30) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_FIRST_NAME VARCHAR(30) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_MIDDLE_NAME VARCHAR(30) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_LAST_NAME VARCHAR(30) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_MRMRS VARCHAR(15) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_NAME_GENER VARCHAR(15) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_NAME_SUFFIX VARCHAR(15) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_NAME_GENDER CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_COUNTRY_NAME VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_REGION_NAME VARCHAR(40) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_CITY_NAME VARCHAR(30) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_POSTAL_CODE VARCHAR(15) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_STREET_NAME VARCHAR(60) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_HOUSE_NUMBER1 VARCHAR(15) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_HOUSE_NUMBER2 VARCHAR(15) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_POBOX_NUMBER VARCHAR(15) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_ADDRESS VARCHAR(150) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_ADDRESS2 VARCHAR(150) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_ADDRESS3 VARCHAR(150) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      CLEANSED_PHONE_1 VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      CLEANSED_EMAIL_1 VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PR_REV_GROUP VARCHAR(10) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      GOUT_MATCH_LEVEL CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      WINDOW_KEY_01 VARCHAR(30) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      REFERENCE_HOUSEHOLD_ID VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      REFERENCE_LEGALENTITYKEY VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      REFERENCE_REGISTRATIONKEY VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      LEGAL_ENT_NBR INTEGER,
	      BRTH_DATE DATE FORMAT 'YYYY-MM-DD',
	      LANG_CODE CHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      CNSMR_USER_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      STATUS VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      FULL_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DPEND_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PET_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PR_NAME_FORM_01 CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_ALIAS_ACCOUNT VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      REFERENCE_MATCHED_LEV1_PATTERN VARCHAR(3) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      REFERENCE_MATCHED_LEV2_PATTERN VARCHAR(3) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DR_BUSINESS_NAME VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      EMAIL_IND CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      REGIS_DATE VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
	      RECORD_IND VARCHAR(3) CHARACTER SET LATIN NOT CASESPECIFIC,
	      RECENT_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
	      REGIS_PRSNA_ID INTEGER,
	      HH_FLAG VARCHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      LE_FLAG VARCHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_TARGET_ID INTEGER,
	      SYS_AUTH_ID VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_SOURCE VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC DEFAULT 'BACKEND',
	      SYS_CREATED_BY VARCHAR(70) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_CREATION_DATE TIMESTAMP(0),
	      SYS_ENT_STATE VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC CHECK ( SYS_ENT_STATE  IN ('ACTIVE','INACTIVE','NEW','DELETED') ),
	      SYS_LAST_MODIFIED_BY VARCHAR(70) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_LAST_MODIFIED_DATE TIMESTAMP(0),
	      SYS_NC_TYPE VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_ERR_CODE VARCHAR(10000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_ERR_SVRTY VARCHAR(30) CHARACTER SET UNICODE NOT CASESPECIFIC CHECK ( SYS_ERR_SVRTY  IN ('SEVERE_ERROR','ERROR','WARNING') ),
	      ADDRESS_CONTACT VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      ADDRESS_SUBSCRPTN VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PHONE_CONTACT VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PHONE_SUBSCRPTN VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      EMAIL_CONTACT VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      EMAIL_SUBSCRPTN VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC)
	PRIMARY INDEX ( MKTNG_PGM_NBR ,REGIS_CNSMR_ID_VAL ,SYS_SOURCE );


REPLACE VIEW MDM.TRILLIUM_OUTPUT_BRA (                                              
	  MKTNG_PGM_NBR                                                                 
	 ,REGIS_CNSMR_ID_VAL                                                            
	 ,DR_ALIAS_CONTACT                                                              
	 ,DR_FIRST_NAME                                                                 
	 ,DR_MIDDLE_NAME                                                                
	 ,DR_LAST_NAME                                                                  
	 ,DR_MRMRS                                                                      
	 ,DR_NAME_GENER                                                                 
	 ,DR_NAME_SUFFIX                                                                
	 ,DR_NAME_GENDER                                                                
	 ,DR_COUNTRY_NAME                                                               
	 ,DR_REGION_NAME                                                                
	 ,DR_CITY_NAME                                                                  
	 ,DR_POSTAL_CODE                                                                
	 ,DR_STREET_NAME                                                                
	 ,DR_HOUSE_NUMBER1                                                              
	 ,DR_HOUSE_NUMBER2                                                              
	 ,DR_POBOX_NUMBER                                                               
	 ,DR_ADDRESS                                                                    
	 ,DR_ADDRESS2                                                                   
	 ,DR_ADDRESS3                                                            
	 ,PR_REV_GROUP                                                                  
	 ,GOUT_MATCH_LEVEL                                                              
	 ,WINDOW_KEY_01                                                                 
	 ,REFERENCE_HOUSEHOLD_ID                                                        
	 ,REFERENCE_LEGALENTITYKEY                                                      
	 ,REFERENCE_REGISTRATIONKEY                                                     
	 ,LEGAL_ENT_NBR                                                                 
	 ,BRTH_DATE                                                                     
	 ,LANG_CODE                                                                     
	 ,CNSMR_USER_NAME                                                               
	 ,STATUS                                                                        
	 ,FULL_NAME                                                                     
	 ,PR_NAME_FORM_01                                                               
	 ,DR_ALIAS_ACCOUNT                                                
	 ,DR_BUSINESS_NAME 
	 ,REGIS_DATE
	 ,RECORD_IND
	 ,RECENT_IND
	 ,REGIS_PRSNA_ID 
	 ,HH_FLAG
	 ,LE_FLAG
	 ,SYS_TARGET_ID                                                                 
	 ,SYS_AUTH_ID                                                                   
	 ,SYS_SOURCE                                                                    
	 ,SYS_CREATED_BY                                                                
	 ,SYS_CREATION_DATE                                                             
	 ,SYS_ENT_STATE                                                                 
	 ,SYS_LAST_MODIFIED_BY                                                          
	 ,SYS_LAST_MODIFIED_DATE                                                        
	 ,SYS_NC_TYPE                                                                   
	 ,SYS_ERR_CODE                                                                  
	 ,SYS_ERR_SVRTY              
	 ,ADDRESS_CONTACT
	 ,ADDRESS_SUBSCRPTN
	 ,EMAIL_CONTACT
	 ,EMAIL_SUBSCRPTN
	 ,PHONE_CONTACT
	,PHONE_SUBSCRPTN
	) AS LOCKING ROW FOR ACCESS SELECT  
	DISTINCT
	  MKTNG_PGM_NBR                                                                 
	 ,REGIS_CNSMR_ID_VAL                                                            
	 ,DR_ALIAS_CONTACT                                                              
	 ,DR_FIRST_NAME                                                                 
	 ,DR_MIDDLE_NAME                                                                
	 ,DR_LAST_NAME                                                                  
	 ,DR_MRMRS                                                                      
	 ,DR_NAME_GENER                                                                 
	 ,DR_NAME_SUFFIX                                                                
	 ,DR_NAME_GENDER                                                                
	 ,DR_COUNTRY_NAME                                                               
	 ,DR_REGION_NAME                                                                
	 ,DR_CITY_NAME                                                                  
	 ,DR_POSTAL_CODE                                                                
	 ,DR_STREET_NAME                                                                
	 ,DR_HOUSE_NUMBER1                                                              
	 ,DR_HOUSE_NUMBER2                                                              
	 ,DR_POBOX_NUMBER                                                               
	 ,DR_ADDRESS                                                                    
	 ,DR_ADDRESS2                                                                   
	 ,DR_ADDRESS3                                                                 
	 ,PR_REV_GROUP                                                                  
	 ,GOUT_MATCH_LEVEL                                                              
	 ,WINDOW_KEY_01                                                                 
	 ,REFERENCE_HOUSEHOLD_ID                                                        
	 ,REFERENCE_LEGALENTITYKEY                                                      
	 ,REFERENCE_REGISTRATIONKEY                                                     
	 ,LEGAL_ENT_NBR                                                                 
	 ,BRTH_DATE                                                                     
	 ,LANG_CODE                                                                     
	 ,CNSMR_USER_NAME                                                               
	 ,STATUS                                                                        
	 ,FULL_NAME                                                                     
	 ,PR_NAME_FORM_01                                                               
	 ,DR_ALIAS_ACCOUNT                                            
	 ,DR_BUSINESS_NAME  
	 ,REGIS_DATE
	 ,RECORD_IND
	 ,RECENT_IND 
	 ,REGIS_PRSNA_ID
	 ,HH_FLAG
	 ,LE_FLAG
	 ,SYS_TARGET_ID                                                                 
	 ,SYS_AUTH_ID                                                                   
	 ,SYS_SOURCE                                                                    
	 ,SYS_CREATED_BY                                                                
	 ,SYS_CREATION_DATE                                                             
	 ,SYS_ENT_STATE                                                                 
	 ,SYS_LAST_MODIFIED_BY                                                          
	 ,SYS_LAST_MODIFIED_DATE                                                        
	 ,SYS_NC_TYPE                                                                   
	 ,SYS_ERR_CODE                                                                  
	 ,SYS_ERR_SVRTY     
	 ,ADDRESS_CONTACT
	 ,ADDRESS_SUBSCRPTN
	 ,EMAIL_CONTACT
	 ,EMAIL_SUBSCRPTN
	 ,PHONE_CONTACT
	,PHONE_SUBSCRPTN
	FROM MDM.TRILLIUM_OUTPUT1_BRA;

	CREATE SET TABLE MDM.TSS_CLEANSE_INPUT1_BRA ,NO FALLBACK ,
	     NO BEFORE JOURNAL,
	     NO AFTER JOURNAL,
	     CHECKSUM = DEFAULT,
	     DEFAULT MERGEBLOCKRATIO
	     (
	      LEGAL_ENT_NBR SMALLINT NOT NULL,
	      MKTNG_PGM_NBR INTEGER NOT NULL,
	      REGIS_CNSMR_ID_VAL VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC NOT NULL,
	      NAME_PREFX_TXT CHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      GVN_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      MID_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      FAMLY_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      NAME_SUFFX_TXT CHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      FULL_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      GENDR_IND CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      BRTH_DATE DATE FORMAT 'YY/MM/DD',
	      ADDR_LINE_1_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      ADDR_LINE_2_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      ADDR_LINE_3_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      STRET_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      STRET_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      APT_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PO_BOX_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      CITY_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      POSTL_AREA_CODE VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      TERR_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      CNTRY_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      DPEND_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PET_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      WIN_KEY VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYNC_STATUS VARCHAR(15) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      USER_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      LANG_CODE CHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_SOURCE VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_NC_TYPE VARCHAR(25) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_CREATION_DATE TIMESTAMP(0),
	      EMAIL_ADDR_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PHONE_EXTSN_NUM VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
	      FULL_PHONE_NUM VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
	      PHONE_LINE_NBR INTEGER,
	      PHONE_AREA_NBR INTEGER,
	      PHONE_EXCHG_NBR INTEGER,
	      PHONE_CNTRY_NBR INTEGER,
	      PRSNA_REG_DT TIMESTAMP(0) NOT NULL,
	      ADDRESS_CONTACT VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      ADDRESS_SUBSCRPTN VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PHONE_CONTACT VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      PHONE_SUBSCRPTN VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      EMAIL_CONTACT VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      EMAIL_SUBSCRPTN VARCHAR(5) CHARACTER SET UNICODE NOT CASESPECIFIC,
	      SYS_TARGET_ID INTEGER)
	PRIMARY INDEX ( LEGAL_ENT_NBR ,MKTNG_PGM_NBR ,REGIS_CNSMR_ID_VAL ,SYS_SOURCE ,SYS_NC_TYPE ,SYS_CREATION_DATE );

	REPLACE VIEW TSS_CLEANSE_INPUT_BRA
	 AS
	 LOCKING ROW FOR ACCESS
	 SELECT
	LEGAL_ENT_NBR                 
	,MKTNG_PGM_NBR                 
	,REGIS_CNSMR_ID_VAL            
	,NAME_PREFX_TXT                
	,GVN_NAME                      
	,MID_NAME                      
	,FAMLY_NAME                    
	,NAME_SUFFX_TXT                
	,FULL_NAME                     
	,GENDR_IND                     
	,BRTH_DATE                     
	,ADDR_LINE_1_TXT               
	,ADDR_LINE_2_TXT               
	,ADDR_LINE_3_TXT               
	,STRET_NUM                     
	,STRET_NAME                    
	,APT_NUM                       
	,PO_BOX_NUM                    
	,CITY_NAME                     
	,POSTL_AREA_CODE               
	,TERR_NAME                     
	,CNTRY_NAME                    
	,DPEND_NAME                    
	,PET_NAME                      
	,WIN_KEY                       
	,SYNC_STATUS                   
	,USER_NAME                     
	,LANG_CODE                     
	,SYS_SOURCE                    
	,SYS_NC_TYPE                   
	,SYS_CREATION_DATE             
	,EMAIL_ADDR_TXT                
	,PHONE_EXTSN_NUM               
	,FULL_PHONE_NUM                
	,PHONE_LINE_NBR                
	,PHONE_AREA_NBR                
	,PHONE_EXCHG_NBR               
	,PHONE_CNTRY_NBR               
	,PRSNA_REG_DT                  
	,ADDRESS_CONTACT
	,ADDRESS_SUBSCRPTN
	,EMAIL_CONTACT
	,EMAIL_SUBSCRPTN
	,PHONE_CONTACT
	,PHONE_SUBSCRPTN
	,SYS_TARGET_ID
	FROM 
	TSS_CLEANSE_INPUT1_BRA;

REPLACE VIEW MDM.REG_OPT_OUT_STG 
AS
SELECT
OPTOUT_ID                     ,
MKTNG_PGM_NBR                 ,
SUBSCRPTN_OPT_NBR             ,
FNAME                         ,
LNAME                         ,
EMAIL                         ,
PHONE                         ,
S_ADD1                        ,
S_ADD2                        ,
S_ADD3                        ,
S_CITY                        ,
S_STATE                       ,
S_ZIP                         ,
S_COUNTRY                     ,
OPT_OUT_DTTIME                ,
ADDR_LINE_1_TXT               ,
ADDR_LINE_2_TXT               ,
ADDR_LINE_3_TXT               ,
CITY_NAME                     ,
TERR_NAME                     ,
POSTL_AREA_CODE               ,
CNTRY_NAME                    ,
LOAD_ID                       ,
LOAD_TS                       ,
MDM_LOAD_IND                  
FROM ICRM_STAGE_TBL.REG_OPT_OUT_STG
;

CREATE MULTISET TABLE MDM.REG_OPT_OUT_MDM_TEMP ,FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO
     (
      MKTNG_PGM_NBR INTEGER,
      REGIS_PRSNA_ID INTEGER,
      LEGAL_ENT_NBR SMALLINT,
      DATA_SRCE_NBR SMALLINT,
      SUBSCRIPTION_NBR INTEGER,
      MATCHD_CNSMR_PRSNA_ID INTEGER,
      FNAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
      LNAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
      EMAIL VARCHAR(50) CHARACTER SET UNICODE NOT CASESPECIFIC,
      PHONE VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
      S_ADD1 VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
      S_ADD2 VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
      S_ADD3 VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
      S_CITY VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      S_STATE VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      S_ZIP VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      S_COUNTRY VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      OPT_OUT_DTTIME TIMESTAMP(0),
      ADDR_LINE_1_TXT VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      ADDR_LINE_2_TXT VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      ADDR_LINE_3_TXT VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      CITY_NAME VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      TERR_NAME VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      POSTL_AREA_CODE VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      CNTRY_NAME VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      LOAD_ID DECIMAL(18,0),
      LOAD_TS TIMESTAMP(0),
      MDM_LOAD_IND CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      EDW_MKTNG_PGM_NBR INTEGER,
      HIST_REGIS_PRSNA_ID INTEGER)
PRIMARY INDEX REG_OPT_OUT_MDM_NUPI ( MKTNG_PGM_NBR,REGIS_PRSNA_ID,SUBSCRIPTION_NBR,OPT_OUT_DTTIME )
INDEX (SUBSCRIPTION_NBR,MATCHD_CNSMR_PRSNA_ID);

REPLACE VIEW MDM.V_SRC_EMAIL_DETAIL
AS
SELECT DISTINCT A.SOURCE_ID,
A.REQ_MAIL_ID,
A.AGN_CON_MAIL_ID,
B.LOAD_ID
FROM ETL_CTRL.SOURCE_CONTROL A
INNER JOIN ETL_CTRL.LOAD_CONTROL B
ON A.SOURCE_ID = B.SOURCE_ID
AND B.LOAD_TYPE='ETL'
AND (B.LOAD_ID IN(SEL LOAD_ID FROM MDM.MDM_LOAD_CONTROL)
OR B.LOAD_ID IN(SEL LOAD_ID FROM MDM.MDM_LOAD_CONTROL_OPTOUT))
INNER JOIN LOAD_INFO LI
ON B.LOAD_ID = LI.LOAD_ID
AND (LI.PROCESS_NAME='Wrapper' OR LI.PROCESS_NAME='OPTOUT Load')
AND LI.STATUS = 'Success';

REPLACE VIEW MDM.REGIS_PRSNA_OPT_HIST 
AS
SELECT
REGIS_PRSNA_ID                ,
MKTNG_PGM_NBR                 ,
LEGAL_ENT_NBR                 ,
DATA_SRCE_NBR                 ,
SUBSCRIPTION_NBR              ,
FIRST_NAME                    ,
LAST_NAME                     ,
EMAIL_ADDR_TEXT               ,
CONTACT_PHONE_NBR             ,
SRC_ADDR_LINE_1_TXT           ,
SRC_ADDR_LINE_2_TXT           ,
SRC_ADDR_LINE_3_TXT           ,
SRC_CITY_NAME                 ,
SRC_STATE                     ,
SRC_ZIP                       ,
SRC_CNTRY_NAME                ,
ADDR_LINE_1_TXT               ,
ADDR_LINE_2_TXT               ,
ADDR_LINE_3_TXT               ,
CITY_NAME                     ,
TERR_NAME                     ,
POSTL_AREA_CODE               ,
CNTRY_NAME                    ,
OPT_IND                       ,
OPT_TIME                  ,
OPT_REASN_TXT             ,
LAST_ACTIVITY_TM              ,
LOG_SOURCE_ID                 ,
LOG_UPDATE_USER               ,
LOG_LOAD_ID                            
FROM ICRM_TBL.REGIS_PRSNA_OPT_HIST
;