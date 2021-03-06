 .logon $TDPID/$TDUSER,$TDPWD
 
.SET ERROROUT STDOUT ;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
.SET SESSION CHARSET 'UTF8' ;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.GOTO $Step

.LABEL L1
CREATE VOLATILE SET TABLE TEMP1 AS
(
SEL	A.REGIS_PRSNA_ID,A.MKTNG_PGM_NBR,A.LEGAL_ENT_NBR,A.CNTRY_INFO_TXT 
FROM	PRSNA_POSTL_ADDR_ORIG A
INNER JOIN REGIS_PRSNA B
ON A.MKTNG_PGM_NBR=B.MKTNG_PGM_NBR
AND A.REGIS_PRSNA_ID=B.REGIS_PRSNA_ID
AND B.LEGAL_ENT_NBR NOT IN (22,35)
AND B.CNTRY_CODE  IN('ESP','PRT')) 
WITH DATA
PRIMARY INDEX(REGIS_PRSNA_ID,MKTNG_PGM_NBR)
PARTITION BY MKTNG_PGM_NBR
ON COMMIT PRESERVE ROWS;

 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;


.LABEL L2

UPDATE	 REGIS_PRSNA
FROM TEMP1 P
SET cntry_code= P.CNTRY_INFO_TXT
WHERE REGIS_PRSNA.REGIS_PRSNA_ID=P.REGIS_PRSNA_ID
	AND REGIS_PRSNA.MKTNG_PGM_NBR=P.MKTNG_PGM_NBR
	AND REGIS_PRSNA.LEGAL_ENT_NBR NOT IN (22,35)
	AND REGIS_PRSNA.CNTRY_CODE  IN('ESP','PRT');
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;


.LABEL L3
UPDATE	 REGIS_PRSNA_POSTL_ADDR
FROM TEMP1 P
SET cntry_code= P.CNTRY_INFO_TXT,
POSTL_ADDR_ID=NULL
WHERE REGIS_PRSNA_POSTL_ADDR.REGIS_PRSNA_ID=P.REGIS_PRSNA_ID
	AND REGIS_PRSNA_POSTL_ADDR.MKTNG_PGM_NBR=P.MKTNG_PGM_NBR
	AND REGIS_PRSNA_POSTL_ADDR.LEGAL_ENT_NBR NOT IN (22,35)
	AND REGIS_PRSNA_POSTL_ADDR.CNTRY_CODE  IN('ESP','PRT');

 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 
 .LABEL L4
 
CREATE SET TABLE DEPLOY_WORK.MATCHD_CNSMR_POSTL_ADDR_DUP1 AS 
(SELECT * FROM MDM.MATCHD_CNSMR_POSTL_ADDR )WITH NO DATA;
  .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 
  .LABEL L5
 INSERT INTO DEPLOY_WORK.MATCHD_CNSMR_POSTL_ADDR_DUP1
SEL * FROM MDM.MATCHD_CNSMR_POSTL_ADDR
WHERE (matchd_cnsmr_prsna_id,legal_ent_nbr) IN 
(SEL matchd_cnsmr_prsna_id,legal_ent_nbr 
FROM MDM.MATCHD_CNSMR_POSTL_ADDR 
GROUP BY 1 ,2
HAVING COUNT(*)>1);
  .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

 .LABEL L6
CREATE SET TABLE DEPLOY_WORK.MATCHD_CNSMR_POSTL_ADDR_DUP2 AS 
(SELECT * FROM MDM.MATCHD_CNSMR_POSTL_ADDR )WITH NO DATA;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

 .LABEL L7
INSERT	INTO DEPLOY_WORK.MATCHD_CNSMR_POSTL_ADDR_DUP2
SEL * 
FROM	DEPLOY_WORK.MATCHD_CNSMR_POSTL_ADDR_DUP1
QUALIFY RANK() OVER (PARTITION BY MATCHD_CNSMR_PRSNA_ID,LEGAL_ENT_NBR 
ORDER BY  SYS_CREATION_DATE DESC, SYS_LAST_MODIFIED_DATE DESC,
  MATCHD_CNSMR_PRSNA_ID DESC,
      LEGAL_ENT_NBR DESC,
      CNTCT_POINT_CATEG_CODE DESC,
      VALID_CNTCT_POINT_IND DESC,
      PREF_CNTCT_POINT_IND DESC,
      ADDR_LINE_1_TXT DESC,
      ADDR_LINE_2_TXT DESC,
      ADDR_LINE_3_TXT DESC,
      STRET_NUM DESC,
      STRET_NAME DESC,
      APT_NUM DESC,
      PO_BOX_NUM DESC, 
      CITY_NAME DESC,
      CITY_CODE DESC,
      POSTL_AREA_CODE  DESC,
      LAT_MEAS DESC,
      LONG_MEAS DESC,
      TERR_NAME DESC,
      TERR_CODE DESC,
      CNTRY_CODE DESC,
      POSTL_ADDR_ID DESC,
	  SYS_SOURCE DESC,
	  SYS_NC_TYPE DESC) = 1;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

 .LABEL L8
 
