@echo off

REM SCRIPT:               TREMOR_MIG.BTEQ 
REM DESCRIPTION:          This script moves records from ETL Staging to MDM EDW Tables.
REM DEPENDENCY:           
REM INPUT:                ICRM Staging
REM OUTPUT:               MDM EDW
REM ERRORS:
REM SPECIAL INSTRUCTIONS:
REM CHANGE LOG:
REM VERSION              DATE                 AUTHOR                          CHANGES
REM 1.00                 03/22/2012           TERADATA                        INITIAL VERSION

echo Executing INPUT LOAD

:start

call .\mdmcustomenv.bat 

set TREMORMIGBTEQ="/d:%TREMOR_MIG_BTEQ%"

set LOGONFILE="/e:%LOGON_FILE%"

set DATABASENAME="/f:%MST_DB%"

set ETLDB="/g:%ETL_DB%"

cscript %MDM_CUSTOM_DIR%\bin\TREMOR_MIG.vbs %TREMORMIGBTEQ% %LOGONFILE% %DATABASENAME% %ETLDB% > %MDM_CUSTOM_DIR%\log\TREMOR_MIG_LOG_1.LOG

 IF ERRORLEVEL 1 (
 echo Exiting due to error during Tremor Migration load >> %MDM_CUSTOM_DIR%\log\TREMOR_MIG_LOG_1.LOG
 set errorlevel=1
exit 1
)

bteq < %TREMOR_MIG_BTEQ% >> %MDM_CUSTOM_DIR%\log\TREMOR_MIG_LOG_1.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during Tremor Migration load >> %MDM_CUSTOM_DIR%\log\TREMOR_MIG_LOG_1.LOG
set errorlevel=1
exit 1
)
:end