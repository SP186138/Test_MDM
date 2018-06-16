@echo off

REM SCRIPT:               Consumer Information.BTEQ 
REM DESCRIPTION:          This script validates the records received from ETL Staging.
REM DEPENDENCY:           
REM INPUT:                ETL Staging
REM OUTPUT:               MST Staging
REM ERRORS:
REM SPECIAL INSTRUCTIONS:
REM CHANGE LOG:
REM VERSION              DATE                 AUTHOR                          CHANGES
REM 1.00                 01/21/2011           TERADATA                        INITIAL VERSION
REM 2.00                 10/31/2011           TERADATA                        Removed Errormove
REM 3.00                 05/13/2012           TERADATA                        Error Handling

echo Executing INPUT LOAD

:start
set ERR=%ERRORLEVEL%
set ERR1=%ERRORLEVEL%

call .\mdmcustomenv-parallel.bat 

set ETLDB="/c:%ETL_DB%"

set CONSUMERVALIDATIONBTEQ="/d:%CONSUMER_VALIDATION_BTEQ%"

set LOGONFILE="/e:%LOGON_FILE%"

set DATABASENAME="/f:%MST_DB%"

set MASTERDB="/g:%ETL_CTRL_DB%"

set DBNAME="/h:%MASTER_DB%"

set EMAIL="/i:%EMAIL_ADDRESS%"

set POSTL="/j:%POSTL_ADDRESS%"

set PHONE="/k:%PHONE_ADDRESS%"

set SOCIAL="/l:%SOCIAL_NETWORK%"

set BTCH=%~1

set BATCH="/m:%BTCH%"

set FAILUREBTEQ="/d:%CONSUMER_VALIDATION_FAILURE_BTEQ%"

FOR /F "tokens=1-6 delims=/ " %%i in ('date/t') do set currentdate=%%i-%%j-%%k-%%l
FOR /F "tokens=1-6 delims=: " %%i in ('time/t') do set currenttime=%%i-%%j-%%k

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\CONSUMER_VALIDATION.vbs %ETLDB% %CONSUMERVALIDATIONBTEQ% %LOGONFILE% %DATABASENAME% %MASTERDB% %DBNAME% %EMAIL% %POSTL% %PHONE% %SOCIAL% %BATCH% > %MDM_CUSTOM_DIR%\log\CONSUMER_INFORMATION_LOG.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during validation load >> %MDM_CUSTOM_DIR%\log\CONSUMER_INFORMATION_LOG.LOG
set errorlevel=1
exit 1
)

bteq < %CONSUMER_VALIDATION_BTEQ% >> %MDM_CUSTOM_DIR%\log\CONSUMER_INFORMATION_LOG.LOG
set ERR=%ERRORLEVEL%
IF NOT %ERR% == 0 (
cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\CONSUMER_VALIDATION.vbs %ETLDB% %FAILUREBTEQ% %LOGONFILE% %DATABASENAME% %MASTERDB% %DBNAME% %EMAIL% %POSTL% %PHONE% %SOCIAL% %BATCH% >> %MDM_CUSTOM_DIR%\log\CONSUMER_INFORMATION_LOG.LOG
IF ERRORLEVEL 1 (
echo Exiting due to error during validation load >> %MDM_CUSTOM_DIR%\log\CONSUMER_INFORMATION_LOG_%currentdate%_%currenttime%.LOG
set errorlevel=1
exit 1
)
bteq < %CONSUMER_VALIDATION_FAILURE_BTEQ% >> %MDM_CUSTOM_DIR%\log\CONSUMER_INFORMATION_LOG.LOG
set ERR1=%ERRORLEVEL%
IF NOT %ERR1% == 0 (
ren %MDM_CUSTOM_DIR%\log\CONSUMER_INFORMATION_LOG.LOG CONSUMER_INFORMATION_LOG_%currentdate%_%currenttime%.LOG
exit %ERR1%
)
ren %MDM_CUSTOM_DIR%\log\CONSUMER_INFORMATION_LOG.LOG CONSUMER_INFORMATION_LOG_%currentdate%_%currenttime%.LOG
exit %ERR%
)


ren %MDM_CUSTOM_DIR%\log\CONSUMER_INFORMATION_LOG.LOG CONSUMER_INFORMATION_LOG_%currentdate%_%currenttime%.LOG


:end
