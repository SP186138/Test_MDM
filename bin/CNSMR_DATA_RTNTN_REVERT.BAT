@echo off
REM TSS Import

REM SCRIPT:               CNSMR_DATA_REVERT.BTEQ
REM DESCRIPTION:          THIS SCRIPT REVERTS CONSUMER INFORMATION
REM DEPENDENCY:           
REM INPUT:                GOLDEN TABLES
REM OUTPUT:               THIS SCRIPT REVERTS CONSUMER INFORMATION
REM ERRORS:
REM SPECIAL INSTRUCTIONS:
REM CHANGE LOG:
REM VERSION              DATE                 AUTHOR                          CHANGES
REM 1.00                 10/09/2012           TERADATA                        INITIAL VERSION


echo Executing TSS Import

:start

FOR /F "tokens=1-6 delims=/ " %%i in ('date/t') do set currentdate=%%i-%%j-%%k-%%l
FOR /F "tokens=1-6 delims=: " %%i in ('time/t') do set currenttime=%%i-%%j-%%k


call .\mdmcustomenv-parallel.bat 

set RTNTNDATE="/c:%REVERT_MKTNG_PGM_NBR%"

set LOGONFILE="/e:%LOGON_FILE%"

set DATABASENAME="/f:%MASTER_DB%"

set CNSMRDATARTNTNREVERTBTEQ="/d:%CNSMR_DATA_RTNTN_REVERT_BTEQ%"

set MSTDB="/g:%MST_DB%"


cscript %MDM_CUSTOM_DIR%\bin\CNSMR_DATA_RTNTN.vbs %RTNTNDATE% %CNSMRDATARTNTNREVERTBTEQ% %LOGONFILE% %DATABASENAME% %MSTDB% > %MDM_CUSTOM_DIR%\log\CNSMR_DATA_RTNTN_REVERT_VBS.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during DATA RETENTION >> %MDM_CUSTOM_DIR%\log\CNSMR_DATA_RTNTN_REVERT_VBS.LOG
ren %MDM_CUSTOM_DIR%\log\CNSMR_DATA_RTNTN_REVERT_VBS.LOG CNSMR_DATA_RTNTN_REVERT_VBS_%currentdate%_%currenttime%.LOG
set errorlevel=1
exit 1
 )

bteq < %CNSMR_DATA_RTNTN_REVERT_BTEQ% > %MDM_CUSTOM_DIR%\log\CNSMR_DATA_RTNTN_REVERT.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during DATA RETENTION >> %MDM_CUSTOM_DIR%\log\CNSMR_DATA_RTNTN_REVERT.LOG
ren %MDM_CUSTOM_DIR%\log\CNSMR_DATA_RTNTN_REVERT.LOG CNSMR_DATA_RTNTN_REVERT_%currentdate%_%currenttime%.LOG
set errorlevel=1
exit 1
)

ren %MDM_CUSTOM_DIR%\log\CNSMR_DATA_RTNTN_REVERT.LOG CNSMR_DATA_RTNTN_REVERT_%currentdate%_%currenttime%.LOG

:end