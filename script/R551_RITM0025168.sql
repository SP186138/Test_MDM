.logon $TDPID/$TDUSER,$TDPWD


.SET ERROROUT STDOUT;
.SET SESSION CHARSET 'UTF8';

DATABASE MDM;
.GOTO $Step





 .LABEL L0

DEL FROM USER_WORK.MATCHD_CNSMR_PRSNA_DUP1;

.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;


.LABEL L1

DEL FROM USER_WORK.MATCHD_CNSMR_PRSNA_DUP2;

.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L2

INSERT INTO USER_WORK.MATCHD_CNSMR_PRSNA_dup1
SEL * from MDM.MATCHD_CNSMR_PRSNA
where MATCHD_CNSMR_PRSNA_ID in(
SEL MATCHD_CNSMR_PRSNA_ID  
FROM MDM.MATCHD_CNSMR_PRSNA
GROUP BY 1
HAVING COUNT (MATCHD_CNSMR_PRSNA_ID) > 1);

.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;


.LABEL L3

INSERT INTO USER_WORK.MATCHD_CNSMR_PRSNA_DUP2
SEL * FROM USER_WORK.MATCHD_CNSMR_PRSNA_DUP1
QUALIFY RANK() OVER(PARTITION BY MATCHD_CNSMR_PRSNA_ID, LEGAL_ENT_NBR ORDER BY LATST_ACTVY_DATE DESC,REGIS_DATETM DESC, SYS_SOURCE DESC,
SYS_LAST_MODIFIED_DATE DESC,PRSNA_STATUS_CODE ASC, NAME_PREFX_TXT ASC,HSHLD_PRSNA_ID DESC,HEAD_OF_HSHLD_IND ASC,UNIVERSAL_OPT_OUT ASC,
GVN_NAME ASC,MID_NAME ASC,FAMLY_NAME ASC,NAME_SUFFX_TXT ASC,
FULL_NAME ASC,GENDR_IND ASC,BRTH_DATE DESC,NOTE_TXT ASC,
CNSMR_USER_NAME ASC,LANG_CODE ASC,SYS_TARGET_ID DESC,
SYS_AUTH_ID ASC,SYS_CREATED_BY ASC,SYS_CREATION_DATE DESC,
SYS_ENT_STATE ASC,SYS_LAST_MODIFIED_BY ASC,SYS_NC_TYPE ASC,SYS_ERR_CODE ASC,SYS_ERR_SVRTY ASC)=1;

.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L4

DEL  FROM MDM.MATCHD_CNSMR_PRSNA WHERE MATCHD_CNSMR_PRSNA_ID IN (SEL DISTINCT MATCHD_CNSMR_PRSNA_ID FROM USER_WORK.MATCHD_CNSMR_PRSNA_dup1);

.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L5

INSERT INTO MDM.MATCHD_CNSMR_PRSNA
SEL * FROM USER_WORK.MATCHD_CNSMR_PRSNA_DUP2;

.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;