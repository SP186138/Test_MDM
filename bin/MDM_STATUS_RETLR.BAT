@echo off

REM SCRIPT:               MDM_STATUS_RETLR.BTEQ  
REM DESCRIPTION:          THIS SCRIPT UPDATES THE LOAD_CONTROL TABLE WITH THE MDM STATUS.
REM DEPENDENCY:           MDM PROCESS
REM INPUT:                
REM OUTPUT:               LOAD_CONTROL
REM ERRORS:
REM SPECIAL INSTRUCTIONS:
REM CHANGE LOG:
REM VERSION              DATE                 AUTHOR                          CHANGES
REM 1.00                 01/30/2014           TERADATA                        INITIAL VERSION

echo Executing INPUT LOAD

:start

call .\mdmcustomenv-parallel.bat 

set ETLDB="/c:%ETL_DB%"

set MDMSTATUSBTEQ="/d:%MDM_STATUS_RETLR_BTEQ%"

set LOGONFILE="/e:%LOGON_FILE%"

set DATABASENAME="/f:%MASTER_DB%"

set MASTERDB="/g:%ETL_CTRL_DB%"

cscript %MDM_CUSTOM_DIR%\etl-scripts-parallel\bin\CONSUMER_VALIDATION.vbs %ETLDB% %MDMSTATUSBTEQ% %LOGONFILE% %DATABASENAME% %MASTERDB% > %MDM_CUSTOM_DIR%\log\MDM_STATUS_RETLR_LOG.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during status update load >> %MDM_CUSTOM_DIR%\log\MDM_STATUS_RETLR_LOG.LOG
set errorlevel=1
exit 1
)

bteq < %MDM_STATUS_RETLR_BTEQ% >> %MDM_CUSTOM_DIR%\log\MDM_STATUS_RETLR_LOG.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during status update load >> %MDM_CUSTOM_DIR%\log\MDM_STATUS_RETLR_LOG.LOG
set errorlevel=1
exit 1
)

:end
