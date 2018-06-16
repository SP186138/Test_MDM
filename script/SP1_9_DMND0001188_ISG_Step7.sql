.logon $TDPID/$TDUSER,$TDPWD
 
.SET ERROROUT STDOUT ;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
.SET SESSION CHARSET 'UTF8' ;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.GOTO $Step

.LABEL L1
INSERT INTO MDM.ATTRIBUTE_VALUES SEL * FROM DEPLOY_WORK.ATTRIBUTE_VALUES_MDM_DMND000118;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L2
INSERT INTO MDM.ATTRIBUTE_TYPES SEL * FROM DEPLOY_WORK.ATTRIBUTE_TYPES_MDM_DMND00011;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L3
INSERT INTO MDM.ATTRIBUTE_TYPES_HIERARCHY SEL * FROM DEPLOY_WORK.ATTRIBUTE_TYPES_HIERARCHY_MDM_DMND0001188;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L4
INSERT INTO MDM.ATTRIBUTE_VALUES_HIERARCHY SEL * FROM DEPLOY_WORK.ATTRIBUTE_VALUES_HIERARCHY_MDM_DMND0001188;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L5
INSERT INTO MDM.ATTRIBUTE_TYPES_RELN SEL * FROM DEPLOY_WORK.ATTRIBUTE_TYPES_RELN_MDM_DMND0001188;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L6
INSERT INTO MDM.ATTRIBUTE_VALUES_RELN SEL * FROM DEPLOY_WORK.ATTRIBUTE_VALUES_RELN_MDM_DMND0001188;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L7
INSERT INTO MDM.RPT_ADDR_QLTY SEL * FROM DEPLOY_WORK.RPT_ADDR_QLTY_MDM_DMND0001188;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L8
INSERT INTO MDM.RPT_CNSMR_NBR SEL * FROM DEPLOY_WORK.RPT_CNSMR_NBR_MDM_DMND0001188;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L9
INSERT INTO MDM.RPT_DATA_NBR SEL * FROM DEPLOY_WORK.RPT_DATA_NBR_MDM_DMND0001188;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L10
INSERT INTO MDM.RPT_LOAD_NBR SEL * FROM DEPLOY_WORK.RPT_LOAD_NBR_MDM_DMND0001188;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L11
INSERT INTO MDM.tss_cntry_table_map SEL * FROM DEPLOY_WORK.tss_cntry_table_map_MDM_DMND0001188;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L12
INSERT INTO MDM.ENV_NM SEL * FROM DEPLOY_WORK.ENV_NM_MDM_DMND0001188;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L13
DROP TABLE MDM.ERR_PRSNA_STG;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L14
RENAME TABLE MDM.ERR_PRSNA_STG_BKUP_DMND0001188 TO ERR_PRSNA_STG;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L15
DEL FROM upld_tmplt_prps WHERE NAME='EntityINCTVTemplate';
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L16
DEL FROM upld_tmplt_prps WHERE NAME='EntityCNTNT_ELEMTemplate';
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L17
INSERT INTO MDM.upld_tmplt_prps SEL * FROM DEPLOY_WORK.upld_tmplt_prps_MDM_DMND0001188 WHERE NAME='EntityINCTVTemplate';
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L18
INSERT INTO MDM.upld_tmplt_prps SEL * FROM DEPLOY_WORK.upld_tmplt_prps_MDM_DMND0001188 WHERE NAME='EntityCNTNT_ELEMTemplate';
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L19
UPDATE upld_tmplt SET API_NAME='excelCntntUpload',service_name='BCM_MASTER' WHERE display_name='CNTNT_ELEM';
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L20
UPDATE upld_tmplt SET API_NAME='excelInctvUpload',service_name='BCM_MASTER' WHERE display_name='INCTV';
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L21
update upld_tmplt
set service_name='BCM_MASTER',
API_NAME='subscriptionOptExcelUpload'
WHERE NAME='EntitySUBSCRPTN_OPTTemplate';
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
.LABEL L22
DROP TABLE MDM.GT_STORE;								
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
.LABEL L23 
DROP TABLE MDM.LD_STORE;								
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;								
.LABEL L24								

