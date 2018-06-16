
.logon $TDPID/$TDUSER,$TDPWD


.SET ERROROUT STDOUT;
.SET SESSION CHARSET 'UTF8';

DATABASE MDM;
.GOTO $Step


.LABEL L0

INSERT INTO  MDM.REGIS_PRSNA_POSTL_ADDR
(REGIS_PRSNA_ID, MKTNG_PGM_NBR ,	
      LEGAL_ENT_NBR ,	
      CNTCT_POINT_CATEG_CODE, WIN_KEY 				,	
      SUBSCRPTN_OPT_NBR 	,	
      SUBSCRPTN_OPT_IND 	,	
      CNSMR_CHCE_DATETM 	,	
      PREF_CNTCT_POINT_IND 	,	
      ADDR_LINE_1_TXT 		,	
      ADDR_LINE_2_TXT 		,	
      ADDR_LINE_3_TXT 		,	
      STRET_NUM 			,	
      STRET_NAME 			,	
      APT_NUM 				,	
      PO_BOX_NUM 			,	
      CITY_NAME 			,	
      POSTL_AREA_CODE 	,
      TERR_NAME 		,
      CITY_CODE 		,
      TERR_CODE 		,
      CNTRY_CODE 		,
      LAT_MEAS 			,
      LONG_MEAS 		,
      GL_ACCURACY , 		
      GL_MATCH_FLG 			,	
      DR_CLEANSE_LVL  ,	
      VALID_CNTCT_POINT_IND 	,
      GUARDN_NAME 				,
      GUARDN_EMAIL_ADDR_TXT 	,
      GUARDN_CNSNT_IND 			,
      ACNLGMT_DATE 				,
      POSTL_STATUS_CODE 		,
      PR_GEOCODE_FAIL 			,
      TQ_GOUT_MATCH_LEVEL 		,
      PR_REV_GROUP 				,
      DATA_SRCE_NBR 			,
      LAST_RTN_DATETM 			,
      POSTL_ADDR_ID 			,
      SYS_SOURCE 				,
      SYS_TARGET_ID 			,
      SYS_AUTH_ID 				,
      SYS_CREATED_BY 			,
      SYS_CREATION_DATE 		,
      SYS_LAST_MODIFIED_DATE 		,
      SYS_ENT_STATE 				,
      SYS_LAST_MODIFIED_BY 			,
      SYS_NC_TYPE 					,
      SYS_ERR_CODE 					,
      SYS_ERR_SVRTY 				
	  )
 SEL 
 REGIS_PRSNA_ID, MKTNG_PGM_NBR ,	
      LEGAL_ENT_NBR ,	
      CNTCT_POINT_CATEG_CODE, WIN_KEY 				,	
      SUBSCRPTN_OPT_NBR 	,	
      SUBSCRPTN_OPT_IND 	,	
      CNSMR_CHCE_DATETM 	,	
      PREF_CNTCT_POINT_IND 	,	
      ADDR_LINE_1_TXT 		,	
      ADDR_LINE_2_TXT 		,	
      ADDR_LINE_3_TXT 		,	
      STRET_NUM 			,	
      STRET_NAME 			,	
      APT_NUM 				,	
      PO_BOX_NUM 			,	
      CITY_NAME 			,	
      POSTL_AREA_CODE 	,
      TERR_NAME 		,
      CITY_CODE 		,
      TERR_CODE 		,
      CNTRY_CODE 		,
      LAT_MEAS 			,
      LONG_MEAS 		,
      GL_ACCURACY , 		
      GL_MATCH_FLG 			,	
      DR_CLEANSE_LVL  ,	
      VALID_CNTCT_POINT_IND 	,
      GUARDN_NAME 				,
      GUARDN_EMAIL_ADDR_TXT 	,
      GUARDN_CNSNT_IND 			,
      ACNLGMT_DATE 				,
      POSTL_STATUS_CODE 		,
      PR_GEOCODE_FAIL 			,
      TQ_GOUT_MATCH_LEVEL 		,
      PR_REV_GROUP 				,
      DATA_SRCE_NBR 			,
      LAST_RTN_DATETM 			,
      POSTL_ADDR_ID 			,
      SYS_SOURCE 				,
      SYS_TARGET_ID 			,
      SYS_AUTH_ID 				,
      SYS_CREATED_BY 			,
      SYS_CREATION_DATE 		,
      SYS_LAST_MODIFIED_DATE 		,
      SYS_ENT_STATE 				,
      SYS_LAST_MODIFIED_BY 			,
      SYS_NC_TYPE 					,
      SYS_ERR_CODE 					,
      SYS_ERR_SVRTY 				
 FROM  DEPLOY_WORK.REGIS_PRSNA_POSTL_ADDR_572;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 
 .LABEL L0
 INSERT INTO MDM.REGIS_PRSNA_EMAIL_ADDR 
