@echo off
REM TSS Import

REM SCRIPT:               TSS_GDPR_OUTPUT.FLD 
REM DESCRIPTION:          This script loads the MST GDPR TRIGGER table from the trigger file that is given by 
REM                       Trillium
REM DEPENDENCY:           TRILLIUM GDPR SCRIPT
REM INPUT:                TRILLIUM GDPR FILE
REM OUTPUT:               MST GDPR TRIGGER
REM ERRORS:
REM SPECIAL INSTRUCTIONS:
REM CHANGE LOG:
REM VERSION              DATE                 AUTHOR                          CHANGES
REM 1.00                 09/12/2017           TERADATA                        INITIAL VERSION

echo Executing TSS Import

:start
set ERR=%ERRORLEVEL%
set ERR1=%ERRORLEVEL%
FOR /F "tokens=1-6 delims=/ " %%i in ('date/t') do set currentdate=%%i-%%j-%%k-%%l
FOR /F "tokens=1-6 delims=: " %%i in ('time/t') do set currenttime=%%i-%%j-%%k
call .\mdmcustomenv-parallel.bat 

set TSSGDPROUTPUT="/c:%TSS_GDPR_OUTPUT%"

set LOGONFILE="/e:%LOGON_FILE%"

set DATABASENAME="/f:%ETL_DB%"

set TSSGDPRCLEANUPBTEQ="/d:%TSS_GDPR_CLEANUP_BTEQ%.BTEQ"

set MSTDB="/g:%MST_DB%"

set CNTRY="/h:AUS"

set COUNTRY="AUS"

set LOGONFILE="/e:%LOGON_FILE%"

set DATABASENAME="/f:%MST_DB%"

set DBNAME="/e:%ETL_DB%"

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\GDPR.vbs %TSSGDPROUTPUT% %TSSGDPRCLEANUPBTEQ% %LOGONFILE% %DATABASENAME% %MSTDB%  %CNTRY% > %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during GDPR TRIGGER cleanup >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG TSS_GDPR_OUTPUT_%currentdate%_%currenttime%.LOG
exit 1
 )
 
set TSSGDPRCLEANUPBTEQ="%TSS_GDPR_CLEANUP_BTEQ%.BTEQ" 

 bteq < %TSSGDPRCLEANUPBTEQ% >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG
set ERR=%ERRORLEVEL%
set FAILUREBTEQ="/d:%TSS_GDPR_OUTPUT_FAILURE_BTEQ%"

IF NOT %ERR% == 0  (
echo Exiting due to error during TSS_GDPR_OUTPUT LOAD >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\GDPR.vbs %TSSGDPROUTPUT% %FAILUREBTEQ% %LOGONFILE% %DATABASENAME% %MSTDB%  %CNTRY% >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG
IF ERRORLEVEL 1 (
echo Exiting due to error during TSS_GDPR_OUTPUT LOAD >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG TSS_GDPR_OUTPUT_%currentdate%_%currenttime%.LOG
exit 1
)
bteq < %TSS_GDPR_OUTPUT_FAILURE_BTEQ% >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG
set ERR1=%ERRORLEVEL%
IF NOT %ERR1% == 0 (
ren %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG TSS_GDPR_OUTPUT_%currentdate%_%currenttime%.LOG
exit %ERR1%
)

ren %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG TSS_GDPR_OUTPUT_%currentdate%_%currenttime%.LOG
exit %ERR%
)

set TSSGDPRSTGFLD="/d:%TSS_GDPR_OUTPUT_FLD%.FLD"

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\GDPR.vbs %TSSGDPROUTPUT% %TSSGDPRSTGFLD% %LOGONFILE% %DATABASENAME% %MSTDB%  %CNTRY% >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG

 IF ERRORLEVEL 1 (
 echo Exiting due to error during GDPR TRIGGER cleanup >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG
 set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG TSS_GDPR_OUTPUT_%currentdate%_%currenttime%.LOG
exit 1
)

