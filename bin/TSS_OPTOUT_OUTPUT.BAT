@echo off
REM TSS Import

REM SCRIPT:               TSS_OPTOUT_OUTPUT.FLD 
REM DESCRIPTION:          This script loads the MST OPTOUT TRIGGER table from the trigger file that is given by 
REM                       Trillium
REM DEPENDENCY:           TRILLIUM OPTOUT SCRIPT
REM INPUT:                TRILLIUM OPTOUT FILE
REM OUTPUT:               MST OPTOUT TRIGGER
REM ERRORS:
REM SPECIAL INSTRUCTIONS:
REM CHANGE LOG:
REM VERSION              DATE                 AUTHOR                          CHANGES
REM 1.00                 03/26/2012           TERADATA                        INITIAL VERSION

echo Executing TSS Import

:start
set ERR=%ERRORLEVEL%
set ERR1=%ERRORLEVEL%
FOR /F "tokens=1-6 delims=/ " %%i in ('date/t') do set currentdate=%%i-%%j-%%k-%%l
FOR /F "tokens=1-6 delims=: " %%i in ('time/t') do set currenttime=%%i-%%j-%%k
call .\mdmcustomenv-parallel.bat 

set TSSOPTOUTOUTPUT="/c:%TSS_OPTOUT_OUTPUT%"

set LOGONFILE="/e:%LOGON_FILE%"

set DATABASENAME="/f:%ETL_DB%"

set TSSOPTOUTCLEANUPBTEQ="/d:%TSS_OPTOUT_CLEANUP_BTEQ%.BTEQ"

set MSTDB="/g:%MST_DB%"

set CNTRY="/h:AUS"

set COUNTRY="AUS"

set LOGONFILE="/e:%LOGON_FILE%"

set DATABASENAME="/f:%MST_DB%"

set DBNAME="/e:%ETL_DB%"

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\OPTOUT.vbs %TSSOPTOUTOUTPUT% %TSSOPTOUTCLEANUPBTEQ% %LOGONFILE% %DATABASENAME% %MSTDB%  %CNTRY% > %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during OPTOUT TRIGGER cleanup >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG TSS_OPTOUT_OUTPUT_%currentdate%_%currenttime%.LOG
exit 1
 )
 
set TSSOPTOUTCLEANUPBTEQ="%TSS_OPTOUT_CLEANUP_BTEQ%.BTEQ" 

 bteq < %TSSOPTOUTCLEANUPBTEQ% >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG
set ERR=%ERRORLEVEL%
set FAILUREBTEQ="/d:%TSS_OPTOUT_OUTPUT_FAILURE_BTEQ%"

IF NOT %ERR% == 0  (
echo Exiting due to error during TSS_OPTOUT_OUTPUT LOAD >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\OPTOUT.vbs %TSSOPTOUTOUTPUT% %FAILUREBTEQ% %LOGONFILE% %DATABASENAME% %MSTDB%  %CNTRY% >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG
IF ERRORLEVEL 1 (
echo Exiting due to error during TSS_OPTOUT_OUTPUT LOAD >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG TSS_OPTOUT_OUTPUT_%currentdate%_%currenttime%.LOG
exit 1
)
bteq < %TSS_OPTOUT_OUTPUT_FAILURE_BTEQ% >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG
set ERR1=%ERRORLEVEL%
IF NOT %ERR1% == 0 (
ren %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG TSS_OPTOUT_OUTPUT_%currentdate%_%currenttime%.LOG
exit %ERR1%
)

ren %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG TSS_OPTOUT_OUTPUT_%currentdate%_%currenttime%.LOG
exit %ERR%
)

set TSSOPTOUTSTGFLD="/d:%TSS_OPTOUT_OUTPUT_FLD%.FLD"

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\OPTOUT.vbs %TSSOPTOUTOUTPUT% %TSSOPTOUTSTGFLD% %LOGONFILE% %DATABASENAME% %MSTDB%  %CNTRY% >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG

 IF ERRORLEVEL 1 (
 echo Exiting due to error during OPTOUT TRIGGER cleanup >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG
 set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG TSS_OPTOUT_OUTPUT_%currentdate%_%currenttime%.LOG
exit 1
)

