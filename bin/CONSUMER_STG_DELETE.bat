@echo off

REM SCRIPT:               CONSUMER_STG_DELETE.BTEQ 
REM DESCRIPTION:          This script deletes records from MDM Staging.
REM DEPENDENCY:           
REM INPUT:                MDM Staging
REM OUTPUT:               MDM Staging
REM ERRORS:
REM SPECIAL INSTRUCTIONS:
REM CHANGE LOG:
REM VERSION              DATE                 AUTHOR                          CHANGES
REM 1.00                 03/11/2011           TERADATA                        INITIAL VERSION

echo Executing INPUT LOAD

:start

call .\mdmcustomenv.bat 

set CONSUMERSTGDELETEBTEQ="/d:%CONSUMER_STG_DELETE_BTEQ%"

set LOGONFILE="/e:%LOGON_FILE%"

set DATABASENAME="/f:%MST_DB%"

set A=%~1

set LoadIdsforDelete="/g:%A%"

cscript %MDM_CUSTOM_DIR%\bin\CONSUMER_STG_DELETE.vbs %CONSUMERSTGDELETEBTEQ% %LOGONFILE% %DATABASENAME% %LoadIdsforDelete% > %MDM_CUSTOM_DIR%\log\CONSUMER_STG_DEL_LOG.LOG

 IF ERRORLEVEL 1 (
 echo Exiting due to error during delete load >> %MDM_CUSTOM_DIR%\log\CONSUMER_STG_DEL_LOG.LOG
 set errorlevel=1
exit 1
)

bteq < %CONSUMER_STG_DELETE_BTEQ% > %MDM_CUSTOM_DIR%\log\CONSUMER_STG_DEL_LOG.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during delete load >> %MDM_CUSTOM_DIR%\log\CONSUMER_STG_DEL_LOG.LOG
set errorlevel=1
exit 1
)
:end