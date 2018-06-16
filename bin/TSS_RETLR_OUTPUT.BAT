@echo off
REM TSS Import

REM SCRIPT:               TSS_RETLR_OUTPUT.FLD 
REM DESCRIPTION:          This script loads the MST RETLR TRIGGER table from the trigger file that is given by 
REM                       Trillium
REM DEPENDENCY:           TRILLIUM RETLR SCRIPT
REM INPUT:                TRILLIUM RETLR FILE
REM OUTPUT:               MST RETLR TRIGGER
REM ERRORS:
REM SPECIAL INSTRUCTIONS:
REM CHANGE LOG:
REM VERSION              DATE                 AUTHOR                          CHANGES
REM 1.00                 01/30/2014           TERADATA                        INITIAL VERSION

echo Executing TSS Import

:start
set ERR=%ERRORLEVEL%
set ERR1=%ERRORLEVEL%
FOR /F "tokens=1-6 delims=/ " %%i in ('date/t') do set currentdate=%%i-%%j-%%k-%%l
FOR /F "tokens=1-6 delims=: " %%i in ('time/t') do set currenttime=%%i-%%j-%%k
call .\mdmcustomenv-parallel.bat 

set TSSRETLROUTPUT="/c:%TSS_RETLR_OUTPUT%"

set LOGONFILE="/e:%LOGON_FILE%"

set DATABASENAME="/f:%ETL_DB%"

set TSSRETLRCLEANUPBTEQ="/d:%TSS_RETLR_CLEANUP_BTEQ%.BTEQ"

set MSTDB="/g:%MST_DB%"

set CNTRY="/h:AUS"

set COUNTRY="AUS"

set LOGONFILE="/e:%LOGON_FILE%"

set DATABASENAME="/f:%MST_DB%"

set DBNAME="/e:%ETL_DB%"

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\RETLR.vbs %TSSRETLROUTPUT% %TSSRETLRCLEANUPBTEQ% %LOGONFILE% %DATABASENAME% %MSTDB%  %CNTRY% > %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during RETLR TRIGGER cleanup >> %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG TSS_RETLR_OUTPUT_%currentdate%_%currenttime%.LOG
exit 1
 )
 
set TSSRETLRCLEANUPBTEQ="%TSS_RETLR_CLEANUP_BTEQ%.BTEQ" 

 bteq < %TSSRETLRCLEANUPBTEQ% >> %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG
set ERR=%ERRORLEVEL%
set FAILUREBTEQ="/d:%TSS_RETLR_OUTPUT_FAILURE_BTEQ%"

IF NOT %ERR% == 0  (
echo Exiting due to error during TSS_RETLR_OUTPUT LOAD >> %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\RETLR.vbs %TSSRETLROUTPUT% %FAILUREBTEQ% %LOGONFILE% %DATABASENAME% %MSTDB%  %CNTRY% >> %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG
IF ERRORLEVEL 1 (
echo Exiting due to error during TSS_RETLR_OUTPUT LOAD >> %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG TSS_RETLR_OUTPUT_%currentdate%_%currenttime%.LOG
exit 1
)
bteq < %TSS_RETLR_OUTPUT_FAILURE_BTEQ% >> %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG
set ERR1=%ERRORLEVEL%
IF NOT %ERR1% == 0 (
ren %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG TSS_RETLR_OUTPUT_%currentdate%_%currenttime%.LOG
exit %ERR1%
)

ren %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG TSS_RETLR_OUTPUT_%currentdate%_%currenttime%.LOG
exit %ERR%
)

set TSSRETLRSTGFLD="/d:%TSS_RETLR_OUTPUT_FLD%.FLD"

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\RETLR.vbs %TSSRETLROUTPUT% %TSSRETLRSTGFLD% %LOGONFILE% %DATABASENAME% %MSTDB%  %CNTRY% >> %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG

 IF ERRORLEVEL 1 (
 echo Exiting due to error during RETLR TRIGGER cleanup >> %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG
 set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG TSS_RETLR_OUTPUT_%currentdate%_%currenttime%.LOG
exit 1
)