set TSSGDPRSTGFLD="%TSS_GDPR_OUTPUT_FLD%.FLD"

fastload -c UTF8 < %TSSGDPRSTGFLD% >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG
REM tbuild -f %TSS_GDPR_OUTPUT_TPT% -u "TdpId='%TdpId%',UserName='%UserName%',UserPassword='%UserPassword%',MDM_DB='%MDM_DB%',ERR_DB='%ERR_DB%',LOG_DB='%LOG_DB%',WORK_DB='%WORK_DB%',DirectoryPath='%MDM_CUSTOM_DIR%\data',FileName = '%TSS_GDPR_OUTPUT%'"
set ERR=%ERRORLEVEL%
set FAILUREBTEQ="/d:%TSS_GDPR_OUTPUT_FAILURE_BTEQ%"

IF NOT %ERR% == 0  (
echo Exiting due to error during TSS_GDPR_OUTPUT LOAD >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG
cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\GDPR.vbs %TSSGDPROUTPUT% %FAILUREBTEQ% %LOGONFILE% %DATABASENAME% %MSTDB%  %CNTRY% >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG
IF ERRORLEVEL 1 (
echo Exiting due to error during TSS_GDPR_OUTPUT LOAD >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG TSS_GDPR_OUTPUT_%currentdate%_%currenttime%.LOG
exit 1
)
bteq < %TSS_GDPR_OUTPUT_FAILURE_BTEQ% >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG
set ERR1=%ERRORLEVEL%
IF NOT %ERR1% == 0 (
ren %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG TSS_GDPR_OUTPUT_%currentdate%_%currenttime%.LOG
exit %ERR1%
)

ren %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG TSS_GDPR_OUTPUT_%currentdate%_%currenttime%.LOG
exit %ERR%
)

set TSSGDPRSTGBTEQ="/d:%TSS_GDPR_OUTPUT_BTEQ%.BTEQ"

set DATABASENAME="/f:%ETL_DB%"

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\GDPR.vbs %TSSGDPROUTPUT% %TSSGDPRSTGBTEQ% %LOGONFILE% %DATABASENAME% %MSTDB%  %CNTRY% >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during GDPR update >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG TSS_GDPR_OUTPUT_%currentdate%_%currenttime%.LOG
exit 1
)

set TSSGDPRSTGBTEQ="%TSS_GDPR_OUTPUT_BTEQ%.BTEQ"

bteq < %TSSGDPRSTGBTEQ% >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG
set ERR=%ERRORLEVEL%
set FAILUREBTEQ="/d:%TSS_GDPR_OUTPUT_FAILURE_BTEQ%"

IF NOT %ERR% == 0  (
echo Exiting due to error during TSS_GDPR_OUTPUT LOAD >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\GDPR.vbs %TSSGDPROUTPUT% %FAILUREBTEQ% %LOGONFILE% %DATABASENAME% %MSTDB%  %CNTRY% >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG
IF ERRORLEVEL 1 (
echo Exiting due to error during TSS_GDPR_OUTPUT LOAD >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG TSS_GDPR_OUTPUT_%currentdate%_%currenttime%.LOG
exit 1
)
bteq < %TSS_GDPR_OUTPUT_FAILURE_BTEQ% >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG
set ERR1=%ERRORLEVEL%
IF NOT %ERR1% == 0 (
ren %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG TSS_GDPR_OUTPUT_%currentdate%_%currenttime%.LOG
exit %ERR1%
)

ren %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG TSS_GDPR_OUTPUT_%currentdate%_%currenttime%.LOG
exit %ERR%
)

del %TSS_GDPR_OUTPUT%.DAT
IF ERRORLEVEL 1 (
echo Exiting due to error during fast load >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG TSS_GDPR_OUTPUT_%currentdate%_%currenttime%.LOG
exit 1
)

ren %MDM_CUSTOM_DIR%\log\TSS_GDPR_OUTPUT.LOG TSS_GDPR_OUTPUT_%currentdate%_%currenttime%.LOG

:end