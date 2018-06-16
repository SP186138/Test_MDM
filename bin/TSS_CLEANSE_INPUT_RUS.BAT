@echo off
REM TSS Export

REM SCRIPT:               TSS_CLEANSE_INPUT_%CNTRY1%.FEXP
REM DESCRIPTION:          This script generates the initial transaction file for use by Trillium
REM DEPENDENCY:           MDM Validation load
REM INPUT:                MST TABLES
REM OUTPUT:               TSS_CLEANSE_INPUT_%CNTRY1%.DAT
REM ERRORS:
REM SPECIAL INSTRUCTIONS:
REM CHANGE LOG:
REM VERSION              DATE                 AUTHOR                          CHANGES
REM 1.00                 04/10/2013           TERADATA                        INITIAL VERSION


echo Executing TSS Export

:start
set ERR=%ERRORLEVEL%
set ERR1=%ERRORLEVEL%
FOR /F "tokens=1-6 delims=/ " %%i in ('date/t') do set currentdate=%%i-%%j-%%k-%%l
FOR /F "tokens=1-6 delims=: " %%i in ('time/t') do set currenttime=%%i-%%j-%%k
call .\mdmcustomenv-parallel.bat 

set ETLDB="/c:%ETL_DB%"

set TSSCLEANSEINPUTBTEQ="/d:%TSS_CLEANSE_INPUT_BTEQ%.BTEQ"

set LOGONFILE="/e:%LOGON_FILE%"

set DATABASENAME="/f:%MST_DB%"

set MASTERDB="/g:%ETL_CTRL_DB%"

set DBNAME="/h:%MASTER_DB%"

set CNTRY="/i:RUS"

set COUNTRY="RUS"

set CNTRY1=RUS

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\CONSUMER_LOAD.vbs %ETLDB% %TSSCLEANSEINPUTBTEQ% %LOGONFILE% %DATABASENAME% %MASTERDB% %DBNAME% %EMAIL% %POSTL% %PHONE% %SOCIAL% %CNTRY% > %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_INPUT_%CNTRY1%.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during validation load >> %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_INPUT_%CNTRY1%.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_INPUT_%CNTRY1%.LOG TSS_CLEANSE_INPUT_%CNTRY1%_%currentdate%_%currenttime%.LOG
exit 1
)

set TSSCLEANSEINPUTBTEQ="%TSS_CLEANSE_INPUT_BTEQ%.BTEQ%COUNTRY%"

bteq < %TSSCLEANSEINPUTBTEQ% >> %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_INPUT_%CNTRY1%.LOG
set ERR=%ERRORLEVEL%
set FAILUREBTEQ="/d:%TSS_CLEANSE_INPUT_FAILURE_BTEQ%.BTEQ"
set FAILUREBTEQ1="%TSS_CLEANSE_INPUT_FAILURE_BTEQ%.BTEQ%COUNTRY%" 

IF NOT %ERR% == 0  (
echo Exiting due to error during cleanse input >> %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_INPUT_%CNTRY1%.LOG

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\CONSUMER_LOAD.vbs %ETLDB% %FAILUREBTEQ% %LOGONFILE% %DATABASENAME% %MASTERDB% %DBNAME% %EMAIL% %POSTL% %PHONE% %SOCIAL% %CNTRY% >> %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_INPUT_%CNTRY1%.LOG
IF ERRORLEVEL 1 (
echo Exiting due to error during cleanse input >> %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_INPUT_%CNTRY1%.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_INPUT_%CNTRY1%.LOG TSS_CLEANSE_INPUT_%CNTRY1%_%currentdate%_%currenttime%.LOG
exit 1
)
bteq < %FAILUREBTEQ1% >> %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_INPUT_%CNTRY1%.LOG
set ERR1=%ERRORLEVEL%

IF NOT %ERR1% == 0 (
ren %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_INPUT_%CNTRY1%.LOG TSS_CLEANSE_INPUT_%CNTRY1%_%currentdate%_%currenttime%.LOG
exit %ERR1%
)

ren %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_INPUT_%CNTRY1%.LOG TSS_CLEANSE_INPUT_%CNTRY1%_%currentdate%_%currenttime%.LOG
exit %ERR%
)

set TSSCLEANSEINPUT="/c:%TSS_CLEANSE_INPUT%"

set TSSCLEANSEINPUTFEXP="/d:%TSS_CLEANSE_INPUT_FEXP%.FEXP"

set DBNAME="/e:%MASTER_DB%"

set CNTRY="/f:RUS"

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\TSS_CLEANSE_INPUT.vbs %TSSCLEANSEINPUT% %TSSCLEANSEINPUTFEXP% %DBNAME%  %CNTRY% >> %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_INPUT_%CNTRY1%.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during fast export >> %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_INPUT_%CNTRY1%.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_INPUT_%CNTRY1%.LOG TSS_CLEANSE_INPUT_%CNTRY1%_%currentdate%_%currenttime%.LOG
exit 1
)

set TSSCLEANSEINPUTFEXP="%TSS_CLEANSE_INPUT_FEXP%.FEXP%COUNTRY%"

fexp -c UTF8 -r ".run file %MDM_CUSTOM_DIR%\logon\LOGON.txt;" < %TSSCLEANSEINPUTFEXP% >> %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_INPUT_%CNTRY1%.LOG

REM tbuild -f %TSS_CLEANSE_INPUT_TPT% -u "TdpId='%TdpId%',UserName='%UserName%',UserPassword='%UserPassword%',MDM_DB='%MDM_DB%',DirectoryPath='%MDM_CUSTOM_DIR%\data',FileName = '%TSS_CLEANSE_INPUT%'"

IF ERRORLEVEL 1 (
echo Exiting due to error during fast export >> %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_INPUT_%CNTRY1%.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_INPUT_%CNTRY1%.LOG TSS_CLEANSE_INPUT_%CNTRY1%_%currentdate%_%currenttime%.LOG
exit 1
)

set COUNTRY=RUS

set TSSCLEANSEINPUTDAT=%TSS_CLEANSE_INPUT1%%COUNTRY%.DAT

set TSSCLEANSEINPUTTMPL=%TSS_CLEANSE_INPUT1%%COUNTRY%.DATTMPL

copy %TSSCLEANSEINPUTDAT% %TSSCLEANSEINPUTTMPL%

IF ERRORLEVEL 1 (
echo Exiting due to error during rename >> %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_INPUT_%CNTRY1%.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_INPUT_%CNTRY1%.LOG TSS_CLEANSE_INPUT_%CNTRY1%_%currentdate%_%currenttime%.LOG
exit 1
)

set TSSCLEANSEINPUT="/d:%TSSCLEANSEINPUTDAT%"

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\TRIM.vbs %TSSCLEANSEINPUT%

IF ERRORLEVEL 1 (
echo Exiting due to error during cscript >> %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_INPUT_%CNTRY1%.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_INPUT_%CNTRY1%.LOG TSS_CLEANSE_INPUT_%CNTRY1%_%currentdate%_%currenttime%.LOG
exit 1
)

ren %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_INPUT_%CNTRY1%.LOG TSS_CLEANSE_INPUT_%CNTRY1%_%currentdate%_%currenttime%.LOG

:end