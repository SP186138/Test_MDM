@echo off

REM SCRIPT:               RESTART_STATUS.BTEQ  
REM DESCRIPTION:          THIS SCRIPT UPDATES THE LOAD_CONTROL AND LOAD_INFO DURING THE RESTARTS
REM DEPENDENCY:           MDM PROCESS
REM INPUT:                
REM OUTPUT:               LOAD_CONTROL,LOAD_INFO
REM ERRORS:
REM SPECIAL INSTRUCTIONS:
REM CHANGE LOG:
REM VERSION              DATE                 AUTHOR                          CHANGES
REM 1.00                 01/21/2011           TERADATA                        INITIAL VERSION

echo Executing INPUT LOAD

:start

call .\mdmcustomenv.bat 

set ETLDB="/c:%ETL_DB%"

set RESTARTSTATUSBTEQ="/d:%RESTART_STATUS_BTEQ%"

set LOGONFILE="/e:%LOGON_FILE%"

set DATABASENAME="/f:%MASTER_DB%"

set MASTERDB="/g:%ETL_CTRL_DB%"

set LOADID="/h:%LOAD_ID%"

cscript %MDM_CUSTOM_DIR%\bin\RESTART_STATUS.vbs %ETLDB% %RESTARTSTATUSBTEQ% %LOGONFILE% %DATABASENAME% %MASTERDB% %LOADID% > %MDM_CUSTOM_DIR%\log\RESTART_STATUS_LOG.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during status update >> %MDM_CUSTOM_DIR%\log\RESTART_STATUS_LOG.LOG
set errorlevel=1
exit 1
)

bteq < %RESTART_STATUS_BTEQ% >> %MDM_CUSTOM_DIR%\log\RESTART_STATUS_LOG.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during status update >> %MDM_CUSTOM_DIR%\log\RESTART_STATUS_LOG.LOG
set errorlevel=1
exit 1
)

:end