set TSSRETLRSTGFLD="%TSS_RETLR_OUTPUT_FLD%.FLD"

fastload -c UTF8 < %TSSRETLRSTGFLD% >> %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG
REM tbuild -f %TSS_RETLR_OUTPUT_TPT% -u "TdpId='%TdpId%',UserName='%UserName%',UserPassword='%UserPassword%',MDM_DB='%MDM_DB%',ERR_DB='%ERR_DB%',LOG_DB='%LOG_DB%',WORK_DB='%WORK_DB%',DirectoryPath='%MDM_CUSTOM_DIR%\data',FileName = '%TSS_RETLR_OUTPUT%'"
set ERR=%ERRORLEVEL%
set FAILUREBTEQ="/d:%TSS_RETLR_OUTPUT_FAILURE_BTEQ%"

IF NOT %ERR% == 0  (
echo Exiting due to error during TSS_RETLR_OUTPUT LOAD >> %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG
cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\RETLR.vbs %TSSRETLROUTPUT% %FAILUREBTEQ% %LOGONFILE% %DATABASENAME% %MSTDB%  %CNTRY% >> %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG
IF ERRORLEVEL 1 (
echo Exiting due to error during TSS_RETLR_OUTPUT LOAD >> %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG TSS_RETLR_OUTPUT_%currentdate%_%currenttime%.LOG
exit 1
)
bteq < %TSS_RETLR_OUTPUT_FAILURE_BTEQ% >> %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG
set ERR1=%ERRORLEVEL%
IF NOT %ERR1% == 0 (
ren %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG TSS_RETLR_OUTPUT_%currentdate%_%currenttime%.LOG
exit %ERR1%
)

ren %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG TSS_RETLR_OUTPUT_%currentdate%_%currenttime%.LOG
exit %ERR%
)

set TSSRETLRSTGBTEQ="/d:%TSS_RETLR_OUTPUT_BTEQ%.BTEQ"

set DATABASENAME="/f:%ETL_DB%"

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\RETLR.vbs %TSSRETLROUTPUT% %TSSRETLRSTGBTEQ% %LOGONFILE% %DATABASENAME% %MSTDB%  %CNTRY% >> %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during RETLR update >> %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG TSS_RETLR_OUTPUT_%currentdate%_%currenttime%.LOG
exit 1
)

set TSSRETLRSTGBTEQ="%TSS_RETLR_OUTPUT_BTEQ%.BTEQ"

bteq < %TSSRETLRSTGBTEQ% >> %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG
set ERR=%ERRORLEVEL%
set FAILUREBTEQ="/d:%TSS_RETLR_OUTPUT_FAILURE_BTEQ%"

IF NOT %ERR% == 0  (
echo Exiting due to error during TSS_RETLR_OUTPUT LOAD >> %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\RETLR.vbs %TSSRETLROUTPUT% %FAILUREBTEQ% %LOGONFILE% %DATABASENAME% %MSTDB%  %CNTRY% >> %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG
IF ERRORLEVEL 1 (
echo Exiting due to error during TSS_RETLR_OUTPUT LOAD >> %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG TSS_RETLR_OUTPUT_%currentdate%_%currenttime%.LOG
exit 1
)
bteq < %TSS_RETLR_OUTPUT_FAILURE_BTEQ% >> %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG
set ERR1=%ERRORLEVEL%
IF NOT %ERR1% == 0 (
ren %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG TSS_RETLR_OUTPUT_%currentdate%_%currenttime%.LOG
exit %ERR1%
)

ren %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG TSS_RETLR_OUTPUT_%currentdate%_%currenttime%.LOG
exit %ERR%
)

del %TSS_RETLR_OUTPUT%.DAT
IF ERRORLEVEL 1 (
echo Exiting due to error during fast load >> %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG TSS_RETLR_OUTPUT_%currentdate%_%currenttime%.LOG
exit 1
)

ren %MDM_CUSTOM_DIR%\log\TSS_RETLR_OUTPUT.LOG TSS_RETLR_OUTPUT_%currentdate%_%currenttime%.LOG

:end