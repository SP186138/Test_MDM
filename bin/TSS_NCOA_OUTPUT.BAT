@echo off
REM TSS Import

REM SCRIPT:               TSS_NCOA_OUTPUT.FLD 
REM DESCRIPTION:          This script loads the MST NCOA TRIGGER table from the trigger file that is given by 
REM                       Trillium
REM DEPENDENCY:           TRILLIUM NCOA SCRIPT
REM INPUT:                TRILLIUM NCOA FILE
REM OUTPUT:               MST NCOA TRIGGER
REM ERRORS:
REM SPECIAL INSTRUCTIONS:
REM CHANGE LOG:
REM VERSION              DATE                 AUTHOR                          CHANGES
REM 1.00                 10/12/2012           TERADATA                        INITIAL VERSION

echo Executing TSS Import

:start
set ERR=%ERRORLEVEL%
set ERR1=%ERRORLEVEL%
FOR /F "tokens=1-6 delims=/ " %%i in ('date/t') do set currentdate=%%i-%%j-%%k-%%l
FOR /F "tokens=1-6 delims=: " %%i in ('time/t') do set currenttime=%%i-%%j-%%k
call .\mdmcustomenv-parallel.bat 

set TSSNCOAOUTPUT="/c:%TSS_NCOA_OUTPUT%"

set LOGONFILE="/e:%LOGON_FILE%"

set DATABASENAME="/f:%ETL_DB%"

set TSSNCOACLEANUPBTEQ="/d:%TSS_NCOA_CLEANUP_BTEQ%.BTEQ"

set MSTDB="/g:%MST_DB%"

set CNTRY="/h:AUS"

set COUNTRY="AUS"

set LOGONFILE="/e:%LOGON_FILE%"

set DATABASENAME="/f:%MST_DB%"

set DBNAME="/e:%ETL_DB%"

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\NCOA.vbs %TSSNCOAOUTPUT% %TSSNCOACLEANUPBTEQ% %LOGONFILE% %DATABASENAME% %MSTDB%  %CNTRY% > %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during NCOA TRIGGER cleanup >> %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG TSS_NCOA_OUTPUT_%currentdate%_%currenttime%.LOG
exit 1
 )
 
set TSSNCOACLEANUPBTEQ="%TSS_NCOA_CLEANUP_BTEQ%.BTEQ" 

 bteq < %TSSNCOACLEANUPBTEQ% >> %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG
set ERR=%ERRORLEVEL%
set FAILUREBTEQ="/d:%TSS_NCOA_OUTPUT_FAILURE_BTEQ%"

IF NOT %ERR% == 0  (
echo Exiting due to error during TSS_NCOA_OUTPUT LOAD >> %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\NCOA.vbs %TSSNCOAOUTPUT% %FAILUREBTEQ% %LOGONFILE% %DATABASENAME% %MSTDB%  %CNTRY% >> %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG
IF ERRORLEVEL 1 (
echo Exiting due to error during TSS_NCOA_OUTPUT LOAD >> %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG TSS_NCOA_OUTPUT_%currentdate%_%currenttime%.LOG
exit 1
)
bteq < %TSS_NCOA_OUTPUT_FAILURE_BTEQ% >> %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG
set ERR1=%ERRORLEVEL%
IF NOT %ERR1% == 0 (
ren %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG TSS_NCOA_OUTPUT_%currentdate%_%currenttime%.LOG
exit %ERR1%
)

ren %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG TSS_NCOA_OUTPUT_%currentdate%_%currenttime%.LOG
exit %ERR%
)

set TSSNCOASTGFLD="/d:%TSS_NCOA_OUTPUT_FLD%.FLD"

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\NCOA.vbs %TSSNCOAOUTPUT% %TSSNCOASTGFLD% %LOGONFILE% %DATABASENAME% %MSTDB%  %CNTRY% >> %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG

 IF ERRORLEVEL 1 (
 echo Exiting due to error during NCOA TRIGGER cleanup >> %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG
 set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG TSS_NCOA_OUTPUT_%currentdate%_%currenttime%.LOG
exit 1
)