set TSSOPTOUTSTGFLD="%TSS_OPTOUT_OUTPUT_FLD%.FLD"

fastload -c UTF8 < %TSSOPTOUTSTGFLD% >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG
REM tbuild -f %TSS_OPTOUT_OUTPUT_TPT% -u "TdpId='%TdpId%',UserName='%UserName%',UserPassword='%UserPassword%',MDM_DB='%MDM_DB%',ERR_DB='%ERR_DB%',LOG_DB='%LOG_DB%',WORK_DB='%WORK_DB%',DirectoryPath='%MDM_CUSTOM_DIR%\data',FileName = '%TSS_OPTOUT_OUTPUT%'"
set ERR=%ERRORLEVEL%
set FAILUREBTEQ="/d:%TSS_OPTOUT_OUTPUT_FAILURE_BTEQ%"

IF NOT %ERR% == 0  (
echo Exiting due to error during TSS_OPTOUT_OUTPUT LOAD >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG
cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\OPTOUT.vbs %TSSOPTOUTOUTPUT% %FAILUREBTEQ% %LOGONFILE% %DATABASENAME% %MSTDB%  %CNTRY% >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG
IF ERRORLEVEL 1 (
echo Exiting due to error during TSS_OPTOUT_OUTPUT LOAD >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG TSS_OPTOUT_OUTPUT_%currentdate%_%currenttime%.LOG
exit 1
)
bteq < %TSS_OPTOUT_OUTPUT_FAILURE_BTEQ% >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG
set ERR1=%ERRORLEVEL%
IF NOT %ERR1% == 0 (
ren %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG TSS_OPTOUT_OUTPUT_%currentdate%_%currenttime%.LOG
exit %ERR1%
)

ren %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG TSS_OPTOUT_OUTPUT_%currentdate%_%currenttime%.LOG
exit %ERR%
)

set TSSOPTOUTSTGBTEQ="/d:%TSS_OPTOUT_OUTPUT_BTEQ%.BTEQ"

set DATABASENAME="/f:%ETL_DB%"

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\OPTOUT.vbs %TSSOPTOUTOUTPUT% %TSSOPTOUTSTGBTEQ% %LOGONFILE% %DATABASENAME% %MSTDB%  %CNTRY% >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during OPTOUT update >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG TSS_OPTOUT_OUTPUT_%currentdate%_%currenttime%.LOG
exit 1
)

set TSSOPTOUTSTGBTEQ="%TSS_OPTOUT_OUTPUT_BTEQ%.BTEQ"

bteq < %TSSOPTOUTSTGBTEQ% >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG
set ERR=%ERRORLEVEL%
set FAILUREBTEQ="/d:%TSS_OPTOUT_OUTPUT_FAILURE_BTEQ%"

IF NOT %ERR% == 0  (
echo Exiting due to error during TSS_OPTOUT_OUTPUT LOAD >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\OPTOUT.vbs %TSSOPTOUTOUTPUT% %FAILUREBTEQ% %LOGONFILE% %DATABASENAME% %MSTDB%  %CNTRY% >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG
IF ERRORLEVEL 1 (
echo Exiting due to error during TSS_OPTOUT_OUTPUT LOAD >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG TSS_OPTOUT_OUTPUT_%currentdate%_%currenttime%.LOG
exit 1
)
bteq < %TSS_OPTOUT_OUTPUT_FAILURE_BTEQ% >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG
set ERR1=%ERRORLEVEL%
IF NOT %ERR1% == 0 (
ren %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG TSS_OPTOUT_OUTPUT_%currentdate%_%currenttime%.LOG
exit %ERR1%
)

ren %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG TSS_OPTOUT_OUTPUT_%currentdate%_%currenttime%.LOG
exit %ERR%
)

del %TSS_OPTOUT_OUTPUT%.DAT
IF ERRORLEVEL 1 (
echo Exiting due to error during fast load >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG TSS_OPTOUT_OUTPUT_%currentdate%_%currenttime%.LOG
exit 1
)

ren %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_OUTPUT.LOG TSS_OPTOUT_OUTPUT_%currentdate%_%currenttime%.LOG

:end