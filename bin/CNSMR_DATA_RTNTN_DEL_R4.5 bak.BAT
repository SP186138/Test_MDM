@echo off
REM TSS Import

REM SCRIPT:               CNSMR_DATA_RTNTN_DEL.BTEQ
REM DESCRIPTION:          THIS SCRIPT DELETES CONSUMER INFORMATION
REM DEPENDENCY:           
REM INPUT:                GOLDEN TABLES
REM OUTPUT:               THIS SCRIPT DELETES CONSUMER INFORMATION
REM ERRORS:
REM SPECIAL INSTRUCTIONS:
REM CHANGE LOG:
REM VERSION              DATE                 AUTHOR                          CHANGES
REM 1.00                 05/17/2011           TERADATA                        INITIAL VERSION
REM 2.00                 10/09/2012           TERADATA                        RELEASE 4.2


echo Executing TSS Import

:start

FOR /F "tokens=1-6 delims=/ " %%i in ('date/t') do set currentdate=%%i-%%j-%%k-%%l
FOR /F "tokens=1-6 delims=: " %%i in ('time/t') do set currenttime=%%i-%%j-%%k


call .\mdmcustomenv-parallel.bat 

set RTNTNDATE="/c:%RTNTN_DATE%"

set LOGONFILE="/e:%LOGON_FILE%"

set DATABASENAME="/f:%MASTER_DB%"

set CNSMRDATARTNTNDELBTEQ="/d:%CNSMR_DATA_RTNTN_DEL_BTEQ%"

set MSTDB="/g:%MST_DB%"


cscript %MDM_CUSTOM_DIR%\bin\CNSMR_DATA_RTNTN.vbs %RTNTNDATE% %CNSMRDATARTNTNDELBTEQ% %LOGONFILE% %DATABASENAME% %MSTDB% > %MDM_CUSTOM_DIR%\log\CNSMR_DATA_RTNTN_DEL_VBS.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during DATA RETENTION >> %MDM_CUSTOM_DIR%\log\CNSMR_DATA_RTNTN_DEL_VBS.LOG
ren %MDM_CUSTOM_DIR%\log\CNSMR_DATA_RTNTN_DEL_VBS.LOG CNSMR_DATA_RTNTN_DEL_VBS_%currentdate%_%currenttime%.LOG
set errorlevel=1
exit 1
 )

bteq < %CNSMR_DATA_RTNTN_DEL_BTEQ% > %MDM_CUSTOM_DIR%\log\CNSMR_DATA_RTNTN_DEL.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during DATA RETENTION >> %MDM_CUSTOM_DIR%\log\CNSMR_DATA_RTNTN_DEL.LOG
ren %MDM_CUSTOM_DIR%\log\CNSMR_DATA_RTNTN_DEL.LOG CNSMR_DATA_RTNTN_DEL_%currentdate%_%currenttime%.LOG
set errorlevel=1
exit 1
)

ren %MDM_CUSTOM_DIR%\log\CNSMR_DATA_RTNTN_DEL.LOG CNSMR_DATA_RTNTN_DEL_%currentdate%_%currenttime%.LOG

:end