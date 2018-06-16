.logon $TDPID/$TDUSER,$TDPWD


.SET ERROROUT STDOUT;
.SET SESSION CHARSET 'UTF8';
.SET ERRORLEVEL 3807 SEVERITY 0

DATABASE MDM;
.GOTO $Step



.LABEL L0
DROP TABLE DEPLOY_WORK.ATTRIBUTE_VALUES_MDM_573 ;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L1
DROP TABLE DEPLOY_WORK.ATTRIBUTE_TYPES_MDM_573 ;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L2
DROP TABLE DEPLOY_WORK.ATTRIBUTE_TYPES_HIERARCHY_MDM_573 ;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L3
DROP TABLE DEPLOY_WORK.ATTRIBUTE_TYPES_RELN_MDM_573 ;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L4
DROP TABLE DEPLOY_WORK.ATTRIBUTE_VALUES_HIERARCHY_MDM_573 ;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L5
DROP TABLE DEPLOY_WORK.ATTRIBUTE_VALUES_RELN_MDM_573 ;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L6
DROP TABLE DEPLOY_WORK.RPT_ADDR_QLTY_MDM_573 ;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L7
DROP TABLE DEPLOY_WORK.RPT_CNSMR_NBR_MDM_573 ;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L8
DROP TABLE DEPLOY_WORK.RPT_DATA_NBR_MDM_573 ;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L9
DROP TABLE DEPLOY_WORK.RPT_LOAD_NBR_MDM_573 ;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L10
DROP TABLE MDM.TRILLIUM_OUTPUT_DUP_MDM_573 ;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L11
DROP TABLE DEPLOY_WORK.tss_cntry_table_map_MDM_573 ;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L12
DROP TABLE DEPLOY_WORK.ENV_NM_MDM_573 ;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L13
DROP TABLE DEPLOY_WORK.upld_tmplt_prps_MDM_573 ;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L14
DROP TABLE DEPLOY_WORK.DQRM_Email_573 ;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L15
DROP TABLE DEPLOY_WORK.DATA_SRCE_SUBS_OPT_IN_DMY_573 ;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L16
DROP TABLE DEPLOY_WORK.DATA_SRCE_SUBS_OPT_IN_573 ;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L17
DROP TABLE DEPLOY_WORK.TRT_IN_DUMMY_573 ;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L18
DROP TABLE DEPLOY_WORK.TRT_IN_573 ;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L19
DROP TABLE DEPLOY_WORK.PREDFND_TRT_VAL_IN_573 ;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L20
DROP TABLE DEPLOY_WORK.PREDFND_TRT_VAL_IN_DUMMY_573 ;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L21
DROP TABLE DEPLOY_WORK.DATA_SUPLR_573 ;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L22
DROP TABLE DEPLOY_WORK.DATA_SRCE_573 ;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