(
REGIS_PRSNA_ID ,
MKTNG_PGM_NBR ,
LEGAL_ENT_NBR ,
CNTCT_POINT_CATEG_CODE ,
SUBSCRPTN_OPT_NBR ,
SUBSCRPTN_OPT_IND ,
CNSMR_CHCE_DATETM ,
PREF_CNTCT_POINT_IND, 
EMAIL_ADDR_TXT ,
EMAIL_FORMT_CODE, 
VALID_CNTCT_POINT_IND,
GUARDN_NAME ,
GUARDN_EMAIL_ADDR_TXT ,
GUARDN_CNSNT_IND ,
ACNLGMT_DATE ,
EMAIL_STATUS_CODE, 
DATA_SRCE_NBR ,
LAST_RTN_DATETM, 
SYS_SOURCE ,
SYS_TARGET_ID, 
SYS_AUTH_ID ,
SYS_CREATED_BY, 
SYS_CREATION_DATE ,
SYS_LAST_MODIFIED_DATE, 
SYS_ENT_STATE ,
SYS_LAST_MODIFIED_BY ,
SYS_NC_TYPE ,
SYS_ERR_CODE ,
SYS_ERR_SVRTY )
SELECT 

REGIS_PRSNA_ID ,
MKTNG_PGM_NBR ,
LEGAL_ENT_NBR ,
CNTCT_POINT_CATEG_CODE ,
SUBSCRPTN_OPT_NBR ,
SUBSCRPTN_OPT_IND ,
CNSMR_CHCE_DATETM ,
PREF_CNTCT_POINT_IND, 
EMAIL_ADDR_TXT ,
EMAIL_FORMT_CODE, 
VALID_CNTCT_POINT_IND,
GUARDN_NAME ,
GUARDN_EMAIL_ADDR_TXT ,
GUARDN_CNSNT_IND ,
ACNLGMT_DATE ,
EMAIL_STATUS_CODE, 
DATA_SRCE_NBR ,
LAST_RTN_DATETM, 
SYS_SOURCE ,
SYS_TARGET_ID, 
SYS_AUTH_ID ,
SYS_CREATED_BY, 
SYS_CREATION_DATE ,
SYS_LAST_MODIFIED_DATE, 
SYS_ENT_STATE ,
SYS_LAST_MODIFIED_BY ,
SYS_NC_TYPE ,
SYS_ERR_CODE ,
SYS_ERR_SVRTY 
FROM DEPLOY_WORK.REGIS_PRSNA_EMAIL_ADDR_572 ;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L0
INSERT INTO  MDM.REGIS_PRSNA_PHONE 
(
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
,LAST_RTN_DATETM)
SELECT 
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
FROM DEPLOY_WORK.REGIS_PRSNA_PHONE_572;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L0
INSERT INTO MDM.REGIS_PRSNA_SOC_NET_ACCT 
(
REGIS_PRSNA_ID
,MKTNG_PGM_NBR
,LEGAL_ENT_NBR
,CNTCT_POINT_CATEG_CODE
,SUBSCRPTN_OPT_NBR
,SUBSCRPTN_OPT_IND
,CNSMR_CHCE_DATETM
,PREF_CNTCT_POINT_IND
,SOCIAL_NETWK_ACCT_ID_VAL
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
)
SELECT 
REGIS_PRSNA_ID
,MKTNG_PGM_NBR
,LEGAL_ENT_NBR
,CNTCT_POINT_CATEG_CODE
,SUBSCRPTN_OPT_NBR
,SUBSCRPTN_OPT_IND
,CNSMR_CHCE_DATETM
,PREF_CNTCT_POINT_IND
,SOCIAL_NETWK_ACCT_ID_VAL
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
FROM DEPLOY_WORK.REGIS_PRSNA_SOC_NET_ACCT_572;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L0
INSERT INTO iCRM_TBL.PRSNA_TRT
( REGIS_PRSNA_ID ,
      MKTNG_PGM_NBR ,
      TRT_NBR ,
      PRSNA_TRT_SEQ_NBR, 
      PRSNA_TRT_DATE ,
      PRSNA_TRT_TXT ,
      LEGAL_ENT_NBR ,
      SYS_SOURCE ,
      SYS_TARGET_ID, 
      SYS_AUTH_ID ,
      SYS_CREATED_BY, 
      SYS_CREATION_DATE, 
      SYS_LAST_MODIFIED_DATE, 
      SYS_ENT_STATE ,
      SYS_LAST_MODIFIED_BY, 
      SYS_NC_TYPE ,
      SYS_ERR_CODE,
      SYS_ERR_SVRTY)
