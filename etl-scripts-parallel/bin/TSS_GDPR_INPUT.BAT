@echo off
REM TSS Export

REM SCRIPT:               TSS_GDPR_INPUT.BAT.FEXP
REM DESCRIPTION:         This script generates the INPUT file for use by Trillium
REM DEPENDENCY:           Staging Gdpr table
REM INPUT:                
REM OUTPUT:               TSS_GDPR_INPUT.BAT.DAT
REM ERRORS:
REM SPECIAL INSTRUCTIONS:
REM CHANGE LOG:
REM VERSION              DATE                 AUTHOR                          CHANGES
REM 1.00                 09/12/2017           TERADATA                        INITIAL VERSION

echo Executing TSS Export

:start
set ERR=%ERRORLEVEL%
set ERR1=%ERRORLEVEL%
FOR /F "tokens=1-6 delims=/ " %%i in ('date/t') do set currentdate=%%i-%%j-%%k-%%l
FOR /F "tokens=1-6 delims=: " %%i in ('time/t') do set currenttime=%%i-%%j-%%k

echo Executing TSS Export etlbin
call .\mdmcustomenv-parallel.bat 

set TSSGDPRINPUT="/c:%TSS_GDPR_INPUT%"

set TSSGDPRINPUTFEXP="/d:%TSS_GDPR_INPUT_FEXP%.FEXP"

set TSSGDPRINPUTBTEQ="/d:%TSS_GDPR_INPUT_BTEQ%.BTEQ"

set DBNAME="/e:%ETL_DB%"

set CNTRY="/f:AUS"

set COUNTRY="AUS"

set LOGONFILE="/e:%LOGON_FILE%"

set DATABASENAME="/f:%MST_DB%"

set MSTDB="/g:%MST_DB%"

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\GDPR.vbs %TSSGDPRINPUT% %TSSGDPRINPUTBTEQ% %LOGONFILE% %DATABASENAME% %MSTDB%  %CNTRY% > %MDM_CUSTOM_DIR%\log\TSS_GDPR_INPUT.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during GDPR TRIGGER cleanup >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_INPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_GDPR_INPUT.LOG TSS_GDPR_INPUT_%currentdate%_%currenttime%.LOG
exit 1
 )
 
set TSSGDPRINPUTBTEQ="%TSS_GDPR_INPUT_BTEQ%.BTEQ" 

 bteq < %TSSGDPRINPUTBTEQ% >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_INPUT.LOG
set ERR=%ERRORLEVEL%
set FAILUREBTEQ="/d:%TSS_GDPR_INPUT_FAILURE_BTEQ%"

IF NOT %ERR% == 0  (
echo Exiting due to error during TSS_GDPR_INPUT LOAD >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_INPUT.LOG
cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\GDPR.vbs %TSSGDPRINPUT% %FAILUREBTEQ% %LOGONFILE% %DATABASENAME% %MSTDB%  %CNTRY% >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_INPUT.LOG
IF ERRORLEVEL 1 (
echo Exiting due to error during TSS_GDPR_INPUT LOAD >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_INPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_GDPR_INPUT.LOG TSS_GDPR_INPUT_%currentdate%_%currenttime%.LOG
exit 1
)
bteq < %TSS_GDPR_INPUT_FAILURE_BTEQ% >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_INPUT.LOG
set ERR1=%ERRORLEVEL%
IF NOT %ERR1% == 0 (
ren %MDM_CUSTOM_DIR%\log\TSS_GDPR_INPUT.LOG TSS_GDPR_INPUT_%currentdate%_%currenttime%.LOG
exit %ERR1%
)

ren %MDM_CUSTOM_DIR%\log\TSS_GDPR_INPUT.LOG TSS_GDPR_INPUT_%currentdate%_%currenttime%.LOG
exit %ERR%
)

set DATABASENAME="/f:%ETL_DB%"

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\GDPR.vbs %TSSGDPRINPUT% %TSSGDPRINPUTFEXP% %LOGONFILE% %DATABASENAME% %MSTDB%  %CNTRY% >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_INPUT.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during fast export >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_INPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_GDPR_INPUT.LOG TSS_GDPR_INPUT_%currentdate%_%currenttime%.LOG
exit 1
)

set TSSGDPRINPUTFEXP="%TSS_GDPR_INPUT_FEXP%.FEXP"

fexp -c UTF8 -r ".run file %MDM_CUSTOM_DIR%\logon\LOGON.txt;" < %TSSGDPRINPUTFEXP% >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_INPUT.LOG

REM tbuild -f %TSS_MATCH_INPUT_CRM_TPT% -u "TdpId='%TdpId%',UserName='%UserName%',UserPassword='%UserPassword%',MDM_DB='%MDM_DB%',DirectoryPath='%MDM_CUSTOM_DIR%\data',FileName = '%TSS_MATCH_INPUT%'"
set ERR=%ERRORLEVEL%
set FAILUREBTEQ="/d:%TSS_GDPR_INPUT_FAILURE_BTEQ%"

IF NOT %ERR% == 0  (
echo Exiting due to error during TSS_GDPR_INPUT LOAD >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_INPUT.LOG
cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\GDPR.vbs %TSSGDPRINPUT% %FAILUREBTEQ% %LOGONFILE% %DATABASENAME% %MSTDB%  %CNTRY% >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_INPUT.LOG
IF ERRORLEVEL 1 (
echo Exiting due to error during TSS_GDPR_INPUT LOAD >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_INPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_GDPR_INPUT.LOG TSS_GDPR_INPUT_%currentdate%_%currenttime%.LOG
exit 1
)
bteq < %TSS_GDPR_INPUT_FAILURE_BTEQ% >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_INPUT.LOG
set ERR1=%ERRORLEVEL%
IF NOT %ERR1% == 0 (
ren %MDM_CUSTOM_DIR%\log\TSS_GDPR_INPUT.LOG TSS_GDPR_INPUT_%currentdate%_%currenttime%.LOG
exit %ERR1%
)
ren %MDM_CUSTOM_DIR%\log\TSS_GDPR_INPUT.LOG TSS_GDPR_INPUT_%currentdate%_%currenttime%.LOG
exit %ERR%
)

set TSSGDPRINPUTDAT=%TSS_GDPR_INPUT1%.DAT

set TSSGDPRINPUTTMPL=%TSS_GDPR_INPUT1%.DATTMPL

copy %TSSGDPRINPUTDAT% %TSSGDPRINPUTTMPL%

IF ERRORLEVEL 1 (
echo Exiting due to error during rename >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_INPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_GDPR_INPUT.LOG TSS_GDPR_INPUT_%currentdate%_%currenttime%.LOG
exit 1
)

set TSSGDPRINPUT="/d:%TSSGDPRINPUTDAT%"

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\TRIM.vbs %TSSGDPRINPUT%

IF ERRORLEVEL 1 (
echo Exiting due to error during cscript >> %MDM_CUSTOM_DIR%\log\TSS_GDPR_INPUT.LOG
set errorlevel=1
ren %MDM_CUSTOM_DIR%\log\TSS_GDPR_INPUT.LOG TSS_GDPR_INPUT_%currentdate%_%currenttime%.LOG
exit 1
)



ren %MDM_CUSTOM_DIR%\log\TSS_GDPR_INPUT.LOG TSS_GDPR_INPUT_%currentdate%_%currenttime%.LOG

:end