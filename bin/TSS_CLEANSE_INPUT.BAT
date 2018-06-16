@echo off
REM TSS Export

REM SCRIPT:               TSS_CLEANSE_INPUT.FEXP
REM DESCRIPTION:          This script generates the initial transaction file for use by Trillium
REM DEPENDENCY:           MDM Validation load
REM INPUT:                MST TABLES
REM OUTPUT:               TSS_CLEANSE_INPUT.DAT
REM ERRORS:
REM SPECIAL INSTRUCTIONS:
REM CHANGE LOG:
REM VERSION              DATE                 AUTHOR                          CHANGES
REM 1.00                 01/21/2011           TERADATA                        INITIAL VERSION

echo Executing TSS Export

:start

call .\mdmcustomenv.bat 

set TSSCLEANSEINPUT="/c:%TSS_CLEANSE_INPUT%"

set TSSCLEANSEINPUTFEXP="/d:%TSS_CLEANSE_INPUT_FEXP%"

set DBNAME="/e:%MASTER_DB%"

cscript %MDM_CUSTOM_DIR%\bin\TSS_CLEANSE_INPUT.vbs %TSSCLEANSEINPUT% %TSSCLEANSEINPUTFEXP% %DBNAME% > %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_INPUT_VBS.LOG

IF ERRORLEVEL 1 (
echo Exiting due to error during fast export >> %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_INPUT.LOG
set errorlevel=1
exit 1
)

fexp -c UTF8 -r ".run file %MDM_CUSTOM_DIR%\logon\LOGON.txt;" < %TSS_CLEANSE_INPUT_FEXP% > %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_INPUT.LOG

REM tbuild -f %TSS_CLEANSE_INPUT_TPT% -u "TdpId='%TdpId%',UserName='%UserName%',UserPassword='%UserPassword%',MDM_DB='%MDM_DB%',DirectoryPath='%MDM_CUSTOM_DIR%\data',FileName = '%TSS_CLEANSE_INPUT%'"

IF ERRORLEVEL 1 (
echo Exiting due to error during fast export >> %MDM_CUSTOM_DIR%\log\TSS_CLEANSE_INPUT.LOG
set errorlevel=1
exit 1
)

sleep 60

:end