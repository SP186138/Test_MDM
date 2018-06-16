.logon $TDPID/$TDUSER,$TDPWD


.SET ERROROUT STDOUT ;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
.SET SESSION CHARSET 'UTF8' ;
 .IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;


.GOTO $Step

.LABEL L1

update MDM.REGIS_PRSNA_POSTL_ADDR
set LAT_MEAS=null, LONG_MEAS=null, GL_ACCURACY=null ,GL_MATCH_FLG=null
where mktng_pgm_nbr in (sel mktng_pgm_nbr from MDM.mktng_pgm
where legal_ent_nbr in (22,35));

.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;
 
.LABEL L2
 
 update MDM.STORE
 set LAT_MEAS=null, LONG_MEAS=null, GL_ACCURACY=null ,GL_MATCH_FLG=null
 where cntry_code in ('ESP','PRT');
 
 
.IF ERRORLEVEL > 0 THEN .QUIT ERRORCODE;