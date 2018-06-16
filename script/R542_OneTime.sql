.logon $TDPID/$TDUSER,$TDPWD


.SET ERROROUT STDOUT;
.SET SESSION CHARSET 'UTF8';

DATABASE MDM;

.GOTO $Step


 .LABEL L0

CREATE TABLE user_work.REGIS_PRSNA_R542  AS 
(SELECT REGIS_PRSNA_ID ,MKTNG_PGM_NBR,MATCHD_CNSMR_PRSNA_ID,LEGAL_ENT_NBR FROM REGIS_PRSNA WHERE (MKTNG_PGM_NBR) IN (SEL MKTNG_PGM_NBR FROM MKTNG_PGM WHERE LEGAL_ENT_NBR IN (23))) WITH DATA
PRIMARY INDEX REGIS_PRSNA_NUPI ( REGIS_PRSNA_ID ,MKTNG_PGM_NBR )
PARTITION BY MKTNG_PGM_NBR ;

 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L1
 

CREATE TABLE user_work.REGIS_PRSNA_POSTL_ADDR_R542  AS 
(SELECT MKTNG_PGM_NBR,REGIS_PRSNA_ID,CNTCT_POINT_CATEG_CODE,WIN_KEY,SYS_ERR_CODE FROM REGIS_PRSNA_POSTL_ADDR WHERE (MKTNG_PGM_NBR) IN (SEL MKTNG_PGM_NBR FROM MKTNG_PGM WHERE LEGAL_ENT_NBR IN (23))) WITH DATA
PRIMARY INDEX REGIS_PRSNA_POSTL_ADDR_NUPI ( REGIS_PRSNA_ID ,MKTNG_PGM_NBR )
PARTITION BY MKTNG_PGM_NBR ;

 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L2
 

CREATE TABLE user_work.MATCHD_CNSMR_PRSNA_R542 AS
(SELECT * FROM MATCHD_CNSMR_PRSNA WHERE (LEGAL_ENT_NBR,MATCHD_CNSMR_PRSNA_ID) IN (SELECT LEGAL_ENT_NBR,MATCHD_CNSMR_PRSNA_ID FROM user_work.REGIS_PRSNA_R542)) WITH DATA
PRIMARY INDEX MATCHD_CNSMR_PRSNA_NUPI ( MATCHD_CNSMR_PRSNA_ID ,LEGAL_ENT_NBR )
PARTITION BY LEGAL_ENT_NBR ;

 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L3
 

CREATE TABLE user_work.HSHLD_PRSNA_R542 AS
(SELECT * FROM HSHLD_PRSNA WHERE (LEGAL_ENT_NBR,HSHLD_PRSNA_ID) IN (SELECT LEGAL_ENT_NBR,HSHLD_PRSNA_ID FROM user_work.MATCHD_CNSMR_PRSNA_R542)) WITH DATA
PRIMARY INDEX MATCHD_CNSMR_PRSNA_NUPI ( HSHLD_PRSNA_ID ,LEGAL_ENT_NBR )
PARTITION BY LEGAL_ENT_NBR ;

 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L4
 

CREATE TABLE user_work.MATCHD_CNSMR_POSTL_ADDR_R542 AS
(SELECT * FROM MATCHD_CNSMR_POSTL_ADDR WHERE (LEGAL_ENT_NBR,MATCHD_CNSMR_PRSNA_ID) IN (SELECT LEGAL_ENT_NBR,MATCHD_CNSMR_PRSNA_ID FROM user_work.REGIS_PRSNA_R542)) WITH DATA
PRIMARY INDEX MATCHD_CNSMR_POSTL_ADDR_NUPI ( MATCHD_CNSMR_PRSNA_ID ,LEGAL_ENT_NBR )
PARTITION BY LEGAL_ENT_NBR ;

 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L5

 REPLACE VIEW MDM.LYLTY_ACCT_DETAILS AS
SEL 
LAS.*,
LL.LYLTY_LVL_NAME
FROM
MDM.LYLTY_ACCT_STMT LAS
LEFT OUTER JOIN MDM.LYLTY_LVL LL 
ON
LAS.MKTNG_PGM_NBR = LL.MKTNG_PGM_NBR
AND
LAS.LYLTY_PGM_NBR = LL.LYLTY_PGM_NBR
AND
LAS.LYLTY_LVL_CODE =LL.LYLTY_LVL_CODE
QUALIFY rank() over (partition by LAS.LYLTY_ACCT_NUM, LAS.MKTNG_PGM_NBR ORDER BY LAS.LYLTY_ACCT_STMT_DATE DESC)=1
;

 .LABEL L6

REPLACE VIEW MDM.CURR_LYLTY_TRANS_DATA AS
SELECT 
LAS.MKTNG_PGM_NBR, 
LAS.LYLTY_ACCT_NUM, 
LAS.LYLTY_PGM_NBR, 
LTRE.LYLTY_TRANX_DATETM AS LYLTY_ACCT_STMT_DATE, 
CASE LTRE.LYLTY_TRANX_TYPE_CODE 
WHEN 'E' THEN 'EARN'
WHEN 'B' THEN 'BURN'
ELSE NULL
END AS LYLTY_TRANX_TYPE_NAME, 
LTRE.EARND_PTS_QTY, 
LTRE.RDMD_PTS_QTY, 
LRE.LYLTY_REWARD_NAME 
FROM 
MDM.LYLTY_ACCT_DETAILS LAS 
LEFT OUTER JOIN MDM.LYLTY_TRANX LTRE 
ON LAS.LYLTY_ACCT_NUM=LTRE.LYLTY_ACCT_NUM
AND LAS.MKTNG_PGM_NBR= LTRE.MKTNG_PGM_NBR
AND LAS.LYLTY_PGM_NBR=LTRE.LYLTY_PGM_NBR
AND LYLTY_TRANX_TYPE_CODE IN ('E' , 'B') 
LEFT OUTER JOIN MDM.LYLTY_REWARD LRE 
ON LTRE.MKTNG_PGM_NBR= LRE.MKTNG_PGM_NBR 
AND LTRE.LYLTY_PGM_NBR=LRE.LYLTY_PGM_NBR
AND LTRE.LYLTY_REWARD_CODE = LRE.LYLTY_REWARD_CODE
QUALIFY rank() over (partition by LAS.LYLTY_ACCT_NUM, LAS.MKTNG_PGM_NBR, LTRE.LYLTY_TRANX_TYPE_CODE ORDER BY LTRE.LYLTY_TRANX_NUM DESC)=1
;

 .LABEL L7