set TSSNCOASTGFLD="%TSS_NCOA_OUTPUT_FLD%.FLD"

fastload -c UTF8 < %TSSNCOASTGFLD% >> %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG
REM tbuild -f %TSS_NCOA_OUTPUT_TPT% -u "TdpId='%TdpId%',UserName='%UserName%',UserPassword='%UserPassword%',MDM_DB='%MDM_DB%',ERR_DB='%ERR_DB%',LOG_DB='%LOG_DB%',WORK_DB='%WORK_DB%',DirectoryPath='%MDM_CUSTOM_DIR%\data',FileName = '%TSS_NCOA_OUTPUT%'"
set ERR=%ERRORLEVEL%
set FAILUREBTEQ="/d:%TSS_NCOA_OUTPUT_FAILURE_BTEQ%"

IF NOT %ERR% == 0  (
echo Exiting due to error during TSS_NCOA_OUTPUT LOAD >> %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG
cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\NCOA.vbs %TSSNCOAOUTPUT% %FAILUREBTEQ% %LOGONFILE% %DATABASENAME% %MSTDB%  %CNTRY% >> %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG
IF ERRORLEVEL 1 (
echo Exiting due to error during TSS_NCOA_OUTPUT LOAD >> %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG TSS_NCOA_OUTPUT_%currentdate%_%currenttime%.LOG
exit 1
)
bteq < %TSS_NCOA_OUTPUT_FAILURE_BTEQ% >> %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG
set ERR1=%ERRORLEVEL%
IF NOT %ERR1% == 0 (
ren %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG TSS_NCOA_OUTPUT_%currentdate%_%currenttime%.LOG
exit %ERR1%
)

ren %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG TSS_NCOA_OUTPUT_%currentdate%_%currenttime%.LOG
exit %ERR%
)

set TSSNCOASTGBTEQ="/d:%TSS_NCOA_OUTPUT_BTEQ%.BTEQ"

set DATABASENAME="/f:%ETL_DB%"

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\NCOA.vbs %TSSNCOAOUTPUT% %TSSNCOASTGBTEQ% %LOGONFILE% %DATABASENAME% %MSTDB%  %CNTRY% >> %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during NCOA update >> %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG TSS_NCOA_OUTPUT_%currentdate%_%currenttime%.LOG
exit 1
)

set TSSNCOASTGBTEQ="%TSS_NCOA_OUTPUT_BTEQ%.BTEQ"

bteq < %TSSNCOASTGBTEQ% >> %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG
set ERR=%ERRORLEVEL%
set FAILUREBTEQ="/d:%TSS_NCOA_OUTPUT_FAILURE_BTEQ%"

IF NOT %ERR% == 0  (
echo Exiting due to error during TSS_NCOA_OUTPUT LOAD >> %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\NCOA.vbs %TSSNCOAOUTPUT% %FAILUREBTEQ% %LOGONFILE% %DATABASENAME% %MSTDB%  %CNTRY% >> %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG
IF ERRORLEVEL 1 (
echo Exiting due to error during TSS_NCOA_OUTPUT LOAD >> %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG TSS_NCOA_OUTPUT_%currentdate%_%currenttime%.LOG
exit 1
)
bteq < %TSS_NCOA_OUTPUT_FAILURE_BTEQ% >> %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG
set ERR1=%ERRORLEVEL%
IF NOT %ERR1% == 0 (
ren %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG TSS_NCOA_OUTPUT_%currentdate%_%currenttime%.LOG
exit %ERR1%
)

ren %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG TSS_NCOA_OUTPUT_%currentdate%_%currenttime%.LOG
exit %ERR%
)

del %TSS_NCOA_OUTPUT%.DAT
IF ERRORLEVEL 1 (
echo Exiting due to error during fast load >> %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG TSS_NCOA_OUTPUT_%currentdate%_%currenttime%.LOG
exit 1
)

ren %MDM_CUSTOM_DIR%\log\TSS_NCOA_OUTPUT.LOG TSS_NCOA_OUTPUT_%currentdate%_%currenttime%.LOG

:end