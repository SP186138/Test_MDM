@echo off
REM TSS Export

REM SCRIPT:               TSS_OPTOUT_INPUT.FEXP
REM DESCRIPTION:         This script generates the INPUT file for use by Trillium
REM DEPENDENCY:           Staging Opt Out table
REM INPUT:                
REM OUTPUT:               TSS_OPTOUT_INPUT.DAT
REM ERRORS:
REM SPECIAL INSTRUCTIONS:
REM CHANGE LOG:
REM VERSION              DATE                 AUTHOR                          CHANGES
REM 1.00                 03/26/2012           TERADATA                        INITIAL VERSION

echo Executing TSS Export

:start
set ERR=%ERRORLEVEL%
set ERR1=%ERRORLEVEL%
FOR /F "tokens=1-6 delims=/ " %%i in ('date/t') do set currentdate=%%i-%%j-%%k-%%l
FOR /F "tokens=1-6 delims=: " %%i in ('time/t') do set currenttime=%%i-%%j-%%k
call .\mdmcustomenv-parallel.bat 

set TSSOPTOUTINPUT="/c:%TSS_OPTOUT_INPUT%"

set TSSOPTOUTINPUTFEXP="/d:%TSS_OPTOUT_INPUT_FEXP%.FEXP"

set TSSOPTOUTINPUTBTEQ="/d:%TSS_OPTOUT_INPUT_BTEQ%.BTEQ"

set DBNAME="/e:%ETL_DB%"

set CNTRY="/f:AUS"

set COUNTRY="AUS"

set LOGONFILE="/e:%LOGON_FILE%"

set DATABASENAME="/f:%MST_DB%"

set MSTDB="/g:%MST_DB%"

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\OPTOUT.vbs %TSSOPTOUTINPUT% %TSSOPTOUTINPUTBTEQ% %LOGONFILE% %DATABASENAME% %MSTDB%  %CNTRY% > %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_INPUT.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during OPTOUT TRIGGER cleanup >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_INPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_INPUT.LOG TSS_OPTOUT_INPUT_%currentdate%_%currenttime%.LOG
exit 1
 )
 
set TSSOPTOUTINPUTBTEQ="%TSS_OPTOUT_INPUT_BTEQ%.BTEQ" 

 bteq < %TSSOPTOUTINPUTBTEQ% >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_INPUT.LOG
set ERR=%ERRORLEVEL%
set FAILUREBTEQ="/d:%TSS_OPTOUT_INPUT_FAILURE_BTEQ%"

IF NOT %ERR% == 0  (
echo Exiting due to error during TSS_OPTOUT_INPUT LOAD >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_INPUT.LOG
cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\OPTOUT.vbs %TSSOPTOUTINPUT% %FAILUREBTEQ% %LOGONFILE% %DATABASENAME% %MSTDB%  %CNTRY% >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_INPUT.LOG
IF ERRORLEVEL 1 (
echo Exiting due to error during TSS_OPTOUT_INPUT LOAD >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_INPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_INPUT.LOG TSS_OPTOUT_INPUT_%currentdate%_%currenttime%.LOG
exit 1
)
bteq < %TSS_OPTOUT_INPUT_FAILURE_BTEQ% >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_INPUT.LOG
set ERR1=%ERRORLEVEL%
IF NOT %ERR1% == 0 (
ren %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_INPUT.LOG TSS_OPTOUT_INPUT_%currentdate%_%currenttime%.LOG
exit %ERR1%
)

ren %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_INPUT.LOG TSS_OPTOUT_INPUT_%currentdate%_%currenttime%.LOG
exit %ERR%
)

set DATABASENAME="/f:%ETL_DB%"

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\OPTOUT.vbs %TSSOPTOUTINPUT% %TSSOPTOUTINPUTFEXP% %LOGONFILE% %DATABASENAME% %MSTDB%  %CNTRY% >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_INPUT.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during fast export >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_INPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_INPUT.LOG TSS_OPTOUT_INPUT_%currentdate%_%currenttime%.LOG
exit 1
)

set TSSOPTOUTINPUTFEXP="%TSS_OPTOUT_INPUT_FEXP%.FEXP"

fexp -c UTF8 -r ".run file %MDM_CUSTOM_DIR%\logon\LOGON.txt;" < %TSSOPTOUTINPUTFEXP% >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_INPUT.LOG

REM tbuild -f %TSS_MATCH_INPUT_CRM_TPT% -u "TdpId='%TdpId%',UserName='%UserName%',UserPassword='%UserPassword%',MDM_DB='%MDM_DB%',DirectoryPath='%MDM_CUSTOM_DIR%\data',FileName = '%TSS_MATCH_INPUT%'"
set ERR=%ERRORLEVEL%
set FAILUREBTEQ="/d:%TSS_OPTOUT_INPUT_FAILURE_BTEQ%"

IF NOT %ERR% == 0  (
echo Exiting due to error during TSS_OPTOUT_INPUT LOAD >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_INPUT.LOG
cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\OPTOUT.vbs %TSSOPTOUTINPUT% %FAILUREBTEQ% %LOGONFILE% %DATABASENAME% %MSTDB%  %CNTRY% >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_INPUT.LOG
IF ERRORLEVEL 1 (
echo Exiting due to error during TSS_OPTOUT_INPUT LOAD >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_INPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_INPUT.LOG TSS_OPTOUT_INPUT_%currentdate%_%currenttime%.LOG
exit 1
)
bteq < %TSS_OPTOUT_INPUT_FAILURE_BTEQ% >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_INPUT.LOG
set ERR1=%ERRORLEVEL%
IF NOT %ERR1% == 0 (
ren %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_INPUT.LOG TSS_OPTOUT_INPUT_%currentdate%_%currenttime%.LOG
exit %ERR1%
)
ren %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_INPUT.LOG TSS_OPTOUT_INPUT_%currentdate%_%currenttime%.LOG
exit %ERR%
)

set TSSOPTOUTINPUTDAT=%TSS_OPTOUT_INPUT1%.DAT

set TSSOPTOUTINPUTTMPL=%TSS_OPTOUT_INPUT1%.DATTMPL

copy %TSSOPTOUTINPUTDAT% %TSSOPTOUTINPUTTMPL%

IF ERRORLEVEL 1 (
echo Exiting due to error during rename >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_INPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_INPUT.LOG TSS_OPTOUT_INPUT_%currentdate%_%currenttime%.LOG
exit 1
)

set TSSOPTOUTINPUT="/d:%TSSOPTOUTINPUTDAT%"

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\TRIM.vbs %TSSOPTOUTINPUT%

IF ERRORLEVEL 1 (
echo Exiting due to error during cscript >> %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_INPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_INPUT.LOG TSS_OPTOUT_INPUT_%currentdate%_%currenttime%.LOG
exit 1
)

ren %MDM_CUSTOM_DIR%\log\TSS_OPTOUT_INPUT.LOG TSS_OPTOUT_INPUT_%currentdate%_%currenttime%.LOG

:end