.logon $TDPID/$TDUSER,$TDPWD
 
.SET ERROROUT STDOUT ;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
.SET SESSION CHARSET 'UTF8' ;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.GOTO $Step

.LABEL L1
DROP TABLE LD_DQRM_Email;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 
 .LABEL L2
CREATE MULTISET TABLE MDM.LD_DQRM_Email ,NO FALLBACK ,
     NO BEFORE JOURNAL,
     NO AFTER JOURNAL,
     CHECKSUM = DEFAULT,
     DEFAULT MERGEBLOCKRATIO
     (
      REGION_CODE VARCHAR(4) CHARACTER SET LATIN NOT CASESPECIFIC,
      MAIL_TYPE VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
      EMAIL_ADDR_TXT VARCHAR(1000) CHARACTER SET LATIN NOT CASESPECIFIC,
      RULE_NUMBER VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC,
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
      SYS_WORKFLOW_ID VARCHAR(100) CHARACTER SET LATIN NOT CASESPECIFIC)
PRIMARY INDEX ( REGION_CODE ,MAIL_TYPE ,EMAIL_ADDR_TXT ,RULE_NUMBER );
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

 