CREATE SET GLOBAL TEMPORARY TABLE MDM.gt_store ,NO FALLBACK ,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     LOG
     (
      STORE_NBR DECIMAL(18,0) NOT NULL,
      RETLR_NBR INTEGER,
      STORE_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
      STORE_STATUS_CD CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      ADDR_LINE_1_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
      ADDR_LINE_2_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
      ADDR_LINE_3_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
      STRET_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
      STRET_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
      STORE_TYPE_CODE CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      CITY_CODE INTEGER,
      TERR_CODE CHAR(8) CHARACTER SET UNICODE NOT CASESPECIFIC,
      CNTRY_CODE CHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC,
      POSTL_AREA_CODE VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      LAT_MEAS DECIMAL(8,6),
      LONG_MEAS DECIMAL(9,6),
      DATA_SRCE_NBR INTEGER,
      LOG_SOURCE_ID DECIMAL(18,0),
      LOG_UPDATE_USER VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      LOG_LOAD_ID VARCHAR(8) CHARACTER SET LATIN NOT CASESPECIFIC,
      STORE_NAME_NTV VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
      APT_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
      PO_BOX_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
      CITY_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
      TERR_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
      GL_MATCH_FLG VARCHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      DR_CLEANSE_LVL INTEGER,
      ALT_STORE_ID VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      STORE_PHN_NBR VARCHAR(25) CHARACTER SET LATIN NOT CASESPECIFIC,
      VALID_CNTCT_POINT_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      PR_GEOCODE_FAIL VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      TQ_GOUT_MATCH_LEVEL VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      PR_REV_GROUP VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      GL_ACCURACY INTEGER,
      SYS_TARGET_ID INTEGER,
      SYS_AUTH_ID VARCHAR(1000) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_SOURCE VARCHAR(256) CHARACTER SET LATIN NOT CASESPECIFIC DEFAULT 'BackEnd',
      SYS_CREATED_BY VARCHAR(70) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_CREATION_DATE TIMESTAMP(0),
      SYS_ENT_STATE VARCHAR(25) CHARACTER SET LATIN NOT CASESPECIFIC CHECK ( SYS_ENT_STATE  IN ('ACTIVE','INACTIVE','NEW','DELETED') ),
      SYS_LAST_MODIFIED_BY VARCHAR(70) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_LAST_MODIFIED_DATE TIMESTAMP(0),
      SYS_NC_TYPE VARCHAR(25) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_ERR_CODE VARCHAR(10000) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_ERR_SVRTY VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC CHECK ( SYS_ERR_SVRTY  IN ('SEVERE_ERROR','ERROR','WARNING') ),
      SYS_FILTER VARCHAR(60) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_WORKFLOW_ID VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_LOAD_ID VARCHAR(32) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_VER_ID VARCHAR(32) CHARACTER SET LATIN NOT CASESPECIFIC, 
CONSTRAINT STORE_PK PRIMARY KEY ( STORE_NBR ))

ON COMMIT DELETE ROWS;                   
                                
  .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;  