DEL FROM MDM.MATCHD_CNSMR_POSTL_ADDR
WHERE (matchd_cnsmr_prsna_id,legal_ent_nbr) IN 
(SEL matchd_cnsmr_prsna_id,legal_ent_nbr 
FROM MDM.MATCHD_CNSMR_POSTL_ADDR 
GROUP BY 1 ,2
HAVING COUNT(*)>1);
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 
 .LABEL L9
  INSERT INTO MATCHD_CNSMR_POSTL_ADDR
SEL * FROM DEPLOY_WORK.MATCHD_CNSMR_POSTL_ADDR_DUP2;
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

 .LABEL L10

UPDATE    MATCHD_CNSMR_POSTL_ADDR 
FROM
(
SEL DISTINCT TEMP.MATCHD_CNSMR_PRSNA_ID,P.LEGAL_ENT_NBR,P.CNTRY_INFO_TXT
FROM PRSNA_POSTL_ADDR_ORIG P
INNER JOIN (
SEL    DISTINCT R.REGIS_PRSNA_ID,R.MKTNG_PGM_NBR,M.LEGAL_ENT_NBR,M.MATCHD_CNSMR_PRSNA_ID 
FROM    MATCHD_CNSMR_POSTL_ADDR M
 INNER JOIN REGIS_PRSNA R
 ON M.MATCHD_CNSMR_PRSNA_ID=R.MATCHD_CNSMR_PRSNA_ID
 AND M.LEGAL_ENT_NBR=R.LEGAL_ENT_NBR
 WHERE M.LEGAL_ENT_NBR NOT IN (22,35)
 AND M.CNTRY_CODE IN ('ESP','PRT')) TEMP
 ON P.REGIS_PRSNA_ID=TEMP.REGIS_PRSNA_ID
 AND P.MKTNG_PGM_NBR=TEMP.MKTNG_PGM_NBR
QUALIFY RANK() OVER (PARTITION BY TEMP.MATCHD_CNSMR_PRSNA_ID, P.LEGAL_ENT_NBR ORDER BY P.SYS_LAST_MODIFIED_DATE DESC, P.REGIS_PRSNA_ID DESC)=1) AS SRC
 SET CNTRY_CODE=SRC.CNTRY_INFO_TXT
 ,POSTL_ADDR_ID=NULL
  WHERE 
  MATCHD_CNSMR_POSTL_ADDR.MATCHD_CNSMR_PRSNA_ID=SRC.MATCHD_CNSMR_PRSNA_ID AND
  MATCHD_CNSMR_POSTL_ADDR.LEGAL_ENT_NBR=SRC.LEGAL_ENT_NBR
 AND MATCHD_CNSMR_POSTL_ADDR.LEGAL_ENT_NBR NOT IN (22,35)
 AND MATCHD_CNSMR_POSTL_ADDR.CNTRY_CODE IN ('ESP','PRT');

 
 
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

.LABEL L11
 UPDATE REGIS_PRSNA_OPT_HIST
FROM (
SEL	DISTINCT REGIS_PRSNA_ID,MKTNG_PGM_NBR,SRC_CNTRY_NAME 
FROM	REGIS_PRSNA_OPT_HIST
WHERE cntry_name  IN('ESP','PRT') 
	AND MKTNG_PGM_NBR IN( 
SEL MKTNG_PGM_nbr 
FROM	MKTNG_PGM 
WHERE	LEGAL_ENT_NBR NOT IN (22,35))
QUALIFY RANK() OVER (PARTITION BY REGIS_PRSNA_ID, MKTNG_PGM_NBR ORDER BY LAST_ACTIVITY_TM DESC)=1) A
SET CNTRY_NAME=A.SRC_CNTRY_NAME,
POSTL_ADDR_ID=NULL
WHERE REGIS_PRSNA_OPT_HIST.REGIS_PRSNA_ID=A.REGIS_PRSNA_ID
	AND REGIS_PRSNA_OPT_HIST.MKTNG_PGM_NBR=A.MKTNG_PGM_NBR
	AND REGIS_PRSNA_OPT_HIST.cntry_name  IN('ESP','PRT') 
	AND 
REGIS_PRSNA_OPT_HIST.MKTNG_PGM_NBR IN( 
SEL MKTNG_PGM_nbr 
FROM	MKTNG_PGM 
WHERE	LEGAL_ENT_NBR NOT IN (22,35));
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;

