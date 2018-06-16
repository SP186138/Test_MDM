@echo off
REM TSS Import

REM SCRIPT:               TSS_MATCH_EDW.BTEQ 
REM DESCRIPTION:          This script loads the EDW
REM DEPENDENCY:           TRILLIUM MATCH SCRIPT
REM INPUT:                TRILLIUM OUTPUT CNTRY TABLES
REM OUTPUT:               EDW
REM ERRORS:
REM SPECIAL INSTRUCTIONS:
REM CHANGE LOG:
REM VERSION              DATE                 AUTHOR                          CHANGES
REM 1.00                 01/21/2011           TERADATA                        INITIAL VERSION
REM 2.00                 10/31/2011           TERADATA                        CHANGES FOR ||ELISM


echo Executing TSS Import

:start
set ERR=%ERRORLEVEL%
set ERR1=%ERRORLEVEL%
FOR /F "tokens=1-6 delims=/ " %%i in ('date/t') do set currentdate=%%i-%%j-%%k-%%l
FOR /F "tokens=1-6 delims=: " %%i in ('time/t') do set currenttime=%%i-%%j-%%k
call .\mdmcustomenv-parallel.bat 

set TSSMATCHOUTPUT="/c:%TSS_MATCH_OUTPUT%"

set LOGONFILE="/e:%LOGON_FILE%"

set DATABASENAME="/f:%MASTER_DB%"

set MSTDB="/g:%MST_DB%"

set CNTRY="/h:OTH"

set CNSMRTSSMATCHEDWBTEQ="/d:%CNSMR_TSS_MATCH_EDW_BTEQ%.BTEQ"

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\CNSMR_TSS_MATCH_EDW.vbs %TSSMATCHOUTPUT% %CNSMRTSSMATCHEDWBTEQ% %LOGONFILE% %DATABASENAME% %CNTRY% > %MDM_CUSTOM_DIR%\log\TSS_MATCH_EDW.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during TRILLIUM OUTPUT update >> %MDM_CUSTOM_DIR%\log\TSS_MATCH_EDW.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_MATCH_EDW.LOG TSS_MATCH_EDW_%currentdate%_%currenttime%.LOG
exit 1
)

set CNSMRTSSMATCHEDWBTEQ="%CNSMR_TSS_MATCH_EDW_BTEQ%.BTEQ"

bteq < %CNSMRTSSMATCHEDWBTEQ% >> %MDM_CUSTOM_DIR%\log\TSS_MATCH_EDW.LOG
set ERR=%ERRORLEVEL%
set FAILUREBTEQ="/d:%TSS_MATCH_OUTPUT_FAILURE_BTEQ%"

IF NOT %ERR% == 0  (
echo Exiting due to error during TRILLIUM OUTPUT update >> %MDM_CUSTOM_DIR%\log\TSS_MATCH_EDW.LOG

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\CNSMR_TSS_MATCH_EDW.vbs %TSSMATCHOUTPUT% %FAILUREBTEQ% %LOGONFILE% %DATABASENAME% %CNTRY% >> %MDM_CUSTOM_DIR%\log\TSS_MATCH_EDW.LOG
IF ERRORLEVEL 1 (
echo Exiting due to error during TRILLIUM OUTPUT update >> %MDM_CUSTOM_DIR%\log\TSS_MATCH_EDW.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_MATCH_EDW.LOG TSS_MATCH_EDW_%currentdate%_%currenttime%.LOG
exit 1
)
bteq < %TSS_MATCH_OUTPUT_FAILURE_BTEQ% >> %MDM_CUSTOM_DIR%\log\TSS_MATCH_EDW.LOG
set ERR1=%ERRORLEVEL%

IF NOT %ERR1% == 0 (
ren %MDM_CUSTOM_DIR%\log\TSS_MATCH_EDW.LOG TSS_MATCH_EDW_%currentdate%_%currenttime%.LOG
exit %ERR1%
)

ren %MDM_CUSTOM_DIR%\log\TSS_MATCH_EDW.LOG TSS_MATCH_EDW_%currentdate%_%currenttime%.LOG
exit %ERR%
)

call .\mdmcustomenv.bat

set TSSMATCHOUTPUT="/c:%TSS_MATCH_OUTPUT%"

set LOGONFILE="/e:%LOGON_FILE%"

set DATABASENAME="/f:%MASTER_DB%"

set CNSMRMERGEBTEQ="/d:%CNSMR_MERGE_BTEQ%"

set MSTDB="/g:%MST_DB%"


cscript %MDM_CUSTOM_DIR%\bin\CNSMR_TSS_MATCH_STG.vbs %TSSMATCHOUTPUT% %CNSMRMERGEBTEQ% %LOGONFILE% %DATABASENAME% %MSTDB% > %MDM_CUSTOM_DIR%\log\CNSMR_MERGE.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during MERGE >> %MDM_CUSTOM_DIR%\log\CNSMR_MERGE.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\CNSMR_MERGE.LOG CNSMR_MERGE_%currentdate%_%currenttime%.LOG
exit 1
 )

bteq < %CNSMR_MERGE_BTEQ% >> %MDM_CUSTOM_DIR%\log\CNSMR_MERGE.LOG
set ERR=%ERRORLEVEL%

IF NOT %ERR% == 0 (
echo Exiting due to error during MERGE >> %MDM_CUSTOM_DIR%\log\CNSMR_MERGE.LOG
ren %MDM_CUSTOM_DIR%\log\CNSMR_MERGE.LOG CNSMR_MERGE_%currentdate%_%currenttime%.LOG
exit %ERR%
)

ren %MDM_CUSTOM_DIR%\log\TSS_MATCH_EDW.LOG TSS_MATCH_EDW_%currentdate%_%currenttime%.LOG
ren %MDM_CUSTOM_DIR%\log\CNSMR_MERGE.LOG CNSMR_MERGE_%currentdate%_%currenttime%.LOG

:end