.LABEL L25  
CREATE MULTISET TABLE MDM.LD_STORE ,NO FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO
     (
      STORE_NBR DECIMAL(18,0) NOT NULL,
      RETLR_NBR INTEGER,
      STORE_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
      STORE_STATUS_CD CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      ADDR_LINE_1_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
      ADDR_LINE_2_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
      ADDR_LINE_3_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
      STRET_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
      STRET_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
      STORE_TYPE_CODE CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      CITY_CODE INTEGER,
      TERR_CODE CHAR(8) CHARACTER SET UNICODE NOT CASESPECIFIC,
      CNTRY_CODE CHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC,
      POSTL_AREA_CODE VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      LAT_MEAS DECIMAL(8,6),
      LONG_MEAS DECIMAL(9,6),
      DATA_SRCE_NBR INTEGER,
      LOG_SOURCE_ID DECIMAL(18,0),
      LOG_UPDATE_USER VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      LOG_LOAD_ID VARCHAR(8) CHARACTER SET LATIN NOT CASESPECIFIC,
      STORE_NAME_NTV VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
      APT_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
      PO_BOX_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
      CITY_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
      TERR_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
      GL_MATCH_FLG VARCHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      DR_CLEANSE_LVL INTEGER,
      ALT_STORE_ID VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      STORE_PHN_NBR VARCHAR(25) CHARACTER SET LATIN NOT CASESPECIFIC,
      VALID_CNTCT_POINT_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      PR_GEOCODE_FAIL VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      TQ_GOUT_MATCH_LEVEL VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      PR_REV_GROUP VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      GL_ACCURACY INTEGER,
      SYS_TARGET_ID INTEGER,
      SYS_AUTH_ID VARCHAR(1000) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_SOURCE VARCHAR(256) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_CREATED_BY VARCHAR(70) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_CREATION_DATE TIMESTAMP(0),
      SYS_ENT_STATE VARCHAR(25) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_LAST_MODIFIED_BY VARCHAR(70) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_LAST_MODIFIED_DATE TIMESTAMP(0),
      SYS_NC_TYPE VARCHAR(25) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_ERR_CODE VARCHAR(10000) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_ERR_SVRTY VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_LOAD_ID VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_WORKFLOW_ID VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
	    SYS_APPROVAL_STATUS VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_ASSIGNMENT_ID INTEGER DEFAULT NULL)
PRIMARY INDEX ( STORE_NBR );
								
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 
 .LABEL L26
 REPLACE VIEW MDM.ERR_CODE_DETAILS
AS
LOCKING ROW FOR ACCESS
SELECT LOAD_ID,
MKTNG_PGM_NBR,
SYS_ERR_CODE AS ERR_DESC,
COUNT(DISTINCT REGIS_CNSMR_ID_VAL) ERROR_CODE_NBR
FROM MDM.ERR_PRSNA_STG
GROUP BY 1,2,3;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

   .LABEL L27
INSERT INTO MDM.DQRM_Email SEL * FROM DEPLOY_WORK.DQRM_Email_DMND0001188;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 
   .LABEL L28
INSERT INTO MDM.DATA_SRCE_SUBS_OPT_IN_DMY SEL * FROM DEPLOY_WORK.DATA_SRCE_SUBS_OPT_IN_DMY_DMND0001188;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L29
INSERT INTO MDM.DATA_SRCE_SUBS_OPT_IN SEL * FROM DEPLOY_WORK.DATA_SRCE_SUBS_OPT_IN_DMND0001188;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L30
INSERT INTO MDM.TRT_IN_DUMMY SEL * FROM DEPLOY_WORK.TRT_IN_DUMMY_DMND0001188;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L31
INSERT INTO MDM.TRT_IN SEL * FROM DEPLOY_WORK.TRT_IN_DMND0001188;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
  .LABEL L32
INSERT INTO MDM.PREDFND_TRT_VAL_IN SEL * FROM DEPLOY_WORK.PREDFND_TRT_VAL_IN_DMND0001188;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
  .LABEL L33
INSERT INTO MDM.PREDFND_TRT_VAL_IN_DUMMY SEL * FROM DEPLOY_WORK.PREDFND_TRT_VAL_IN_DUMMY_DMND0001188;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 
 
   .LABEL L34
 ALTER TABLE MDM.PRSNA_STG    ADD  PRSNA_STATUS_CODE VARCHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC ;
  .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
     .LABEL L35
  ALTER TABLE MDM.PRSNA_POSTL_ADDR_STG    ADD  POSTL_ADDR_ID INTEGER,
ADD   CITY_CODE INTEGER,
ADD TERR_CODE CHAR(8) CHARACTER SET LATIN NOT CASESPECIFIC,
ADD PR_GEOCODE_FAIL VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
ADD TQ_GOUT_MATCH_LEVEL VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
ADD PR_REV_GROUP VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
ADD LAT_MEAS DECIMAL(8,6),
ADD LONG_MEAS DECIMAL(9,6),
ADD GL_ACCURACY BYTEINT,
ADD GL_MATCH_FLG VARCHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
ADD DR_CLEANSE_LVL BYTEINT,
ADD VALID_ADDR_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC;

 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
  
   .LABEL L36