SEL
 REGIS_PRSNA_ID ,
      MKTNG_PGM_NBR ,
      TRT_NBR ,
      PRSNA_TRT_SEQ_NBR, 
      PRSNA_TRT_DATE ,
      PRSNA_TRT_TXT ,
      LEGAL_ENT_NBR ,
      SYS_SOURCE ,
      SYS_TARGET_ID, 
      SYS_AUTH_ID ,
      SYS_CREATED_BY, 
      SYS_CREATION_DATE, 
      SYS_LAST_MODIFIED_DATE, 
      SYS_ENT_STATE ,
      SYS_LAST_MODIFIED_BY, 
      SYS_NC_TYPE ,
      SYS_ERR_CODE,
      SYS_ERR_SVRTY
 FROM DEPLOY_WORK.PRSNA_TRT_572;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 
 .LABEL L0
 INSERT INTO MDM.REGIS_PRSNA
(REGIS_PRSNA_ID
,MKTNG_PGM_NBR
,LEGAL_ENT_NBR
,MATCHD_CNSMR_PRSNA_ID
,REFERAL_MKTNG_PGM_NBR
,TRM_LEAD_KEY
,NAME_PREFX_TXT
,GVN_NAME
,MID_NAME
,FAMLY_NAME
,NAME_SUFFX_TXT
,FULL_NAME
,GENDR_IND
,BRTH_DATE
,LANG_CODE
,CNTRY_CODE
,EMAIL_SUPRSN_IND
,POSTL_SUPRSN_IND
,PHONE_SUPRSN_IND
,SOCL_NETWK_SUPRSN_IND
,NATIONAL_ID_NBR
,CNSMR_SENTIMENT
,LATST_ACTVY_DATE
,REGIS_CNSMR_ID_VAL
,CNSMR_USER_NAME
,REGIS_DATE
,PRSNA_STATUS_CODE
,LYLTY_PGM_NBR
,LYLTY_ACCT_NUM
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
,data_srce_nbr
,DATA_ORIGIN_SRCE_NBR
,DATA_OP_SRCE_NAME
,PII_DATA_MINIMIZE_DATETM
,GVN_NAME_ALIAS
,FAMLY_NAME_ALIAS
)  SELECT
REGIS_PRSNA_ID
,MKTNG_PGM_NBR
,LEGAL_ENT_NBR
,MATCHD_CNSMR_PRSNA_ID
,REFERAL_MKTNG_PGM_NBR
,TRM_LEAD_KEY
,NAME_PREFX_TXT
,GVN_NAME
,MID_NAME
,FAMLY_NAME
,NAME_SUFFX_TXT
,FULL_NAME
,GENDR_IND
,BRTH_DATE
,LANG_CODE
,CNTRY_CODE
,EMAIL_SUPRSN_IND
,POSTL_SUPRSN_IND
,PHONE_SUPRSN_IND
,SOCL_NETWK_SUPRSN_IND
,NATIONAL_ID_NBR
,CNSMR_SENTIMENT
,LATST_ACTVY_DATE
,REGIS_CNSMR_ID_VAL
,CNSMR_USER_NAME
,REGIS_DATETM
,PRSNA_STATUS_CODE
,LYLTY_PGM_NBR
,LYLTY_ACCT_NUM
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
,data_srce_nbr
,DATA_ORIGIN_SRCE_NBR
,DATA_OP_SRCE_NAME
,PII_DATA_MINIMIZE_DATETM
,GVN_NAME_ALIAS
,FAMLY_NAME_ALIAS
FROM DEPLOY_WORK.REGIS_PRSNA_572;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;