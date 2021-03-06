.logon $TDPID/$TDUSER,$TDPWD


.SET ERROROUT STDOUT;
.SET SESSION CHARSET 'UTF8';

DATABASE MDM;

.GOTO $Step

 .LABEL L0

--Deleting the existing record that is present in the TRILLIUM_OUTPUT1_USA table

DELETE FROM TSS_MATCH_INPUT_USA
WHERE (MKTNG_PGM_NBR,REGIS_PRSNA_ID)
IN (SEL TC.MKTNG_PGM_NBR,RP.REGIS_PRSNA_ID FROM TSS_CLEANSE_INPUT1_USA TC JOIN REGIS_PRSNA RP
ON TC.MKTNG_PGM_NBR=RP.MKTNG_PGM_NBR AND TC.REGIS_CNSMR_ID_VAL=RP.REGIS_CNSMR_ID_VAL AND TC.SYS_TARGET_ID=RP.SYS_TARGET_ID);

 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L1

COLLECT STATS TSS_MATCH_INPUT_USA
COLUMN (LEGAL_ENT_NBR ,MKTNG_PGM_NBR ,REGIS_CNSMR_ID_VAL);

 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 .LABEL L2