ALTER TABLE MDM.RPT_LOAD_NBR
ADD WEBSITE_REGIS_NBR INTEGER;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
   .LABEL L37
REPLACE VIEW MDM.POSTL_ADDR
AS LOCKING ROW FOR ACCESS
SEL * FROM  icrm_tbl.POSTL_ADDR;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
  
  .LABEL L38
DROP  TABLE MDM.ADDR_INPUT;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
.LABEL L39
CREATE SET GLOBAL TEMPORARY TABLE MDM.addr_input ,NO FALLBACK ,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     LOG
     (
      REGIS_PRSNA_ID INTEGER NOT NULL,
      MKTNG_PGM_NBR INTEGER NOT NULL,
      LEGAL_ENT_NBR SMALLINT,
      CNTCT_POINT_CATEG_CODE CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL,
      WIN_KEY VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
      SUBSCRPTN_OPT_NBR INTEGER,
      SUBSCRPTN_OPT_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      CNSMR_CHCE_DATETM TIMESTAMP(6),
      PREF_CNTCT_POINT_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL DEFAULT 'Y',
      ADDR_LINE_1_TXT VARCHAR(500) CHARACTER SET UNICODE NOT CASESPECIFIC,
      ADDR_LINE_2_TXT VARCHAR(500) CHARACTER SET UNICODE NOT CASESPECIFIC,
      ADDR_LINE_3_TXT VARCHAR(500) CHARACTER SET UNICODE NOT CASESPECIFIC,
      STRET_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
      STRET_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
      APT_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
      PO_BOX_NUM VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
      CITY_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
      POSTL_AREA_CODE VARCHAR(20) CHARACTER SET UNICODE NOT CASESPECIFIC,
      TERR_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
      CITY_CODE INTEGER,
      TERR_CODE CHAR(8) CHARACTER SET UNICODE NOT CASESPECIFIC,
      CNTRY_CODE CHAR(5) CHARACTER SET LATIN NOT CASESPECIFIC,
      LAT_MEAS DECIMAL(18,6),
      LONG_MEAS DECIMAL(18,6),
      VALID_CNTCT_POINT_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC NOT NULL DEFAULT 'Y',
      GUARDN_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
      GUARDN_EMAIL_ADDR_TXT VARCHAR(1000) CHARACTER SET UNICODE NOT CASESPECIFIC,
      GUARDN_CNSNT_IND CHAR(1) CHARACTER SET LATIN NOT CASESPECIFIC,
      ACNLGMT_DATE DATE FORMAT 'YYYY-MM-DD',
      POSTL_STATUS_CODE CHAR(2) CHARACTER SET LATIN NOT CASESPECIFIC,
      PR_GEOCODE_FAIL VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      TQ_GOUT_MATCH_LEVEL VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      PR_REV_GROUP VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      DATA_SRCE_NBR SMALLINT,
      SYS_SOURCE VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_TARGET_ID INTEGER,
      SYS_AUTH_ID VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_CREATED_BY VARCHAR(70) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_CREATION_DATE TIMESTAMP(0),
      SYS_LAST_MODIFIED_DATE TIMESTAMP(0),
      SYS_ENT_STATE VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_LAST_MODIFIED_BY VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_NC_TYPE VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_ERR_CODE VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_ERR_SVRTY VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC,
      NATIONAL_ID_NBR VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      GL_ACCURACY VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      GL_MATCH_FLAG VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      GL_LATITUDE VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      GL_LONGITUDE VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      DR_CLEANSE_LEVEL VARCHAR(50) CHARACTER SET LATIN NOT CASESPECIFIC,
      POSTL_ADDR_ID INTEGER)
PRIMARY INDEX REGIS_PRSNA_POSTL_ADDR_NUPI ( REGIS_PRSNA_ID ,MKTNG_PGM_NBR )
PARTITION BY MKTNG_PGM_NBR 
ON COMMIT PRESERVE ROWS;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L40

DROP TABLE GT_PRSNA_PHONE_STG ALL;

.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L41

CREATE SET GLOBAL TEMPORARY TABLE MDM.GT_PRSNA_PHONE_STG ,NO FALLBACK ,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO,
     LOG
     (
      MKTNG_PGM_NBR INTEGER NOT NULL,
      REGIS_CNSMR_ID_VAL VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC NOT NULL,
      CNTCT_POINT_CATEG_CODE CHAR(2) CHARACTER SET UNICODE NOT CASESPECIFIC,
      PHONE_CNTRY_NBR INTEGER,
      PHONE_AREA_NBR INTEGER,
      PHONE_EXCHG_NBR INTEGER,
      PHONE_LINE_NBR INTEGER,
      PHONE_EXTSN_NUM VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      FULL_PHONE_NUM VARCHAR(20) CHARACTER SET LATIN NOT CASESPECIFIC,
      SMS_PREFR_IND CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
      SMS_AVAIL_START_TIME TIME(6),
      SMS_AVAIL_END_TIME TIME(6),
      CNTCT_OPTN_IND CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
      PREFR_IND CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
      VALID_IND CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
      RECORD_IND CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
      LOAD_ID DECIMAL(18,0),
      LOAD_TS TIMESTAMP(0),
      MDM_LOAD_IND CHAR(2) CHARACTER SET UNICODE NOT CASESPECIFIC,
      SYNC_STATUS VARCHAR(15) CHARACTER SET UNICODE NOT CASESPECIFIC,
      CNTCT_OPTN_NBR DECIMAL(4,2),
      CNSMR_CHCE_DATETM TIMESTAMP(0),
      GUARDN_NAME VARCHAR(100) CHARACTER SET UNICODE NOT CASESPECIFIC,
      GUARDN_EMAIL_ADDR_TXT VARCHAR(200) CHARACTER SET UNICODE NOT CASESPECIFIC,
      GUARDN_CNSNT_IND CHAR(1) CHARACTER SET UNICODE NOT CASESPECIFIC,
      ACNLGMT_DATE DATE FORMAT 'YY/MM/DD',
      SYS_TARGET_ID INTEGER,
      SYS_AUTH_ID VARCHAR(1000) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_SOURCE VARCHAR(256) CHARACTER SET LATIN NOT CASESPECIFIC DEFAULT 'BackEnd',
      SYS_CREATED_BY VARCHAR(70) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_CREATION_DATE TIMESTAMP(0),
      SYS_ENT_STATE VARCHAR(25) CHARACTER SET LATIN NOT CASESPECIFIC CHECK ( SYS_ENT_STATE  IN ('ACTIVE','INACTIVE','NEW','DELETED') ),
      SYS_LAST_MODIFIED_BY VARCHAR(70) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_LAST_MODIFIED_DATE TIMESTAMP(0),
      SYS_NC_TYPE VARCHAR(25) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_ERR_CODE VARCHAR(10000) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_ERR_SVRTY VARCHAR(30) CHARACTER SET LATIN NOT CASESPECIFIC CHECK ( SYS_ERR_SVRTY  IN ('SEVERE_ERROR','ERROR','WARNING') ),
      SYS_FILTER VARCHAR(60) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_WORKFLOW_ID VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      SYS_LOAD_ID VARCHAR(32) CHARACTER SET LATIN NOT CASESPECIFIC, 
CONSTRAINT PRSNA_PHONE_STG_PK PRIMARY KEY ( MKTNG_PGM_NBR ,REGIS_CNSMR_ID_VAL ))

ON COMMIT DELETE ROWS;

.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;


 .LABEL L42
INSERT INTO MDM.WS_CNSMR_DEL SEL * FROM DEPLOY_WORK.WS_CNSMR_DEL_DMND0001188;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;


  .LABEL L43

UPDATE upld_tmplt
SET service_name= 'BCM_MASTER'
,API_NAME='BrandFamlyExcelUpload'
WHERE template_type='Transaction.EntityBRAND_FAMLYTemplate';
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 
.LABEL L44
INSERT INTO MDM.WS_CNSMR_GDPR_RQST SEL * FROM DEPLOY_WORK.WS_CNSMR_GDPR_RQST_DMND0001188;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE; 

 
 